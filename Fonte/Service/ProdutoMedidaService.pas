unit ProdutoMedidaService;

interface

uses BasicService, System.Generics.Collections, System.SysUtils,Firedac.comp.client,
  ProdutoMedidaRepository, PrMedidaVO;

type
  TProdutoMedidaService = class(TBasicService)

  class procedure index(DataSet: TFDMemTable; Search: String);
  class function getById(IdProdutoMedida: String): TPrMedidaVO;
  class function save(ProdutoMedida: TPrMedidaVO): Boolean;
  class function destroyer(IdProdutoMedida: String): Boolean;

  end;

implementation

{ TClienteRepository }

class procedure TProdutoMedidaService.index(DataSet: TFDMemTable; Search: String);
var
  ProdutoMedidas: TList<TPrMedidaVO>;
  I: Integer;
begin
  ProdutoMedidas:= nil;
  Dataset.Open;
  Dataset.DisableControls;
  Dataset.EmptyDataSet;
  ProdutoMedidas:= TProdutoMedidaRepository.index(Search);
  if Assigned(ProdutoMedidas) then
  begin
    for I:= 0 to Pred(ProdutoMedidas.Count) do
    begin
      Dataset.Append;
      Dataset.FieldByName('ID').AsString:= ProdutoMedidas.Items[I].Id;
      Dataset.FieldByName('MARK').AsInteger:= 0;
      Dataset.FieldByName('NOME').AsString:= ProdutoMedidas.Items[I].Nome;
      Dataset.FieldByName('SIMBOLO').AsString:= ProdutoMedidas.Items[I].Simbolo;
      Dataset.Post;
      ProdutoMedidas.Items[I].Free;
    end;
    FreeAndNil(ProdutoMedidas);
    Dataset.First;
  end;
  Dataset.EnableControls;
end;

class function TProdutoMedidaService.getById(IdProdutoMedida: String): TPrMedidaVO;
begin
  Result:= TProdutoMedidaRepository.getById(IdProdutoMedida);
end;

class function TProdutoMedidaService.save(ProdutoMedida: TPrMedidaVO): Boolean;
var
  ProdutoMedidaOld: TPrMedidaVO;
begin
  Result:= False;
  try
    try
      BeginTransaction;
      ProdutoMedidaOld:= TProdutoMedidaRepository.getById(ProdutoMedida.Id);

      if not Assigned(ProdutoMedidaOld) then
        Result:= TProdutoMedidaRepository.store(ProdutoMedida)
      else
      if ProdutoMedida.ToJSONString = ProdutoMedidaOld.ToJSONString then
      begin
        Result:= True;
        Commit;
        Exit;
      end
      else
        Result:= TProdutoMedidaRepository.update(ProdutoMedida,ProdutoMedidaOld);
      Commit;
    except
      Rollback;
    end;
  finally
    FreeAndNil(ProdutoMedidaOld);
  end;
end;

class function TProdutoMedidaService.destroyer(IdProdutoMedida: String): Boolean;
var
  ProdutoMedidaObj: TPrMedidaVO;
begin
  try
    Result:= False;
    try
      BeginTransaction;
      ProdutoMedidaObj:= TProdutoMedidaRepository.getById(IdProdutoMedida);
      TProdutoMedidaRepository.destroyer(ProdutoMedidaObj);
      Commit;
      Result:= True;
    except
      Rollback;
    end;
  finally
    FreeAndNil(ProdutoMedidaObj);
  end;
end;

end.
