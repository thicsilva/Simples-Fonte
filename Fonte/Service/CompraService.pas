unit CompraService;

interface

uses BasicService, System.Generics.Collections, System.SysUtils, CpCompraVO,Firedac.comp.client,
  CompraRepository, PsPessoaVO, PessoaService;

type
  TCompraService = class(TBasicService)

  class procedure index(DataSet: TFDMemTable; Search: String);
  class function getById(IdCompra: String): TCpCompraVO;
  class function save(Compra: TCpCompraVO): Boolean;
  class function destroyer(IdCompra: String): Boolean;

  end;

implementation

{ TCompraService }

class function TCompraService.destroyer(IdCompra: String): Boolean;
var
  CompraObj: TCpCompraVO;
begin
  try
    Result:= False;
    try
      BeginTransaction;
      CompraObj:= TCompraRepository.getById(IdCompra);
      TCompraRepository.destroyer(CompraObj);
      Commit;
      Result:= True;
    except
      Rollback;
    end;
  finally
    FreeAndNil(CompraObj);
  end;
end;

class function TCompraService.getById(IdCompra: String): TCpCompraVO;
begin
  Result:= TCompraRepository.getById(IdCompra);
end;

class procedure TCompraService.index(DataSet: TFDMemTable; Search: String);
var
  Compras: TList<TCpCompraVO>;
  Fornecedor: TPsPessoaVO;
  I: Integer;
begin
  Compras:= nil;
  Dataset.Open;
  Dataset.DisableControls;
  Dataset.EmptyDataSet;
  Compras:= TCompraRepository.index(Search);
  if Assigned(Compras) then
  begin
    for I:= 0 to Pred(Compras.Count) do
    begin
      Dataset.Append;
      Dataset.FieldByName('ID').AsString:= Compras.Items[I].Id;
      Dataset.FieldByName('MARK').AsInteger:= 0;
      Dataset.FieldByName('DATA_COMPRA').AsDateTime:= Compras.Items[I].DataCompra;
      Dataset.FieldByName('COMPRA').AsString:= Compras.Items[I].Codigo;
      Fornecedor:= TPessoaService.getById(Compras.Items[I].IdPessoa);
      Dataset.FieldByName('FORNECEDOR').AsString:= Trim(Fornecedor.Nome);
      FreeAndNil(Fornecedor);
      Dataset.FieldByName('VENCIMENTO').AsDateTime:= Compras.Items[I].DataVencimento;
      Dataset.FieldByName('PAGAMENTO').AsString:= Compras.Items[I].CondicaoPgt;
      Dataset.FieldByName('VALOR').AsCurrency:= Compras.Items[I].TotalLiquido;
      Dataset.Post;
      Compras.Items[I].Free;
    end;
    FreeAndNil(Compras);
    Dataset.First;
  end;
  Dataset.EnableControls;
end;

class function TCompraService.save(Compra: TCpCompraVO): Boolean;
var
  CompraOld: TCpCompraVO;
begin
  Result:= False;
  try
    try
      BeginTransaction;
      CompraOld:= TCompraRepository.getById(Compra.Id);

      if not Assigned(CompraOld) then
        Result:= TCompraRepository.store(Compra)
      else
      if Compra.ToJSONString = CompraOld.ToJSONString then
      begin
        Result:= True;
        Commit;
        Exit;
      end
      else
        Result:= TCompraRepository.update(Compra,CompraOld);
      Commit;
    except
      Rollback;
    end;
  finally
    FreeAndNil(CompraOld);
  end;
end;

end.
