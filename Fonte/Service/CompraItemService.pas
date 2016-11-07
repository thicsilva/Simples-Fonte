unit CompraItemService;

interface

uses BasicService, System.Generics.Collections, System.SysUtils,Firedac.comp.client,
  CompraItemRepository, CpItemVO, PrProdutoVO, ProdutoService;

type
  TCompraItemService = class(TBasicService)

  class procedure indexCompra(DataSet: TFDMemTable; Search: String);
  class function getById(IdItem: String): TCpItemVO;
  class function getByIdCompra(IdCompra: String): TCpItemVO;
  class function save(Item: TCpItemVO): Boolean;
  class function destroyer(IdItem: String): Boolean;

  end;

implementation

{ TClienteRepository }

class procedure TCompraItemService.indexCompra(DataSet: TFDMemTable; Search: String);
var
  Itens: TList<TCpItemVO>;
  Produto: TPrProdutoVO;
  I: Integer;
begin
  Itens:= nil;
  Dataset.Open;
  Dataset.DisableControls;
  Dataset.EmptyDataSet;
  Itens:= TCompraItemRepository.index(Search);
  if Assigned(Itens) then
  begin
    for I:= 0 to Pred(Itens.Count) do
    begin
      Dataset.Append;
//      Dataset.FieldByName('ID').AsString:= Itens.Items[I].Id;
//      Produto:= TProdutoService.getById(itens.Items[I].IdProduto);
//      Dataset.FieldByName('NOME').AsString:= Trim(Produto.Nome);
//      FreeAndNil(Produto);
//      Dataset.FieldByName('DETALHE').AsString:= Trim(Itens.Items[I].Detalhe);
//      Dataset.FieldByName('QUANTIDADE').AsCurrency:= Itens.Items[I].Quantidade;
//      Dataset.FieldByName('CUSTO').AsCurrency:= Itens.Items[I].Custo;
//      Dataset.FieldByName('SUBTOTAL').AsCurrency:= Itens.Items[I].Subtotal;
//      Dataset.Post;
      Itens.Items[I].Free;
    end;
    FreeAndNil(Itens);
    Dataset.First;
  end;
  Dataset.EnableControls;
end;

class function TCompraItemService.getById(IdItem: String): TCpItemVO;
begin
  Result:= TCompraItemRepository.getById(IdItem);
end;

class function TCompraItemService.getByIdCompra(
  IdCompra: String): TCpItemVO;
begin
  Result:= TCompraItemRepository.getByIdCompra(IdCompra);
end;

class function TCompraItemService.save(Item: TCpItemVO): Boolean;
var
  ItensOld: TCpItemVO;
begin
  Result:= False;
  try
    try
      BeginTransaction;
      ItensOld:= TCompraItemRepository.getById(Item.Id);

      if not Assigned(ItensOld) then
        Result:= TCompraItemRepository.store(Item)
      else
      if Item.ToJSONString = ItensOld.ToJSONString then
      begin
        Result:= True;
        Commit;
        Exit;
      end
      else
        Result:= TCompraItemRepository.update(Item,ItensOld);
      Commit;
    except
      Rollback;
    end;
  finally
    FreeAndNil(ItensOld);
  end;
end;

class function TCompraItemService.destroyer(IdItem: String): Boolean;
var
  ItemObj: TCpItemVO;
begin
  try
    Result:= False;
    try
      BeginTransaction;
      ItemObj:= TCompraItemRepository.getById(IdItem);
      TCompraItemRepository.destroyer(ItemObj);
      Commit;
      Result:= True;
    except
      Rollback;
    end;
  finally
    FreeAndNil(ItemObj);
  end;
end;

end.
