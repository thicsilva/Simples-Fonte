unit BancoService;

interface

uses BasicService, System.Generics.Collections, System.SysUtils, FnOsVO,Firedac.comp.client,
  BancoRepository, FnBancoVO, PessoaService, FnBancoBoletoVO,
  ConfigBoletoService;

type
  TBancoService = class(TBasicService)

  class procedure index(DataSet: TFDMemTable; Search: String);
  class function getById(IdBanco: String): TFnBancoVO;
  class function save(Banco: TFnBancoVO): Boolean;
  class function destroyer(IdBanco: String): Boolean;

  end;

implementation

{ TBancoService }

class function TBancoService.destroyer(IdBanco: String): Boolean;
var
  BancoObj: TFnBancoVO;
begin
  try
    Result:= False;
    try
      BeginTransaction;
      BancoObj:= TBancoRepository.getById(IdBanco);
      TBancoRepository.destroyer(BancoObj);
      Commit;
      Result:= True;
    except
      Rollback;
    end;
  finally
    FreeAndNil(BancoObj);
  end;
end;

class function TBancoService.getById(IdBanco: String): TFnBancoVO;
begin
  Result:= TBancoRepository.getById(IdBanco);
end;

class procedure TBancoService.index(DataSet: TFDMemTable; Search: String);
var
  Bancos: TList<TFnBancoVO>;
  ConfigBoleto: TFnBancoBoletoVO;
  I: Integer;
begin
  Bancos:= nil;
  Dataset.Open;
  Dataset.DisableControls;
  Dataset.EmptyDataSet;
  Bancos:= TBancoRepository.index(Search);
  if Assigned(Bancos) then
  begin
    for I:= 0 to Pred(Bancos.Count) do
    begin
      Dataset.Append;
      Dataset.FieldByName('ID').AsString:= Bancos.Items[I].Id;
      Dataset.FieldByName('MARK').AsInteger:= 0;
      DataSet.FieldByName('DESCRICAO').AsString:= Bancos.Items[I].Descricao;
      DataSet.FieldByName('BANCO').AsString:= Bancos.Items[I].Banco;
      DataSet.FieldByName('TIPO_CONTA').AsString:= Bancos.Items[I].TipoConta;
      ConfigBoleto:= TConfigBoletoService.getByIdBanco(Bancos.Items[I].Id);
      if Assigned(ConfigBoleto) then
        DataSet.FieldByName('CONFIG_BOLETO').AsString:= 'SIM'
      else
        DataSet.FieldByName('CONFIG_BOLETO').AsString:= 'NAO';
      FreeAndNil(ConfigBoleto);
      Dataset.Post;
      Bancos.Items[I].Free;
    end;
    FreeAndNil(Bancos);
    Dataset.First;
  end;
  Dataset.EnableControls;
end;

class function TBancoService.save(Banco: TFnBancoVO): Boolean;
var
  BancoOld: TFnBancoVO;
begin
  Result:= False;
  try
    try
      BeginTransaction;
      BancoOld:= TBancoRepository.getById(Banco.Id);

      if not Assigned(BancoOld) then
        Result:= TBancoRepository.store(Banco)
      else
      if Banco.ToJSONString = BancoOld.ToJSONString then
      begin
        Result:= True;
        Commit;
        Exit;
      end
      else
        Result:= TBancoRepository.update(Banco,BancoOld);
      Commit;
    except
      Rollback;
    end;
  finally
    FreeAndNil(BancoOld);
  end;
end;

end.
