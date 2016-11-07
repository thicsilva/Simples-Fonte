unit PessoaFisicaRepository;

interface

uses BasicRepository, System.Generics.Collections, System.SysUtils, PsFisicaVO;

type
  TPessoaFiscaRepository = class(TBasicRepository)

  class function index(Search: String): TList<TPsFisicaVO>;
  class function store(PessoaFisica: TPsFisicaVO): Boolean;
  class function update(PessoaFisica,PessoaFisicaOld: TPsFisicaVO): Boolean;
  class function destroyer(PessoaFisica: TPsFisicaVO): Boolean;
  class function getById(IdPessoaFisica: String): TPsFisicaVO;
  class function getByIdPessoa(IdPessoaFisica: String): TPsFisicaVO;

  end;

implementation

{ TPessoaFiscaRepository }

class function TPessoaFiscaRepository.index(Search: String): TList<TPsFisicaVO>;
var
  Filtro: String;
begin
  Filtro:= ' ID_PESSOA =  ' + QuotedStr(Search);
  Result:= Consultar<TPsFisicaVO>(False,Filtro);
end;

class function TPessoaFiscaRepository.store(PessoaFisica: TPsFisicaVO): Boolean;
begin
  PessoaFisica.Id:= storeFirebird(PessoaFisica);
  Result:= Trim(PessoaFisica.Id) <> EmptyStr;
end;

class function TPessoaFiscaRepository.update(PessoaFisica, PessoaFisicaOld: TPsFisicaVO): Boolean;
begin
  Result:= Alterar(PessoaFisica,PessoaFisicaOld);
end;

class function TPessoaFiscaRepository.destroyer(PessoaFisica: TPsFisicaVO): Boolean;
begin
  Result:= Excluir(PessoaFisica);
end;

class function TPessoaFiscaRepository.getById(IdPessoaFisica: String): TPsFisicaVO;
begin
  Result:= ConsultarUmObjeto<TPsFisicaVO>('ID = ' + QuotedStr(IdPessoaFisica),False);
end;

class function TPessoaFiscaRepository.getByIdPessoa(
  IdPessoaFisica: String): TPsFisicaVO;
begin
  Result:= ConsultarUmObjeto<TPsFisicaVO>('ID_PESSOA = ' + QuotedStr(IdPessoaFisica),False);
end;

end.
