unit DadosEmpresaRepository;

interface

uses BasicRepository, System.Generics.Collections, System.SysUtils, PsEmpresaVO;

type
  TDadosEmpresaRepository = class(TBasicRepository)

  class function index(Search: String): TList<TPsEmpresaVO>;
  class function store(Empresa: TPsEmpresaVO): Boolean;
  class function update(Empresa,EmpresaOld: TPsEmpresaVO): Boolean;
  class function destroyer(Empresa: TPsEmpresaVO): Boolean;
  class function getById(IdEmpresa: String): TPsEmpresaVO;
  class function getByIdPessoa(IdPessoa: String): TPsEmpresaVO;

  end;

implementation

{ TDadosEmpresaRepository }

class function TDadosEmpresaRepository.index(Search: String): TList<TPsEmpresaVO>;
var
  Filtro: String;
begin
  Filtro:= ' RESPONSAVEL LIKE ' + QuotedStr(Search+'%');
  Result:= Consultar<TPsEmpresaVO>(False,Filtro);
end;

class function TDadosEmpresaRepository.store(Empresa: TPsEmpresaVO): Boolean;
begin
  Empresa.Id:= storeFirebird(Empresa);
  Result:= Trim(Empresa.Id) <> EmptyStr;
end;

class function TDadosEmpresaRepository.update(Empresa, EmpresaOld: TPsEmpresaVO): Boolean;
begin
  Result:= Alterar(Empresa,EmpresaOld);
end;

class function TDadosEmpresaRepository.destroyer(Empresa: TPsEmpresaVO): Boolean;
begin
  Result:= Excluir(Empresa);
end;

class function TDadosEmpresaRepository.getById(IdEmpresa: String): TPsEmpresaVO;
begin
  Result:= ConsultarUmObjeto<TPsEmpresaVO>('ID = ' + QuotedStr(IdEmpresa),False);
end;

class function TDadosEmpresaRepository.getByIdPessoa(
  IdPessoa: String): TPsEmpresaVO;
begin
  Result:= ConsultarUmObjeto<TPsEmpresaVO>('ID_PESSOA = ' + QuotedStr(IdPessoa),False);
end;

end.
