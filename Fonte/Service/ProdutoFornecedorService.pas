unit ProdutoFornecedorService;

interface

uses BasicService, System.Generics.Collections, System.SysUtils,Firedac.comp.client,
  ProdutoFornecedorRepository, PrFornecedorVO;

type
  TProdutoFornecedorService = class(TBasicService)

  class procedure index(DataSet: TFDMemTable; Search: String);
  class function getById(IdProdutoFornecedor: String): TPrFornecedorVO;
  class function getByIdProduto(IdProdutoFornecedor: String): TPrFornecedorVO;
  class function save(ProdutoFornecedor: TPrFornecedorVO): Boolean;
  class function destroyer(IdProdutoFornecedor: String): Boolean;

  end;

implementation

{ TClienteRepository }

class procedure TProdutoFornecedorService.index(DataSet: TFDMemTable; Search: String);
var
  ProdutoFornecedores: TList<TPrFornecedorVO>;
  I: Integer;
begin
  ProdutoFornecedores:= nil;
  Dataset.Open;
  Dataset.DisableControls;
  Dataset.EmptyDataSet;
  ProdutoFornecedores:= TProdutoFornecedorRepository.index(Search);
  if Assigned(ProdutoFornecedores) then
  begin
    for I:= 0 to Pred(ProdutoFornecedores.Count) do
    begin
      Dataset.Append;
      //Dataset.FieldByName('ID').AsString:= ProdutoFornecedores.Items[I].Id;
      //Dataset.FieldByName('CLIENTE').AsString:= ProdutoFornecedores.Items[I].Nome;
      //Dataset.FieldByName('CPF_CNPJ').AsString:= ProdutoFornecedores.Items[I].Id;
      //Dataset.FieldByName('EMAIL').AsString:= ProdutoFornecedores.Items[I].Id;
      //Dataset.FieldByName('FONE_COMERCIAL').AsString:= ProdutoFornecedores.Items[I].Id;
      //Dataset.FieldByName('CRIADO_EM').AsDateTime:= ProdutoFornecedores.Items[I].Incluso;
      Dataset.Post;
      ProdutoFornecedores.Items[I].Free;
    end;
    FreeAndNil(ProdutoFornecedores);
    Dataset.First;
  end;
  Dataset.EnableControls;
end;

class function TProdutoFornecedorService.getById(IdProdutoFornecedor: String): TPrFornecedorVO;
begin
  Result:= TProdutoFornecedorRepository.getById(IdProdutoFornecedor);
end;

class function TProdutoFornecedorService.getByIdProduto(
  IdProdutoFornecedor: String): TPrFornecedorVO;
begin
  Result:= TProdutoFornecedorRepository.getByIdProduto(IdProdutoFornecedor);
end;

class function TProdutoFornecedorService.save(ProdutoFornecedor: TPrFornecedorVO): Boolean;
var
  ProdutoFornecedorOld: TPrFornecedorVO;
begin
  Result:= False;
  try
    try
      BeginTransaction;
      ProdutoFornecedorOld:= TProdutoFornecedorRepository.getById(ProdutoFornecedor.Id);

      if not Assigned(ProdutoFornecedorOld) then
        Result:= TProdutoFornecedorRepository.store(ProdutoFornecedor)
      else
      if ProdutoFornecedor.ToJSONString = ProdutoFornecedorOld.ToJSONString then
      begin
        Result:= True;
        Commit;
        Exit;
      end
      else
        Result:= TProdutoFornecedorRepository.update(ProdutoFornecedor,ProdutoFornecedorOld);
      Commit;
    except
      Rollback;
    end;
  finally
    FreeAndNil(ProdutoFornecedorOld);
  end;
end;

class function TProdutoFornecedorService.destroyer(IdProdutoFornecedor: String): Boolean;
var
  ProdutoFornecedorObj: TPrFornecedorVO;
begin
  try
    Result:= False;
    try
      BeginTransaction;
      ProdutoFornecedorObj:= TProdutoFornecedorRepository.getById(IdProdutoFornecedor);
      TProdutoFornecedorRepository.destroyer(ProdutoFornecedorObj);
      Commit;
      Result:= True;
    except
      Rollback;
    end;
  finally
    FreeAndNil(ProdutoFornecedorObj);
  end;
end;

end.
