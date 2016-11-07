unit uConexaoBD;

interface

uses Classes, SQLExpr, WideStrings, DB, SysUtils, DBXMySql, DBXFirebird,
     DBXInterbase, DBXMsSQL, DBXOracle, DbxDb2, IWSystem, Data.DBXCommon;

type

  TConexaoBD = class sealed
  private
    FCONEXAO: TSQLConnection;
    FBANCO: string;
    class var FInstance: TConexaoBD;

    constructor Create(Db: string);
    procedure ConfigurarConexao(pBD: String);
    procedure FreeObjects;
  public
    class function GetInstance: TConexaoBD;
    class function GetQuery: TSQLQuery;

    property Conexao: TSQLConnection read FCONEXAO;
    property Banco: string read FBANCO write FBANCO;
  end;

implementation


procedure TConexaoBD.FreeObjects;
begin
  if Assigned(FInstance) then
  begin
    FCONEXAO.Free;
    FInstance.Free;
  end;
end;

class function TConexaoBD.GetInstance: TConexaoBD;
begin
  if (not Assigned(FInstance)) then
    FInstance:= Create('Firebird');

  Result:= FInstance;
end;

class function TConexaoBD.GetQuery: TSQLQuery;
begin
  Result:= TSQLQuery.Create(nil);
  Result.SQLConnection:= GetInstance.FConexao;
end;

procedure TConexaoBD.ConfigurarConexao(pBD: String);
var
  Arquivo: String;
  Parametros: TStringList;
begin
  if pBD = 'Oracle' then
  begin
    //carrega o arquivo de parametros (neste caso o do Oracle)
    Arquivo := gsAppPath + 'Oracle_DBExpress_conn.txt';

    Conexao.DriverName     := 'Oracle';
    Conexao.ConnectionName := 'OracleConnection';
    Conexao.GetDriverFunc  := 'getSQLDriverORACLE';
    Conexao.LibraryName    := 'dbxora.dll';
    Conexao.VendorLib      := 'oci.dll';
  end
  else 
  if pBD = 'MSSQL' then
  begin
    //carrega o arquivo de parametros (neste caso o do MSSQL)
    Arquivo := gsAppPath + 'MSSQL_DBExpress_conn.txt';

    Conexao.DriverName     := 'MSSQL';
    Conexao.ConnectionName := 'MSSQLCONNECTION';
    Conexao.GetDriverFunc  := 'getSQLDriverMSSQL';
    Conexao.LibraryName    := 'dbxmss.dll';
    Conexao.VendorLib      := 'oledb';
  end
  else 
  if pBD = 'Firebird' then
  begin
    //carrega o arquivo de parametros (neste caso o do Firebird)
    Arquivo := gsAppPath + 'Firebird_DBExpress_conn.txt';

    Conexao.DriverName     := 'Firebird';
    Conexao.ConnectionName := 'FBConnection';
    Conexao.GetDriverFunc  := 'getSQLDriverINTERBASE';
    Conexao.LibraryName    := 'dbxfb.dll';
    Conexao.VendorLib      := 'fbclient.dll';
  end
  else 
  if pBD = 'Interbase' then
  begin
    //carrega o arquivo de parametros (neste caso o do Interbase)
    Arquivo := gsAppPath + 'Interbase_DBExpress_conn.txt';

    Conexao.DriverName     := 'Interbase';
    Conexao.ConnectionName := 'IBConnection';
    Conexao.GetDriverFunc  := 'getSQLDriverINTERBASE';
    Conexao.LibraryName    := 'dbxint.dll';
    Conexao.VendorLib      := 'gds32.dll';
  end
  else 
  if pBD = 'MySQL' then
  begin
    //carrega o arquivo de parametros (neste caso o do MySQL)
    Arquivo := gsAppPath + 'MySQL_DBExpress_conn.txt';

    Conexao.DriverName     := 'MySQL';
    Conexao.ConnectionName := 'MySQLConnection';
    Conexao.GetDriverFunc  := 'getSQLDriverMYSQL';
    Conexao.LibraryName    := 'dbxmys.dll';
    Conexao.VendorLib      := 'libmysql.dll';
  end
  else 
  if pBD = 'DB2' then
  begin
    //carrega o arquivo de parametros (neste caso o do DB2)
    Arquivo := gsAppPath + 'DB2_DBExpress_conn.txt';

    Conexao.DriverName     := 'Db2';
    Conexao.ConnectionName := 'DB2Connection';
    Conexao.GetDriverFunc  := 'getSQLDriverDB2';
    Conexao.LibraryName    := 'dbxdb2.dll';
    Conexao.VendorLib      := 'db2cli.dll';
  end
  else 
  if pBD = 'Postgres' then
  begin
    //carrega o arquivo de parametros (neste caso o do Postgres)
    Arquivo := gsAppPath + 'Postgres_DBExpress_conn.txt';

    Conexao.DriverName     := 'DevartPostgreSQL';
    Conexao.ConnectionName := 'PostgreConnection';
    Conexao.GetDriverFunc  := 'getSQLDriverPostgreSQL';
    Conexao.LibraryName    := 'dbexppgsql40.dll';
    Conexao.VendorLib      := 'not used';
  end;
  //variável para carregar os parametros do banco
  Parametros := TStringList.Create;
  try
    Parametros.LoadFromFile(Arquivo);
    Conexao.Params.Text := Parametros.Text;
  finally
    FreeAndNil(Parametros);
  end;
  Conexao.LoginPrompt := False;
  Conexao.Name := 'Conexao';
end;

constructor TConexaoBD.Create(Db: string);
begin
  FConexao:= TSQLConnection.Create(nil);
  ConfigurarConexao(Db);
  Conexao.KeepConnection := True;
  Conexao.AutoClone := False;
  Conexao.Connected := True;
  Banco := Db;
end;

initialization
  TConexaoBD.GetInstance;
finalization
  TConexaoBD.GetInstance.FreeObjects;

end.
