unit PessoaUsuarioRepository;

interface

uses BasicRepository, System.Generics.Collections, System.SysUtils, PsUsuarioVO;

type
  TPessoaUsuarioRepository = class(TBasicRepository)

  class function index(Search: String): TList<TPsUsuarioVO>;
  class function store(PessoaUsuario: TPsUsuarioVO): Boolean;
  class function update(PessoaUsuario,PessoaUsuarioOld: TPsUsuarioVO): Boolean;
  class function destroyer(PessoaUsuario: TPsUsuarioVO): Boolean;
  class function getById(IdPessoaUsuario: String): TPsUsuarioVO;
  class function getByLoginUsuario(Email,Senha: String): TPsUsuarioVO;
  class function getByIdPessoa(IdPessoaUsuario: String): TPsUsuarioVO;

  end;

implementation

{ TPessoaUsuarioRepository }

class function TPessoaUsuarioRepository.index(Search: String): TList<TPsUsuarioVO>;
var
  Filtro: String;
begin
  Filtro:= ' ID_PESSOA =  ' + QuotedStr(Search);
  Result:= Consultar<TPsUsuarioVO>(False,Filtro);
end;

class function TPessoaUsuarioRepository.store(PessoaUsuario: TPsUsuarioVO): Boolean;
begin
  PessoaUsuario.Id:= storeFirebird(PessoaUsuario);
  Result:= Trim(PessoaUsuario.Id) <> EmptyStr;
end;

class function TPessoaUsuarioRepository.update(PessoaUsuario, PessoaUsuarioOld: TPsUsuarioVO): Boolean;
begin
  Result:= Alterar(PessoaUsuario,PessoaUsuarioOld);
end;

class function TPessoaUsuarioRepository.destroyer(PessoaUsuario: TPsUsuarioVO): Boolean;
begin
  Result:= Excluir(PessoaUsuario);
end;

class function TPessoaUsuarioRepository.getById(IdPessoaUsuario: String): TPsUsuarioVO;
begin
  Result:= ConsultarUmObjeto<TPsUsuarioVO>('ID = ' + QuotedStr(IdPessoaUsuario),False);
end;

class function TPessoaUsuarioRepository.getByIdPessoa(
  IdPessoaUsuario: String): TPsUsuarioVO;
begin
  Result:= ConsultarUmObjeto<TPsUsuarioVO>('ID_PESSOA = ' + QuotedStr(IdPessoaUsuario),False);
end;

class function TPessoaUsuarioRepository.getByLoginUsuario(Email,
  Senha: String): TPsUsuarioVO;
begin
  Result:= ConsultarUmObjeto<TPsUsuarioVO>('EMAIL = ' + QuotedStr(Email) + ' AND SENHA = ' + QuotedStr(Senha),False);
end;

end.
