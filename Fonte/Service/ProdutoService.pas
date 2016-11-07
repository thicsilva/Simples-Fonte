unit ProdutoService;

interface

uses BasicService, System.Generics.Collections, System.SysUtils,Firedac.comp.client,
   PrProdutoVO, ProdutoRepository, Biblioteca, Bibli, ProdutoMedidaService,
  PrMedidaVO, PrCategoriaVO, CategoriaProdutoService, PrTributacaoVO,
  ProdutoTributacaoService,Vcl.StdCtrls, ViewInventarioEstoqueVO;

type
  TProdutoService = class(TBasicService)

  class procedure index(DataSet: TFDMemTable; Search: String);
  class procedure indexServico(DataSet: TFDMemTable; Search: String);
  class procedure indexEstoque(DataSet: TFDMemTable; Search: String;
  CustoTotal,EstoqueTotal: TLabel);
  class procedure indexApoioInventario(DataSet: TFDMemTable; Search: String);
  class procedure indexInventario(DataSet: TFDMemTable; Search: String);
  class function getById(IdProduto: String): TPrProdutoVO;
  class function save(Produto: TPrProdutoVO): Boolean;
  class function destroyer(IdProduto: String): Boolean;

  end;

implementation

{ TProdutoRepository }

class procedure TProdutoService.index(DataSet: TFDMemTable; Search: String);
var
  Produtos: TList<TPrProdutoVO>;
  I: Integer;
begin
  Produtos:= nil;
  Dataset.Open;
  Dataset.DisableControls;
  Dataset.EmptyDataSet;
  Produtos:= TProdutoRepository.index(Search);
  if Assigned(Produtos) then
  begin
    for I:= 0 to Pred(Produtos.Count) do
    begin
      Dataset.Append;
      Dataset.FieldByName('ID').AsString:= Produtos.Items[I].Id;
      Dataset.FieldByName('MARK').AsInteger:= 0;
      Dataset.FieldByName('NOME').AsString:= Produtos.Items[I].Nome;
      Dataset.FieldByName('VALOR_VENDA').AsCurrency:= Produtos.Items[I].ValorVenda;
      Dataset.FieldByName('ESTOQUE').AsCurrency:= Produtos.Items[I].DisponivelEstoque;
      Dataset.FieldByName('VALOR_CUSTO').AsCurrency:= Produtos.Items[I].ValorCusto;
      Dataset.Post;
      Produtos.Items[I].Free;
    end;
    FreeAndNil(Produtos);
    Dataset.First;
  end;
  Dataset.EnableControls;
end;

class procedure TProdutoService.indexApoioInventario(DataSet: TFDMemTable;
  Search: String);
var
  Produtos: TList<TPrProdutoVO>;
  I: Integer;
begin
  Produtos:= nil;
  Dataset.Open;
  Dataset.DisableControls;
  Dataset.EmptyDataSet;
  Produtos:= TProdutoRepository.index(Search);
  if Assigned(Produtos) then
  begin
    for I:= 0 to Pred(Produtos.Count) do
    begin
      Dataset.Append;
      Dataset.FieldByName('CODIGO').AsString:= Produtos.Items[I].Codigo;
      Dataset.FieldByName('DESCRICAO').AsString:= Produtos.Items[I].Nome;
      Dataset.FieldByName('QUANTIDADE').AsCurrency:= Produtos.Items[I].DisponivelEstoque;
      Dataset.Post;
      Produtos.Items[I].Free;
    end;
    FreeAndNil(Produtos);
    Dataset.First;
  end;
  Dataset.EnableControls;
end;

class procedure TProdutoService.indexEstoque(DataSet: TFDMemTable;
  Search: String;CustoTotal,EstoqueTotal: TLabel);
var
  Produtos: TList<TPrProdutoVO>;
  Tributacao: TPrTributacaoVO;
  Medida: TPrMedidaVO;
  Categoria: TPrCategoriaVO;
  I: Integer;
  QtEstoque,CustoTotalEstoque: Currency;
begin
  QtEstoque:= 0;
  CustoTotalEstoque:= 0;
  Produtos:= nil;
  Dataset.Open;
  Dataset.DisableControls;
  Dataset.EmptyDataSet;
  Produtos:= TProdutoRepository.index(Search);
  if Assigned(Produtos) then
  begin
    for I:= 0 to Pred(Produtos.Count) do
    begin
      Dataset.Append;
      Dataset.FieldByName('ID').AsString:= Produtos.Items[I].Id;
      Dataset.FieldByName('MARK').AsInteger:= 0;
      Dataset.FieldByName('CODIGO').AsString:= Produtos.Items[I].Codigo;
      Dataset.FieldByName('PRODUTO').AsString:= Produtos.Items[I].Nome;

      Tributacao:= TProdutoTributacaoService.getByIdProduto(Produtos.Items[I].Id);
      if Assigned(Tributacao) then
      begin
        Medida:= TProdutoMedidaService.getById(Tributacao.IdMedida);
        if Assigned(Medida) then
          Dataset.FieldByName('UNIDADE_MEDIDA').AsString:= Medida.Nome;
        FreeAndNil(Medida);

        Categoria:= TCategoriaProdutoService.getById(Tributacao.IdCategoria);
        if Assigned(Categoria) then
          Dataset.FieldByName('CATEGORIA').AsString:= Categoria.Nome;
        FreeAndNil(Categoria);
      end;
      FreeAndNil(Tributacao);
      Dataset.FieldByName('VALOR_CUSTO').AsCurrency:= Produtos.Items[I].ValorCusto;
      Dataset.FieldByName('VALOR_VENDA').AsCurrency:= Produtos.Items[I].ValorVenda;
      Dataset.FieldByName('QT_ESTOQUE').AsCurrency:= Produtos.Items[I].DisponivelEstoque;
      Dataset.FieldByName('CUSTO_TOTAL').AsCurrency:=
      Produtos.Items[I].DisponivelEstoque * Produtos.Items[I].ValorCusto;

      QtEstoque:= QtEstoque + Produtos.Items[I].DisponivelEstoque;
      CustoTotalEstoque:= CustoTotalEstoque + Dataset.FieldByName('CUSTO_TOTAL').AsCurrency;

      Dataset.Post;
      Produtos.Items[I].Free;
    end;
    FreeAndNil(Produtos);
    Dataset.First;
  end;
  Dataset.EnableControls;
  CustoTotal.Caption:= FloatToStrF(CustoTotalEstoque,ffNumber,12,2);
  EstoqueTotal.Caption:= FloatToStrF(QtEstoque,ffNumber,12,0);
end;

class procedure TProdutoService.indexInventario(DataSet: TFDMemTable;
  Search: String);
var
  Produtos: TList<TViewInventarioEstoqueVO>;
  Tributacao: TPrTributacaoVO;
  Medida: TPrMedidaVO;
  Categoria: TPrCategoriaVO;
  I: Integer;
begin
  Produtos:= nil;
  Dataset.Open;
  Dataset.DisableControls;
  Dataset.EmptyDataSet;
  Produtos:= TProdutoRepository.indexInventario(Search);
  if Assigned(Produtos) then
  begin
    for I:= 0 to Pred(Produtos.Count) do
    begin
      Dataset.Append;
      Dataset.FieldByName('ID').AsString:= Produtos.Items[I].Id;
      Dataset.FieldByName('CODIGO').AsString:= Produtos.Items[I].Codigo;
      Dataset.FieldByName('PRODUTO').AsString:= Produtos.Items[I].Nome;

      Tributacao:= TProdutoTributacaoService.getByIdProduto(Produtos.Items[I].Id);
      if Assigned(Tributacao) then
      begin
        Medida:= TProdutoMedidaService.getById(Tributacao.IdMedida);
        if Assigned(Medida) then
          Dataset.FieldByName('MEDIDA').AsString:= Medida.Nome;
        FreeAndNil(Medida);

        Categoria:= TCategoriaProdutoService.getById(Tributacao.IdCategoria);
        if Assigned(Categoria) then
          Dataset.FieldByName('CATEGORIA').AsString:= Categoria.Nome;
        FreeAndNil(Categoria);
      end;
      FreeAndNil(Tributacao);
      Dataset.FieldByName('CUSTO').AsCurrency:= Produtos.Items[I].ValorCusto;
      Dataset.FieldByName('SALDO_ESTOQUE').AsCurrency:= Produtos.Items[I].Estoque;
      Dataset.FieldByName('NOVO_SALDO').AsCurrency:= Produtos.Items[I].Estoque;
      Dataset.FieldByName('DIFERENCA').AsCurrency:= 0;
      Dataset.Post;
      Produtos.Items[I].Free;
    end;
    FreeAndNil(Produtos);
    Dataset.First;
  end;
  Dataset.EnableControls;
end;

class procedure TProdutoService.indexServico(DataSet: TFDMemTable;
  Search: String);
var
  Servicos: TList<TPrProdutoVO>;
  I: Integer;
begin
  Servicos:= nil;
  Dataset.Open;
  Dataset.DisableControls;
  Dataset.EmptyDataSet;
  Servicos:= TProdutoRepository.indexServico(Search);
  if Assigned(Servicos) then
  begin
    for I:= 0 to Pred(Servicos.Count) do
    begin
      Dataset.Append;
      Dataset.FieldByName('ID').AsString:= Servicos.Items[I].Id;
      Dataset.FieldByName('MARK').AsInteger:= 0;
      Dataset.FieldByName('NOME').AsString:= Servicos.Items[I].Nome;
      Dataset.FieldByName('VALOR_CUSTO').AsCurrency:= Servicos.Items[I].ValorCusto;
      Dataset.FieldByName('VALOR_VENDA').AsCurrency:= Servicos.Items[I].ValorVenda;
      Dataset.Post;
      Servicos.Items[I].Free;
    end;
    FreeAndNil(Servicos);
    Dataset.First;
  end;
  Dataset.EnableControls;
end;

class function TProdutoService.getById(IdProduto: String): TPrProdutoVO;
begin
  Result:= TProdutoRepository.getById(IdProduto);
end;

class function TProdutoService.save(Produto: TPrProdutoVO): Boolean;
var
  ProdutoOld: TPrProdutoVO;
begin
  Result:= False;
  try
    try
      BeginTransaction;
      ProdutoOld:= TProdutoRepository.getById(Produto.Id);

      if not Assigned(ProdutoOld) then
        Result:= TProdutoRepository.store(Produto)
      else
      if Produto.ToJSONString = ProdutoOld.ToJSONString then
      begin
        Result:= True;
        Commit;
        Exit;
      end
      else
        Result:= TProdutoRepository.update(Produto,ProdutoOld);
      Commit;
    except
      Rollback;
    end;
  finally
    FreeAndNil(ProdutoOld);
  end;
end;

class function TProdutoService.destroyer(IdProduto: String): Boolean;
var
  ProdutoObj: TPrProdutoVO;
begin
  try
    Result:= False;
    try
      BeginTransaction;
      ProdutoObj:= TProdutoRepository.getById(IdProduto);
      TProdutoRepository.destroyer(ProdutoObj);
      Commit;
      Result:= True;
    except
      Rollback;
    end;
  finally
    FreeAndNil(ProdutoObj);
  end;
end;

end.
