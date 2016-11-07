unit PlanoContaRepository;

interface

uses BasicRepository, System.Generics.Collections, System.SysUtils, FnPlanoContaVO;

type
  TPlanoContaRepository = class(TBasicRepository)

  class function index(Search: String): TList<TFnPlanoContaVO>;
  class function indexPlanoPai(Search: String): TList<TFnPlanoContaVO>;
  class function store(PlanoConta: TFnPlanoContaVO): Boolean;
  class function update(PlanoConta,PlanoContaOld: TFnPlanoContaVO): Boolean;
  class function destroyer(PlanoConta: TFnPlanoContaVO): Boolean;
  class function getById(IdPlanoConta: String): TFnPlanoContaVO;
  class function getByIdPlanoPai(IdPlanoPai: String): TFnPlanoContaVO;

  end;

implementation

{ TPlanoContaRepository }

class function TPlanoContaRepository.index(Search: String): TList<TFnPlanoContaVO>;
var
  Filtro: String;
begin
  Filtro:= ' NOME LIKE ' + QuotedStr(Search+'%') + ' ORDER BY NIVEL';
  Result:= Consultar<TFnPlanoContaVO>(False,Filtro);
end;

class function TPlanoContaRepository.indexPlanoPai(
  Search: String): TList<TFnPlanoContaVO>;
var
  Filtro: String;
begin
  Filtro:= Search + ' ORDER BY NIVEL';
  Result:= Consultar<TFnPlanoContaVO>(False,Filtro);
end;

class function TPlanoContaRepository.store(PlanoConta: TFnPlanoContaVO): Boolean;
begin
  PlanoConta.Id:= storeFirebird(PlanoConta);
  Result:= Trim(PlanoConta.Id) <> EmptyStr;
end;

class function TPlanoContaRepository.update(PlanoConta, PlanoContaOld: TFnPlanoContaVO): Boolean;
begin
  Result:= Alterar(PlanoConta,PlanoContaOld);
end;

class function TPlanoContaRepository.destroyer(PlanoConta: TFnPlanoContaVO): Boolean;
begin
  Result:= Excluir(PlanoConta);
end;

class function TPlanoContaRepository.getById(IdPlanoConta: String): TFnPlanoContaVO;
begin
  Result:= ConsultarUmObjeto<TFnPlanoContaVO>('ID = ' + QuotedStr(IdPlanoConta),False);
end;

class function TPlanoContaRepository.getByIdPlanoPai(
  IdPlanoPai: String): TFnPlanoContaVO;
begin
  Result:= ConsultarUmObjeto<TFnPlanoContaVO>('ID_PAI = ' + QuotedStr(IdPlanoPai),False);
end;

end.
