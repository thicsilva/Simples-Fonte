unit VendaRepository;

interface

uses BasicRepository, System.Generics.Collections, System.SysUtils,VdVendaVO;

type
  TVendaRepository = class(TBasicRepository)

  class function index(Search: String): TList<TVdVendaVO>;
  class function store(Venda: TVdVendaVO): Boolean;
  class function update(Venda,VendaOld: TVdVendaVO): Boolean;
  class function destroyer(Venda: TVdVendaVO): Boolean;
  class function getById(IdVenda: String): TVdVendaVO;

  end;

implementation

{ TVendaRepository }

class function TVendaRepository.index(Search: String): TList<TVdVendaVO>;
var
  Filtro: String;
begin
  Filtro:= ' OBS LIKE ' + QuotedStr(Search+'%');
  Result:= Consultar<TVdVendaVO>(False,Filtro);
end;

class function TVendaRepository.store(Venda: TVdVendaVO): Boolean;
begin
  Venda.Id:= storeFirebird(Venda);
  Result:= Trim(Venda.Id) <> EmptyStr;
end;

class function TVendaRepository.update(Venda, VendaOld: TVdVendaVO): Boolean;
begin
  Result:= Alterar(Venda,VendaOld);
end;

class function TVendaRepository.destroyer(Venda: TVdVendaVO): Boolean;
begin
  Result:= Excluir(Venda);
end;

class function TVendaRepository.getById(IdVenda: String): TVdVendaVO;
begin
  Result:= ConsultarUmObjeto<TVdVendaVO>('ID = ' + QuotedStr(IdVenda),False);
end;

end.
