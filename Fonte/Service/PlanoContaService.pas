unit PlanoContaService;

interface

uses BasicService, System.Generics.Collections, System.SysUtils,Firedac.comp.client,
  PlanoContaRepository, FnPlanoContaVO;

type
  TPlanoContaService = class(TBasicService)

  class procedure index(DataSet: TFDMemTable; Search: String; Tipo: Boolean);
  class function getById(IdPlanoConta: String): TFnPlanoContaVO;
  class function getByIdPlanoPai(IdPlanoPai: String): TFnPlanoContaVO;
  class function save(PlanoConta: TFnPlanoContaVO): Boolean;
  class function destroyer(IdPlanoConta: String): Boolean;

  end;

implementation

{ TPlanoContaService }

class function TPlanoContaService.destroyer(IdPlanoConta: String): Boolean;
var
  PlanoContaObj: TFnPlanoContaVO;
begin
  try
    Result:= False;
    try
      BeginTransaction;
      PlanoContaObj:= TPlanoContaRepository.getById(IdPlanoConta);
      TPlanoContaRepository.destroyer(PlanoContaObj);
      Commit;
      Result:= True;
    except
      Rollback;
    end;
  finally
    FreeAndNil(PlanoContaObj);
  end;
end;

class function TPlanoContaService.getById(IdPlanoConta: String): TFnPlanoContaVO;
begin
  Result:= TPlanoContaRepository.getById(IdPlanoConta);
end;

class function TPlanoContaService.getByIdPlanoPai(
  IdPlanoPai: String): TFnPlanoContaVO;
begin
  Result:= TPlanoContaRepository.getById(IdPlanoPai);
end;

class procedure TPlanoContaService.index(DataSet: TFDMemTable; Search: String;
Tipo: Boolean);
var
  PlanoContas,PlanoContas1,PlanoContas2,PlanoContas3: TList<TFnPlanoContaVO>;
  A,B,C,D: Integer;
begin
  PlanoContas:= nil;
  Dataset.Open;
  Dataset.DisableControls;
  Dataset.EmptyDataSet;
  if Tipo = True then
    PlanoContas:= TPlanoContaRepository.indexPlanoPai(' ID_PAI IS NULL')
  else
    PlanoContas:= TPlanoContaRepository.index(Search);
  if Assigned(PlanoContas) then
  begin
    for A:= 0 to Pred(PlanoContas.Count) do
    begin
      Dataset.Append;
      Dataset.FieldByName('ID').AsString:= PlanoContas.Items[A].Id;
      Dataset.FieldByName('MARK').AsInteger:= 0;
      DataSet.FieldByName('NOME').AsString:= IntToStr(A + 1) +
      ' - ' + PlanoContas.Items[A].Nome;
      DataSet.FieldByName('NIVEL').AsInteger:= PlanoContas.Items[A].Nivel;
      Dataset.Post;

      PlanoContas1:= TPlanoContaRepository.indexPlanoPai(' ID_PAI = '+QuotedStr(PlanoContas.Items[A].Id));
      if Assigned(PlanoContas1) then
      begin
        for B := 0 to Pred(PlanoContas1.Count) do
        begin
          Dataset.Append;
          Dataset.FieldByName('ID').AsString:= PlanoContas1.Items[B].Id;
          Dataset.FieldByName('MARK').AsInteger:= 0;
          DataSet.FieldByName('NOME').AsString:= ' '+IntToStr(A + 1) +'.'+
          IntToStr(B + 1) +' - ' + PlanoContas1.Items[B].Nome;
          DataSet.FieldByName('NIVEL').AsInteger:= PlanoContas1.Items[B].Nivel;
          Dataset.Post;

          PlanoContas2:= TPlanoContaRepository.indexPlanoPai(' ID_PAI = '+QuotedStr(PlanoContas1.Items[B].Id));
          if Assigned(PlanoContas2) then
          begin
            for C := 0 to Pred(PlanoContas2.Count) do
            begin
              Dataset.Append;
              Dataset.FieldByName('ID').AsString:= PlanoContas2.Items[C].Id;
              Dataset.FieldByName('MARK').AsInteger:= 0;
              DataSet.FieldByName('NOME').AsString:= '  '+IntToStr(A + 1) +'.'+
              IntToStr(B + 1)+'.'+IntToStr(C + 1)+
              ' - ' + PlanoContas2.Items[C].Nome;
              DataSet.FieldByName('NIVEL').AsInteger:= PlanoContas2.Items[C].Nivel;
              Dataset.Post;

              PlanoContas3:= TPlanoContaRepository.indexPlanoPai(' ID_PAI = '+QuotedStr(PlanoContas2.Items[C].Id));
              if Assigned(PlanoContas3) then
              begin
                for D := 0 to Pred(PlanoContas3.Count) do
                begin
                  Dataset.Append;
                  Dataset.FieldByName('ID').AsString:= PlanoContas3.Items[D].Id;
                  Dataset.FieldByName('MARK').AsInteger:= 0;
                  DataSet.FieldByName('NOME').AsString:= '   '+IntToStr(A + 1) +'.'+
                  IntToStr(B + 1)+'.'+IntToStr(C + 1)+'.'+
                  IntToStr(D + 1)+' - ' + PlanoContas3.Items[D].Nome;
                  DataSet.FieldByName('NIVEL').AsInteger:= PlanoContas3.Items[D].Nivel;
                  Dataset.Post;

                  PlanoContas3.Items[D].Free;
                end;
              end;
              FreeAndNil(PlanoContas3);
              PlanoContas2.Items[C].Free;
            end;
          end;
          FreeAndNil(PlanoContas2);
          PlanoContas1.Items[B].Free;
        end;
      end;
      FreeAndNil(PlanoContas1);
      PlanoContas.Items[A].Free;
    end;
    FreeAndNil(PlanoContas);
    Dataset.First;
  end;
  Dataset.EnableControls;
end;

class function TPlanoContaService.save(PlanoConta: TFnPlanoContaVO): Boolean;
var
  PlanoContaOld: TFnPlanoContaVO;
begin
  Result:= False;
  try
    try
      BeginTransaction;
      PlanoContaOld:= TPlanoContaRepository.getById(PlanoConta.Id);

      if not Assigned(PlanoContaOld) then
        Result:= TPlanoContaRepository.store(PlanoConta)
      else
      if PlanoConta.ToJSONString = PlanoContaOld.ToJSONString then
      begin
        Result:= True;
        Commit;
        Exit;
      end
      else
        Result:= TPlanoContaRepository.update(PlanoConta,PlanoContaOld);
      Commit;
    except
      Rollback;
    end;
  finally
    FreeAndNil(PlanoContaOld);
  end;
end;

end.
