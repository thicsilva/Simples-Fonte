unit ConfigBoletoRepository;

interface

uses BasicRepository, System.Generics.Collections, System.SysUtils, FnBancoBoletoVO;

type
  TConfigBoletoRepository = class(TBasicRepository)

  class function store(ConfigBoleto: TFnBancoBoletoVO): Boolean;
  class function update(ConfigBoleto,ConfigBoletoOld: TFnBancoBoletoVO): Boolean;
  class function destroyer(ConfigBoleto: TFnBancoBoletoVO): Boolean;
  class function getById(IdConfigBoleto: String): TFnBancoBoletoVO;
  class function getByIdBanco(IdBanco: String): TFnBancoBoletoVO;

  end;

implementation

{ TConfigBoletoRepository }

class function TConfigBoletoRepository.store(ConfigBoleto: TFnBancoBoletoVO): Boolean;
begin
  ConfigBoleto.Id:= storeFirebird(ConfigBoleto);
  Result:= Trim(ConfigBoleto.Id) <> EmptyStr;
end;

class function TConfigBoletoRepository.update(ConfigBoleto, ConfigBoletoOld: TFnBancoBoletoVO): Boolean;
begin
  Result:= Alterar(ConfigBoleto,ConfigBoletoOld);
end;

class function TConfigBoletoRepository.destroyer(ConfigBoleto: TFnBancoBoletoVO): Boolean;
begin
  Result:= Excluir(ConfigBoleto);
end;

class function TConfigBoletoRepository.getById(IdConfigBoleto: String): TFnBancoBoletoVO;
begin
  Result:= ConsultarUmObjeto<TFnBancoBoletoVO>('ID = ' + QuotedStr(IdConfigBoleto),False);
end;

class function TConfigBoletoRepository.getByIdBanco(
  IdBanco: String): TFnBancoBoletoVO;
begin
  Result:= ConsultarUmObjeto<TFnBancoBoletoVO>('ID_BANCO = ' + QuotedStr(IdBanco),False);
end;

end.
