unit ProdutoMedidaRepository;

interface

uses BasicRepository, System.Generics.Collections, System.SysUtils, PrMedidaVO;

type
  TProdutoMedidaRepository = class(TBasicRepository)

  class function index(Search: String): TList<TPrMedidaVO>;
  class function store(ProdutoMedida: TPrMedidaVO): Boolean;
  class function update(ProdutoMedida,ProdutoMedidaOld: TPrMedidaVO): Boolean;
  class function destroyer(ProdutoMedida: TPrMedidaVO): Boolean;
  class function getById(IdProdutoMedida: String): TPrMedidaVO;

  end;

implementation

{ PessoaJuridicaRepository }

class function TProdutoMedidaRepository.index(Search: String): TList<TPrMedidaVO>;
var
  Filtro: String;
begin
  Filtro:= ' NOME LIKE ' + QuotedStr(Search+'%');
  Result:= Consultar<TPrMedidaVO>(False,Filtro);
end;

class function TProdutoMedidaRepository.store(ProdutoMedida: TPrMedidaVO): Boolean;
begin
  ProdutoMedida.Id:= storeFirebird(ProdutoMedida);
  Result:= Trim(ProdutoMedida.Id) <> EmptyStr;
end;

class function TProdutoMedidaRepository.update(ProdutoMedida, ProdutoMedidaOld: TPrMedidaVO): Boolean;
begin
  Result:= Alterar(ProdutoMedida,ProdutoMedidaOld);
end;

class function TProdutoMedidaRepository.destroyer(ProdutoMedida: TPrMedidaVO): Boolean;
begin
  Result:= Excluir(ProdutoMedida);
end;

class function TProdutoMedidaRepository.getById(IdProdutoMedida: String): TPrMedidaVO;
begin
  Result:= ConsultarUmObjeto<TPrMedidaVO>('ID = ' + QuotedStr(IdProdutoMedida),False);
end;


end.
