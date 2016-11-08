unit CrediarioRepository;

interface

uses BasicRepository, System.Generics.Collections, System.SysUtils, FnCrediarioVO,
  Biblioteca;

type
  TCrediarioRepository = class(TBasicRepository)

  class function indexContaPagar(Search: String): TList<TFnCrediarioVO>;
  class function indexContaPagarEntreData(Search: String; DtIni,DtFim: TDateTime): TList<TFnCrediarioVO>;
  class function indexParcelaPagar(Search: String): TList<TFnCrediarioVO>;
  class function indexContaPagarParcelaFilho(Search: String): TList<TFnCrediarioVO>;
  class function indexContaReceber(Search: String): TList<TFnCrediarioVO>;
  class function indexVenda(Search: String): TList<TFnCrediarioVO>;
  class function indexVendaPaga(Search: String): TList<TFnCrediarioVO>;
  class function store(Crediario: TFnCrediarioVO): Boolean;
  class function update(Crediario,CrediarioOld: TFnCrediarioVO): Boolean;
  class function destroyer(Crediario: TFnCrediarioVO): Boolean;
  class function getById(IdCrediario: String): TFnCrediarioVO;

  end;

implementation

{ TCrediarioRepository }

class function TCrediarioRepository.indexContaPagar(
  Search: String): TList<TFnCrediarioVO>;
var
  Filtro: String;
begin
  if Search <> '' then
    Filtro:= ' ID LIKE ' + QuotedStr(Search+'%') + ' AND TIPO_CADASTRO = ''CONTA A PAGAR'' ORDER BY DATA_VENCIMENTO'
  else
    Filtro:= ' ID IS NOT NULL  AND TIPO_CADASTRO = ''CONTA A PAGAR'' ORDER BY DATA_VENCIMENTO';

  Result:= Consultar<TFnCrediarioVO>(False,Filtro);
end;

class function TCrediarioRepository.indexContaPagarEntreData(Search: String;
DtIni,DtFim: TDateTime): TList<TFnCrediarioVO>;
var
  Filtro: String;
begin
  if Search <> '' then
  begin
    Filtro:= ' ID LIKE ' + QuotedStr(Search+'%') + ' AND TIPO_CADASTRO = ''CONTA A PAGAR'' AND '+
    DatesToSQL(DtIni,DtFim,'DATA_VENCIMENTO',False);
    Result:= Consultar<TFnCrediarioVO>(False,Filtro);
  end
  else
  begin
    Filtro:= ' ID IS NOT NULL  AND TIPO_CADASTRO = ''CONTA A PAGAR'' AND  ' + DatesToSQL(DtIni,DtFim,'DATA_VENCIMENTO',False);
    Result:= Consultar<TFnCrediarioVO>(False,Filtro);
  end;
end;

class function TCrediarioRepository.indexContaPagarParcelaFilho(
  Search: String): TList<TFnCrediarioVO>;
var
  Filtro: String;
begin
  Filtro:= ' ID_PARCELA_PAI = ' + QuotedStr(Search) + ' AND TIPO_CADASTRO = ''CONTA A PAGAR''';
  Result:= Consultar<TFnCrediarioVO>(False,Filtro);
end;

class function TCrediarioRepository.indexContaReceber(Search: String): TList<TFnCrediarioVO>;
var
  Filtro: String;
begin
  Filtro:= ' OBS LIKE ' + QuotedStr(Search+'%') + ' AND TIPO_CADASTRO = ''CONTA A RECEBER'' ORDER BY DATA_VENCIMENTO';
  Result:= Consultar<TFnCrediarioVO>(False,Filtro);
end;

class function TCrediarioRepository.indexParcelaPagar(
  Search: String): TList<TFnCrediarioVO>;
var
  Filtro: String;
begin
  Filtro:= ' ID LIKE ' + QuotedStr(Search+'%') + ' AND TIPO_CADASTRO = ''CONTA A PAGAR'' ORDER BY DATA_VENCIMENTO';
  Result:= Consultar<TFnCrediarioVO>(False,Filtro);
end;

class function TCrediarioRepository.indexVenda(
  Search: String): TList<TFnCrediarioVO>;
var
  Filtro: String;
begin
  Filtro:= ' ID_VENDA = ' + QuotedStr(Search);
  Result:= Consultar<TFnCrediarioVO>(False,Filtro);
end;

class function TCrediarioRepository.indexVendaPaga(
  Search: String): TList<TFnCrediarioVO>;
var
  Filtro: String;
begin
  Filtro:= ' ID_VENDA = ' + QuotedStr(Search) + ' AND STATUS = ''PAGO''';
  Result:= Consultar<TFnCrediarioVO>(False,Filtro);
end;

class function TCrediarioRepository.store(Crediario: TFnCrediarioVO): Boolean;
begin
  Crediario.Id:= storeFirebird(Crediario);
  Result:= Trim(Crediario.Id) <> EmptyStr;
end;

class function TCrediarioRepository.update(Crediario, CrediarioOld: TFnCrediarioVO): Boolean;
begin
  Result:= Alterar(Crediario,CrediarioOld);
end;

class function TCrediarioRepository.destroyer(Crediario: TFnCrediarioVO): Boolean;
begin
  Result:= Excluir(Crediario);
end;

class function TCrediarioRepository.getById(IdCrediario: String): TFnCrediarioVO;
begin
  Result:= ConsultarUmObjeto<TFnCrediarioVO>('ID = ' + QuotedStr(IdCrediario),False);
end;

end.
