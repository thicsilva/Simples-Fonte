unit PessoaFisicaService;

interface

uses BasicService, System.Generics.Collections, System.SysUtils,Firedac.comp.client,
  PessoaFisicaRepository, PsFisicaVO;

type
  TPessoaFisicaService = class(TBasicService)

  class procedure index(DataSet: TFDMemTable; Search: String);
  class function getById(IdPessoaFisica: String): TPsFisicaVO;
  class function getByIdPessoa(IdPessoaFisica: String): TPsFisicaVO;
  class function save(PessoaFisica: TPsFisicaVO): Boolean;
  class function destroyer(IdPessoaFisica: String): Boolean;

  end;

implementation

{ TClienteRepository }

class procedure TPessoaFisicaService.index(DataSet: TFDMemTable; Search: String);
var
  PessoaFisicas: TList<TPsFisicaVO>;
  I: Integer;
begin
  PessoaFisicas:= nil;
  Dataset.Open;
  Dataset.DisableControls;
  Dataset.EmptyDataSet;
  PessoaFisicas:= TPessoaFiscaRepository.index(Search);
  if Assigned(PessoaFisicas) then
  begin
    for I:= 0 to Pred(PessoaFisicas.Count) do
    begin
      Dataset.Append;
      //Dataset.FieldByName('ID').AsString:= PessoaFisicas.Items[I].Id;
      //Dataset.FieldByName('CLIENTE').AsString:= PessoaFisicas.Items[I].Nome;
      //Dataset.FieldByName('CPF_CNPJ').AsString:= PessoaFisicas.Items[I].Id;
      //Dataset.FieldByName('EMAIL').AsString:= PessoaFisicas.Items[I].Id;
      //Dataset.FieldByName('FONE_COMERCIAL').AsString:= PessoaFisicas.Items[I].Id;
      //Dataset.FieldByName('CRIADO_EM').AsDateTime:= PessoaFisicas.Items[I].Incluso;
      Dataset.Post;
      PessoaFisicas.Items[I].Free;
    end;
    FreeAndNil(PessoaFisicas);
    Dataset.First;
  end;
  Dataset.EnableControls;
end;

class function TPessoaFisicaService.getById(IdPessoaFisica: String): TPsFisicaVO;
begin
  Result:= TPessoaFiscaRepository.getById(IdPessoaFisica);
end;

class function TPessoaFisicaService.getByIdPessoa(
  IdPessoaFisica: String): TPsFisicaVO;
begin
  Result:= TPessoaFiscaRepository.getByIdPessoa(IdPessoaFisica);
end;

class function TPessoaFisicaService.save(PessoaFisica: TPsFisicaVO): Boolean;
var
  PessoaFisicaOld: TPsFisicaVO;
begin
  Result:= False;
  try
    try
      BeginTransaction;
      PessoaFisicaOld:= TPessoaFiscaRepository.getById(PessoaFisica.Id);

      if not Assigned(PessoaFisicaOld) then
        Result:= TPessoaFiscaRepository.store(PessoaFisica)
      else
      if PessoaFisica.ToJSONString = PessoaFisicaOld.ToJSONString then
      begin
        Result:= True;
        Commit;
        Exit;
      end
      else
        Result:= TPessoaFiscaRepository.update(PessoaFisica,PessoaFisicaOld);
      Commit;
    except
      Rollback;
    end;
  finally
    FreeAndNil(PessoaFisicaOld);
  end;
end;

class function TPessoaFisicaService.destroyer(IdPessoaFisica: String): Boolean;
var
  PessoaFisicaObj: TPsFisicaVO;
begin
  try
    Result:= False;
    try
      BeginTransaction;
      PessoaFisicaObj:= TPessoaFiscaRepository.getById(IdPessoaFisica);
      TPessoaFiscaRepository.destroyer(PessoaFisicaObj);
      Commit;
      Result:= True;
    except
      Rollback;
    end;
  finally
    FreeAndNil(PessoaFisicaObj);
  end;
end;

end.
