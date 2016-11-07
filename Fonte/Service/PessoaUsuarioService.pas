unit PessoaUsuarioService;

interface

uses BasicService, System.Generics.Collections, System.SysUtils,Firedac.comp.client,
  PessoaUsuarioRepository, PsUsuarioVO;

type
  TPessoaUsuarioService = class(TBasicService)

  class procedure index(DataSet: TFDMemTable; Search: String);
  class function getById(IdPessoaUsuario: String): TPsUsuarioVO;
  class function getByIdPessoa(IdPessoaUsuario: String): TPsUsuarioVO;
  class function save(PessoaUsuario: TPsUsuarioVO): Boolean;
  class function destroyer(IdPessoaUsuario: String): Boolean;

  end;

implementation

{ TClienteRepository }

class procedure TPessoaUsuarioService.index(DataSet: TFDMemTable; Search: String);
var
  PessoaUsuarios: TList<TPsUsuarioVO>;
  I: Integer;
begin
  PessoaUsuarios:= nil;
  Dataset.Open;
  Dataset.DisableControls;
  Dataset.EmptyDataSet;
  PessoaUsuarios:= TPessoaUsuarioRepository.index(Search);
  if Assigned(PessoaUsuarios) then
  begin
    for I:= 0 to Pred(PessoaUsuarios.Count) do
    begin
      Dataset.Append;
      //Dataset.FieldByName('ID').AsString:= PessoaUsuarios.Items[I].Id;
      //Dataset.FieldByName('CLIENTE').AsString:= PessoaUsuarios.Items[I].Nome;
      //Dataset.FieldByName('CPF_CNPJ').AsString:= PessoaUsuarios.Items[I].Id;
      //Dataset.FieldByName('EMAIL').AsString:= PessoaUsuarios.Items[I].Id;
      //Dataset.FieldByName('FONE_COMERCIAL').AsString:= PessoaUsuarios.Items[I].Id;
      //Dataset.FieldByName('CRIADO_EM').AsDateTime:= PessoaUsuarios.Items[I].Incluso;
      Dataset.Post;
      PessoaUsuarios.Items[I].Free;
    end;
    FreeAndNil(PessoaUsuarios);
    Dataset.First;
  end;
  Dataset.EnableControls;
end;

class function TPessoaUsuarioService.getById(IdPessoaUsuario: String): TPsUsuarioVO;
begin
  Result:= TPessoaUsuarioRepository.getById(IdPessoaUsuario);
end;

class function TPessoaUsuarioService.getByIdPessoa(
  IdPessoaUsuario: String): TPsUsuarioVO;
begin
  Result:= TPessoaUsuarioRepository.getByIdPessoa(IdPessoaUsuario);
end;

class function TPessoaUsuarioService.save(PessoaUsuario: TPsUsuarioVO): Boolean;
var
  PessoaUsuarioOld: TPsUsuarioVO;
begin
  Result:= False;
  try
    try
      BeginTransaction;
      PessoaUsuarioOld:= TPessoaUsuarioRepository.getById(PessoaUsuario.Id);

      if not Assigned(PessoaUsuarioOld) then
        Result:= TPessoaUsuarioRepository.store(PessoaUsuario)
      else
      if PessoaUsuario.ToJSONString = PessoaUsuarioOld.ToJSONString then
      begin
        Result:= True;
        Commit;
        Exit;
      end
      else
        Result:= TPessoaUsuarioRepository.update(PessoaUsuario,PessoaUsuarioOld);
      Commit;
    except
      Rollback;
    end;
  finally
    FreeAndNil(PessoaUsuarioOld);
  end;
end;

class function TPessoaUsuarioService.destroyer(IdPessoaUsuario: String): Boolean;
var
  PessoaUsuarioObj: TPsUsuarioVO;
begin
  try
    Result:= False;
    try
      BeginTransaction;
      PessoaUsuarioObj:= TPessoaUsuarioRepository.getById(IdPessoaUsuario);
      TPessoaUsuarioRepository.destroyer(PessoaUsuarioObj);
      Commit;
      Result:= True;
    except
      Rollback;
    end;
  finally
    FreeAndNil(PessoaUsuarioObj);
  end;
end;

end.
