unit PessoaService;

interface

uses BasicService, System.Generics.Collections, System.SysUtils,Firedac.comp.client,
   PsPessoaVO, PessoaRepository, PsFisicaVO, PsJuridicaVO, PessoaFisicaService,
  PessoaJuridicaService, Biblioteca, Bibli, PsUsuarioVO, PessoaUsuarioService;

type
  TPessoaService = class(TBasicService)

  class procedure indexCliente(DataSet: TFDMemTable; Search: String);
  class procedure indexFornecedor(DataSet: TFDMemTable; Search: String);
  class procedure indexTransportadora(DataSet: TFDMemTable; Search: String);
  class procedure indexUsuario(DataSet: TFDMemTable; Search: String);
  class function getById(IdPessoa: String): TPsPessoaVO;
  class function save(Pessoa: TPsPessoaVO): Boolean;
  class function destroyer(IdPessoa: String): Boolean;

  end;

implementation

{ TPessoaRepository }

class procedure TPessoaService.indexCliente(DataSet: TFDMemTable; Search: String);
var
  Clientes: TList<TPsPessoaVO>;
  PessoaFisica: TPsFisicaVO;
  PessoaJuridica: TPsJuridicaVO;
  I: Integer;
begin
  Clientes:= nil;
  Dataset.Open;
  Dataset.DisableControls;
  Dataset.EmptyDataSet;
  Clientes:= TPessoaRepository.indexCliente(Search);
  if Assigned(Clientes) then
  begin
    for I:= 0 to Pred(Clientes.Count) do
    begin
      Dataset.Append;
      Dataset.FieldByName('ID').AsString:= Clientes.Items[I].Id;
      Dataset.FieldByName('MARK').AsInteger:= 0;
      Dataset.FieldByName('CLIENTE').AsString:= Clientes.Items[I].Nome;
      if Trim(Clientes.Items[I].TipoPessoa) = 'FISICA' then
      begin
        PessoaFisica:= TPessoaFisicaService.getByIdPessoa(Clientes.Items[I].Id);
        if Assigned(PessoaFisica) then
        begin
          Dataset.FieldByName('CPF_CNPJ').AsString:= bb.colocamascara(PessoaFisica.Cpf,1);
          Dataset.FieldByName('EMAIL').AsString:= PessoaFisica.Email;
          Dataset.FieldByName('FONE_COMERCIAL').AsString:= bb.colocamascara(PessoaFisica.Telefone,4);
        end;
        FreeAndNil(PessoaFisica);
      end
      else
      if Trim(Clientes.Items[I].TipoPessoa) = 'JURIDICA' then
      begin
        PessoaJuridica:= TPessoaJuridicaService.getByIdPessoa(Clientes.Items[I].Id);
        if Assigned(PessoaJuridica) then
        begin
          Dataset.FieldByName('CPF_CNPJ').AsString:= bb.colocamascara(PessoaJuridica.Cnpj,5);
          Dataset.FieldByName('EMAIL').AsString:= PessoaJuridica.Email;
          Dataset.FieldByName('FONE_COMERCIAL').AsString:= bb.colocamascara(PessoaJuridica.Telefone,4);
        end;
        FreeAndNil(PessoaJuridica);
      end;
      Dataset.FieldByName('CRIADO_EM').AsDateTime:= Clientes.Items[I].Incluso;
      Dataset.Post;
      Clientes.Items[I].Free;
    end;
    FreeAndNil(Clientes);
    Dataset.First;
  end;
  Dataset.EnableControls;
end;

class procedure TPessoaService.indexFornecedor(DataSet: TFDMemTable;
  Search: String);
var
  Fornecedores: TList<TPsPessoaVO>;
  PessoaFisica: TPsFisicaVO;
  PessoaJuridica: TPsJuridicaVO;
  I: Integer;
begin
  Fornecedores:= nil;
  Dataset.Open;
  Dataset.DisableControls;
  Dataset.EmptyDataSet;
  Fornecedores:= TPessoaRepository.indexFornecedor(Search);
  if Assigned(Fornecedores) then
  begin
    for I:= 0 to Pred(Fornecedores.Count) do
    begin
      Dataset.Append;
      Dataset.FieldByName('ID').AsString:= Fornecedores.Items[I].Id;
      Dataset.FieldByName('MARK').AsInteger:= 0;
      Dataset.FieldByName('FORNECEDOR').AsString:= Fornecedores.Items[I].Nome;
      if Trim(Fornecedores.Items[I].TipoPessoa) = 'FISICA' then
      begin
        PessoaFisica:= TPessoaFisicaService.getByIdPessoa(Fornecedores.Items[I].Id);
        if Assigned(PessoaFisica) then
        begin
          Dataset.FieldByName('CPF_CNPJ').AsString:= bb.colocamascara(PessoaFisica.Cpf,1);
          Dataset.FieldByName('CONTATO').AsString:= bb.colocamascara(PessoaFisica.Telefone,4);
        end;
        FreeAndNil(PessoaFisica);
      end
      else
      if Trim(Fornecedores.Items[I].TipoPessoa) = 'JURIDICA' then
      begin
        PessoaJuridica:= TPessoaJuridicaService.getByIdPessoa(Fornecedores.Items[I].Id);
        if Assigned(PessoaJuridica) then
        begin
          Dataset.FieldByName('CPF_CNPJ').AsString:= bb.colocamascara(PessoaJuridica.Cnpj,5);
          Dataset.FieldByName('CONTATO').AsString:= bb.colocamascara(PessoaJuridica.Telefone,4);
        end;
        FreeAndNil(PessoaJuridica);
      end;
      Dataset.Post;
      Fornecedores.Items[I].Free;
    end;
    FreeAndNil(Fornecedores);
    Dataset.First;
  end;
  Dataset.EnableControls;
end;

class procedure TPessoaService.indexTransportadora(DataSet: TFDMemTable;
  Search: String);
var
  Transportadoras: TList<TPsPessoaVO>;
  PessoaFisica: TPsFisicaVO;
  PessoaJuridica: TPsJuridicaVO;
  I: Integer;
begin
  Transportadoras:= nil;
  Dataset.Open;
  Dataset.DisableControls;
  Dataset.EmptyDataSet;
  Transportadoras:= TPessoaRepository.indexTransportadora(Search);
  if Assigned(Transportadoras) then
  begin
    for I:= 0 to Pred(Transportadoras.Count) do
    begin
      Dataset.Append;
      Dataset.FieldByName('ID').AsString:= Transportadoras.Items[I].Id;
      Dataset.FieldByName('MARK').AsInteger:= 0;
      Dataset.FieldByName('NOME').AsString:= Transportadoras.Items[I].Nome;
      if Trim(Transportadoras.Items[I].TipoPessoa) = 'FISICA' then
      begin
        PessoaFisica:= TPessoaFisicaService.getByIdPessoa(Transportadoras.Items[I].Id);
        if Assigned(PessoaFisica) then
          Dataset.FieldByName('CPF_CNPJ').AsString:= bb.colocamascara(PessoaFisica.Cpf,1);

        FreeAndNil(PessoaFisica);
      end
      else
      if Trim(Transportadoras.Items[I].TipoPessoa) = 'JURIDICA' then
      begin
        PessoaJuridica:= TPessoaJuridicaService.getByIdPessoa(Transportadoras.Items[I].Id);
        if Assigned(PessoaJuridica) then
          Dataset.FieldByName('CPF_CNPJ').AsString:= bb.colocamascara(PessoaJuridica.Cnpj,5);

        FreeAndNil(PessoaJuridica);
      end;
      Dataset.Post;
      Transportadoras.Items[I].Free;
    end;
    FreeAndNil(Transportadoras);
    Dataset.First;
  end;
  Dataset.EnableControls;
end;

class procedure TPessoaService.indexUsuario(DataSet: TFDMemTable;
  Search: String);
var
  Usuarios: TList<TPsPessoaVO>;
  UsuarioPerfil: TPsUsuarioVO;
  I: Integer;
begin
  Usuarios:= nil;
  Dataset.Open;
  Dataset.DisableControls;
  Dataset.EmptyDataSet;
  Usuarios:= TPessoaRepository.indexUsuario(Search);
  if Assigned(Usuarios) then
  begin
    for I:= 0 to Pred(Usuarios.Count) do
    begin
      Dataset.Append;
      Dataset.FieldByName('ID').AsString:= Usuarios.Items[I].Id;
      Dataset.FieldByName('MARK').AsInteger:= 0;
      Dataset.FieldByName('NOME').AsString:= Usuarios.Items[I].Nome;
      UsuarioPerfil:= TPessoaUsuarioService.getByIdPessoa(Usuarios.Items[I].Id);
      Dataset.FieldByName('PERFIL').AsString:= UsuarioPerfil.Perfil;
      Dataset.FieldByName('LOGIN').AsString:= UsuarioPerfil.Email;
      FreeAndNil(UsuarioPerfil);

      Dataset.Post;
      Usuarios.Items[I].Free;
    end;
    FreeAndNil(Usuarios);
    Dataset.First;
  end;
  Dataset.EnableControls;
end;

class function TPessoaService.getById(IdPessoa: String): TPsPessoaVO;
begin
  Result:= TPessoaRepository.getById(IdPessoa);
end;

class function TPessoaService.save(Pessoa: TPsPessoaVO): Boolean;
var
  ClienteOld: TPsPessoaVO;
begin
  Result:= False;
  try
    try
      BeginTransaction;
      ClienteOld:= TPessoaRepository.getById(Pessoa.Id);

      if not Assigned(ClienteOld) then
        Result:= TPessoaRepository.store(Pessoa)
      else
      if Pessoa.ToJSONString = ClienteOld.ToJSONString then
      begin
        Result:= True;
        Commit;
        Exit;
      end
      else
        Result:= TPessoaRepository.update(Pessoa,ClienteOld);
      Commit;
    except
      Rollback;
    end;
  finally
    FreeAndNil(ClienteOld);
  end;
end;

class function TPessoaService.destroyer(IdPessoa: String): Boolean;
var
  ClienteObj: TPsPessoaVO;
begin
  try
    Result:= False;
    try
      BeginTransaction;
      ClienteObj:= TPessoaRepository.getById(IdPessoa);
      TPessoaRepository.destroyer(ClienteObj);
      Commit;
      Result:= True;
    except
      Rollback;
    end;
  finally
    FreeAndNil(ClienteObj);
  end;
end;

end.
