unit DadosEmpresaService;

interface

uses BasicService, System.Generics.Collections, System.SysUtils, PsEmpresaVO,Firedac.comp.client,
  DadosEmpresaRepository, PsPessoaVO, PessoaService;

type
  TDadosEmpresaService = class(TBasicService)

  class procedure index(DataSet: TFDMemTable; Search: String);
  class function getById(IdEmpresa: String): TPsEmpresaVO;
  class function getByIdPessoa(IdPessoa: String): TPsEmpresaVO;
  class function save(Empresa: TPsEmpresaVO): Boolean;
  class function destroyer(IdEmpresa: String): Boolean;

  end;

implementation

{ TDadosEmpresaService }

class function TDadosEmpresaService.destroyer(IdEmpresa: String): Boolean;
var
  EmpresaObj: TPsEmpresaVO;
begin
  try
    Result:= False;
    try
      BeginTransaction;
      EmpresaObj:= TDadosEmpresaRepository.getById(IdEmpresa);
      TDadosEmpresaRepository.destroyer(EmpresaObj);
      Commit;
      Result:= True;
    except
      Rollback;
    end;
  finally
    FreeAndNil(EmpresaObj);
  end;
end;

class function TDadosEmpresaService.getById(IdEmpresa: String): TPsEmpresaVO;
begin
  Result:= TDadosEmpresaRepository.getById(IdEmpresa);
end;

class function TDadosEmpresaService.getByIdPessoa(
  IdPessoa: String): TPsEmpresaVO;
begin
  Result:= TDadosEmpresaRepository.getByIdPessoa(IdPessoa);
end;

class procedure TDadosEmpresaService.index(DataSet: TFDMemTable; Search: String);
var
  Empresas: TList<TPsEmpresaVO>;
  Cliente: TPsPessoaVO;
  I: Integer;
begin
  Empresas:= nil;
  Dataset.Open;
  Dataset.DisableControls;
  Dataset.EmptyDataSet;
  Empresas:= TDadosEmpresaRepository.index(Search);
  if Assigned(Empresas) then
  begin
    for I:= 0 to Pred(Empresas.Count) do
    begin
      Dataset.Append;
//      Dataset.FieldByName('ID').AsString:= Empresas.Items[I].Id;
//      Dataset.FieldByName('MARK').AsInteger:= 0;
//      Dataset.FieldByName('DATA_INICIO').AsDateTime:= Empresas.Items[I].DataInicio;
//      Dataset.FieldByName('DATA_ENTREGA').AsDateTime:= Empresas.Items[I].DataEntrega;
//      Dataset.FieldByName('NUMERO_OS').AsString:= Trim(Empresas.Items[I].NumeroOs);
//      Cliente:= TPessoaService.getById(Empresas.Items[I].IdPessoa);
//      Dataset.FieldByName('CLIENTE').AsString:= Trim(Cliente.Nome);
//      FreeAndNil(Cliente);
//      Dataset.FieldByName('STATUS').AsString:= Trim(Empresas.Items[I].Status);
//      Dataset.FieldByName('RESPONSAVEL').AsString:= Trim(Empresas.Items[I].Responsavel);
      Dataset.Post;
      Empresas.Items[I].Free;
    end;
    FreeAndNil(Empresas);
    Dataset.First;
  end;
  Dataset.EnableControls;
end;

class function TDadosEmpresaService.save(Empresa: TPsEmpresaVO): Boolean;
var
  EmpresaOld: TPsEmpresaVO;
begin
  Result:= False;
  try
    try
      BeginTransaction;
      EmpresaOld:= TDadosEmpresaRepository.getById(Empresa.Id);

      if not Assigned(EmpresaOld) then
        Result:= TDadosEmpresaRepository.store(Empresa)
      else
      if Empresa.ToJSONString = EmpresaOld.ToJSONString then
      begin
        Result:= True;
        Commit;
        Exit;
      end
      else
        Result:= TDadosEmpresaRepository.update(Empresa,EmpresaOld);
      Commit;
    except
      Rollback;
    end;
  finally
    FreeAndNil(EmpresaOld);
  end;
end;

end.
