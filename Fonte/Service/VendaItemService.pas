unit VendaItemService;

interface

uses BasicService, System.Generics.Collections, System.SysUtils,Firedac.comp.client,
  VendaItemRepository, VdItemVO, PrProdutoVO, ProdutoService;

type
  TVendaItemService = class(TBasicService)

  class procedure indexCompra(DataSet: TFDMemTable; Search: String);
  class function getById(IdItem: String): TVdItemVO;
  class function getByIdVenda(IdVenda: String): TVdItemVO;
  class function save(Item: TVdItemVO): Boolean;
  class function destroyer(IdItem: String): Boolean;

  end;

implementation

{ TClienteRepository }

class procedure TVendaItemService.indexCompra(DataSet: TFDMemTable; Search: String);
var
  Itens: TList<TVdItemVO>;
  Produto: TPrProdutoVO;
  I: Integer;
begin
  Itens:= nil;
  Dataset.Open;
  Dataset.DisableControls;
  Dataset.EmptyDataSet;
  Itens:= TVendaItemRepository.index(Search);
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

class function TVendaItemService.getById(IdItem: String): TVdItemVO;
begin
  Result:= TVendaItemRepository.getById(IdItem);
end;

class function TVendaItemService.getByIdVenda(
  IdVenda: String): TVdItemVO;
begin
  Result:= TVendaItemRepository.getByIdVenda(IdVenda);
end;

class function TVendaItemService.save(Item: TVdItemVO): Boolean;
var
  ItensOld: TVdItemVO;
begin
  Result:= False;
  try
    try
      BeginTransaction;
      ItensOld:= TVendaItemRepository.getById(Item.Id);

      if not Assigned(ItensOld) then
        Result:= TVendaItemRepository.store(Item)
      else
      if Item.ToJSONString = ItensOld.ToJSONString then
      begin
        Result:= True;
        Commit;
        Exit;
      end
      else
        Result:= TVendaItemRepository.update(Item,ItensOld);
      Commit;
    except
      Rollback;
    end;
  finally
    FreeAndNil(ItensOld);
  end;
end;

class function TVendaItemService.destroyer(IdItem: String): Boolean;
var
  ItemObj: TVdItemVO;
begin
  try
    Result:= False;
    try
      BeginTransaction;
      ItemObj:= TvendaItemRepository.getById(IdItem);
      TVendaItemRepository.destroyer(ItemObj);
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
