unit EstoqueService;

interface

uses BasicService, System.Generics.Collections, System.SysUtils,Firedac.comp.client,
  EstoqueRepository, PrEstoqueVO, PsPessoaVO, PessoaService;

type
  TEstoqueService = class(TBasicService)

  class procedure index(DataSet: TFDMemTable; Search: String; DataInicio,DataFinal: TDate);
  class function getById(Estoque: String): TPrEstoqueVO;
  class function getByIdProduto(Produto: String): TPrEstoqueVO;
  class function save(Estoque: TPrEstoqueVO): Boolean;
  class function destroyer(Estoque: String): Boolean;

  end;

implementation

{ TClienteRepository }

class procedure TEstoqueService.index(DataSet: TFDMemTable; Search: String; DataInicio,DataFinal: TDate);
var
  Estoques: TList<TPrEstoqueVO>;
  Pessoa: TPsPessoaVO;
  I: Integer;
begin
  Estoques:= nil;
  Dataset.Open;
  Dataset.DisableControls;
  Dataset.EmptyDataSet;
  Estoques:= TEstoqueRepository.index(Search,DataInicio,DataFinal);
  if Assigned(Estoques) then
  begin
    for I:= 0 to Pred(Estoques.Count) do
    begin
      Dataset.Append;
      Dataset.FieldByName('DATA_HORA').AsDateTime:= Estoques.Items[I].DataHora;
      Dataset.FieldByName('MOVIMENTACAO').AsString:= Estoques.Items[I].Movimentacao;
      Pessoa:= TPessoaService.getById(Estoques.Items[I].IdPessoa);
      if Assigned(Pessoa) then
        Dataset.FieldByName('PESSOA').AsString:= Pessoa.Nome;
      FreeAndNil(Pessoa);
      Dataset.FieldByName('VALOR_UNITARIO').AsCurrency:= Estoques.Items[I].ValorUnitario;
      Dataset.FieldByName('VALOR_CUSTO').AsCurrency:= Estoques.Items[I].ValorCusto;
      Dataset.FieldByName('QT_MOVIMENTADA').AsCurrency:= Estoques.Items[I].QtMovimentada;
      Dataset.FieldByName('SALDO_ESTOQUE').AsCurrency:= Estoques.Items[I].SaldoEstoque;
      Dataset.Post;
      Estoques.Items[I].Free;
    end;
    FreeAndNil(Estoques);
    Dataset.First;
  end;
  Dataset.EnableControls;
end;

class function TEstoqueService.getById(Estoque: String): TPrEstoqueVO;
begin
  Result:= TEstoqueRepository.getById(Estoque);
end;

class function TEstoqueService.getByIdProduto(
  Produto: String): TPrEstoqueVO;
begin
  Result:= TEstoqueRepository.getByIdProduto(Produto);
end;

class function TEstoqueService.save(Estoque: TPrEstoqueVO): Boolean;
var
  EstoqueOld: TPrEstoqueVO;
begin
  Result:= False;
  try
    try
      BeginTransaction;
      EstoqueOld:= TEstoqueRepository.getById(Estoque.Id);

      if not Assigned(EstoqueOld) then
        Result:= TEstoqueRepository.store(Estoque)
      else
      if Estoque.ToJSONString = EstoqueOld.ToJSONString then
      begin
        Result:= True;
        Commit;
        Exit;
      end
      else
        Result:= TEstoqueRepository.update(Estoque,EstoqueOld);
      Commit;
    except
      Rollback;
    end;
  finally
    FreeAndNil(EstoqueOld);
  end;
end;

class function TEstoqueService.destroyer(Estoque: String): Boolean;
var
  EstoqueObj: TPrEstoqueVO;
begin
  try
    Result:= False;
    try
      BeginTransaction;
      EstoqueObj:= TEstoqueRepository.getById(Estoque);
      TEstoqueRepository.destroyer(EstoqueObj);
      Commit;
      Result:= True;
    except
      Rollback;
    end;
  finally
    FreeAndNil(EstoqueObj);
  end;
end;

end.
