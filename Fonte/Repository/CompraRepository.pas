unit CompraRepository;

interface

uses BasicRepository, System.Generics.Collections, System.SysUtils, CpCompraVO;

type
  TCompraRepository = class(TBasicRepository)

  class function index(Search: String): TList<TCpCompraVO>;
  class function store(Compra: TCpCompraVO): Boolean;
  class function update(Compra,CompraOld: TCpCompraVO): Boolean;
  class function destroyer(Compra: TCpCompraVO): Boolean;
  class function getById(IdCompra: String): TCpCompraVO;

  end;

implementation

{ TCompraRepository }

class function TCompraRepository.index(Search: String): TList<TCpCompraVO>;
var
  Filtro: String;
begin
  Filtro:= ' OBS LIKE ' + QuotedStr(Search+'%');
  Result:= Consultar<TCpCompraVO>(False,Filtro);
end;

class function TCompraRepository.store(Compra: TCpCompraVO): Boolean;
begin
  Compra.Id:= storeFirebird(Compra);
  Result:= Trim(Compra.Id) <> EmptyStr;
end;

class function TCompraRepository.update(Compra, CompraOld: TCpCompraVO): Boolean;
begin
  Result:= Alterar(Compra,CompraOld);
end;

class function TCompraRepository.destroyer(Compra: TCpCompraVO): Boolean;
begin
  Result:= Excluir(Compra);
end;

class function TCompraRepository.getById(IdCompra: String): TCpCompraVO;
begin
  Result:= ConsultarUmObjeto<TCpCompraVO>('ID = ' + QuotedStr(IdCompra),False);
end;

end.
