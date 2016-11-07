unit CategoriaProdutoRepository;

interface

uses BasicRepository, System.Generics.Collections, System.SysUtils, PrCategoriaVO;

type
  TCategoriaProdutoRepository = class(TBasicRepository)

  class function index(Search: String): TList<TPrCategoriaVO>;
  class function store(Categoria: TPrCategoriaVO): Boolean;
  class function update(Categoria,CategoriaOld: TPrCategoriaVO): Boolean;
  class function destroyer(Categoria: TPrCategoriaVO): Boolean;
  class function getById(IdCategoria: String): TPrCategoriaVO;

  end;

implementation

{ TCategoriaProdutoRepository }

class function TCategoriaProdutoRepository.index(Search: String): TList<TPrCategoriaVO>;
var
  Filtro: String;
begin
  Filtro:= ' NOME LIKE ' + QuotedStr(Search+'%');
  Result:= Consultar<TPrCategoriaVO>(False,Filtro);
end;

class function TCategoriaProdutoRepository.store(Categoria: TPrCategoriaVO): Boolean;
begin
  Categoria.Id:= storeFirebird(Categoria);
  Result:= Trim(Categoria.Id) <> EmptyStr;
end;

class function TCategoriaProdutoRepository.update(Categoria, CategoriaOld: TPrCategoriaVO): Boolean;
begin
  Result:= Alterar(Categoria,CategoriaOld);
end;

class function TCategoriaProdutoRepository.destroyer(Categoria: TPrCategoriaVO): Boolean;
begin
  Result:= Excluir(Categoria);
end;

class function TCategoriaProdutoRepository.getById(IdCategoria: String): TPrCategoriaVO;
begin
  Result:= ConsultarUmObjeto<TPrCategoriaVO>('ID = ' + QuotedStr(IdCategoria),False);
end;

end.
