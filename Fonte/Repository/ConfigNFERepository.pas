unit ConfigNFERepository;

interface

uses BasicRepository, System.Generics.Collections, System.SysUtils, PsEpNFEVO;

type
  TConfigNFERepository = class(TBasicRepository)

  class function index(Search: String): TList<TPsEpNFEVO>;
  class function store(ConfigNFE: TPsEpNFEVO): Boolean;
  class function update(ConfigNFE,ConfigNFEOld: TPsEpNFEVO): Boolean;
  class function destroyer(ConfigNFE: TPsEpNFEVO): Boolean;
  class function getById(IdConfigNFE: String): TPsEpNFEVO;
  class function getByIdEmpresa(IdEmpresa: String): TPsEpNFEVO;

  end;

implementation

{ TConfigNFERepository }

class function TConfigNFERepository.index(Search: String): TList<TPsEpNFEVO>;
var
  Filtro: String;
begin
  Filtro:= ' RESPONSAVEL LIKE ' + QuotedStr(Search+'%');
  Result:= Consultar<TPsEpNFEVO>(False,Filtro);
end;

class function TConfigNFERepository.store(ConfigNFE: TPsEpNFEVO): Boolean;
begin
  ConfigNFE.Id:= storeFirebird(ConfigNFE);
  Result:= Trim(ConfigNFE.Id) <> EmptyStr;
end;

class function TConfigNFERepository.update(ConfigNFE, ConfigNFEOld: TPsEpNFEVO): Boolean;
begin
  Result:= Alterar(ConfigNFE,ConfigNFEOld);
end;

class function TConfigNFERepository.destroyer(ConfigNFE: TPsEpNFEVO): Boolean;
begin
  Result:= Excluir(ConfigNFE);
end;

class function TConfigNFERepository.getById(IdConfigNFE: String): TPsEpNFEVO;
begin
  Result:= ConsultarUmObjeto<TPsEpNFEVO>('ID = ' + QuotedStr(IdConfigNFE),False);
end;

class function TConfigNFERepository.getByIdEmpresa(
  IdEmpresa: String): TPsEpNFEVO;
begin
  Result:= ConsultarUmObjeto<TPsEpNFEVO>('ID_EMPRESA = ' + QuotedStr(IdEmpresa),False);
end;

end.
