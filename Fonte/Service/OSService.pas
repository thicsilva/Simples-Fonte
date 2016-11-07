unit OSService;

interface

uses BasicService, System.Generics.Collections, System.SysUtils, FnOsVO,Firedac.comp.client,
  OSRepository, PsPessoaVO, PessoaService;

type
  TOSService = class(TBasicService)

  class procedure index(DataSet: TFDMemTable; Search: String);
  class function getById(IdOs: String): TFnOsVO;
  class function save(OS: TFnOsVO): Boolean;
  class function destroyer(IdOs: String): Boolean;

  end;

implementation

{ TOSService }

class function TOSService.destroyer(IdOs: String): Boolean;
var
  OSObj: TFnOsVO;
begin
  try
    Result:= False;
    try
      BeginTransaction;
      OSObj:= TOSRepository.getById(IdOs);
      TOSRepository.destroyer(OSObj);
      Commit;
      Result:= True;
    except
      Rollback;
    end;
  finally
    FreeAndNil(OSObj);
  end;
end;

class function TOSService.getById(IdOs: String): TFnOsVO;
begin
  Result:= TOSRepository.getById(IdOs);
end;

class procedure TOSService.index(DataSet: TFDMemTable; Search: String);
var
  OSs: TList<TFnOsVO>;
  Cliente: TPsPessoaVO;
  I: Integer;
begin
  OSs:= nil;
  Dataset.Open;
  Dataset.DisableControls;
  Dataset.EmptyDataSet;
  OSs:= TOSRepository.index(Search);
  if Assigned(OSs) then
  begin
    for I:= 0 to Pred(OSs.Count) do
    begin
      Dataset.Append;
      Dataset.FieldByName('ID').AsString:= OSs.Items[I].Id;
      Dataset.FieldByName('MARK').AsInteger:= 0;
      Dataset.FieldByName('DATA_INICIO').AsDateTime:= OSs.Items[I].DataInicio;
      Dataset.FieldByName('DATA_ENTREGA').AsDateTime:= OSs.Items[I].DataEntrega;
      Dataset.FieldByName('NUMERO_OS').AsString:= Trim(OSs.Items[I].NumeroOs);
      Cliente:= TPessoaService.getById(OSs.Items[I].IdPessoa);
      Dataset.FieldByName('CLIENTE').AsString:= Trim(Cliente.Nome);
      FreeAndNil(Cliente);
      Dataset.FieldByName('STATUS').AsString:= Trim(OSs.Items[I].Status);
      Dataset.FieldByName('RESPONSAVEL').AsString:= Trim(OSs.Items[I].Responsavel);
      Dataset.Post;
      OSs.Items[I].Free;
    end;
    FreeAndNil(OSs);
    Dataset.First;
  end;
  Dataset.EnableControls;
end;

class function TOSService.save(OS: TFnOsVO): Boolean;
var
  OSOld: TFnOsVO;
begin
  Result:= False;
  try
    try
      BeginTransaction;
      OSOld:= TOSRepository.getById(OS.Id);

      if not Assigned(OSOld) then
        Result:= TOSRepository.store(OS)
      else
      if OS.ToJSONString = OSOld.ToJSONString then
      begin
        Result:= True;
        Commit;
        Exit;
      end
      else
        Result:= TOSRepository.update(OS,OSOld);
      Commit;
    except
      Rollback;
    end;
  finally
    FreeAndNil(OSOld);
  end;
end;

end.
