unit Bibli;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  DBClient,
  Constantes,
  DB,
  DBXMySql,
  DBGrids,
  IdHashMessageDigest,
  IdBaseComponent,
  IdIcmpClient,
  ShellApi,
  System.DateUtils,
  System.UITypes;

type
  TBiblioteca = Class
  Private
     { Private declarations }
  public
    { Public declarations }
    function  ExibeMS(Mensagem: String; Tipo: Integer):Boolean;
    Function  ValidaCNPJ(xCNPJ: String):Boolean;
    Function  ValidaCPF( xCPF:String ):Boolean;
    Function  ValidaEstado(Dado : string) : boolean;
    Function  MixCase(InString: String): String;
    Function  Hora_Seg( Horas:string ):LongInt;
    Function  Seg_Hora( Seg:LongInt ):string;
    Function  Minuscula(InString: String): String;
    Function  StrZero(Num:Real ; Zeros,Deci:integer): string;
    Function  OrdenaPinta(xGrid: DBGrids.TDBGrid; Column: TColumn; cds:
      TClientDataSet): boolean;
    function  MD5File(const fileName: string): string;
    function  MD5String(const texto: string): string;
    Function  TruncaValor(Value:Extended;Casas:Integer):Extended;
    function  UltimoDiaMes(Mdt: TDateTime) : String;
    function  FormataFloat(Tipo:String; Valor: Extended): string;
    function  DevolveInteiro(Const Texto:String):String;
    function  DevolveConteudoDelimitado(Delimidador:string;var Linha:string):string;
    function  VersaoExe(exe, param : string): String;
    function  ExecutaPing(HostName: String): boolean;
    function  StrIsInteger(const S: string): boolean;
    function  padR(const AString : AnsiString; const nLen : Integer; const Caracter : AnsiChar) : AnsiString ;
    function  TiraPontos(Str: string): string;
    function  TextoParaData(pData: string): TDate;
    function  DataParaTexto(pData: TDate): string;
    function  mc_ValorExtenso(Valor :Currency) :String;
    function  OrganizaFloat(valor: String):Double; overload;
    function  serialhd(drive: string): string;
    function  FloatToSql(valor: string):string;
    function  SqlToFloat(Valor: string):string;
    Function  colocamascara(num: String; tipo: Integer): string;
    function  BooleanTostr(Valor: Boolean): string;

    Procedure ZapFiles(vMasc:String);
    Procedure SetTaskBar(Visible: Boolean);
    procedure Split(const Delimiter: Char; Input: string; const Strings: TStrings);
    procedure ArredondaComponentes(Control: TWinControl);
    procedure Restart;

    {Funções auxiliares}
    function  mcx_Ajusta(Valor :String) :String;
    function  mcx_Centenas(Valor :Integer) :String;
    function  mcx_Dezenas(Valor :Integer) :String;
    function  mcx_Unidades(Valor :Integer) :String;
    function  Codifica(Action, Src: String): String;
    Function  ColocaZerosEsquerda(S:String;vT:Integer):String;
    function  StrEsquerda(S: string; vt: integer):string;
    function  StrDireita(S: string; vt: integer): string;
    function  StrCentro(S: string; vt: integer): string;
    function  VerificaNULL(Texto:string;Tipo:integer):string;
    function  Modulo11(Numero: String): String;
    function  FileTimeToDTime(FTime: TFileTime): TDateTime;
    function  GetIdentificacao: string;
    function  VerificaTempo(Data1, Data2: TDateTime; Tipo: Byte): Integer;
    function  AdicionarMascaraCPF_CNPJ(Valor: string): string;
    function StringToHex (S : string) : string;

    procedure ConfiguraAmbiente;
    procedure PercorreDataSet(DataSet: TDataSet; Procedimento: TProc);


  End;

var
  Bb: TBiblioteca;
  InString : String;

implementation

{ TBiblioteca }

function TBiblioteca.BooleanTostr(Valor: Boolean): string;
begin
  if Valor then
  begin
    Result:= 'S';
  end
  else
  begin
    Result:= 'N';
  end;
end;

function TBiblioteca.FileTimeToDTime(FTime: TFileTime): TDateTime;
var
  LocalFTime: TFileTime;
  STime: TSystemTime;
begin
  FileTimeToLocalFileTime(FTime, LocalFTime);
  FileTimeToSystemTime(LocalFTime, STime);
  Result := SystemTimeToDateTime(STime);
end;

function TBiblioteca.FloatToSql(valor: string):string;
var
  I: Integer;
  ValorManipulado,ResultadoManipulavel: String;
begin
     I:= 1;
     ValorManipulado:= '';
     ResultadoManipulavel:= '';

     while I > 0 do
        begin
            ValorManipulado:= Copy(Valor,I,1);

            if (ValorManipulado <> ',') then
                ResultadoManipulavel:= ResultadoManipulavel + ValorManipulado
            else
                ResultadoManipulavel:= ResultadoManipulavel + '.';

            if (ValorManipulado <> '') then
               I:= I+1
            else
               I:= 0;

        end;

     if ResultadoManipulavel = '' then
        ResultadoManipulavel:= '0';

     Result:= ResultadoManipulavel;
end;


function TBiblioteca.serialhd(drive: string): string;
Var
	Serial:DWord;
	DirLen,Flags: DWord;
	DLabel : Array[0..11] of Char;
begin
	Try GetVolumeInformation(PChar(Drive+':\'),dLabel,12,@Serial,DirLen,Flags,nil,0);
  		Result := IntToHex(Serial,8);
		Except Result :='';
	end;
end;

procedure TBiblioteca.ConfiguraAmbiente;
begin
//  DateSeparator     := '/';
//  ShortDateFormat   := 'dd/mm/yyyy';
//  ThousandSeparator := '.';
//  DecimalSeparator  := ',';
end;

function TBiblioteca.VerificaNULL(Texto:string;Tipo:integer):string;
begin

  case tipo of
    0:begin
      if trim(Texto) = '' then
        Result := 'NULL'
      else
        Result := trim(Texto);
    end;
    1:begin
      if trim(Texto) = '' then
        Result := 'NULL'
      else
        Result := QuotedStr(trim(Texto));
    end;
  end;

end;

function TBiblioteca.VerificaTempo(Data1, Data2: TDateTime;
  Tipo: Byte): Integer;
begin
  try
    Result:= SecondsBetween(Data1,Data2);
  except
    Result:= 0;
  end;
end;

function TBiblioteca.ValidaCNPJ(xCNPJ: String):Boolean;
Var
d1,d4,xx,nCount,fator,resto,digito1,digito2 : Integer;
Check : String;
begin
d1 := 0;
d4 := 0;
xx := 1;
for nCount := 1 to Length( xCNPJ )-2 do
    begin
    if Pos( Copy( xCNPJ, nCount, 1 ), '/-.' ) = 0 then
       begin
       if xx < 5 then
          begin
          fator := 6 - xx;
          end
       else
          begin
          fator := 14 - xx;
          end;
       d1 := d1 + StrToInt( Copy( xCNPJ, nCount, 1 ) ) * fator;
       if xx < 6 then
          begin
          fator := 7 - xx;
          end
       else
          begin
          fator := 15 - xx;
          end;
       d4 := d4 + StrToInt( Copy( xCNPJ, nCount, 1 ) ) * fator;
       xx := xx+1;
       end;
    end;
    resto := (d1 mod 11);
    if resto < 2 then
       begin
       digito1 := 0;
       end
   else
       begin
       digito1 := 11 - resto;
       end;
   d4 := d4 + 2 * digito1;
   resto := (d4 mod 11);
   if resto < 2 then
      begin
      digito2 := 0;
      end
   else
      begin
      digito2 := 11 - resto;
      end;
   Check := IntToStr(Digito1) + IntToStr(Digito2);
   if Check <> copy(xCNPJ,succ(length(xCNPJ)-2),2) then
      begin
      Result := False;
      end
   else
      begin
      Result := True;
      end;
end;

{ Valida o CPF digitado }
function TBiblioteca.ValidaCPF( xCPF:String ):Boolean;
Var
d1,d4,xx,nCount,resto,digito1,digito2 : Integer;
Check : String;
Begin
d1 := 0; d4 := 0; xx := 1;
for nCount := 1 to Length( xCPF )-2 do
    begin
    if Pos( Copy( xCPF, nCount, 1 ), '/-.' ) = 0 then
       begin
       d1 := d1 + ( 11 - xx ) * StrToInt( Copy( xCPF, nCount, 1 ) );
       d4 := d4 + ( 12 - xx ) * StrToInt( Copy( xCPF, nCount, 1 ) );
       xx := xx+1;
       end;
    end;
resto := (d1 mod 11);
if resto < 2 then
   begin
   digito1 := 0;
   end
else
   begin
   digito1 := 11 - resto;
   end;
d4 := d4 + 2 * digito1;
resto := (d4 mod 11);
if resto < 2 then
   begin
   digito2 := 0;
   end
else
   begin
   digito2 := 11 - resto;
   end;
Check := IntToStr(Digito1) + IntToStr(Digito2);
if Check <> copy(xCPF,succ(length(xCPF)-2),2) then
   begin
   Result := False;
   end
else
   begin
   Result := True;
   end;
end;

function TBiblioteca.ValidaEstado(Dado : string) : boolean;
const
  Estados = 'SPMGRJRSSCPRESDFMTMSGOTOBASEALPBPEMARNCEPIPAAMAPFNACRRRO';
var
  Posicao : integer;
begin
Result := true;
if Dado <> '' then
   begin
   Posicao := Pos(UpperCase(Dado),Estados);
   if (Posicao = 0) or ((Posicao mod 2) = 0) then
      begin
      Result := false;
      end;
    end;
end;

{Corrige a string que contenha caracteres maiusculos
inseridos no meio dela para tudo minusculo e com a
primeira letra maiuscula}
Function  TBiblioteca.MixCase(InString: String): String;
Var I: Integer;
Begin
  Result := LowerCase(InString);
  Result[1] := UpCase(Result[1]);
  For I := 1 To Length(InString) - 1 Do Begin
    If (Result[I] = ' ') Or (Result[I] = '''') Or (Result[I] = '"')
    Or (Result[I] = '-') Or (Result[I] = '.')  Or (Result[I] = '(') Then
      Result[I + 1] := UpCase(Result[I + 1]);
    if Result[I] = 'Ç' then
      Result[I] := 'ç';
    if Result[I] = 'Ã' then
      Result[I] := 'ã';
    if Result[I] = 'Á' then
      Result[I] := 'á';
    if Result[I] = 'É' then
      Result[I] := 'é';
    if Result[I] = 'Í' then
      Result[I] := 'í';
    if Result[I] = 'Õ' then
      Result[I] := 'õ';
    if Result[I] = 'Ó' then
      Result[I] := 'ó';
    if Result[I] = 'Ú' then
      Result[I] := 'ú';
    if Result[I] = 'Â' then
      Result[I] := 'â';
    if Result[I] = 'Ê' then
      Result[I] := 'ê';
    if Result[I] = 'Ô' then
      Result[I] := 'ô';
  End;
End;

{Apaga arquivos usando mascaras tipo: c:\Temp\*.zip, c:\Temp\*.*
Obs: Requer o Path dos arquivos a serem deletados}
Procedure TBiblioteca.ZapFiles(vMasc:String);
Var Dir : TsearchRec;
    Erro: Integer;
Begin
   Erro := FindFirst(vMasc,faArchive,Dir);
   While Erro = 0 do Begin
      DeleteFile( ExtractFilePAth(vMasc)+Dir.Name );
      Erro := FindNext(Dir);
   End;
   FindClose(Dir);
End;

function TBiblioteca.Hora_Seg( Horas:string ):LongInt;
Var Hor,Min,Seg:LongInt;
begin
  Horas[Pos(':',Horas)]:= '[';
  Horas[Pos(':',Horas)]:= ']';
  Hor := StrToInt(Copy(Horas,1,Pos('[',Horas)-1));
  Min := StrToInt(Copy(Horas,Pos('[',Horas)+1,(Pos(']',Horas)-Pos('[',Horas)-1)));
  if Pos(':',Horas) > 0 then
    Seg := StrToInt(Copy(Horas,Pos(']',Horas)+1,(Pos(':',Horas)-Pos(']',Horas)-1)))
  else
    Seg := StrToInt(Copy(Horas,Pos(']',Horas)+1,2));
  Result := Seg + (Hor*3600) + (Min*60);
end;

function TBiblioteca.Seg_Hora( Seg:LongInt ):string;
Var
  Hora,Min:LongInt;
  Tmp : Double;
begin
   Tmp := Seg / 3600;
   Hora := Round(Int(Tmp));
   Seg :=  Round(Seg - (Hora*3600));
   Tmp := Seg / 60;
   Min := Round(Int(Tmp));
   Seg :=  Round(Seg - (Min*60));
   Result := StrZero(Hora,2,0)+':'+StrZero(Min,2,0)+':'+StrZero(Seg,2,0);
end;

{converte tudo para minuscula}
Function  TBiblioteca.Minuscula(InString: String): String;
Var I: Integer;
Begin
  Result := LowerCase(InString);
  For I := 1 To Length(InString) - 1 Do Begin
    If (Result[I] = ' ') Or (Result[I] = '''') Or (Result[I] = '"')
    Or (Result[I] = '-') Or (Result[I] = '.')  Or (Result[I] = '(') Then
      Result[I] := UpCase(Result[I]);
    if Result[I] = 'Ç' then
      Result[I] := 'ç';
    if Result[I] = 'Ã' then
      Result[I] := 'ã';
    if Result[I] = 'Á' then
      Result[I] := 'á';
    if Result[I] = 'É' then
      Result[I] := 'é';
    if Result[I] = 'Í' then
      Result[I] := 'í';
    if Result[I] = 'Õ' then
      Result[I] := 'õ';
    if Result[I] = 'Ó' then
      Result[I] := 'ó';
    if Result[I] = 'Ú' then
      Result[I] := 'ú';
    if Result[I] = 'Â' then
      Result[I] := 'â';
    if Result[I] = 'Ê' then
      Result[I] := 'ê';
    if Result[I] = 'Ô' then
      Result[I] := 'ô';
  End;
End;

{esconde|exibe a barra do Windows}
procedure TBiblioteca.SetTaskBar(Visible: Boolean);
var
  wndHandle : THandle;
  wndClass : array[0..50] of Char;
begin
{  StrPCopy(@wndClass[0],'Shell_TrayWnd');
  wndHandle := FindWindow(@wndClass[0], nil);
  If Visible = True then
    ShowWindow(wndHandle, SW_RESTORE)
  else ShowWindow(wndHandle, SW_HIDE); }
end;

function TBiblioteca.StrZero(Num:Real ; Zeros,Deci:integer): string;
var
  Tam,Z:integer;
  Res,Zer:string;
begin
   Str(Num:Zeros:Deci,Res);
   Res := Trim(Res);
   Tam := Length(Res);
   Zer := '';
   for z := 01 to (Zeros-Tam) do
      Zer := Zer + '0';
   Result := Zer+Res;
end;

Function TBiblioteca.OrdenaPinta(xGrid: DBGrids.TDBGrid; Column: TColumn; cds:
  TClientDataSet): boolean;
const
  idxDefault = 'DEFAULT_ORDER';
var
  strColumn: string;
  bolUsed: boolean;
  idOptions: TIndexOptions;
  i: integer;
  VDescendField: string;
  coluna : String;
begin

  result := False;
  if not cds.Active then
    exit;

  strColumn := idxDefault;

  // não faz nada caso seja um campo calculado
  if (Column.Field.FieldKind = fkCalculated) then
    exit;

  // índice já está sendo utilizado
  bolUsed := (Column.Field.FieldName = cds.IndexName);

  // seta o nome da coluna na variavel para carga de dados e pesquisa
  coluna := Column.Field.FieldName;

  // verifica a existência do índice e propriedades
  cds.IndexDefs.Update;
  idOptions := [];
  for i := 0 to cds.IndexDefs.Count - 1 do
  begin
    if cds.IndexDefs.Items[i].Name = Column.Field.FieldName then
    begin
      strColumn := Column.Field.FieldName;
      // determina como deve ser criado o índice, inverte a condição ixDescending
      case (ixDescending in cds.IndexDefs.Items[i].Options) of
        True:
          begin
            idOptions := [];
            VDescendField := '';
          end;
        False:
          begin
            idOptions := [ixDescending];
            VDescendField := strColumn;
          end;
      end;
    end;
  end;

  // caso não encontre o índice ou o mesmo esteja em uso
  if (strColumn = idxDefault) or bolUsed then
  begin
    if bolUsed then
      cds.DeleteIndex(Column.Field.FieldName);
    try
      cds.AddIndex(Column.Field.FieldName, Column.Field.FieldName, idOptions,
        VDescendField, '', 0);
      strColumn := Column.Field.FieldName;
    except
      // se índice indeterminado, seta o padrão
      if bolUsed then
        strColumn := idxDefault;
    end;
  end;

  // pinta todas as outras colunas com a cor padrão e a coluna clicada com a cor Azul
  for i := 0 to xGrid.Columns.Count - 1 do
  begin
    if Pos(strColumn, xGrid.Columns[i].Field.FieldName) <> 0 then
      xGrid.Columns[i].Title.Font.Color := clBlue
    else
      xGrid.Columns[i].Title.Font.Color := clWindowText;
  end;

  // tenta setar o índice, caso ocorra algum erro seta o padrão
  try
    cds.IndexName := strColumn;
  except
    cds.IndexName := idxDefault;
  end;

  result := True;
end;

function TBiblioteca.OrganizaFloat(valor: String): Double;
var
  I: Integer;
  ValorManipulado,ResultadoManipulavel: String;
begin
  I:= 1;
  ValorManipulado:= '';
  ResultadoManipulavel:= '';

  while I > 0 do
    begin
        ValorManipulado:= Copy(Valor,I,1);

        if (ValorManipulado <> '.') and (ValorManipulado <> '%') then
            ResultadoManipulavel:= ResultadoManipulavel + ValorManipulado;

        if (ValorManipulado <> '%') and (ValorManipulado <> '') then
           I:= I+1
        else
           I:= 0;

    end;
  if ResultadoManipulavel = '' then
    ResultadoManipulavel:= '0';

  Result:= StrToFloat(ResultadoManipulavel);
end;

function TBiblioteca.MD5File(const fileName: string): string;
var
  idmd5 : TIdHashMessageDigest5;
  fs : TFileStream;
begin
  idmd5 := TIdHashMessageDigest5.Create;
  fs := TFileStream.Create(fileName, fmOpenRead OR fmShareDenyWrite) ;
  try
    result := idmd5.HashStreamAsHex(fs);
  finally
    fs.Free;
    idmd5.Free;
  end;
end;

function TBiblioteca.MD5String(const texto: string): string;
var
  idmd5: TIdHashMessageDigest5;
begin
  idmd5 := TIdHashMessageDigest5.Create;
  try
    result := LowerCase(idmd5.HashStringAsHex(texto));
  finally
  idmd5.Free;
  end;
end;

Function TBiblioteca.TruncaValor(Value:Extended;Casas:Integer):Extended;
Var
  sValor:String;
  nPos:Integer;
begin
   //Transforma o valor em string
   sValor := FloatToStr(Value);

   //Verifica se possui ponto decimal
   nPos := Pos(FormatSettings.DecimalSeparator,sValor);
   If ( nPos > 0 ) Then begin
      sValor := Copy(sValor,1,nPos+Casas);
   End;

   Result := StrToFloat(sValor);
end;

function TBiblioteca.UltimoDiaMes(Mdt: TDateTime) : String;
var
  ano, mes, dia : word;
  mDtTemp : TDateTime;
begin
  Decodedate(mDt, ano, mes, dia);
  mDtTemp := (mDt - dia) + 33;
  Decodedate(mDtTemp, ano, mes, dia);
  mDtTemp := mDtTemp - dia;
  Decodedate(mDtTemp, ano, mes, dia);
  Result := IntToStr(dia)
end;

function TBiblioteca.FormataFloat(Tipo:String; Valor: Extended): string;
var
  i:integer;
  Mascara:String;
begin
  Mascara := '0.';

  if Tipo = 'Q' then
  begin
    for i := 1 to Constantes.TConstantes.DECIMAIS_QUANTIDADE do
      Mascara := Mascara + '0';
  end
  else if Tipo = 'V' then
  begin
    for i := 1 to Constantes.TConstantes.DECIMAIS_VALOR do
      Mascara := Mascara + '0';
  end;

  Result := FormatFloat(Mascara, Valor);
end;

function TBiblioteca.GetIdentificacao: string;
begin
  Result:= Bb.serialhd('C');
  Result:= Result + '05041988';
  Result:= Bb.MD5String(Result);
  Result:= Bb.DevolveInteiro(Result);
end;

procedure TBiblioteca.Split(const Delimiter: Char; Input: string;
  const Strings: TStrings);
begin
  Assert(Assigned(Strings)) ;
  Strings.Clear;
  Strings.Delimiter := Delimiter;
  Strings.DelimitedText := Input;
end;

function TBiblioteca.SqlToFloat(Valor: string): string;
var
  I: Integer;
  ValorManipulado,ResultadoManipulavel: String;
begin
  I:= 1;
  ValorManipulado:= '';
  ResultadoManipulavel:= '';

  while I > 0 do
  begin
    ValorManipulado:= Copy(Valor,I,1);

    if (ValorManipulado = '.') then
      ValorManipulado:= ',';

    ResultadoManipulavel:= ResultadoManipulavel + ValorManipulado;

    if (ValorManipulado <> '%') and (ValorManipulado <> '') then
       I:= I+1
    else
       I:= 0;
  end;
  if ResultadoManipulavel = '' then
    ResultadoManipulavel:= '0';

  Result:= ResultadoManipulavel;
end;

function TBiblioteca.DevolveInteiro(Const Texto:String):String;
var I: integer;
    S: string;
begin
  S := '';
  for I := 1 To Length(Texto) Do
  begin
    if CharInSet((Texto[I]),['0'..'9']) then
    begin
      S := S + Copy(Texto, I, 1);
    end;
  end;
  result := S;
end;

function TBiblioteca.DevolveConteudoDelimitado(Delimidador:string;
  var Linha:string):string;
var
  PosBarra: integer;
begin
  PosBarra:=Pos(Delimidador,Linha);
  Result:= StringReplace((Copy(Linha,1,PosBarra-1)),'[#]','|',[rfReplaceAll]);
  Delete(Linha,1,PosBarra);
end;

function TBiblioteca.VersaoExe(exe, param : string): String;
type
   PFFI = ^vs_FixedFileInfo;
var
  F : PFFI;
  Handle : Dword;
  Len : Longint;
  Data : Pchar;
  Buffer : Pointer;
  Tamanho : Dword;
  Parquivo: Pchar;

begin
  Parquivo := StrAlloc(Length(Exe) + 1);
  StrPcopy(Parquivo, Exe);
  Len := GetFileVersionInfoSize(Parquivo, Handle);
  Result := '';
  if Len > 0 then
  begin
    Data:=StrAlloc(Len+1);
    if GetFileVersionInfo(Parquivo,Handle,Len,Data) then
    begin
      VerQueryValue(Data, '\',Buffer,Tamanho);
      F := PFFI(Buffer);
      if param = 'N' then
      begin
        Result := Format('%d%d%d%d',
        [HiWord(F^.dwFileVersionMs),
        LoWord(F^.dwFileVersionMs),
        HiWord(F^.dwFileVersionLs),
        Loword(F^.dwFileVersionLs)]);
      end else if param = 'V' then
      begin
        Result := Format('%d.%d.%d.%d',
        [HiWord(F^.dwFileVersionMs),
        LoWord(F^.dwFileVersionMs),
        HiWord(F^.dwFileVersionLs),
        Loword(F^.dwFileVersionLs)]);
      end
    end;
    StrDispose(Data);
  end;
  StrDispose(Parquivo);
end;

function TBiblioteca.AdicionarMascaraCPF_CNPJ(Valor: string): string;
begin
  Valor:= DevolveInteiro(Valor);

  if Length(Valor) = 11 then
  begin
    Result:= Copy(Valor,1,3)      +
            '.' + Copy(Valor,4,3) +
            '.' + Copy(Valor,7,3) +
            '-' + Copy(Valor,10,2);
  end
  else if Length(Valor) = 14 then
  begin
    Result:= Copy(Valor,1,2)       +
             '.' + Copy(Valor,3,3) +
             '.' + Copy(Valor,6,3) +
             '/' + Copy(Valor,9,4) +
             '-' + Copy(Valor,13,2);
  end
  else
    Result:= EmptyStr;
end;

procedure TBiblioteca.ArredondaComponentes(Control: TWinControl);
var
  R: TRect;
  Rgn: HRGN;
begin
  with Control do
  begin
    R := ClientRect;
    rgn := CreateRoundRectRgn(R.Left, R.Top, R.Right, R.Bottom, 30,30) ;
    Perform(EM_GETRECT, 0, lParam(@r)) ;
    InflateRect(r, - 4, - 4) ;
    Perform(EM_SETRECTNP, 0, lParam(@r)) ;
    SetWindowRgn(Handle, rgn, True) ;
    Invalidate;
  end;
end;

function TBiblioteca.ExecutaPing(HostName: String): boolean;
var
  ICMP : TIdIcmpClient;
begin
  try
   ICMP := TIdIcmpClient.Create(nil);
    try
     ICMP.Host := HostName;
     ICMP.ReceiveTimeout := 500;
     ICMP.Ping;
      if ICMP.ReplyStatus.BytesReceived > 0 then
       result := true
       else
        result := false;
    except
     result := false;
    end;
  finally
    FreeAndNil(ICMP)
  end;
end;

function TBiblioteca.ExibeMS(Mensagem: String; Tipo: Integer): Boolean;
begin
  {1 = Pergunta, 2 = Infomação , 3 Erro}
  Mensagem:= UpperCase(Copy(Mensagem,1,1)) + LowerCase(Copy(Mensagem,2));

  case Tipo of
    1:begin
      Result:= False;
      if MessageDlg(Mensagem,  mtWarning, [mbYes, mbNo], 0) = mrYes then
      begin
        Result:= True;
      end;
    end;

    2:begin
      MessageDlg(Mensagem,  mtWarning, [mbOK], 0);
    end;

    3:begin
      MessageDlg(Mensagem,  mtWarning, [mbOK], 0);
    end;

    4:begin
      MessageDlg(Mensagem,  mtWarning, [mbOK], 0);
    end;
  end;
end;

function TBiblioteca.StrCentro(S: string; vt: integer): string;
Var
  X : integer;
begin
  X := StrToInt(DevolveInteiro(FloatToStr(Bb.TruncaValor((vt - Length(S)) / 2,0))));
  Result:= StringOfChar(' ',X) + S + StringOfChar(' ',X);
end;

function TBiblioteca.StrDireita(S: string; vt: integer): string;
Var X : Integer;
    H : String;
begin
  H := StringOfChar(' ',vt);
  X := Length(S);
  Delete(H,1,X);
  Result := H+S ;

end;

function TBiblioteca.StrEsquerda(S: string; vt: integer): string;
Var X : Integer;
    H : String;
begin
  H := StringOfChar(' ',vt);
  X := Length(S);
  Delete(H,1,X);

  if Length(S) > vt then
    S:= Copy(S,1,vt);

  Result := S+H;

end;

function TBiblioteca.StringToHex(S: string): string;
var
  Str : String;
  i   : Integer;
begin
  for I := 0 to Length(S) - 1 do
  begin
    Str := Str + IntToHex(Ord(S[I + 1]), 2);
  end;
  Delete(Str, Length(Str), 1);
  Result := Str;
end;

function TBiblioteca.StrIsInteger(const S: string): boolean;
begin
  try
    StrToInt(S);
    Result := true;
  except
    Result := false;
  end;
end;

function TBiblioteca.padR(const AString : AnsiString; const nLen : Integer;
   const Caracter : AnsiChar) : AnsiString ;
var
  Tam: Integer;
begin
  Tam := Length(AString);
  if Tam < nLen then
    Result := StringOfChar(Caracter, (nLen - Tam)) + AString
  else
    Result := copy(AString,1,nLen) ;
end ;

procedure TBiblioteca.PercorreDataSet(DataSet: TDataSet; Procedimento: TProc);
var
  Bookmark: TBookmark;
begin
  DataSet.DisableControls;
  Bookmark := DataSet.Bookmark;
  DataSet.First;
  while not DataSet.Eof do
  begin
    Procedimento;
    DataSet.Next;
  end;
  DataSet.Bookmark := Bookmark;
  DataSet.EnableControls;
end;

procedure TBiblioteca.Restart;
var
  AppName : PChar;
begin
  AppName := PChar(Application.ExeName) ;
  ShellExecute(0,'open', AppName, nil, nil, SW_SHOWNORMAL) ;
  Application.Terminate;
end;

function TBiblioteca.TiraPontos(Str: string): string;
var
  i: Integer;
  xStr : String;
begin
 xStr := '';
 for i:=1 to Length(Trim(str)) do
   if (Pos(Copy(str,i,1),'/-.)(,')=0) then xStr := xStr + str[i];

 xStr := StringReplace(xStr,' ','',[rfReplaceAll]);

 Result:=xStr;
end;


function TBiblioteca.TextoParaData(pData: string): TDate;
var
  Dia, Mes, Ano: Integer;
begin
  if (pData <> '') AND (pData <> '0000-00-00') then
  begin
    Dia := StrToInt(Copy(pData,9,2));
    Mes := StrToInt(Copy(pData,6,2));
    Ano := StrToInt(Copy(pData,1,4));
    Result := EncodeDate(Ano,Mes,Dia);
  end
  else
  begin
    Result := 0;
  end;
end;

function TBiblioteca.DataParaTexto(pData: TDate): string;
begin
  if pData > 0 then
    Result := FormatDateTime('YYYY-MM-DD',pData)
  else
    Result := '0000-00-00';
end;

function TBiblioteca.mc_ValorExtenso(Valor :Currency) :String;
var
  StrValores, StrPart, StrValor, PartDec :String;
  i, Parcela, Posicao :Integer;
begin
  StrValores := 'trilhão  '+'trilhões '+'bilhão   '+'bilhões  '+
                'milhão   '+'milhões  '+'mil      '+'mil      ';

  //Formata o valor corretamente...
  StrValor := CurrToStr(Valor);
  Posicao  := Pos(',',StrValor);

  if Posicao > 0 then
  begin
    PartDec := Copy(StrValor,Posicao+1,2);
    if Length(PartDec) < 2 then
    begin
      StrValor := StrValor+'0';
      PartDec  := PartDec +'0';
    end;
    StrValor := StringReplace(StrValor,',','',[rfReplaceAll]);
  end
  else
  begin
    PartDec  := '00';
    StrValor := StrValor+PartDec;
  end;

  while Length(StrValor) < 17 do StrValor := '0'+StrValor;

  //Fim da formatação...
  for i := 1 to 5 do begin
    StrPart := Copy(StrValor,((i-1)*3)+1,3);
    Parcela := StrToInt(StrPart);
    if Parcela = 1 then Posicao := 1 else Posicao := 10;
    if Parcela > 0 then
    begin
      if Length(Result) > 0 then Result := Result+' e ';
      Result := Result+mcx_Centenas(Parcela);
      Result := Result+TrimRight(Copy(StrValores,((i-1)*18)+Posicao,9));
      if not i = 5 then Result := Result+' ';
    end;
  end;

  if Length(Result) > 0 then
    if Int(Valor) = 1 then
      Result := Result+'real '
    else
      Result := Result+' reais ';

  Parcela := StrToInt(PartDec);

  if Parcela > 0 then
  begin
    if Length(Result) > 0 then Result := Result+' e ';
    if Parcela = 1 then
      Result := Result+'um centavo'
    else
      Result := Result+mcx_Dezenas(Parcela)+'centavos';
    end;

  Result := mcx_Ajusta(Result);
end;

function TBiblioteca.mcx_Ajusta(Valor :String) :String;
begin
  Valor := Trim(StringReplace(Valor,'  ',' ',[rfReplaceAll]));

  if Pos('um mil ',Valor) = 1 then
    Valor := StringReplace(Valor,'um mil','mil',[rfReplaceAll]);

  if (Copy(Valor,Length(Valor)-8,9) = 'tos reais') or
     (Copy(Valor,Length(Valor)-8,9) = 'mil reais') then
  begin
    Result := Valor;
    Exit;
  end;

  //Ajusta milhares
  Valor  := StringReplace(Valor,'mil e cento'       ,'mil cento'       ,[rfReplaceAll]);
  Valor  := StringReplace(Valor,'mil e duzentos'    ,'mil duzentos'    ,[rfReplaceAll]);
  Valor  := StringReplace(Valor,'mil e trezentos'   ,'mil trezentos'   ,[rfReplaceAll]);
  Valor  := StringReplace(Valor,'mil e quatrocentos','mil quatrocentos',[rfReplaceAll]);
  Valor  := StringReplace(Valor,'mil e quinhentos'  ,'mil quinhentos'  ,[rfReplaceAll]);
  Valor  := StringReplace(Valor,'mil e seiscentos'  ,'mil seiscentos'  ,[rfReplaceAll]);
  Valor  := StringReplace(Valor,'mil e setecentos'  ,'mil setecentos'  ,[rfReplaceAll]);
  Valor  := StringReplace(Valor,'mil e oitocentos'  ,'mil oitocentos'  ,[rfReplaceAll]);
  Valor  := StringReplace(Valor,'mil e novecentos'  ,'mil novecentos'  ,[rfReplaceAll]);
  //Ajusta trilhões, bilhões e milhões
  Valor  := StringReplace(Valor,'ão reais' ,'ão de reais' ,[rfReplaceAll]);
  Valor  := StringReplace(Valor,'ões reais','ões de reais',[rfReplaceAll]);
  //Retorna valor
  Result := Valor;
end;

function TBiblioteca.mcx_Centenas(Valor :Integer) :String;
var
  StrValor, StrDig :String;
begin
  if Valor = 100 then
    Result := 'cem '
  else
  begin
    Result   := '';
    StrDig   := '00'+IntToStr(Valor);
    StrDig   := Copy(StrDig,Length(StrDig)-2,3);
    StrValor := 'cento       '+'duzentos    '+'trezentos   '+
                'quatrocentos'+'quinhentos  '+'seiscentos  '+
                'setecentos  '+'oitocentos  '+'novecentos  ';
    if StrToInt(StrDig[1]) > 0 then
      Result := TrimRight(Copy(StrValor,((StrToInt(StrDig[1])-1)*12)+1,12))+' ';
    if StrToInt(Copy(StrDig,2,2)) > 0 then
    begin
      if Length(Result) > 0 then Result := Result+'e ';
        Result := Result+mcx_Dezenas(StrToInt(Copy(StrDig,2,2)))
    end;
  end;
end;

function TBiblioteca.mcx_Dezenas(Valor :Integer) :String;
var
  StrValor, StrDig :String;
begin
   if Valor < 20 then
     Result := mcx_Unidades(Valor)
   else
   begin
     Result   := '';
     StrDig   := '00'+IntToStr(Valor);
     StrDig   := Copy(StrDig,Length(StrDig)-1,2);
     StrValor := 'vinte    '+'trinta   '+'quarenta '+'cinquenta'+
                 'sessenta '+'setenta  '+'oitenta  '+'noventa  ';
     Result   := TrimRight(Copy(StrValor,((StrToInt(StrDig[1])-2)*9)+1,9))+' ';
     if StrToInt(StrDig[2]) > 0 then
       Result := Result+'e '+mcx_Unidades(StrToInt(StrDig[2]));
   end;
end;

function TBiblioteca.mcx_Unidades(Valor :Integer) :String;
const
  StrValor :Array[0..18] of pChar = ('um','dois','três','quatro','cinco','seis',
                                     'sete','oito','nove','dez','onze','doze',
                                     'treze','quatorze','quinze','dezesseis',
                                     'dezessete','dezoito','dezenove');
begin
  Result := StrValor[Valor-1]+' ';
end;

function TBiblioteca.Codifica(Action, Src: String): String;
Label Fim; {Função para criptografar e descriptografar string's}
var
  KeyLen : Integer;
  KeyPos : Integer;
  OffSet : Integer;
  Dest, Key : String;
  SrcPos : Integer;
  SrcAsc : Integer;
  TmpSrcAsc : Integer;
  Range : Integer;
begin
try
  if (Src = '') Then
  begin
    Result:= '';
    Goto Fim;
  end;
  Key := 'YUQL23KL23DF90WI5E1JAS467NMCXXL6JAOAUWWMCL0AOMM4A4VZYW9KHJUI234'+
         '7EJHJKDF3424SKL K3LAKDJSL9RTIKJ';
  Dest := '';
  KeyLen := Length(Key);
  KeyPos := 0;
  Range := 256;
  if (Action = UpperCase('C')) then
  begin
    Randomize;
    OffSet := Random(Range);
    Dest := Format('%1.2x',[OffSet]);
    for SrcPos := 1 to Length(Src) do
    begin
      Application.ProcessMessages;
      SrcAsc := (Ord(Src[SrcPos]) + OffSet) Mod 255;
      if KeyPos < KeyLen then KeyPos := KeyPos + 1 else KeyPos := 1;
      SrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
      Dest := Dest + Format('%1.2x',[SrcAsc]);
      OffSet := SrcAsc;
    end;
  end
  Else if (Action = UpperCase('D')) then
  begin
    OffSet := StrToInt('$'+ copy(Src,1,2));
    SrcPos := 3;
  repeat
    SrcAsc := StrToInt('$'+ copy(Src,SrcPos,2));
    if (KeyPos < KeyLen) Then KeyPos := KeyPos + 1 else KeyPos := 1;
    TmpSrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
    if TmpSrcAsc <= OffSet then TmpSrcAsc := 255 + TmpSrcAsc - OffSet
    else TmpSrcAsc := TmpSrcAsc - OffSet;
    Dest := Dest + Chr(TmpSrcAsc);
    OffSet := SrcAsc;
    SrcPos := SrcPos + 2;
  until (SrcPos >= Length(Src));
  end;
  Result:= Dest;
  Fim:
except
 Src := '';
 Result:= '';
end;
end;

function TBiblioteca.colocamascara(num: String; tipo: Integer): string;
begin
  case tipo of
    1: Result := Copy(num,1,3)+'.'+Copy(num,4,3)+'.'+Copy(num,7,3)+'-'+Copy(num,10,2);                      // 999.999.999-99
    2: Result := Copy(num,1,2)+'/'+Copy(num,3,2)+'/'+Copy(num,5,4);                                         // 99/99/9999
    3: Result := Copy(num,1,5)+'-'+Copy(num,6,3);                                                           // 99999-999
    4: Result := '('+Copy(num,1,2)+')'+Copy(num,3,4)+'-'+Copy(num,7,4);                                     // (64) 8453-8883
    5: Result := Copy(num,1,2)+'.'+Copy(num,3,3)+'.'+Copy(num,6,3)+'/'+Copy(num,9,4)+'-'+Copy(num,13,2);    // 00.000.000/0000-00
  end;
end;

Function TBiblioteca.ColocaZerosEsquerda(S:String;vT:Integer):String;
Var X : Integer;
    H : String;
begin
  case vT of
    2: H := '00';
    3: H := '000';
    4: H := '0000';
    5: H := '00000';
    6: H := '000000';
    7: H := '0000000';
    8: H := '00000000';
    9: H := '000000000';
    10: H := '0000000000';
    11: H := '00000000000';
    12: H := '000000000000';
    13: H := '0000000000000';
  end;
  X := Length(S);
  Delete(H,1,X);
  Result := H + S;
end;

function TBiblioteca.Modulo11(Numero: String): String;
var
  i,k : Integer;
  Soma : Integer;
  Digito : Integer;
begin
  Result := '';
  Try
    Soma := 0; k:= 2;
    for i := Length(Numero) downto 1 do
    begin
      Soma := Soma + (StrToInt(Numero[i])*k);
      inc(k);
      if k > 9 then
        k := 2;
    end;
    Digito := 11 - Soma mod 11;
    if Digito >= 10 then
      Digito := 0;
    Result := Result + Chr(Digito + Ord('0'));
  except
    Result := 'X';
  end;
end;

end.


