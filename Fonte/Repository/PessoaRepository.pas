unit PessoaRepository;

interface

uses BasicRepository, System.Generics.Collections, System.SysUtils, PsPessoaVO;

type
  TPessoaRepository = class(TBasicRepository)

  class function indexCliente(Search: String): TList<TPsPessoaVO>;
  class function indexFornecedor(Search: String): TList<TPsPessoaVO>;
  class function indexTransportadora(Search: String): TList<TPsPessoaVO>;
  class function indexUsuario(Search: String): TList<TPsPessoaVO>;
  class function store(Pessoa: TPsPessoaVO): Boolean;
  class function update(Pessoa,PessoaOld: TPsPessoaVO): Boolean;
  class function destroyer(Pessoa: TPsPessoaVO): Boolean;
  class function getById(IdPessoa: String): TPsPessoaVO;
  class function getByIdEmpresa: TPsPessoaVO;

  end;

implementation

{ TPessoaRepository }

class function TPessoaRepository.indexCliente(Search: String): TList<TPsPessoaVO>;
var
  Filtro: String;
begin
  Filtro:= ' NOME LIKE ' + QuotedStr(Search+'%') +
           ' AND TIPO_CADASTRO = ''CLIENTE''';
  Result:= Consultar<TPsPessoaVO>(False,Filtro);
end;

class function TPessoaRepository.indexFornecedor(
  Search: String): TList<TPsPessoaVO>;
var
  Filtro: String;
begin
  Filtro:= ' NOME LIKE ' + QuotedStr(Search+'%') +
           ' AND TIPO_CADASTRO = ''FORNECEDOR''';
  Result:= Consultar<TPsPessoaVO>(False,Filtro);
end;

class function TPessoaRepository.indexTransportadora(
  Search: String): TList<TPsPessoaVO>;
var
  Filtro: String;
begin
  Filtro:= ' NOME LIKE ' + QuotedStr(Search+'%') +
           ' AND TIPO_CADASTRO = ''TRANSPORTADORA''';
  Result:= Consultar<TPsPessoaVO>(False,Filtro);
end;

class function TPessoaRepository.indexUsuario(
  Search: String): TList<TPsPessoaVO>;
var
  Filtro: String;
begin
  Filtro:= ' NOME LIKE ' + QuotedStr(Search+'%') +
           ' AND TIPO_CADASTRO = ''USUARIO''';
  Result:= Consultar<TPsPessoaVO>(False,Filtro);
end;

class function TPessoaRepository.store(Pessoa: TPsPessoaVO): Boolean;
begin
  Pessoa.Id:= storeFirebird(Pessoa);
  Result:= Trim(Pessoa.Id) <> EmptyStr;
end;

class function TPessoaRepository.update(Pessoa, PessoaOld: TPsPessoaVO): Boolean;
begin
  Result:= Alterar(Pessoa,PessoaOld);
end;

class function TPessoaRepository.destroyer(Pessoa: TPsPessoaVO): Boolean;
begin
  Result:= Excluir(Pessoa);
end;

class function TPessoaRepository.getById(IdPessoa: String): TPsPessoaVO;
begin
  Result:= ConsultarUmObjeto<TPsPessoaVO>('ID = ' + QuotedStr(IdPessoa),False);
end;

class function TPessoaRepository.getByIdEmpresa: TPsPessoaVO;
begin
  Result:= ConsultarUmObjeto<TPsPessoaVO>('TIPO_CADASTRO = ''EMPRESA''',False);
end;

end.
