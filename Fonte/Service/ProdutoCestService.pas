unit ProdutoCestService;

interface

uses BasicService, System.Generics.Collections, System.SysUtils,Firedac.comp.client,
  ProdutoCestRepository, FnCestVO, Bibli, Biblioteca;

type
  TProdutoCestService = class(TBasicService)

  class procedure index(DataSet: TFDMemTable; Search: String);
  class function getById(IdProdutoCest: String): TFnCestVO;
  class function getByIdProduto(IdProdutoCest: String): TFnCestVO;
  class function save(ProdutoCest: TFnCestVO): Boolean;
  class function destroyer(IdProdutoCest: String): Boolean;

  end;

implementation

{ TClienteRepository }

class procedure TProdutoCestService.index(DataSet: TFDMemTable; Search: String);
var
  ProdutoCests: TList<TFnCestVO>;
  I: Integer;
begin
  ProdutoCests:= nil;
  Dataset.Open;
  Dataset.DisableControls;
  Dataset.EmptyDataSet;
  ProdutoCests:= TProdutoCestRepository.index(Search);
  if Assigned(ProdutoCests) then
  begin
    for I:= 0 to Pred(ProdutoCests.Count) do
    begin
      Dataset.Append;
      Dataset.FieldByName('ID').AsString:= ProdutoCests.Items[I].Id;
      Dataset.FieldByName('MARK').AsInteger:= 0;
      Dataset.FieldByName('CEST').AsString:= ProdutoCests.Items[I].Cest;
      Dataset.FieldByName('NCM').AsString:= ProdutoCests.Items[I].Ncm;
      Dataset.FieldByName('DESCRICAO').AsString:= UpperCase(RemoveAcentos(ProdutoCests.Items[I].Descricao));
      Dataset.Post;
      ProdutoCests.Items[I].Free;
    end;
    FreeAndNil(ProdutoCests);
    Dataset.First;
  end;
  Dataset.EnableControls;
end;

class function TProdutoCestService.getById(IdProdutoCest: String): TFnCestVO;
begin
  Result:= TProdutoCestRepository.getById(IdProdutoCest);
end;

class function TProdutoCestService.getByIdProduto(
  IdProdutoCest: String): TFnCestVO;
begin
  Result:= TProdutoCestRepository.getByIdProduto(IdProdutoCest);
end;

class function TProdutoCestService.save(ProdutoCest: TFnCestVO): Boolean;
var
  ProdutoCestOld: TFnCestVO;
begin
  Result:= False;
  try
    try
      BeginTransaction;
      ProdutoCestOld:= TProdutoCestRepository.getById(ProdutoCest.Id);

      if not Assigned(ProdutoCestOld) then
        Result:= TProdutoCestRepository.store(ProdutoCest)
      else
      if ProdutoCest.ToJSONString = ProdutoCestOld.ToJSONString then
      begin
        Result:= True;
        Commit;
        Exit;
      end
      else
        Result:= TProdutoCestRepository.update(ProdutoCest,ProdutoCestOld);
      Commit;
    except
      Rollback;
    end;
  finally
    FreeAndNil(ProdutoCestOld);
  end;
end;

class function TProdutoCestService.destroyer(IdProdutoCest: String): Boolean;
var
  ProdutoCestObj: TFnCestVO;
begin
  try
    Result:= False;
    try
      BeginTransaction;
      ProdutoCestObj:= TProdutoCestRepository.getById(IdProdutoCest);
      TProdutoCestRepository.destroyer(ProdutoCestObj);
      Commit;
      Result:= True;
    except
      Rollback;
    end;
  finally
    FreeAndNil(ProdutoCestObj);
  end;
end;

end.
