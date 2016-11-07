unit ProdutoRepository;

interface

uses BasicRepository, System.Generics.Collections, System.SysUtils, PrProdutoVO,
  ViewInventarioEstoqueVO;

type
  TProdutoRepository = class(TBasicRepository)

  class function index(Search: String): TList<TPrProdutoVO>;
  class function indexServico(Search: String): TList<TPrProdutoVO>;
  class function indexInventario(Search: String): TList<TViewInventarioEstoqueVO>;
  class function store(Produto: TPrProdutoVO): Boolean;
  class function update(Produto,ProdutoOld: TPrProdutoVO): Boolean;
  class function destroyer(Produto: TPrProdutoVO): Boolean;
  class function getById(IdProduto: String): TPrProdutoVO;

  end;

implementation

{ TProdutoRepository }

class function TProdutoRepository.index(Search: String): TList<TPrProdutoVO>;
var
  Filtro: String;
begin
  Filtro:= ' NOME LIKE ' + QuotedStr(Search+'%') +
           ' AND TIPO_CADASTRO = ''PRODUTO''';
  Result:= Consultar<TPrProdutoVO>(False,Filtro);
end;

class function TProdutoRepository.indexInventario(
  Search: String): TList<TViewInventarioEstoqueVO>;
var
  Filtro: String;
begin
  Filtro:=  Search;
  Result:= Consultar<TViewInventarioEstoqueVO>(False,Filtro);
end;

class function TProdutoRepository.indexServico(
  Search: String): TList<TPrProdutoVO>;
var
  Filtro: String;
begin
  Filtro:= ' NOME LIKE ' + QuotedStr(Search+'%') +
           ' AND TIPO_CADASTRO = ''SERVICO''';
  Result:= Consultar<TPrProdutoVO>(False,Filtro);
end;

class function TProdutoRepository.store(Produto: TPrProdutoVO): Boolean;
begin
  Produto.Id:= storeFirebird(Produto);
  Result:= Trim(Produto.Id) <> EmptyStr;
end;

class function TProdutoRepository.update(Produto, ProdutoOld: TPrProdutoVO): Boolean;
begin
  Result:= Alterar(Produto,ProdutoOld);
end;

class function TProdutoRepository.destroyer(Produto: TPrProdutoVO): Boolean;
begin
  Result:= Excluir(Produto);
end;

class function TProdutoRepository.getById(IdProduto: String): TPrProdutoVO;
begin
  Result:= ConsultarUmObjeto<TPrProdutoVO>('ID = ' + QuotedStr(IdProduto),False);
end;

end.
