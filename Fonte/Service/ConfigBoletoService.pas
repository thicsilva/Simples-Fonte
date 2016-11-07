unit ConfigBoletoService;

interface

uses BasicService, System.Generics.Collections, System.SysUtils, FnBancoBoletoVO,Firedac.comp.client,
  ConfigBoletoRepository;

type
  TConfigBoletoService = class(TBasicService)

  class function getById(IdConfigBoleto: String): TFnBancoBoletoVO;
  class function getByIdBanco(IdBanco: String): TFnBancoBoletoVO;
  class function save(ConfigBoleto: TFnBancoBoletoVO): Boolean;
  class function destroyer(IdConfigBoleto: String): Boolean;

  end;

implementation

{ TConfigBoletoService }

class function TConfigBoletoService.destroyer(IdConfigBoleto: String): Boolean;
var
  ConfigBoletoObj: TFnBancoBoletoVO;
begin
  try
    Result:= False;
    try
      BeginTransaction;
      ConfigBoletoObj:= TConfigBoletoRepository.getById(IdConfigBoleto);
      TConfigBoletoRepository.destroyer(ConfigBoletoObj);
      Commit;
      Result:= True;
    except
      Rollback;
    end;
  finally
    FreeAndNil(ConfigBoletoObj);
  end;
end;

class function TConfigBoletoService.getById(IdConfigBoleto: String): TFnBancoBoletoVO;
begin
  Result:= TConfigBoletoRepository.getById(IdConfigBoleto);
end;

class function TConfigBoletoService.getByIdBanco(IdBanco: String): TFnBancoBoletoVO;
begin
  Result:= TConfigBoletoRepository.getByIdBanco(IdBanco);
end;

class function TConfigBoletoService.save(ConfigBoleto: TFnBancoBoletoVO): Boolean;
var
  ConfigBoletoOld: TFnBancoBoletoVO;
begin
  Result:= False;
  try
    try
      BeginTransaction;
      ConfigBoletoOld:= TConfigBoletoRepository.getById(ConfigBoleto.Id);

      if not Assigned(ConfigBoletoOld) then
        Result:= TConfigBoletoRepository.store(ConfigBoleto)
      else
      if ConfigBoleto.ToJSONString = ConfigBoletoOld.ToJSONString then
      begin
        Result:= True;
        Commit;
        Exit;
      end
      else
        Result:= TConfigBoletoRepository.update(ConfigBoleto,ConfigBoletoOld);
      Commit;
    except
      Rollback;
    end;
  finally
    FreeAndNil(ConfigBoletoOld);
  end;
end;

end.
