unit CrediarioService;

interface

uses BasicService, System.Generics.Collections, System.SysUtils, FnCrediarioVO,Firedac.comp.client,
  CrediarioRepository, PsPessoaVO, PessoaService, CpCompraVO, CompraService,Vcl.StdCtrls;

type
  TCrediarioService = class(TBasicService)

  class procedure indexContaPagar(DataSet: TFDMemTable; EmAtraso,ValorAtraso,
  Apagar,ValorApagar,Pago,ValorPago,Total,ValorTotal: TLabel; Search: String);
  class function getById(IdCrediario: String): TFnCrediarioVO;
  class function save(Crediario: TFnCrediarioVO): Boolean;
  class function destroyer(IdCrediario: String): Boolean;

  end;

implementation

{ TCrediarioService }

class function TCrediarioService.destroyer(IdCrediario: String): Boolean;
var
  CrediarioObj: TFnCrediarioVO;
begin
  try
    Result:= False;
    try
      BeginTransaction;
      CrediarioObj:= TCrediarioRepository.getById(IdCrediario);
      TCrediarioRepository.destroyer(CrediarioObj);
      Commit;
      Result:= True;
    except
      Rollback;
    end;
  finally
    FreeAndNil(CrediarioObj);
  end;
end;

class function TCrediarioService.getById(IdCrediario: String): TFnCrediarioVO;
begin
  Result:= TCrediarioRepository.getById(IdCrediario);
end;

class procedure TCrediarioService.indexContaPagar(DataSet: TFDMemTable;EmAtraso,ValorAtraso,
  Apagar,ValorApagar,Pago,ValorPago,Total,ValorTotal: TLabel; Search: String);
var
  Crediarioss: TList<TFnCrediarioVO>;
  ParcelaParcial: TList<TFnCrediarioVO>;
  Compra: TCpCompraVO;
  Pessoa: TPsPessoaVO;
  I,Status: Integer;
  VEmAtraso,VValorAtraso,
  VApagar,VValorApagar,VPago,VValorPago,VTotal,VValorTotal: Currency;
begin
  Crediarioss:= nil;
  Dataset.Open;
  Dataset.DisableControls;
  Dataset.EmptyDataSet;
  Crediarioss:= TCrediarioRepository.indexContaPagar(Search);
  VEmAtraso:= 0;VValorAtraso:= 0;
  VApagar:= 0; VValorApagar:= 0; VPago:= 0; VValorPago:= 0;VTotal:= 0;VValorTotal:= 0;
  if Assigned(Crediarioss) then
  begin
    for I:= 0 to Pred(Crediarioss.Count) do
    begin
      Dataset.Append;
      Dataset.FieldByName('ID').AsString:= Crediarioss.Items[I].Id;
      DataSet.FieldByName('VENCIMENTO').AsDateTime:= Crediarioss.Items[I].DataVencimento;
      Compra:= TCompraService.getById(Crediarioss.Items[I].IdCompra);
      DataSet.FieldByName('COMPRA').AsString:= Compra.Codigo;
      FreeAndNil(Compra);
      Pessoa:= TPessoaService.getById(Crediarioss.Items[I].IdPessoa);
      DataSet.FieldByName('FORNECEDOR').AsString:= Pessoa.Nome;
      FreeAndNil(Pessoa);
      DataSet.FieldByName('PARCELA').AsString:= Crediarioss.Items[I].Parcela;
      DataSet.FieldByName('VALOR').AsCurrency:= Crediarioss.Items[I].Valor;
      DataSet.FieldByName('RECEBIDO').AsCurrency:= Crediarioss.Items[I].ValorPago;
      if Crediarioss.Items[I].DataVencimento <= now  then
      begin
        VEmAtraso:= VEmAtraso + 1;
        VValorAtraso:= VValorAtraso + Crediarioss.Items[I].Valor;
      end;

      if Trim(Crediarioss.Items[I].Status) = 'A PAGAR' then
      begin
        VApagar:= VApagar + 1;
        VValorApagar:= VValorApagar + Crediarioss.Items[I].Valor;
      end
      else
      if Trim(Crediarioss.Items[I].Status) = 'PAGO' then
      begin
        VPago:= VPago + 1;
        VValorPago:= VValorPago + Crediarioss.Items[I].ValorPago;
      end;

      VTotal:= VTotal + 1;
      VValorTotal:= VValorTotal + Crediarioss.Items[I].Valor;

      if Crediarioss.Items[I].IdParcelaPai.IsEmpty then
      begin
        ParcelaParcial:= TCrediarioRepository.indexContaPagarParcelaFilho(Search);
        if Assigned(ParcelaParcial) then
        begin
          if Trim(Crediarioss.Items[I].Status) = 'A PAGAR' then
          begin
            if Crediarioss.Items[I].DataVencimento <= now then
              Status:= 3 //PARCELA A PAGAR PARCIAL VENCIDA
            else
              Status:= 4 //PARCELA A PAGAR PARCIAL
          end
          else
            Status:= 5; // PARCELA PAGA PARCIAL
        end
        else
        begin
          if Trim(Crediarioss.Items[I].Status) = 'A PAGAR' then
          begin
            if Crediarioss.Items[I].DataVencimento <= now then
              Status:= 1 //PARCELA A PAGAR VENCIDA
            else
              Status:= 2 //PARCELA A PAGAR
          end
          else
            Status:= 0; // PARCELA PAGA
        end;
        FreeAndNil(ParcelaParcial);
      end
      else
      if not Crediarioss.Items[I].IdParcelaPai.IsEmpty then
      begin
        if Trim(Crediarioss.Items[I].Status) = 'A PAGAR' then
        begin
          if Crediarioss.Items[I].DataVencimento <= now then
            Status:= 3 //PARCELA A PAGAR PARCIAL VENCIDA
          else
            Status:= 4 //PARCELA A PAGAR PARCIAL
        end
        else
          Status:= 5; // PARCELA PAGA PARCIAL
      end;

      DataSet.FieldByName('STATUS').AsInteger:= Status;
      Dataset.Post;
      Crediarioss.Items[I].Free;
    end;
    FreeAndNil(Crediarioss);
    Dataset.First;
  end;

  EmAtraso.Caption:= 'Em Atraso ('+ FloatToStr(VEmAtraso)+')';
  ValorAtraso.Caption:= FloatToStrF(VValorAtraso,ffCurrency,12,2);

  Apagar.Caption:= 'A Pagar ('+ FloatToStr(VApagar)+')';
  ValorApagar.Caption:= FloatToStrF(VValorApagar,ffCurrency,12,2);

  Pago.Caption:= 'Pago ('+ FloatToStr(VPago)+')';
  ValorPago.Caption:= FloatToStrF(VValorPago,ffCurrency,12,2);

  Total.Caption:= 'Total ('+ FloatToStr(VTotal)+')';
  ValorTotal.Caption:= FloatToStrF(VValorTotal,ffCurrency,12,2);

  Dataset.EnableControls;
end;

class function TCrediarioService.save(Crediario: TFnCrediarioVO): Boolean;
var
  CrediarioOld: TFnCrediarioVO;
begin
  Result:= False;
  try
    try
      BeginTransaction;
      CrediarioOld:= TCrediarioRepository.getById(Crediario.Id);

      if not Assigned(CrediarioOld) then
        Result:= TCrediarioRepository.store(Crediario)
      else
      if Crediario.ToJSONString = CrediarioOld.ToJSONString then
      begin
        Result:= True;
        Commit;
        Exit;
      end
      else
        Result:= TCrediarioRepository.update(Crediario,CrediarioOld);
      Commit;
    except
      Rollback;
    end;
  finally
    FreeAndNil(CrediarioOld);
  end;
end;

end.
