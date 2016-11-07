unit ProdutoTributacaoRepository;

interface

uses BasicRepository, System.Generics.Collections, System.SysUtils, PrTributacaoVO;

type
  TProdutoTributacaoRepository = class(TBasicRepository)

  class function index(Search: String): TList<TPrTributacaoVO>;
  class function store(ProdutoTributacao: TPrTributacaoVO): Boolean;
  class function update(ProdutoTributacao,ProdutoTributacaoOld: TPrTributacaoVO): Boolean;
  class function destroyer(ProdutoTributacao: TPrTributacaoVO): Boolean;
  class function getById(IdProdutoTributacao: String): TPrTributacaoVO;
  class function getByIdProduto(IdProdutoTributacao: String): TPrTributacaoVO;

  end;

implementation

{ PessoaJuridicaRepository }

class function TProdutoTributacaoRepository.index(Search: String): TList<TPrTributacaoVO>;
var
  Filtro: String;
begin
  Filtro:= ' ID_PRODUTO =  ' + QuotedStr(Search);
  Result:= Consultar<TPrTributacaoVO>(False,Filtro);
end;

class function TProdutoTributacaoRepository.store(ProdutoTributacao: TPrTributacaoVO): Boolean;
begin
  ProdutoTributacao.Id:= storeFirebird(ProdutoTributacao);
  Result:= Trim(ProdutoTributacao.Id) <> EmptyStr;
end;

class function TProdutoTributacaoRepository.update(ProdutoTributacao, ProdutoTributacaoOld: TPrTributacaoVO): Boolean;
begin
  Result:= Alterar(ProdutoTributacao,ProdutoTributacaoOld);
end;

class function TProdutoTributacaoRepository.destroyer(ProdutoTributacao: TPrTributacaoVO): Boolean;
begin
  Result:= Excluir(ProdutoTributacao);
end;

class function TProdutoTributacaoRepository.getById(IdProdutoTributacao: String): TPrTributacaoVO;
begin
  Result:= ConsultarUmObjeto<TPrTributacaoVO>('ID = ' + QuotedStr(IdProdutoTributacao),False);
end;

class function TProdutoTributacaoRepository.getByIdProduto(
  IdProdutoTributacao: String): TPrTributacaoVO;
begin
  Result:= ConsultarUmObjeto<TPrTributacaoVO>('ID_PRODUTO = ' + QuotedStr(IdProdutoTributacao),False);
end;

end.
