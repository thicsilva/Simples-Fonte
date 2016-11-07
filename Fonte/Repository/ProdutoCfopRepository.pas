unit ProdutoCfopRepository;

interface

uses BasicRepository, System.Generics.Collections, System.SysUtils, FnCfopVO;

type
  TProdutoCfopRepository = class(TBasicRepository)

  class function index(Search: String): TList<TFnCfopVO>;
  class function store(ProdutoCfop: TFnCfopVO): Boolean;
  class function update(ProdutoCfop,ProdutoCfopOld: TFnCfopVO): Boolean;
  class function destroyer(ProdutoCfop: TFnCfopVO): Boolean;
  class function getById(IdProdutoCfop: String): TFnCfopVO;
  class function getByIdProduto(IdProdutoCfop: String): TFnCfopVO;

  end;

implementation

{ PessoaJuridicaRepository }

class function TProdutoCfopRepository.index(Search: String): TList<TFnCfopVO>;
var
  Filtro: String;
begin
  Filtro:= ' ID_PRODUTO =  ' + QuotedStr(Search);
  Result:= Consultar<TFnCfopVO>(False,Filtro);
end;

class function TProdutoCfopRepository.store(ProdutoCfop: TFnCfopVO): Boolean;
begin
  ProdutoCfop.Id:= storeFirebird(ProdutoCfop);
  Result:= Trim(ProdutoCfop.Id) <> EmptyStr;
end;

class function TProdutoCfopRepository.update(ProdutoCfop, ProdutoCfopOld: TFnCfopVO): Boolean;
begin
  Result:= Alterar(ProdutoCfop,ProdutoCfopOld);
end;

class function TProdutoCfopRepository.destroyer(ProdutoCfop: TFnCfopVO): Boolean;
begin
  Result:= Excluir(ProdutoCfop);
end;

class function TProdutoCfopRepository.getById(IdProdutoCfop: String): TFnCfopVO;
begin
  Result:= ConsultarUmObjeto<TFnCfopVO>('ID = ' + QuotedStr(IdProdutoCfop),False);
end;

class function TProdutoCfopRepository.getByIdProduto(
  IdProdutoCfop: String): TFnCfopVO;
begin
  Result:= ConsultarUmObjeto<TFnCfopVO>('ID_PESSOA = ' + QuotedStr(IdProdutoCfop),False);
end;

end.
