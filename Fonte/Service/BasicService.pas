unit BasicService;

interface

uses
  Data.DBXCommon;

type
  TBasicService = class
  private
    class var FTransaction: TDBXTransaction;
  public
    class procedure BeginTransaction;
    class procedure Commit;
    class procedure Rollback;

  end;

implementation

{ TBasicService }

uses uConexaoBD;

class procedure TBasicService.Commit;
begin
  TConexaoBD.GetInstance.Conexao.CommitFreeAndNil(FTransaction);
end;

class procedure TBasicService.Rollback;
begin
   TConexaoBD.GetInstance.Conexao.RollbackFreeAndNil(FTransaction);
end;

class procedure TBasicService.BeginTransaction;
begin
  FTransaction:=  TConexaoBD.GetInstance.Conexao.BeginTransaction;
end;

end.
