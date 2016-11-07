unit CentroCustoService;

interface

uses BasicService, System.Generics.Collections, System.SysUtils,Firedac.comp.client,
  FnCentroCustoVO, CentroCustoRepository, Biblioteca, Bibli;

type
  TCentroCustoService = class(TBasicService)

  class procedure index(DataSet: TFDMemTable; Search: String);
  class function getById(IdCentroCusto: String): TFnCentroCustoVO;
  class function save(CentroCusto: TFnCentroCustoVO): Boolean;
  class function destroyer(IdCentroCusto: String): Boolean;

  end;

implementation

{ TCentroCustoRepository }

class procedure TCentroCustoService.index(DataSet: TFDMemTable; Search: String);
var
  CentroCustos: TList<TFnCentroCustoVO>;
  I: Integer;
begin
  CentroCustos:= nil;
  Dataset.Open;
  Dataset.DisableControls;
  Dataset.EmptyDataSet;
  CentroCustos:= TCentroCustoRepository.index(Search);
  if Assigned(CentroCustos) then
  begin
    for I:= 0 to Pred(CentroCustos.Count) do
    begin
      Dataset.Append;
      Dataset.FieldByName('ID').AsString:= CentroCustos.Items[I].Id;
      Dataset.FieldByName('MARK').AsInteger:= 0;
      Dataset.FieldByName('NOME').AsString:= CentroCustos.Items[I].Nome;
      Dataset.Post;
      CentroCustos.Items[I].Free;
    end;
    FreeAndNil(CentroCustos);
    Dataset.First;
  end;
  Dataset.EnableControls;
end;

class function TCentroCustoService.getById(IdCentroCusto: String): TFnCentroCustoVO;
begin
  Result:= TCentroCustoRepository.getById(IdCentroCusto);
end;

class function TCentroCustoService.save(CentroCusto: TFnCentroCustoVO): Boolean;
var
  CentroCustoOld: TFnCentroCustoVO;
begin
  Result:= False;
  try
    try
      BeginTransaction;
      CentroCustoOld:= TCentroCustoRepository.getById(CentroCusto.Id);

      if not Assigned(CentroCustoOld) then
        Result:= TCentroCustoRepository.store(CentroCusto)
      else
      if CentroCusto.ToJSONString = CentroCustoOld.ToJSONString then
      begin
        Result:= True;
        Commit;
        Exit;
      end
      else
        Result:= TCentroCustoRepository.update(CentroCusto,CentroCustoOld);
      Commit;
    except
      Rollback;
    end;
  finally
    FreeAndNil(CentroCustoOld);
  end;
end;

class function TCentroCustoService.destroyer(IdCentroCusto: String): Boolean;
var
  CentroCustoObj: TFnCentroCustoVO;
begin
  try
    Result:= False;
    try
      BeginTransaction;
      CentroCustoObj:= TCentroCustoRepository.getById(IdCentroCusto);
      TCentroCustoRepository.destroyer(CentroCustoObj);
      Commit;
      Result:= True;
    except
      Rollback;
    end;
  finally
    FreeAndNil(CentroCustoObj);
  end;
end;

end.
