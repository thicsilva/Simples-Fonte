unit ProdutoCestRepository;

interface

uses BasicRepository, System.Generics.Collections, System.SysUtils, FnCestVO;

type
  TProdutoCestRepository = class(TBasicRepository)

  class function index(Search: String): TList<TFnCestVO>;
  class function store(ProdutoCest: TFnCestVO): Boolean;
  class function update(ProdutoCest,ProdutoCestOld: TFnCestVO): Boolean;
  class function destroyer(ProdutoCest: TFnCestVO): Boolean;
  class function getById(IdProdutoCest: String): TFnCestVO;
  class function getByIdProduto(IdProdutoCest: String): TFnCestVO;

  end;

implementation

{ PessoaJuridicaRepository }

class function TProdutoCestRepository.index(Search: String): TList<TFnCestVO>;
var
  Filtro: String;
begin
  Filtro:= ' DESCRICAO LIKE ' + QuotedStr(Search+'%');
  Result:= Consultar<TFnCestVO>(False,Filtro);
end;

class function TProdutoCestRepository.store(ProdutoCest: TFnCestVO): Boolean;
begin
  ProdutoCest.Id:= storeFirebird(ProdutoCest);
  Result:= Trim(ProdutoCest.Id) <> EmptyStr;
end;

class function TProdutoCestRepository.update(ProdutoCest, ProdutoCestOld: TFnCestVO): Boolean;
begin
  Result:= Alterar(ProdutoCest,ProdutoCestOld);
end;

class function TProdutoCestRepository.destroyer(ProdutoCest: TFnCestVO): Boolean;
begin
  Result:= Excluir(ProdutoCest);
end;

class function TProdutoCestRepository.getById(IdProdutoCest: String): TFnCestVO;
begin
  Result:= ConsultarUmObjeto<TFnCestVO>('ID = ' + QuotedStr(IdProdutoCest),False);
end;

class function TProdutoCestRepository.getByIdProduto(
  IdProdutoCest: String): TFnCestVO;
begin
  Result:= ConsultarUmObjeto<TFnCestVO>('ID_PRODUTO = ' + QuotedStr(IdProdutoCest),False);
end;

end.
