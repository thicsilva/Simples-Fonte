unit CentroCustoRepository;

interface

uses BasicRepository, System.Generics.Collections, System.SysUtils, FnCentroCustoVO;

type
  TCentroCustoRepository = class(TBasicRepository)

  class function index(Search: String): TList<TFnCentroCustoVO>;
  class function store(CentroCusto: TFnCentroCustoVO): Boolean;
  class function update(CentroCusto,CentroCustoOld: TFnCentroCustoVO): Boolean;
  class function destroyer(CentroCusto: TFnCentroCustoVO): Boolean;
  class function getById(IdCentroCusto: String): TFnCentroCustoVO;

  end;

implementation

{ TCentroCustoRepository }

class function TCentroCustoRepository.index(Search: String): TList<TFnCentroCustoVO>;
var
  Filtro: String;
begin
  Filtro:= ' NOME LIKE ' + QuotedStr(Search+'%');
  Result:= Consultar<TFnCentroCustoVO>(False,Filtro);
end;

class function TCentroCustoRepository.store(CentroCusto: TFnCentroCustoVO): Boolean;
begin
  CentroCusto.Id:= storeFirebird(CentroCusto);
  Result:= Trim(CentroCusto.Id) <> EmptyStr;
end;

class function TCentroCustoRepository.update(CentroCusto, CentroCustoOld: TFnCentroCustoVO): Boolean;
begin
  Result:= Alterar(CentroCusto,CentroCustoOld);
end;

class function TCentroCustoRepository.destroyer(CentroCusto: TFnCentroCustoVO): Boolean;
begin
  Result:= Excluir(CentroCusto);
end;

class function TCentroCustoRepository.getById(IdCentroCusto: String): TFnCentroCustoVO;
begin
  Result:= ConsultarUmObjeto<TFnCentroCustoVO>('ID = ' + QuotedStr(IdCentroCusto),False);
end;

end.
