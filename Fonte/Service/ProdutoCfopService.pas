unit ProdutoCfopService;

interface

uses BasicService, System.Generics.Collections, System.SysUtils,Firedac.comp.client,
  ProdutoCfopRepository, FnCfopVO;

type
  TProdutoCfopService = class(TBasicService)

  class procedure index(DataSet: TFDMemTable; Search: String);
  class function getById(IdProdutoCfop: String): TFnCfopVO;
  class function getByIdProduto(IdProdutoCfop: String): TFnCfopVO;
  class function save(ProdutoCfop: TFnCfopVO): Boolean;
  class function destroyer(IdProdutoCfop: String): Boolean;

  end;

implementation

{ TClienteRepository }

class procedure TProdutoCfopService.index(DataSet: TFDMemTable; Search: String);
var
  ProdutoCfops: TList<TFnCfopVO>;
  I: Integer;
begin
  ProdutoCfops:= nil;
  Dataset.Open;
  Dataset.DisableControls;
  Dataset.EmptyDataSet;
  ProdutoCfops:= TProdutoCfopRepository.index(Search);
  if Assigned(ProdutoCfops) then
  begin
    for I:= 0 to Pred(ProdutoCfops.Count) do
    begin
      Dataset.Append;
      //Dataset.FieldByName('ID').AsString:= ProdutoCfops.Items[I].Id;
      //Dataset.FieldByName('CLIENTE').AsString:= ProdutoCfops.Items[I].Nome;
      //Dataset.FieldByName('CPF_CNPJ').AsString:= ProdutoCfops.Items[I].Id;
      //Dataset.FieldByName('EMAIL').AsString:= ProdutoCfops.Items[I].Id;
      //Dataset.FieldByName('FONE_COMERCIAL').AsString:= ProdutoCfops.Items[I].Id;
      //Dataset.FieldByName('CRIADO_EM').AsDateTime:= ProdutoCfops.Items[I].Incluso;
      Dataset.Post;
      ProdutoCfops.Items[I].Free;
    end;
    FreeAndNil(ProdutoCfops);
    Dataset.First;
  end;
  Dataset.EnableControls;
end;

class function TProdutoCfopService.getById(IdProdutoCfop: String): TFnCfopVO;
begin
  Result:= TProdutoCfopRepository.getById(IdProdutoCfop);
end;

class function TProdutoCfopService.getByIdProduto(
  IdProdutoCfop: String): TFnCfopVO;
begin
  Result:= TProdutoCfopRepository.getByIdProduto(IdProdutoCfop);
end;

class function TProdutoCfopService.save(ProdutoCfop: TFnCfopVO): Boolean;
var
  ProdutoCfopOld: TFnCfopVO;
begin
  Result:= False;
  try
    try
      BeginTransaction;
      ProdutoCfopOld:= TProdutoCfopRepository.getById(ProdutoCfop.Id);

      if not Assigned(ProdutoCfopOld) then
        Result:= TProdutoCfopRepository.store(ProdutoCfop)
      else
      if ProdutoCfop.ToJSONString = ProdutoCfopOld.ToJSONString then
      begin
        Result:= True;
        Commit;
        Exit;
      end
      else
        Result:= TProdutoCfopRepository.update(ProdutoCfop,ProdutoCfopOld);
      Commit;
    except
      Rollback;
    end;
  finally
    FreeAndNil(ProdutoCfopOld);
  end;
end;

class function TProdutoCfopService.destroyer(IdProdutoCfop: String): Boolean;
var
  ProdutoCfopObj: TFnCfopVO;
begin
  try
    Result:= False;
    try
      BeginTransaction;
      ProdutoCfopObj:= TProdutoCfopRepository.getById(IdProdutoCfop);
      TProdutoCfopRepository.destroyer(ProdutoCfopObj);
      Commit;
      Result:= True;
    except
      Rollback;
    end;
  finally
    FreeAndNil(ProdutoCfopObj);
  end;
end;

end.
