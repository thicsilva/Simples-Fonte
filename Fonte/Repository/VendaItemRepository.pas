unit VendaItemRepository;

interface

uses BasicRepository, System.Generics.Collections, System.SysUtils, VdItemVO;

type
  TVendaItemRepository = class(TBasicRepository)

  class function index(Search: String): TList<TVdItemVO>;
  class function store(Item: TVdItemVO): Boolean;
  class function update(Item,CompraItemOld: TVdItemVO): Boolean;
  class function destroyer(Item: TVdItemVO): Boolean;
  class function getById(IdItem: String): TVdItemVO;
  class function getByIdVenda(IdVenda: String): TVdItemVO;

  end;

implementation

{ TVendaItemRepository }

class function TVendaItemRepository.index(Search: String): TList<TVdItemVO>;
var
  Filtro: String;
begin
  Filtro:= ' ID_VENDA =  ' + QuotedStr(Search);
  Result:= Consultar<TVdItemVO>(False,Filtro);
end;

class function TVendaItemRepository.store(Item: TVdItemVO): Boolean;
begin
  Item.Id:= storeFirebird(Item);
  Result:= Trim(Item.Id) <> EmptyStr;
end;

class function TVendaItemRepository.update(Item, CompraItemOld: TVdItemVO): Boolean;
begin
  Result:= Alterar(Item,CompraItemOld);
end;

class function TVendaItemRepository.destroyer(Item: TVdItemVO): Boolean;
begin
  Result:= Excluir(Item);
end;

class function TVendaItemRepository.getById(IdItem: String): TVdItemVO;
begin
  Result:= ConsultarUmObjeto<TVdItemVO>('ID = ' + QuotedStr(IdItem),False);
end;

class function TVendaItemRepository.getByIdVenda(
  IdVenda: String): TVdItemVO;
begin
  Result:= ConsultarUmObjeto<TVdItemVO>('ID_VENDA = ' + QuotedStr(IdVenda),False);
end;

end.
