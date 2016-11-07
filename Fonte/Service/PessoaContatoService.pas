unit PessoaContatoService;

interface

uses BasicService, System.Generics.Collections, System.SysUtils,Firedac.comp.client,
  PessoaContatoRepository, PsContatoVO;

type
  TPessoaContatoService = class(TBasicService)

  class procedure index(DataSet: TFDMemTable; Search: String);
  class function getById(IdPessoaContato: String): TPsContatoVO;
  class function getByIdPessoa(IdPessoaContato: String): TPsContatoVO;
  class function save(PessoaContato: TPsContatoVO): Boolean;
  class function destroyer(IdPessoaContato: String): Boolean;

  end;

implementation

{ TClienteRepository }

class procedure TPessoaContatoService.index(DataSet: TFDMemTable; Search: String);
var
  PessoaFisicas: TList<TPsContatoVO>;
  I: Integer;
begin
  PessoaFisicas:= nil;
  Dataset.Open;
  Dataset.DisableControls;
  Dataset.EmptyDataSet;
  PessoaFisicas:= TPessoaContatoRepository.index(Search);
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

class function TPessoaContatoService.getById(IdPessoaContato: String): TPsContatoVO;
begin
  Result:= TPessoaContatoRepository.getById(IdPessoaContato);
end;

class function TPessoaContatoService.getByIdPessoa(
  IdPessoaContato: String): TPsContatoVO;
begin
  Result:= TPessoaContatoRepository.getByIdPessoa(IdPessoaContato);
end;

class function TPessoaContatoService.save(PessoaContato: TPsContatoVO): Boolean;
var
  PessoaFisicaOld: TPsContatoVO;
begin
  Result:= False;
  try
    try
      BeginTransaction;
      PessoaFisicaOld:= TPessoaContatoRepository.getById(PessoaContato.Id);

      if not Assigned(PessoaFisicaOld) then
        Result:= TPessoaContatoRepository.store(PessoaContato)
      else
      if PessoaContato.ToJSONString = PessoaFisicaOld.ToJSONString then
      begin
        Result:= True;
        Commit;
        Exit;
      end
      else
        Result:= TPessoaContatoRepository.update(PessoaContato,PessoaFisicaOld);
      Commit;
    except
      Rollback;
    end;
  finally
    FreeAndNil(PessoaFisicaOld);
  end;
end;

class function TPessoaContatoService.destroyer(IdPessoaContato: String): Boolean;
var
  PessoaFisicaObj: TPsContatoVO;
begin
  try
    Result:= False;
    try
      BeginTransaction;
      PessoaFisicaObj:= TPessoaContatoRepository.getById(IdPessoaContato);
      TPessoaContatoRepository.destroyer(PessoaFisicaObj);
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
