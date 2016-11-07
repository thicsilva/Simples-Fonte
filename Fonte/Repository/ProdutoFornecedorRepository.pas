unit ProdutoFornecedorRepository;

interface

uses BasicRepository, System.Generics.Collections, System.SysUtils, PrFornecedorVO;

type
  TProdutoFornecedorRepository = class(TBasicRepository)

  class function index(Search: String): TList<TPrFornecedorVO>;
  class function store(ProdutoFornecedor: TPrFornecedorVO): Boolean;
  class function update(ProdutoFornecedor,ProdutoFornecedorOld: TPrFornecedorVO): Boolean;
  class function destroyer(ProdutoFornecedor: TPrFornecedorVO): Boolean;
  class function getById(IdProdutoFornecedor: String): TPrFornecedorVO;
  class function getByIdProduto(IdProdutoFornecedor: String): TPrFornecedorVO;

  end;

implementation

{ TProdutoFornecedorRepository }

class function TProdutoFornecedorRepository.index(Search: String): TList<TPrFornecedorVO>;
var
  Filtro: String;
begin
  Filtro:= ' ID_PRODUTO =  ' + QuotedStr(Search);
  Result:= Consultar<TPrFornecedorVO>(False,Filtro);
end;

class function TProdutoFornecedorRepository.store(ProdutoFornecedor: TPrFornecedorVO): Boolean;
begin
  ProdutoFornecedor.Id:= storeFirebird(ProdutoFornecedor);
  Result:= Trim(ProdutoFornecedor.Id) <> EmptyStr;
end;

class function TProdutoFornecedorRepository.update(ProdutoFornecedor, ProdutoFornecedorOld: TPrFornecedorVO): Boolean;
begin
  Result:= Alterar(ProdutoFornecedor,ProdutoFornecedorOld);
end;

class function TProdutoFornecedorRepository.destroyer(ProdutoFornecedor: TPrFornecedorVO): Boolean;
begin
  Result:= Excluir(ProdutoFornecedor);
end;

class function TProdutoFornecedorRepository.getById(IdProdutoFornecedor: String): TPrFornecedorVO;
begin
  Result:= ConsultarUmObjeto<TPrFornecedorVO>('ID = ' + QuotedStr(IdProdutoFornecedor),False);
end;

class function TProdutoFornecedorRepository.getByIdProduto(
  IdProdutoFornecedor: String): TPrFornecedorVO;
begin
  Result:= ConsultarUmObjeto<TPrFornecedorVO>('ID_PRODUTO = ' + QuotedStr(IdProdutoFornecedor),False);
end;

end.
