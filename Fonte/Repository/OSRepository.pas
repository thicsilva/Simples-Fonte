unit OSRepository;

interface

uses BasicRepository, System.Generics.Collections, System.SysUtils, FnOsVO;

type
  TOSRepository = class(TBasicRepository)

  class function index(Search: String): TList<TFnOsVO>;
  class function store(OS: TFnOsVO): Boolean;
  class function update(OS,OSOld: TFnOsVO): Boolean;
  class function destroyer(OS: TFnOsVO): Boolean;
  class function getById(IdOS: String): TFnOsVO;

  end;

implementation

{ TOSRepository }

class function TOSRepository.index(Search: String): TList<TFnOsVO>;
var
  Filtro: String;
begin
  Filtro:= ' RESPONSAVEL LIKE ' + QuotedStr(Search+'%');
  Result:= Consultar<TFnOsVO>(False,Filtro);
end;

class function TOSRepository.store(OS: TFnOsVO): Boolean;
begin
  OS.Id:= storeFirebird(OS);
  Result:= Trim(OS.Id) <> EmptyStr;
end;

class function TOSRepository.update(OS, OSOld: TFnOsVO): Boolean;
begin
  Result:= Alterar(OS,OSOld);
end;

class function TOSRepository.destroyer(OS: TFnOsVO): Boolean;
begin
  Result:= Excluir(OS);
end;

class function TOSRepository.getById(IdOS: String): TFnOsVO;
begin
  Result:= ConsultarUmObjeto<TFnOsVO>('ID = ' + QuotedStr(IdOS),False);
end;

end.
