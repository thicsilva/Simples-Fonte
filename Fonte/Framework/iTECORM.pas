unit iTECORM;

interface

uses Atributos, Rtti, SysUtils, SQLExpr, TypInfo, DBXCommon, DBXJSON,
  VO, DBXJSONReflect, Classes, Generics.Collections, System.JSON;

type
  TiTECORM = class
  private
    class function FormatarFiltro(pFiltro: String): String;
    class function ValorPropriedadeObjeto(pObj: TObject; pCampo: String): Variant;
  public
    class function storeFirebird(pObjeto: TObject): String;
    class function Inserir(pObjeto: TObject): Integer;
    class function Alterar(pObjeto: TObject): Boolean; overload;
    class function Alterar(pObjeto, pObjetoOld: TObject): Boolean; overload;
    class function Excluir(pObjeto: TObject): Boolean;
    class function Consultar<T: class>(pFiltro: String; pPagina: Integer): TJSONArray; overload;
    class function Consultar<T: class>(pFiltro: String; pPagina: Integer; pConsultaCompleta: Boolean): TJSONArray; overload;
    class function Consultar<T: class>(pFiltro: String; pConsultaCompleta: Boolean; pPagina: Integer = 0): TObjectList<T>; overload;
    class function Consultar<T: class>(pConsultaCompleta: Boolean; pFiltro: String): TList<T>; overload;
    class function Consultar(pObjeto: TObject; pFiltro: String; pPagina: Integer; DBXCommand: TDBXCommand): TDBXReader; overload;
    class function Consultar(pConsulta: String; pFiltro: String; pPagina: Integer; DBXCommand: TDBXCommand): TDBXReader; overload;
    class function Consultar<T: class>(pConsulta: String; pFiltro: String; pPagina: Integer): TJSONArray; overload;
    class function ConsultarUmObjeto<T: class>(pFiltro: String; pConsultaCompleta: Boolean): T;
    class procedure PopularObjetosRelacionados(pObj: TVO);
    class procedure AnularObjetosRelacionados(pObj: TVO);
    class function ComandoSQL(pConsulta: String): Boolean;
    class function SelectMax(pTabela: String; pFiltro: String): Integer;
    class function SelectMin(pTabela: String; pFiltro: String): Integer;
    class function GetQuery: TSQLQuery;
  end;

var
  ConsultaCompleta: Boolean;

implementation

uses
  uConexaoBD, Constantes, Biblioteca;

{ TCCORM }

class function TiTECORM.FormatarFiltro(pFiltro: String): String;
begin
  Result := pFiltro;
  Result := StringReplace(Result, '*', '%', [rfReplaceAll]);
  Result := StringReplace(Result, '|', '/', [rfReplaceAll]);
  Result := StringReplace(Result, '\"', '"', [rfReplaceAll]);
end;

class function TiTECORM.GetQuery: TSQLQuery;
begin
  Result:= TConexaoBD.GetInstance.GetQuery;
end;

class function TiTECORM.ValorPropriedadeObjeto(pObj: TObject; pCampo: String): Variant;
var
  Contexto: TRttiContext;
  Tipo: TRttiType;
  Atributo: TCustomAttribute;
  Propriedade: TRttiProperty;
begin
  Result := 0;
  Contexto := TRttiContext.Create;
  try
    Tipo := Contexto.GetType(pObj.ClassType);

    for Propriedade in Tipo.GetProperties do
    begin
      for Atributo in Propriedade.GetAttributes do
      begin
        // se está pesquisando pelo ID
        if Atributo is TId then
        begin
          if (Atributo as TId).NameField = pCampo then
          begin
            Result := Propriedade.GetValue(pObj).AsInteger;
          end;
        end;

        // se está pesquisando por outro campo
        if Atributo is TColumn then
        begin
          if (Atributo as TColumn).Name = pCampo then
          begin
            if (Propriedade.PropertyType.TypeKind in [tkInteger, tkInt64]) then
              Result := Propriedade.GetValue(pObj).AsInteger
            else if (Propriedade.PropertyType.TypeKind in [tkString, tkUString]) then
              Result := Propriedade.GetValue(pObj).AsString;
          end;
        end;
      end;
    end;
  finally
    Contexto.Free;
  end;
end;

class function TiTECORM.Inserir(pObjeto: TObject): Integer;
var
  Query: TSQLQuery;
  Contexto: TRttiContext;
  Tipo: TRttiType;
  Propriedade: TRttiProperty;
  Atributo: TCustomAttribute;
  ConsultaSQL, CamposSQL, ValoresSQL: String;
  UltimoID: Integer;
  Tabela: String;
  NomeTipo: String;
begin
  try
    // Add - William 07-11-13
    FormatSettings.DecimalSeparator:= '.';

    Contexto := TRttiContext.Create;
    Tipo := Contexto.GetType(pObjeto.ClassType);

    // localiza o nome da tabela
    for Atributo in Tipo.GetAttributes do
    begin
      if Atributo is TTable then
      begin
        ConsultaSQL := 'INSERT INTO ' + (Atributo as TTable).Name;
        Tabela := (Atributo as TTable).Name;
      end;
    end;

    // preenche os nomes dos campos e valores
    for Propriedade in Tipo.GetProperties do
    begin
      for Atributo in Propriedade.GetAttributes do
      begin
        if Atributo is TColumn then
        begin
          if not(Atributo as TColumn).Transiente then
          begin
            if (Propriedade.PropertyType.TypeKind in [tkInteger, tkInt64]) then
            begin
              if (Propriedade.GetValue(pObjeto).AsInteger <> 0) then
              begin
                CamposSQL := CamposSQL + (Atributo as TColumn).Name + ',';
                ValoresSQL := ValoresSQL + Propriedade.GetValue(pObjeto).ToString + ',';
              end;
            end
            else if (Propriedade.PropertyType.TypeKind in [tkString, tkUString]) then
            begin
              if (Propriedade.GetValue(pObjeto).AsString <> '') then
              begin
                CamposSQL := CamposSQL + (Atributo as TColumn).Name + ',';
                ValoresSQL := ValoresSQL + QuotedStr(Propriedade.GetValue(pObjeto).ToString) + ',';
              end;
            end
            else if (Propriedade.PropertyType.TypeKind = tkFloat) then
            begin
              NomeTipo := LowerCase(Propriedade.PropertyType.Name);
              if NomeTipo = 'tdatetime' then
              begin
                if Propriedade.GetValue(pObjeto).AsExtended > 0 then
                begin
                  CamposSQL := CamposSQL + (Atributo as TColumn).Name + ',';
                  ValoresSQL := ValoresSQL + QuotedStr(FormatDateTime('yyyy-mm-dd', Propriedade.GetValue(pObjeto).AsExtended)) + ',';
                end;
              end
              else
              begin
                CamposSQL := CamposSQL + (Atributo as TColumn).Name + ',';
                ValoresSQL := ValoresSQL + QuotedStr(FormatFloat('0.000000', Propriedade.GetValue(pObjeto).AsExtended)) + ',';
              end;
            end
            else
            begin
              CamposSQL := CamposSQL + (Atributo as TColumn).Name + ',';
              ValoresSQL := ValoresSQL + QuotedStr(Propriedade.GetValue(pObjeto).ToString) + ',';
            end;
          end;
        end;
      end;
    end;

    // Add - William 07-11-13
    FormatSettings.DecimalSeparator:= ',';

    // retirando as vírgulas que sobraram no final
    Delete(CamposSQL, Length(CamposSQL), 1);
    Delete(ValoresSQL, Length(ValoresSQL), 1);

    ConsultaSQL := ConsultaSQL + '(' + CamposSQL + ') VALUES (' + ValoresSQL + ')';

    if TConexaoBD.GetInstance.Banco = 'Firebird' then
    begin
      ConsultaSQL := ConsultaSQL + ' RETURNING ID ';
    end;


    try
      Query := TConexaoBD.GetQuery;
      Query.CommandText := ConsultaSQL;

      UltimoID := 0;
      if TConexaoBD.GetInstance.Banco = 'MySQL' then
      begin
        Query.ExecSQL();
        Query.CommandText := 'select LAST_INSERT_ID() as id';
        Query.Open();
        UltimoID := Query.FieldByName('id').AsInteger;
      end
      else if TConexaoBD.GetInstance.Banco = 'Firebird' then
      begin
        Query.Open;
        UltimoID := Query.Fields[0].AsInteger;
      end
      else if TConexaoBD.GetInstance.Banco = 'Postgres' then
      begin
        Query.ExecSQL();
        Query.CommandText := 'select Max(id) as id from ' + Tabela;
        Query.Open();
        UltimoID := Query.FieldByName('id').AsInteger;
      end
      else if TConexaoBD.GetInstance.Banco = 'MSSQL' then
      begin
        Query.ExecSQL();
        Query.CommandText := 'select Max(id) as id from ' + Tabela;
        Query.Open();
        UltimoID := Query.FieldByName('id').AsInteger;
      end;
    finally
      Query.Close;
      FreeAndNil(Query);
    end;

    Result := UltimoID;
  finally
    Contexto.Free;
  end;
end;

class function TiTECORM.Alterar(pObjeto, pObjetoOld: TObject): Boolean;
var
  Query: TSQLQuery;
  Contexto: TRttiContext;
  Tipo, TipoOld: TRttiType;
  Propriedade, PropriedadeOld: TRttiProperty;
  Atributo, AtributoOld: TCustomAttribute;
  ConsultaSQL, CamposSQL, FiltroSQL: String;
  NomeTipo: String;
  ValorNew, ValorOld: Variant;
  AchouValorOld: Boolean;
begin
  try
    // Add - William 07-11-13
    FormatSettings.DecimalSeparator:= '.';

    Contexto := TRttiContext.Create;
    Tipo := Contexto.GetType(pObjeto.ClassType);
    TipoOld := Contexto.GetType(pObjetoOld.ClassType);

    // localiza o nome da tabela
    for Atributo in Tipo.GetAttributes do
    begin
      if Atributo is TTable then
        ConsultaSQL := 'UPDATE ' + (Atributo as TTable).Name + ' SET ';
    end;

    // preenche os nomes dos campos e filtro
    for Propriedade in Tipo.GetProperties do
    begin
      for Atributo in Propriedade.GetAttributes do
      begin
        if Atributo is TColumn then
        begin
          if not(Atributo as TColumn).Transiente then
          begin
            AchouValorOld := False;
            ValorNew := Propriedade.GetValue(pObjeto).ToString;

            // Compara os dois VOs e só considera para a consulta os campos que foram alterados
            for PropriedadeOld in TipoOld.GetProperties do
            begin
              for AtributoOld in PropriedadeOld.GetAttributes do
              begin
                if AtributoOld is TColumn then
                begin
                  if (AtributoOld as TColumn).Name = (Atributo as TColumn).Name then
                  begin
                    AchouValorOld := True;
                    ValorOld := Propriedade.GetValue(pObjetoOld).ToString;

                    // só continua a execução se o valor que subiu em NewVO for diferente do OldVO
                    if ValorNew <> ValorOld then
                    begin

                      if (Propriedade.PropertyType.TypeKind in [tkInteger, tkInt64]) then
                      begin
                        if (Propriedade.GetValue(pObjeto).AsInteger <> 0) then
                          CamposSQL := CamposSQL + (Atributo as TColumn).Name + ' = ' + Propriedade.GetValue(pObjeto).ToString + ','
                        else
                          CamposSQL := CamposSQL + (Atributo as TColumn).Name + ' = ' + 'null' + ',';
                      end

                      else if (Propriedade.PropertyType.TypeKind in [tkString, tkUString]) then
                      begin
                        if (Propriedade.GetValue(pObjeto).AsString <> '') then
                          CamposSQL := CamposSQL + (Atributo as TColumn).Name + ' = ' + QuotedStr(Propriedade.GetValue(pObjeto).ToString) + ','
                        else
                          CamposSQL := CamposSQL + (Atributo as TColumn).Name + ' = ' + 'null' + ',';
                      end

                      else if (Propriedade.PropertyType.TypeKind = tkFloat) then
                      begin
                        if Propriedade.GetValue(pObjeto).AsExtended <> 0 then
                        begin
                          NomeTipo := LowerCase(Propriedade.PropertyType.Name);
                          if NomeTipo = 'tdatetime' then
                            CamposSQL := CamposSQL + (Atributo as TColumn).Name + ' = ' + QuotedStr(FormatDateTime('yyyy-mm-dd', Propriedade.GetValue(pObjeto).AsExtended)) + ','
                          else
                            CamposSQL := CamposSQL + (Atributo as TColumn).Name + ' = ' + QuotedStr(FormatFloat('0.000000', Propriedade.GetValue(pObjeto).AsExtended)) + ',';
                        end
                        else
                          CamposSQL := CamposSQL + (Atributo as TColumn).Name + ' = ' + 'null' + ',';
                      end

                      else if Propriedade.GetValue(pObjeto).ToString <> '' then
                        CamposSQL := CamposSQL + (Atributo as TColumn).Name + ' = ' + QuotedStr(Propriedade.GetValue(pObjeto).ToString) + ','
                      else
                        CamposSQL := CamposSQL + (Atributo as TColumn).Name + ' = ' + 'null' + ',';

                    end;
                  end;
                end;
              end;
              // Quebra o for, pois já encontrou o valor Old correspondente
              if AchouValorOld then
                Break;
            end;

          end;
        end
        else if Atributo is TId then
          FiltroSQL := ' WHERE ' + (Atributo as TId).NameField + ' = ' + QuotedStr(Propriedade.GetValue(pObjeto).ToString);
      end;
    end;

    // Add - William 07-11-13
    FormatSettings.DecimalSeparator:= ',';

    // retirando as vírgulas que sobraram no final
    Delete(CamposSQL, Length(CamposSQL), 1);

    ConsultaSQL := ConsultaSQL + CamposSQL + FiltroSQL;

    Query:= TConexaoBD.GetInstance.GetQuery;
    Query.CommandText := ConsultaSQL;
    Query.ExecSQL();

    Result := True;
  finally
    Contexto.Free;
    FreeAndNil(Query);
  end;
end;

class function TiTECORM.Alterar(pObjeto: TObject): Boolean;
var
  Query: TSQLQuery;
  Contexto: TRttiContext;
  Tipo: TRttiType;
  Propriedade: TRttiProperty;
  Atributo: TCustomAttribute;
  ConsultaSQL, CamposSQL, FiltroSQL: String;
  NomeTipo: String;
begin
  try
    // Add - William 07-11-13
    FormatSettings.DecimalSeparator:= '.';

    Contexto := TRttiContext.Create;
    Tipo := Contexto.GetType(pObjeto.ClassType);

    // localiza o nome da tabela
    for Atributo in Tipo.GetAttributes do
    begin
      if Atributo is TTable then
        ConsultaSQL := 'UPDATE ' + (Atributo as TTable).Name + ' SET ';
    end;

    // preenche os nomes dos campos e filtro
    for Propriedade in Tipo.GetProperties do
    begin
      for Atributo in Propriedade.GetAttributes do
      begin
        if Atributo is TColumn then
        begin
          if not(Atributo as TColumn).Transiente then
          begin

            if (Propriedade.PropertyType.TypeKind in [tkInteger, tkInt64]) then
            begin
              if (Propriedade.GetValue(pObjeto).AsInteger <> 0) then
              begin
                CamposSQL := CamposSQL + (Atributo as TColumn).Name + ' = ' + Propriedade.GetValue(pObjeto).ToString + ','
              end;
            end

            else if (Propriedade.PropertyType.TypeKind in [tkString, tkUString]) then
            begin
              if (Propriedade.GetValue(pObjeto).AsString <> '') then
              begin
                CamposSQL := CamposSQL + (Atributo as TColumn).Name + ' = ' + QuotedStr(Propriedade.GetValue(pObjeto).ToString) + ','
              end;
            end

            else if (Propriedade.PropertyType.TypeKind = tkFloat) then
            begin
              if Propriedade.GetValue(pObjeto).AsExtended <> 0 then
              begin
                NomeTipo := LowerCase(Propriedade.PropertyType.Name);
                if NomeTipo = 'tdatetime' then
                  CamposSQL := CamposSQL + (Atributo as TColumn).Name + ' = ' + QuotedStr(FormatDateTime('yyyy-mm-dd', Propriedade.GetValue(pObjeto).AsExtended)) + ','
                else
                  CamposSQL := CamposSQL + (Atributo as TColumn).Name + ' = ' + QuotedStr(FormatFloat('0.000000', Propriedade.GetValue(pObjeto).AsExtended)) + ',';
              end;
            end

            else if Propriedade.GetValue(pObjeto).ToString <> '' then
            begin
              CamposSQL := CamposSQL + (Atributo as TColumn).Name + ' = ' + QuotedStr(Propriedade.GetValue(pObjeto).ToString) + ','
            end;
          end;
        end
        else if Atributo is TId then
          FiltroSQL := ' WHERE ' + (Atributo as TId).NameField + ' = ' + QuotedStr(Propriedade.GetValue(pObjeto).ToString);
      end;
    end;

    // Add - William 07-11-13
    FormatSettings.DecimalSeparator:= ',';

    // retirando as vírgulas que sobraram no final
    Delete(CamposSQL, Length(CamposSQL), 1);

    ConsultaSQL := ConsultaSQL + CamposSQL + FiltroSQL;


    Query:= TConexaoBD.GetInstance.GetQuery;
    Query.CommandText := ConsultaSQL;
    Query.ExecSQL();

    Result := True;
  finally
    Contexto.Free;
    FreeAndNil(Query);
  end;
end;

class function TiTECORM.Excluir(pObjeto: TObject): Boolean;
var
  Query: TSQLQuery;
  Contexto: TRttiContext;
  Tipo: TRttiType;
  Propriedade: TRttiProperty;
  Atributo: TCustomAttribute;
  ConsultaSQL, FiltroSQL: String;
begin
  try
    Contexto := TRttiContext.Create;
    Tipo := Contexto.GetType(pObjeto.ClassType);

    // localiza o nome da tabela
    for Atributo in Tipo.GetAttributes do
    begin
      if Atributo is TTable then
        ConsultaSQL := 'DELETE FROM ' + (Atributo as TTable).Name;
    end;

    // preenche o filtro
    for Propriedade in Tipo.GetProperties do
    begin
      for Atributo in Propriedade.GetAttributes do
      begin
        if Atributo is TId then
        begin
          FiltroSQL := ' WHERE ' + (Atributo as TId).NameField + ' = ' + QuotedStr(Propriedade.GetValue(pObjeto).ToString);
        end;
      end;
    end;

    ConsultaSQL := ConsultaSQL + FiltroSQL;

    Query:= TConexaoBD.GetQuery;
    Query.CommandText := ConsultaSQL;
    Query.ExecSQL();

    Result := True;
  finally
    Contexto.Free;
    FreeAndNil(Query);
  end;
end;

class function TiTECORM.Consultar(pObjeto: TObject; pFiltro: String; pPagina: Integer; DBXCommand: TDBXCommand): TDBXReader;
var
  Contexto: TRttiContext;
  Tipo: TRttiType;
  Atributo: TCustomAttribute;
  Propriedade: TRttiProperty;
  ConsultaSQL, FiltroSQL, Campo, NomeTabelaPrincipal, Joins: String;
  CamposConsulta: TStringList;
  TabelasJoin: TStringList; //Filtros em tabelas avô pra cima
  CamposJoin: TStringList; //Filtros em tabelas avô pra cima
  i, j: Integer;
  ConsultaTransiente: Boolean;
begin
  try
    try
      ConsultaTransiente := False;
      TabelasJoin := TStringList.Create;
      CamposJoin := TStringList.Create;
      Contexto := TRttiContext.Create;
      Tipo := Contexto.GetType(pObjeto.ClassType);

      // pega o nome da tabela principal
      for Atributo in Tipo.GetAttributes do
      begin
        if Atributo is TTable then
        begin
          NomeTabelaPrincipal := (Atributo as TTable).Name;
        end;
      end;

      // extrai os campos para consulta
      CamposConsulta := ExtraiCamposFiltro(pFiltro);

      // verifica se existem campos transientes na consulta
      for i := 0 to CamposConsulta.Count - 1 do
      begin
        Campo := CamposConsulta[i];

        for Propriedade in Tipo.GetProperties do
        begin
          for Atributo in Propriedade.GetAttributes do
          begin
            if Atributo is TColumn then
            begin
              // se o campo que retornou na lista for transiente, pega o nome da tabela e marca a consulta como transiente
              if ((Atributo as TColumn).Name = Campo) and ((Atributo as TColumn).Transiente) then
              begin
                Campo := StringReplace(Campo, '.', '', [rfReplaceAll]);
                ConsultaSQL := ConsultaSQL + ', ' + (Atributo as TColumn).Name + ' AS ' + Campo;

                //se houver um "." no nome da tabela chama o método para
                if (Pos('.', (Atributo as TColumn).TableName) > 0) then
                begin
                  Split('.', (Atributo as TColumn).TableName, TabelasJoin);
                  Split('.', (Atributo as TColumn).LocalColumn, CamposJoin);
                  Joins := Joins + ' ' + 'LEFT JOIN ' + TabelasJoin[0] + ' ON ' + NomeTabelaPrincipal + '.' + CamposJoin[0] + ' = ' + TabelasJoin[0] + '.' + (Atributo as TColumn).ForeingColumn;
                  for j := 1 to TabelasJoin.Count - 1 do
                    Joins := Joins + ' ' + 'LEFT JOIN ' + TabelasJoin[j] + ' ON ' + TabelasJoin[j-1] + '.' + CamposJoin[j] + ' = ' + TabelasJoin[j] + '.' + (Atributo as TColumn).ForeingColumn;
                end
                else
                  Joins := Joins + ' ' + 'LEFT JOIN ' + (Atributo as TColumn).TableName + ' ON ' + NomeTabelaPrincipal + '.' + (Atributo as TColumn).LocalColumn + ' = ' + (Atributo as TColumn).TableName + '.' + (Atributo as TColumn).ForeingColumn;
                ConsultaTransiente := True;
              end;
            end;
          end;
        end;
      end;

      // monta o inicio da consulta
      if ConsultaTransiente then
      begin
        // consulta transiente
        for Atributo in Tipo.GetAttributes do
        begin
          if Atributo is TTable then
          begin
            if (TConexaoBD.GetInstance.Banco = 'Firebird') and (pPagina >= 0) then
            begin
              ConsultaSQL := 'SELECT first ' + IntToStr(TConstantes.QUANTIDADE_POR_PAGINA) + ' skip ' + IntToStr(pPagina) + ' ' + (Atributo as TTable).Name + '.*' + ConsultaSQL + ' From ' + (Atributo as TTable).Name + Joins;
            end
            else
            begin
              ConsultaSQL := 'SELECT ' + (Atributo as TTable).Name + '.*' + ConsultaSQL + ' FROM ' + (Atributo as TTable).Name + Joins;
            end;
          end;
        end;
      end
      else
      begin
        // consulta normal
        for Atributo in Tipo.GetAttributes do
        begin
          if Atributo is TTable then
          begin
            if (TConexaoBD.GetInstance.Banco = 'Firebird') and (pPagina >= 0) then
            begin
              ConsultaSQL := 'SELECT first ' + IntToStr(TConstantes.QUANTIDADE_POR_PAGINA) + ' skip ' + IntToStr(pPagina) + ' * FROM ' + (Atributo as TTable).Name;
            end
            else
            begin
              ConsultaSQL := 'SELECT * FROM ' + (Atributo as TTable).Name;
            end;
          end;
        end;
      end;

      if TConexaoBD.GetInstance.Banco = 'Postgres' then
      begin
        if pFiltro <> '' then
        begin
          // Não diferenciar letras maiúsculas de minúsculas e nem acentuadas de não acentuadas.
          // Código Adicionado e Alterado por Carlos Fitl
          pFiltro := StringReplace(pFiltro, 'LIKE', 'ILIKE', [rfReplaceAll]);
          pFiltro := StringReplace(pFiltro, '[', ' CAST(', [rfReplaceAll]);
          pFiltro := StringReplace(pFiltro, ']', ' as VARCHAR)',[rfReplaceAll]);
          pFiltro := StringReplace(pFiltro, '"', chr(39), [rfReplaceAll]);
          FiltroSQL := ' WHERE ' + FormatarFiltro(pFiltro);
        end;
      end

      // Código Adicionado por Fernando L Oliveira.
      else if TConexaoBD.GetInstance.Banco = 'Firebird' then
      begin
        if pFiltro <> '' then
        begin
          // Não diferenciar letras maiúsculas de minúsculas e nem acentuadas de não acentuadas.
          pFiltro := StringReplace(pFiltro, '[', ' CAST([', [rfReplaceAll]);
          pFiltro := StringReplace(pFiltro, ']', ' as TEXT)] COLLATE PT_BR ',[rfReplaceAll]);
          FiltroSQL := ' WHERE ' + FormatarFiltro(pFiltro);
        end;
      end

      else if pFiltro <> '' then
      begin
        FiltroSQL := ' WHERE ' + FormatarFiltro(pFiltro);
      end;

      ConsultaSQL := ConsultaSQL + FiltroSQL;

      if (TConexaoBD.GetInstance.Banco = 'MySQL') and (pPagina >= 0) then
      begin
        ConsultaSQL := ConsultaSQL + ' limit ' + IntToStr(TConstantes.QUANTIDADE_POR_PAGINA) + ' offset ' + IntToStr(pPagina);
      end
	    else if (TConexaoBD.GetInstance.Banco = 'Postgres') and (pPagina >= 0) then
      begin
        ConsultaSQL := ConsultaSQL + ' limit ' + IntToStr(TConstantes.QUANTIDADE_POR_PAGINA) + ' offset ' + IntToStr(pPagina);
      end;

      // Retira os [] da consulta
      ConsultaSQL := StringReplace(ConsultaSQL, '[', '', [rfReplaceAll]);
      ConsultaSQL := StringReplace(ConsultaSQL, ']', '', [rfReplaceAll]);


      DBXCommand.Close;
      DBXCommand.Text:= ConsultaSQL;
      DBXCommand.Prepare;
      Result:= DBXCommand.ExecuteQuery;
    except
      raise ;
    end;
  finally
    Contexto.Free;
    FreeAndNil(CamposConsulta);
    FreeAndNil(TabelasJoin);
    FreeAndNil(CamposJoin);
  end;
end;

class function TiTECORM.Consultar(pConsulta: String; pFiltro: String; pPagina: Integer; DBXCommand: TDBXCommand): TDBXReader;
var
  FiltroSQL: String;
begin
  try
    if TConexaoBD.GetInstance.Banco = 'Postgres' then
    begin
      if pFiltro <> '' then
      begin
        pFiltro := StringReplace(FormatarFiltro(pFiltro), '"', chr(39), [rfReplaceAll]);
        FiltroSQL := ' and ' + pFiltro;
      end;
    end
    else
    begin
      if pFiltro <> '' then
      begin
        pFiltro := FormatarFiltro(pFiltro);
        FiltroSQL := ' and ' + pFiltro;
      end;
    end;

    DBXCommand.Close;
    DBXCommand.Text := pConsulta + FiltroSQL;
    DBXCommand.Prepare;
    Result:= DBXCommand.ExecuteQuery;
  except
    raise ;
  end;
end;

class function TiTECORM.Consultar<T>(pFiltro: String; pConsultaCompleta: Boolean; pPagina: Integer): TObjectList<T>;
var
  DBXCommand: TDBXCommand;
  DBXReader: TDBXReader;
  ObjConsulta: TObject;
  Obj: T;
begin
  ConsultaCompleta := pConsultaCompleta;
  Result := TObjectList<T>.Create;
  ObjConsulta := TClass(T).Create;
  try
    DBXCommand:= TConexaoBD.GetInstance.Conexao.DBXConnection.CreateCommand;
    DBXReader := Consultar(ObjConsulta, pFiltro, pPagina, DBXCommand);
    try
      while DBXReader.Next do
      begin
        Obj := TGenericVO<T>.FromDBXReader(DBXReader);
        if ConsultaCompleta then
        begin
          try
            PopularObjetosRelacionados(TVO(Obj));
          finally
          end;
        end;
        Result.Add(Obj);
      end;
    finally
      DBXReader.Free;
      DBXCommand.Free;
    end;
  finally
    ObjConsulta.Free;
  end;
end;

class function TiTECORM.ConsultarUmObjeto<T>(pFiltro: String; pConsultaCompleta: Boolean): T;
var
  DBXCommand: TDBXCommand;
  DBXReader: TDBXReader;
  ObjConsulta: TObject;
  Obj: T;
begin
  ConsultaCompleta := pConsultaCompleta;
  ObjConsulta := TClass(T).Create;
  try
    DBXCommand:= TConexaoBD.GetInstance.Conexao.DBXConnection.CreateCommand;
    DBXReader := Consultar(ObjConsulta, pFiltro, 0, DBXCommand);
    try
      if DBXReader.Next then
      begin
        Obj := TGenericVO<T>.FromDBXReader(DBXReader);
        if ConsultaCompleta then
        begin
          try
            PopularObjetosRelacionados(TVO(Obj));
          finally
          end;
        end;
        Result := Obj;
      end
      else
        Result := Nil;
    finally
      DBXReader.Free;
      DBXCommand.Free;
    end;
  finally
    ObjConsulta.Free;
  end;
end;

class function TiTECORM.Consultar<T>(pConsulta, pFiltro: String; pPagina: Integer): TJSONArray;
var
  FiltroSQL: String;
  DBXCommand: TDBXCommand;
  DBXReader: TDBXReader;
  Obj: T;
begin
  Result := TJSONArray.Create;

  pFiltro := FormatarFiltro(pFiltro);

  if pFiltro <> '' then
    FiltroSQL := ' WHERE ' + pFiltro;

  try
    DBXCommand:= TConexaoBD.GetInstance.Conexao.DBXConnection.CreateCommand;
    DBXCommand.Close;
    DBXCommand.Text:= pConsulta + FiltroSQL;
    DBXCommand.Prepare;
    DBXReader:= DBXCommand.ExecuteQuery;

    while DBXReader.Next do
    begin
      Obj := TGenericVO<T>.FromDBXReader(DBXReader);
      try
        Result.AddElement(TVO.ObjectToJSON<T>(Obj));
      finally
        TObject(Obj).Free;
      end;
    end;
  finally
    DBXReader.Free;
    DBXCommand.Free;
  end;
end;

class function TiTECORM.Consultar<T>(pConsultaCompleta: Boolean; pFiltro: String): TList<T>;
var
  DBXCommand: TDBXCommand;
  DBXReader: TDBXReader;
  ObjConsulta: TObject;
  Obj: T;
begin
  ConsultaCompleta := pConsultaCompleta;
  Result:= nil;
  ObjConsulta := TClass(T).Create;
  try
    DBXCommand:= TConexaoBD.GetInstance.Conexao.DBXConnection.CreateCommand;
    DBXReader := Consultar(ObjConsulta, pFiltro, -1, DBXCommand);
    try
      while DBXReader.Next do
      begin
        Obj := TGenericVO<T>.FromDBXReader(DBXReader);
        if ConsultaCompleta then
        begin
          try
            PopularObjetosRelacionados(TVO(Obj));
          finally
          end;
        end;

        if not Assigned(Result) then
          Result:= TList<T>.Create;

        Result.Add(Obj);
      end;
    finally
      DBXReader.Free;
      DBXCommand.Free;
    end;
  finally
    ObjConsulta.Free;
  end;
end;

class function TiTECORM.Consultar<T>(pFiltro: String; pPagina: Integer): TJSONArray;
var
  ObjConsulta: TObject;
  Obj: T;
  DBXCommand: TDBXCommand;
  DBXReader: TDBXReader;
begin
  Result := TJSONArray.Create;
  ObjConsulta := TClass(T).Create;
  try
    try
      DBXCommand:= TConexaoBD.GetInstance.Conexao.DBXConnection.CreateCommand;
      DBXReader := Consultar(ObjConsulta, pFiltro, pPagina, DBXCommand);
      try
        while DBXReader.Next do
        begin
          Obj := TGenericVO<T>.FromDBXReader(DBXReader);
          try
            PopularObjetosRelacionados(TVO(Obj));
            Result.AddElement(TVO(Obj).ToJSON);
          finally
            TObject(Obj).Free;
          end;
        end;
      finally
        DBXReader.Free;
        DBXCommand.Free;
      end;
    except
      raise ;
    end;
  finally
    ObjConsulta.Free;
  end;
end;

class function TiTECORM.Consultar<T>(pFiltro: String; pPagina: Integer; pConsultaCompleta: Boolean): TJSONArray;
var
  ObjConsulta: TObject;
  Obj: T;
  DBXReader: TDBXReader;
  DBXCommand: TDBXCommand;
begin
  ConsultaCompleta := pConsultaCompleta;
  Result := TJSONArray.Create;
  ObjConsulta := TClass(T).Create;
  try
    try
      DBXCommand:= TConexaoBD.GetInstance.Conexao.DBXConnection.CreateCommand;
      DBXReader := Consultar(ObjConsulta, pFiltro, pPagina, DBXCommand);
      try
        while DBXReader.Next do
        begin
          Obj := TGenericVO<T>.FromDBXReader(DBXReader);
          try
            PopularObjetosRelacionados(TVO(Obj));
            TVO(Obj).ToJSON;
            if not ConsultaCompleta then
              AnularObjetosRelacionados(TVO(Obj));
            Result.AddElement(TVO(Obj).ToJSON);
          finally
            TObject(Obj).Free;
          end;
        end;
      finally
        DBXReader.Free;
        DBXCommand.Free;
      end;
    except
      raise ;
    end;
  finally
    ObjConsulta.Free;
  end;
end;

class procedure TiTECORM.PopularObjetosRelacionados(pObj: TVO);
var
  Contexto: TRttiContext;
  Tipo: TRttiType;
  Atributo: TCustomAttribute;
  Propriedade: TRttiProperty;
  NomeTipoObj: String;
  NomeClasseObj: String;
  UnMarshal: TJSONUnMarshal;
  i: Integer;
  Obj: TVO;
  ItemLista: TVO;
  DBXCommand: TDBXCommand;
  DBXReader: TDBXReader;
  Lista: TObjectList<TVO>;
begin
  Contexto := TRttiContext.Create;
  try
    Tipo := Contexto.GetType(pObj.ClassType);

    // Percorre propriedades
    for Propriedade in Tipo.GetProperties do
    begin
      // Percorre atributos
      for Atributo in Propriedade.GetAttributes do
      begin

        // Verifica se o atributo é um atributo de associação para muitos
        if Atributo is TManyValuedAssociation then
        begin
          // Se for uma consulta completa, carrega as listas
          if ConsultaCompleta then
          begin
            // Se a propriedade for uma classe
            if Propriedade.PropertyType.TypeKind = tkClass then
            begin
              NomeTipoObj := Propriedade.PropertyType.Name;
              if (Pos('TList', NomeTipoObj) > 0) or (Pos('TObjectList', NomeTipoObj) > 0) then
              begin
                // Captura o tipo de classe da lista (TList<Unit.TNomeClasse>)
                i := Pos('<', NomeTipoObj);
                NomeClasseObj := Copy(NomeTipoObj, i + 1, Length(NomeTipoObj) - 1 - i);

                // Usa o UnMarshal para criar o objeto
                UnMarshal := TJSONUnMarshal.Create;
                try
                  // Cria objeto temporário
                  Obj := UnMarshal.ObjectInstance(Contexto, NomeClasseObj) as TVO;
                  if Assigned(Obj) then
                  begin
                    Lista := TObjectList<TVO>(Propriedade.GetValue(pObj).AsObject);

                    // Se a lista tiver sido instanciada
                    if Assigned(Lista) then
                    begin
                      // Consulta a lista de objetos
                      DBXCommand:= TConexaoBD.GetInstance.Conexao.DBXConnection.CreateCommand;
                      DBXReader := Consultar(Obj, (Atributo as TManyValuedAssociation).ForeingColumn + ' = ' + QuotedStr( String( ValorPropriedadeObjeto(pObj, (Atributo as TManyValuedAssociation).LocalColumn))), -1, DBXCommand);
                      try
                        while DBXReader.Next do
                        begin
                          // Cria nova instância do objeto temporário
                          ItemLista := Obj.NewInstance as TVO;
                          // Popula Objeto
                          ItemLista := VOFromDBXReader(ItemLista, DBXReader);
                          // Inclui objeto na lista
                          Lista.Add(ItemLista);

                          // se o campo estiver anotado para pegar as demais relações, continua populando os objetos
                          if (Atributo as TManyValuedAssociation).GetRelations then
                          begin
                            PopularObjetosRelacionados(ItemLista);
                          end
                        end;
                      finally
                        DBXReader.Free;
                        DBXCommand.Free;
                      end;
                    end;
                    // Destroi objeto temporário
                    Obj.Free;
                  end;
                finally
                  UnMarshal.Free;
                end;
              end;
            end;
          end;
        end

        // Verifica se o atributo é um atributo de associação para uma classe
        else if Atributo is TAssociation then
        begin
          // Se a propriedade for uma classe
          if Propriedade.PropertyType.TypeKind = tkClass then
          begin
            // Captura o tipo de classe da lista (Unit.TNomeClasse)
            NomeClasseObj := Propriedade.PropertyType.QualifiedName;

            // Verifica se o objeto já está instanciado
            Obj := Propriedade.GetValue(pObj).AsObject as TVO;
            // Se ele não estiver instanciado
            if not Assigned(Obj) then
            begin
              // Usa o UnMarshal para criar o objeto
              UnMarshal := TJSONUnMarshal.Create;
              try
                // Cria objeto
                Obj := UnMarshal.ObjectInstance(Contexto, NomeClasseObj) as TVO;
              finally
                UnMarshal.Free;
              end;
            end;

            // Se conseguiu capturar uma instância do objeto, popula...
            if Assigned(Obj) then
            begin
              // Consulta o objeto relacionado
              DBXCommand:= TConexaoBD.GetInstance.Conexao.DBXConnection.CreateCommand;
              DBXReader := Consultar(Obj, (Atributo as TAssociation).ForeingColumn + ' = ' + QuotedStr( String( ValorPropriedadeObjeto(pObj, (Atributo as TAssociation).LocalColumn))), -1, DBXCommand);
              try
                if DBXReader.Next then
                begin
                  // Popula Objeto
                  Obj := VOFromDBXReader(Obj, DBXReader);
                  // Inclui objeto no objeto principal
                  Propriedade.SetValue(pObj, Obj);
                  // se o campo estiver anotado para pegar as demais relações, continua populando os objetos
                  if (Atributo as TAssociation).GetRelations then
                  begin
                    PopularObjetosRelacionados(TVO(Obj));
                  end
                  // senão, anula objetos relacionados
                  else
                  begin
                    AnularObjetosRelacionados(TVO(Obj));
                  end;
                end
                else FreeAndNil(Obj);
              finally
                DBXReader.Free;
                DBXCommand.Free;
              end;
            end;
          end;
        end;
      end;
    end;
  finally
    Contexto.Free;
  end;
end;

class procedure TiTECORM.AnularObjetosRelacionados(pObj: TVO);
var
  Contexto: TRttiContext;
  Tipo: TRttiType;
  Atributo: TCustomAttribute;
  Propriedade: TRttiProperty;
begin
  Contexto := TRttiContext.Create;
  try
    Tipo := Contexto.GetType(pObj.ClassType);

    // Percorre propriedades
    for Propriedade in Tipo.GetProperties do
    begin
      // Percorre atributos
      for Atributo in Propriedade.GetAttributes do
      begin
        // Verifica se o atributo é um atributo de associação para muitos
        if Atributo is TManyValuedAssociation then
        begin
          Propriedade.SetValue(pObj, nil);
        end
        // Verifica se o atributo é um atributo de associação para uma classe
        else if Atributo is TAssociation then
        begin
          Propriedade.SetValue(pObj, nil);
        end;
      end;
    end;
  finally
    Contexto.Free;
  end;
end;

class function TiTECORM.ComandoSQL(pConsulta: String): Boolean;
var
  Query: TSQLQuery;
begin
  try
    Query:= TConexaoBD.GetInstance.GetQuery;
    Query.CommandText := pConsulta;
    Query.ExecSQL();
    Result := True;
  finally
    FreeAndNil(Query);
  end;
end;

class function TiTECORM.SelectMax(pTabela: String; pFiltro: String): Integer;
var
  Query: TSQLQuery;
  ConsultaSQL: String;
begin
  ConsultaSQL := 'SELECT MAX(ID) AS MAXIMO FROM ' + pTabela;
  if pFiltro <> '' then
    ConsultaSQL := ConsultaSQL + ' WHERE ' + pFiltro;
  try
    try
      Query:= TConexaoBD.GetQuery;
      Query.CommandText := ConsultaSQL;
      Query.Open;

      if Query.RecordCount > 0 then
        Result := Query.FieldByName('MAXIMO').AsInteger
      else
        Result := -1;

    except
      Result := -1;
    end;
  finally
    FreeAndNil(Query);
  end;
end;

class function TiTECORM.SelectMin(pTabela: String; pFiltro: String): Integer;
var
  Query: TSQLQuery;
  ConsultaSQL: String;
begin
  ConsultaSQL := 'SELECT MIN(ID) AS MINIMO FROM ' + pTabela;
  if pFiltro <> '' then
    ConsultaSQL := ConsultaSQL + ' WHERE ' + pFiltro;
  try
    try
      Query:= TConexaoBD.GetQuery;
      Query.CommandText := ConsultaSQL;
      Query.Open;

      if Query.RecordCount > 0 then
        Result := Query.FieldByName('MINIMO').AsInteger
      else
        Result := -1;

    except
      Result := -1;
    end;
  finally
    FreeAndNil(Query);
  end;
end;

class function TiTECORM.storeFirebird(pObjeto: TObject): String;
var
  Query: TSQLQuery;
  Contexto: TRttiContext;
  Tipo: TRttiType;
  Propriedade: TRttiProperty;
  Atributo: TCustomAttribute;
  ConsultaSQL, CamposSQL, ValoresSQL: String;
  UltimoID: String;
  Tabela: String;
  NomeTipo: String;
begin
  try
    // Add - William 07-11-13
    FormatSettings.DecimalSeparator:= '.';

    Contexto := TRttiContext.Create;
    Tipo := Contexto.GetType(pObjeto.ClassType);

    // localiza o nome da tabela
    for Atributo in Tipo.GetAttributes do
    begin
      if Atributo is TTable then
      begin
        ConsultaSQL := 'INSERT INTO ' + (Atributo as TTable).Name;
        Tabela := (Atributo as TTable).Name;
      end;
    end;

    // preenche os nomes dos campos e valores
    for Propriedade in Tipo.GetProperties do
    begin
      for Atributo in Propriedade.GetAttributes do
      begin
        if Atributo is TColumn then
        begin
          if not(Atributo as TColumn).Transiente then
          begin
            if (Propriedade.PropertyType.TypeKind in [tkInteger, tkInt64]) then
            begin
              if (Propriedade.GetValue(pObjeto).AsInteger <> 0) then
              begin
                CamposSQL := CamposSQL + (Atributo as TColumn).Name + ',';
                ValoresSQL := ValoresSQL + Propriedade.GetValue(pObjeto).ToString + ',';
              end;
            end
            else if (Propriedade.PropertyType.TypeKind in [tkString, tkUString]) then
            begin
              if (Propriedade.GetValue(pObjeto).AsString <> '') then
              begin
                CamposSQL := CamposSQL + (Atributo as TColumn).Name + ',';
                ValoresSQL := ValoresSQL + QuotedStr(Propriedade.GetValue(pObjeto).ToString) + ',';
              end;
            end
            else if (Propriedade.PropertyType.TypeKind = tkFloat) then
            begin
              NomeTipo := LowerCase(Propriedade.PropertyType.Name);
              if NomeTipo = 'tdatetime' then
              begin
                if Propriedade.GetValue(pObjeto).AsExtended > 0 then
                begin
                  CamposSQL := CamposSQL + (Atributo as TColumn).Name + ',';
                  ValoresSQL := ValoresSQL + QuotedStr(FormatDateTime('yyyy-mm-dd', Propriedade.GetValue(pObjeto).AsExtended)) + ',';
                end;
              end
              else
              begin
                CamposSQL := CamposSQL + (Atributo as TColumn).Name + ',';
                ValoresSQL := ValoresSQL + QuotedStr(FormatFloat('0.000000', Propriedade.GetValue(pObjeto).AsExtended)) + ',';
              end;
            end
            else
            begin
              CamposSQL := CamposSQL + (Atributo as TColumn).Name + ',';
              ValoresSQL := ValoresSQL + QuotedStr(Propriedade.GetValue(pObjeto).ToString) + ',';
            end;
          end;
        end;
      end;
    end;

    // Add - William 07-11-13
    FormatSettings.DecimalSeparator:= ',';

    // retirando as vírgulas que sobraram no final
    Delete(CamposSQL, Length(CamposSQL), 1);
    Delete(ValoresSQL, Length(ValoresSQL), 1);

    ConsultaSQL := ConsultaSQL + '(' + CamposSQL + ') VALUES (' + ValoresSQL + ')';

    if TConexaoBD.GetInstance.Banco = 'Firebird' then
    begin
      ConsultaSQL := ConsultaSQL + ' RETURNING ID ';
    end;


    try
      Query := TConexaoBD.GetQuery;
      Query.CommandText := ConsultaSQL;

      UltimoID := '';
      Query.Open;
      UltimoID := Query.Fields[0].AsString;
    finally
      Query.Close;
      FreeAndNil(Query);
    end;

    Result := UltimoID;
  finally
    Contexto.Free;
  end;
end;

end.
