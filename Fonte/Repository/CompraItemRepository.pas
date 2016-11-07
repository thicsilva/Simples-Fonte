unit CompraItemRepository;

interface

uses BasicRepository, System.Generics.Collections, System.SysUtils, CpItemVO;

type
  TCompraItemRepository = class(TBasicRepository)

  class function index(Search: String): TList<TCpItemVO>;
  class function store(Item: TCpItemVO): Boolean;
  class function update(Item,CompraItemOld: TCpItemVO): Boolean;
  class function destroyer(Item: TCpItemVO): Boolean;
  class function getById(IdItem: String): TCpItemVO;
  class function getByIdCompra(IdCompra: String): TCpItemVO;

  end;

implementation

{ TCompraItemRepository }

class function TCompraItemRepository.index(Search: String): TList<TCpItemVO>;
var
  Filtro: String;
begin
  Filtro:= ' ID_COMPRA =  ' + QuotedStr(Search);
  Result:= Consultar<TCpItemVO>(False,Filtro);
end;

class function TCompraItemRepository.store(Item: TCpItemVO): Boolean;
begin
  Item.Id:= storeFirebird(Item);
  Result:= Trim(Item.Id) <> EmptyStr;
end;

class function TCompraItemRepository.update(Item, CompraItemOld: TCpItemVO): Boolean;
begin
  Result:= Alterar(Item,CompraItemOld);
end;

class function TCompraItemRepository.destroyer(Item: TCpItemVO): Boolean;
begin
  Result:= Excluir(Item);
end;

class function TCompraItemRepository.getById(IdItem: String): TCpItemVO;
begin
  Result:= ConsultarUmObjeto<TCpItemVO>('ID = ' + QuotedStr(IdItem),False);
end;

class function TCompraItemRepository.getByIdCompra(
  IdCompra: String): TCpItemVO;
begin
  Result:= ConsultarUmObjeto<TCpItemVO>('ID_COMPRA = ' + QuotedStr(IdCompra),False);
end;

end.
