unit VendaService;

interface

uses BasicService, System.Generics.Collections, System.SysUtils, VdVendaVO,Firedac.comp.client,
  VendaRepository, PsPessoaVO, PessoaService;

type
  TVendaService = class(TBasicService)

  class procedure index(DataSet: TFDMemTable; Search: String);
  class function getById(IdVenda: String): TVdVendaVO;
  class function save(Venda: TVdVendaVO): Boolean;
  class function destroyer(IdVenda: String): Boolean;

  end;

implementation

{ TVendaService }

class function TVendaService.destroyer(IdVenda: String): Boolean;
var
  VendaObj: TVdVendaVO;
begin
  try
    Result:= False;
    try
      BeginTransaction;
      VendaObj:= TVendaRepository.getById(IdVenda);
      TVendaRepository.destroyer(VendaObj);
      Commit;
      Result:= True;
    except
      Rollback;
    end;
  finally
    FreeAndNil(VendaObj);
  end;
end;

class function TVendaService.getById(IdVenda: String): TVdVendaVO;
begin
  Result:= TVendaRepository.getById(IdVenda);
end;

class procedure TVendaService.index(DataSet: TFDMemTable; Search: String);
var
  Vendas: TList<TVdVendaVO>;
  Clientes: TPsPessoaVO;
  I: Integer;
begin
  Vendas:= nil;
  Dataset.Open;
  Dataset.DisableControls;
  Dataset.EmptyDataSet;
  Vendas:= TVendaRepository.index(Search);
  if Assigned(Vendas) then
  begin
    for I:= 0 to Pred(Vendas.Count) do
    begin
      Dataset.Append;
      Dataset.FieldByName('ID').AsString:= Vendas.Items[I].Id;
      Dataset.FieldByName('MARK').AsInteger:= 0;
      Dataset.FieldByName('DATA_VENDA').AsDateTime:= Vendas.Items[I].DataVendaOrcamento;
      Dataset.FieldByName('VENDA').AsString:= Vendas.Items[I].Numero;
      Clientes:= TPessoaService.getById(Vendas.Items[I].IdPessoa);
      Dataset.FieldByName('CLIENTE').AsString:= Trim(Clientes.Nome);
      FreeAndNil(Clientes);
      Dataset.FieldByName('STATUS').AsString:= Vendas.Items[I].StatusNegosiacao;
      Dataset.FieldByName('NOTA_FISCAL').AsString:= '';
      Dataset.FieldByName('VALOR').AsCurrency:= Vendas.Items[I].TotalLiquido;
      Dataset.Post;
      Vendas.Items[I].Free;
    end;
    FreeAndNil(Vendas);
    Dataset.First;
  end;
  Dataset.EnableControls;
end;

class function TVendaService.save(Venda: TVdVendaVO): Boolean;
var
  VendaOld: TVdVendaVO;
begin
  Result:= False;
  try
    try
      BeginTransaction;
      VendaOld:= TVendaRepository.getById(Venda.Id);

      if not Assigned(VendaOld) then
        Result:= TVendaRepository.store(Venda)
      else
      if Venda.ToJSONString = VendaOld.ToJSONString then
      begin
        Result:= True;
        Commit;
        Exit;
      end
      else
        Result:= TVendaRepository.update(Venda,VendaOld);
      Commit;
    except
      Rollback;
    end;
  finally
    FreeAndNil(VendaOld);
  end;
end;

end.
