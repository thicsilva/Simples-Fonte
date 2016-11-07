unit EstoqueRepository;

interface

uses BasicRepository, System.Generics.Collections, System.SysUtils,PrEstoqueVO,
  Biblioteca;

type
  TEstoqueRepository = class(TBasicRepository)

  class function index(Search: String; DataInicio,DataFinal: TDate): TList<TPrEstoqueVO>;
  class function store(Estoque: TPrEstoqueVO): Boolean;
  class function update(Estoque,EstoqueOld: TPrEstoqueVO): Boolean;
  class function destroyer(Estoque: TPrEstoqueVO): Boolean;
  class function getById(IdEstoque: String): TPrEstoqueVO;
  class function getByIdProduto(IdProduto: String): TPrEstoqueVO;

  end;

implementation

{ TEstoqueRepository }

class function TEstoqueRepository.index(Search: String; DataInicio,DataFinal: TDate): TList<TPrEstoqueVO>;
var
  Filtro: String;
begin
  Filtro:= ' ID_PRODUTO =  ' + QuotedStr(Search) +
           ' AND '+ DatesToSQL(DataInicio,DataFinal,'DATA_HORA',True);
  Result:= Consultar<TPrEstoqueVO>(False,Filtro);
end;

class function TEstoqueRepository.store(Estoque: TPrEstoqueVO): Boolean;
begin
  Estoque.Id:= storeFirebird(Estoque);
  Result:= Trim(Estoque.Id) <> EmptyStr;
end;

class function TEstoqueRepository.update(Estoque, EstoqueOld: TPrEstoqueVO): Boolean;
begin
  Result:= Alterar(Estoque,EstoqueOld);
end;

class function TEstoqueRepository.destroyer(Estoque: TPrEstoqueVO): Boolean;
begin
  Result:= Excluir(Estoque);
end;

class function TEstoqueRepository.getById(IdEstoque: String): TPrEstoqueVO;
begin
  Result:= ConsultarUmObjeto<TPrEstoqueVO>('ID = ' + QuotedStr(IdEstoque),False);
end;

class function TEstoqueRepository.getByIdProduto(
  IdProduto: String): TPrEstoqueVO;
begin
  Result:= ConsultarUmObjeto<TPrEstoqueVO>('ID_PRODUTO = ' + QuotedStr(IdProduto),False);
end;

end.
