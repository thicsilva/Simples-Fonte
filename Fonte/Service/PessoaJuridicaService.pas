unit PessoaJuridicaService;

interface

uses BasicService, System.Generics.Collections, System.SysUtils,Firedac.comp.client,
  PessoaJuridicaRepository, PsJuridicaVO;

type
  TPessoaJuridicaService = class(TBasicService)

  class procedure index(DataSet: TFDMemTable; Search: String);
  class function getById(IdPessoaJuridica: String): TPsJuridicaVO;
  class function getByIdPessoa(IdPessoaJuridica: String): TPsJuridicaVO;
  class function save(PessoaJuridica: TPsJuridicaVO): Boolean;
  class function destroyer(IdPessoaJuridica: String): Boolean;

  end;

implementation

{ TClienteRepository }

class procedure TPessoaJuridicaService.index(DataSet: TFDMemTable; Search: String);
var
  PessoasJuridicas: TList<TPsJuridicaVO>;
  I: Integer;
begin
  PessoasJuridicas:= nil;
  Dataset.Open;
  Dataset.DisableControls;
  Dataset.EmptyDataSet;
  PessoasJuridicas:= TPessoaJuridicaRepository.index(Search);
  if Assigned(PessoasJuridicas) then
  begin
    for I:= 0 to Pred(PessoasJuridicas.Count) do
    begin
      Dataset.Append;
      //Dataset.FieldByName('ID').AsString:= PessoasJuridicas.Items[I].Id;
      //Dataset.FieldByName('CLIENTE').AsString:= PessoasJuridicas.Items[I].Nome;
      //Dataset.FieldByName('CPF_CNPJ').AsString:= PessoasJuridicas.Items[I].Id;
      //Dataset.FieldByName('EMAIL').AsString:= PessoasJuridicas.Items[I].Id;
      //Dataset.FieldByName('FONE_COMERCIAL').AsString:= PessoasJuridicas.Items[I].Id;
      //Dataset.FieldByName('CRIADO_EM').AsDateTime:= PessoasJuridicas.Items[I].Incluso;
      Dataset.Post;
      PessoasJuridicas.Items[I].Free;
    end;
    FreeAndNil(PessoasJuridicas);
    Dataset.First;
  end;
  Dataset.EnableControls;
end;

class function TPessoaJuridicaService.getById(IdPessoaJuridica: String): TPsJuridicaVO;
begin
  Result:= TPessoaJuridicaRepository.getById(IdPessoaJuridica);
end;

class function TPessoaJuridicaService.getByIdPessoa(
  IdPessoaJuridica: String): TPsJuridicaVO;
begin
  Result:= TPessoaJuridicaRepository.getByIdPessoa(IdPessoaJuridica);
end;

class function TPessoaJuridicaService.save(PessoaJuridica: TPsJuridicaVO): Boolean;
var
  PessoaJuridicaOld: TPsJuridicaVO;
begin
  Result:= False;
  try
    try
      BeginTransaction;
      PessoaJuridicaOld:= TPessoaJuridicaRepository.getById(PessoaJuridica.Id);

      if not Assigned(PessoaJuridicaOld) then
        Result:= TPessoaJuridicaRepository.store(PessoaJuridica)
      else
      if PessoaJuridica.ToJSONString = PessoaJuridicaOld.ToJSONString then
      begin
        Result:= True;
        Commit;
        Exit;
      end
      else
        Result:= TPessoaJuridicaRepository.update(PessoaJuridica,PessoaJuridicaOld);
      Commit;
    except
      Rollback;
    end;
  finally
    FreeAndNil(PessoaJuridicaOld);
  end;
end;

class function TPessoaJuridicaService.destroyer(IdPessoaJuridica: String): Boolean;
var
  PessoaJuridicaObj: TPsJuridicaVO;
begin
  try
    Result:= False;
    try
      BeginTransaction;
      PessoaJuridicaObj:= TPessoaJuridicaRepository.getById(IdPessoaJuridica);
      TPessoaJuridicaRepository.destroyer(PessoaJuridicaObj);
      Commit;
      Result:= True;
    except
      Rollback;
    end;
  finally
    FreeAndNil(PessoaJuridicaObj);
  end;
end;

end.
