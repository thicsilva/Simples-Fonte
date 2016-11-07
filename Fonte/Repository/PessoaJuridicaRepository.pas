unit PessoaJuridicaRepository;

interface

uses BasicRepository, System.Generics.Collections, System.SysUtils, PsJuridicaVO;

type
  TPessoaJuridicaRepository = class(TBasicRepository)

  class function index(Search: String): TList<TPsJuridicaVO>;
  class function store(PessoaJuridica: TPsJuridicaVO): Boolean;
  class function update(PessoaJuridica,PessoaFisicaOld: TPsJuridicaVO): Boolean;
  class function destroyer(PessoaJuridica: TPsJuridicaVO): Boolean;
  class function getById(IdPessoaJuridica: String): TPsJuridicaVO;
  class function getByIdPessoa(IdPessoaJuridica: String): TPsJuridicaVO;

  end;

implementation

{ PessoaJuridicaRepository }

class function TPessoaJuridicaRepository.index(Search: String): TList<TPsJuridicaVO>;
var
  Filtro: String;
begin
  Filtro:= ' ID_PESSOA =  ' + QuotedStr(Search);
  Result:= Consultar<TPsJuridicaVO>(False,Filtro);
end;

class function TPessoaJuridicaRepository.store(PessoaJuridica: TPsJuridicaVO): Boolean;
begin
  PessoaJuridica.Id:= storeFirebird(PessoaJuridica);
  Result:= Trim(PessoaJuridica.Id) <> EmptyStr;
end;

class function TPessoaJuridicaRepository.update(PessoaJuridica, PessoaFisicaOld: TPsJuridicaVO): Boolean;
begin
  Result:= Alterar(PessoaJuridica,PessoaFisicaOld);
end;

class function TPessoaJuridicaRepository.destroyer(PessoaJuridica: TPsJuridicaVO): Boolean;
begin
  Result:= Excluir(PessoaJuridica);
end;

class function TPessoaJuridicaRepository.getById(IdPessoaJuridica: String): TPsJuridicaVO;
begin
  Result:= ConsultarUmObjeto<TPsJuridicaVO>('ID = ' + QuotedStr(IdPessoaJuridica),False);
end;

class function TPessoaJuridicaRepository.getByIdPessoa(
  IdPessoaJuridica: String): TPsJuridicaVO;
begin
  Result:= ConsultarUmObjeto<TPsJuridicaVO>('ID_PESSOA = ' + QuotedStr(IdPessoaJuridica),False);
end;

end.
