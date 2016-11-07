unit ProdutoTributacaoService;

interface

uses BasicService, System.Generics.Collections, System.SysUtils,Firedac.comp.client,
  ProdutoTributacaoRepository, PrTributacaoVO;

type
  TProdutoTributacaoService = class(TBasicService)

  class procedure index(DataSet: TFDMemTable; Search: String);
  class function getById(IdProdutoTributacao: String): TPrTributacaoVO;
  class function getByIdProduto(IdProdutoTributacao: String): TPrTributacaoVO;
  class function save(ProdutoTributacao: TPrTributacaoVO): Boolean;
  class function destroyer(IdProdutoTributacao: String): Boolean;

  end;

implementation

{ TClienteRepository }

class procedure TProdutoTributacaoService.index(DataSet: TFDMemTable; Search: String);
var
  ProdutoTributacoes: TList<TPrTributacaoVO>;
  I: Integer;
begin
  ProdutoTributacoes:= nil;
  Dataset.Open;
  Dataset.DisableControls;
  Dataset.EmptyDataSet;
  ProdutoTributacoes:= TProdutoTributacaoRepository.index(Search);
  if Assigned(ProdutoTributacoes) then
  begin
    for I:= 0 to Pred(ProdutoTributacoes.Count) do
    begin
      Dataset.Append;
      //Dataset.FieldByName('ID').AsString:= ProdutoTributacoes.Items[I].Id;
      //Dataset.FieldByName('CLIENTE').AsString:= ProdutoTributacoes.Items[I].Nome;
      //Dataset.FieldByName('CPF_CNPJ').AsString:= ProdutoTributacoes.Items[I].Id;
      //Dataset.FieldByName('EMAIL').AsString:= ProdutoTributacoes.Items[I].Id;
      //Dataset.FieldByName('FONE_COMERCIAL').AsString:= ProdutoTributacoes.Items[I].Id;
      //Dataset.FieldByName('CRIADO_EM').AsDateTime:= ProdutoTributacoes.Items[I].Incluso;
      Dataset.Post;
      ProdutoTributacoes.Items[I].Free;
    end;
    FreeAndNil(ProdutoTributacoes);
    Dataset.First;
  end;
  Dataset.EnableControls;
end;

class function TProdutoTributacaoService.getById(IdProdutoTributacao: String): TPrTributacaoVO;
begin
  Result:= TProdutoTributacaoRepository.getById(IdProdutoTributacao);
end;

class function TProdutoTributacaoService.getByIdProduto(
  IdProdutoTributacao: String): TPrTributacaoVO;
begin
  Result:= TProdutoTributacaoRepository.getByIdProduto(IdProdutoTributacao);
end;

class function TProdutoTributacaoService.save(ProdutoTributacao: TPrTributacaoVO): Boolean;
var
  ProdutoTributacaoOld: TPrTributacaoVO;
begin
  Result:= False;
  try
    try
      BeginTransaction;
      ProdutoTributacaoOld:= TProdutoTributacaoRepository.getById(ProdutoTributacao.Id);

      if not Assigned(ProdutoTributacaoOld) then
        Result:= TProdutoTributacaoRepository.store(ProdutoTributacao)
      else
      if ProdutoTributacao.ToJSONString = ProdutoTributacaoOld.ToJSONString then
      begin
        Result:= True;
        Commit;
        Exit;
      end
      else
        Result:= TProdutoTributacaoRepository.update(ProdutoTributacao,ProdutoTributacaoOld);
      Commit;
    except
      Rollback;
    end;
  finally
    FreeAndNil(ProdutoTributacaoOld);
  end;
end;

class function TProdutoTributacaoService.destroyer(IdProdutoTributacao: String): Boolean;
var
  ProdutoTributacaoObj: TPrTributacaoVO;
begin
  try
    Result:= False;
    try
      BeginTransaction;
      ProdutoTributacaoObj:= TProdutoTributacaoRepository.getById(IdProdutoTributacao);
      TProdutoTributacaoRepository.destroyer(ProdutoTributacaoObj);
      Commit;
      Result:= True;
    except
      Rollback;
    end;
  finally
    FreeAndNil(ProdutoTributacaoObj);
  end;
end;

end.
