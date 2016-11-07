unit PessoaContatoRepository;

interface

uses BasicRepository, System.Generics.Collections, System.SysUtils, PsContatoVO;

type
  TPessoaContatoRepository = class(TBasicRepository)

  class function index(Search: String): TList<TPsContatoVO>;
  class function store(PessoaContato: TPsContatoVO): Boolean;
  class function update(PessoaContato,PessoaFisicaOld: TPsContatoVO): Boolean;
  class function destroyer(PessoaContato: TPsContatoVO): Boolean;
  class function getById(IdPessoaContato: String): TPsContatoVO;
  class function getByIdPessoa(IdPessoaContato: String): TPsContatoVO;

  end;

implementation

{ TPessoaContatoRepository }

class function TPessoaContatoRepository.index(Search: String): TList<TPsContatoVO>;
var
  Filtro: String;
begin
  Filtro:= ' ID_PESSOA =  ' + QuotedStr(Search);
  Result:= Consultar<TPsContatoVO>(False,Filtro);
end;

class function TPessoaContatoRepository.store(PessoaContato: TPsContatoVO): Boolean;
begin
  PessoaContato.Id:= storeFirebird(PessoaContato);
  Result:= Trim(PessoaContato.Id) <> EmptyStr;
end;

class function TPessoaContatoRepository.update(PessoaContato, PessoaFisicaOld: TPsContatoVO): Boolean;
begin
  Result:= Alterar(PessoaContato,PessoaFisicaOld);
end;

class function TPessoaContatoRepository.destroyer(PessoaContato: TPsContatoVO): Boolean;
begin
  Result:= Excluir(PessoaContato);
end;

class function TPessoaContatoRepository.getById(IdPessoaContato: String): TPsContatoVO;
begin
  Result:= ConsultarUmObjeto<TPsContatoVO>('ID = ' + QuotedStr(IdPessoaContato),False);
end;

class function TPessoaContatoRepository.getByIdPessoa(
  IdPessoaContato: String): TPsContatoVO;
begin
  Result:= ConsultarUmObjeto<TPsContatoVO>('ID_PESSOA = ' + QuotedStr(IdPessoaContato),False);
end;

end.
