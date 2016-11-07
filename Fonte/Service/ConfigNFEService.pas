unit ConfigNFEService;

interface

uses BasicService, System.Generics.Collections, System.SysUtils, PsEpNFEVO,Firedac.comp.client,
  ConfigNFERepository, PsEmpresaVO, DadosEmpresaService;

type
  TConfigNFEService = class(TBasicService)

  class procedure index(DataSet: TFDMemTable; Search: String);
  class function getById(IdConfigNFE: String): TPsEpNFEVO;
  class function getByIdEmpresa(IdEmpresa: String): TPsEpNFEVO;
  class function save(ConfigNFE: TPsEpNFEVO): Boolean;
  class function destroyer(IdConfigNFE: String): Boolean;

  end;

implementation

{ TConfigNFEService }

class function TConfigNFEService.destroyer(IdConfigNFE: String): Boolean;
var
  ConfigNFEObj: TPsEpNFEVO;
begin
  try
    Result:= False;
    try
      BeginTransaction;
      ConfigNFEObj:= TConfigNFERepository.getById(IdConfigNFE);
      TConfigNFERepository.destroyer(ConfigNFEObj);
      Commit;
      Result:= True;
    except
      Rollback;
    end;
  finally
    FreeAndNil(ConfigNFEObj);
  end;
end;

class function TConfigNFEService.getById(IdConfigNFE: String): TPsEpNFEVO;
begin
  Result:= TConfigNFERepository.getById(IdConfigNFE);
end;

class function TConfigNFEService.getByIdEmpresa(IdEmpresa: String): TPsEpNFEVO;
begin
  Result:= TConfigNFERepository.getById(IdEmpresa);
end;

class procedure TConfigNFEService.index(DataSet: TFDMemTable; Search: String);
var
  OSs: TList<TPsEpNFEVO>;
 // Cliente: TPsPessoaVO;
  I: Integer;
begin
  OSs:= nil;
  Dataset.Open;
  Dataset.DisableControls;
  Dataset.EmptyDataSet;
  OSs:= TConfigNFERepository.index(Search);
  if Assigned(OSs) then
  begin
    for I:= 0 to Pred(OSs.Count) do
    begin
      Dataset.Append;
//      Dataset.FieldByName('ID').AsString:= OSs.Items[I].Id;
//      Dataset.FieldByName('MARK').AsInteger:= 0;
//      Dataset.FieldByName('DATA_INICIO').AsDateTime:= OSs.Items[I].DataInicio;
//      Dataset.FieldByName('DATA_ENTREGA').AsDateTime:= OSs.Items[I].DataEntrega;
//      Dataset.FieldByName('NUMERO_OS').AsString:= Trim(OSs.Items[I].NumeroOs);
//      Cliente:= TPessoaService.getById(OSs.Items[I].IdPessoa);
//      Dataset.FieldByName('CLIENTE').AsString:= Trim(Cliente.Nome);
//      FreeAndNil(Cliente);
//      Dataset.FieldByName('STATUS').AsString:= Trim(OSs.Items[I].Status);
//      Dataset.FieldByName('RESPONSAVEL').AsString:= Trim(OSs.Items[I].Responsavel);
//      Dataset.Post;
      OSs.Items[I].Free;
    end;
    FreeAndNil(OSs);
    Dataset.First;
  end;
  Dataset.EnableControls;
end;

class function TConfigNFEService.save(ConfigNFE: TPsEpNFEVO): Boolean;
var
  ConfigNFEOld: TPsEpNFEVO;
begin
  Result:= False;
  try
    try
      BeginTransaction;
      ConfigNFEOld:= TConfigNFERepository.getById(ConfigNFE.Id);

      if not Assigned(ConfigNFEOld) then
        Result:= TConfigNFERepository.store(ConfigNFE)
      else
      if ConfigNFE.ToJSONString = ConfigNFEOld.ToJSONString then
      begin
        Result:= True;
        Commit;
        Exit;
      end
      else
        Result:= TConfigNFERepository.update(ConfigNFE,ConfigNFEOld);
      Commit;
    except
      Rollback;
    end;
  finally
    FreeAndNil(ConfigNFEOld);
  end;
end;

end.
