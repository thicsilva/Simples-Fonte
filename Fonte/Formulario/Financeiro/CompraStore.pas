unit CompraStore;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ModeloStore, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.StdCtrls,
  Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, CpCompraVO, CompraService,
  CpItemVO,System.Generics.Collections, CompraItemService, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Biblioteca, CompraItemRepository, PsPessoaVO,
  PessoaService, PrProdutoVO, ProdutoService, FnPlanoContaVO, PlanoContaService;

type
  TFCompraStore = class(TFModeloStore)
    pnlTitle: TPanel;
    lblTituloForm: TLabel;
    Bevel1: TBevel;
    Label1: TLabel;
    lblValorTotalTitle: TLabel;
    pnlProduto: TPanel;
    imgSearchFornecedor: TImage;
    Label6: TLabel;
    edtFornecedor: TLabeledEdit;
    edtCodigoReferencia: TLabeledEdit;
    edtCategoria: TLabeledEdit;
    imgSearchCategoria: TImage;
    Label2: TLabel;
    edtDataCompra: TDateTimePicker;
    Label8: TLabel;
    cbxCondicaoPagamento: TComboBox;
    Label9: TLabel;
    edtDataVencimento: TDateTimePicker;
    Label10: TLabel;
    Grid: TDBGrid;
    pnlGridTitle: TPanel;
    bvBorderBottomGridTitle: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Panel2: TPanel;
    Bevel6: TBevel;
    Label13: TLabel;
    cbxTipoDesconto: TComboBox;
    Label14: TLabel;
    Panel3: TPanel;
    lblValorTotal: TLabel;
    edtTotalDesconto: TEdit;
    Bevel7: TBevel;
    Bevel8: TBevel;
    Label16: TLabel;
    Panel4: TPanel;
    lblTotalLiquido: TLabel;
    Bevel3: TBevel;
    spbAddItem: TSpeedButton;
    Image2: TImage;
    ActionAdicionarItem: TAction;
    ds_Item: TDataSource;
    fdmt_Item: TFDMemTable;
    fdmt_ItemID: TStringField;
    fdmt_ItemNOME: TStringField;
    fdmt_ItemDETALHE: TStringField;
    fdmt_ItemQUANTIDADE: TCurrencyField;
    fdmt_ItemCUSTO: TCurrencyField;
    fdmt_ItemSUBTOTAL: TCurrencyField;
    mmObs: TMemo;
    Label18: TLabel;
    Label5: TLabel;
    edtValorFrete: TEdit;
    fdmt_ItemID_PRODUTO_SERVICO: TStringField;
    ActionAlterarItem: TAction;
    ActionExcluirItem: TAction;
    SpeedButton1: TSpeedButton;
    Image1: TImage;
    SpeedButton2: TSpeedButton;
    Image3: TImage;
    procedure ActionAdicionarItemExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure imgSearchFornecedorClick(Sender: TObject);
    procedure edtFornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure edtTotalDescontoChange(Sender: TObject);
    procedure ActionAlterarItemExecute(Sender: TObject);
    procedure ActionExcluirItemExecute(Sender: TObject);
    procedure ActionSalvarExecute(Sender: TObject);
    procedure imgSearchCategoriaClick(Sender: TObject);
    procedure edtCategoriaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    ObjCompra: TCpCompraVO;
    ObjItemList: TList<TCpItemVo>;

    procedure EdtToObj;
    procedure ObjToEdt;
    function Validacoes: String;

    procedure SomaValores(Status: Boolean; Valor: Currency);
    procedure SomaDesconto;
  public
    { Public declarations }
  end;

var
  FCompraStore: TFCompraStore;

implementation

{$R *.dfm}

uses Fornecedor, Menu, ItemStore, Mensagem, PlanoConta;

procedure TFCompraStore.ActionAdicionarItemExecute(Sender: TObject);
begin
  try
    FItemStore:= TFItemStore.Create(nil);
    FItemStore.Height:= FMenu.Height;
    FItemStore.Width:= FMenu.Width;
    FItemStore.ShowModal;
    if FItemStore.Tag = 1 then
    begin
      fdmt_Item.Insert;
      fdmt_ItemID_PRODUTO_SERVICO.AsString:= FItemStore.edtProdutoServico.Hint;
      fdmt_ItemNOME.AsString:= FItemStore.edtProdutoServico.Text;
      fdmt_ItemDETALHE.AsString:= FItemStore.edtDetalhe.Text;
      fdmt_ItemQUANTIDADE.AsCurrency:= ConvertCurrency(FItemStore.edtQuantidade.Text);
      fdmt_ItemCUSTO.AsCurrency:= ConvertCurrency(FItemStore.edtCusto.Text);
      fdmt_ItemSUBTOTAL.AsCurrency:= ConvertCurrency(FItemStore.lblSubTotal.Caption);
      fdmt_Item.Post;
      SomaValores(True,ConvertCurrency(FItemStore.lblSubTotal.Caption));
    end;
  finally
    FreeAndNil(FItemStore);
  end;
end;

procedure TFCompraStore.ActionAlterarItemExecute(Sender: TObject);
begin
  if not fdmt_Item.IsEmpty then
  begin
    try
      FItemStore:= TFItemStore.Create(nil);
      FItemStore.Height:= FMenu.Height;
      FItemStore.Width:= FMenu.Width;
      FItemStore.edtProdutoServico.Hint:= fdmt_ItemID_PRODUTO_SERVICO.AsString;
      FItemStore.edtProdutoServico.Text:= fdmt_ItemNOME.AsString;
      FItemStore.edtDetalhe.Text:= fdmt_ItemDETALHE.AsString;
      FItemStore.edtQuantidade.Text:= FloatToStrF(fdmt_ItemQUANTIDADE.AsCurrency,ffNumber,12,2);
      FItemStore.edtCusto.Text:= FloatToStrF(fdmt_ItemCUSTO.AsCurrency,ffNumber,12,2);
      FItemStore.lblSubTotal.Caption:= FloatToStrF(fdmt_ItemSUBTOTAL.AsCurrency,ffCurrency,12,2);
      FItemStore.ShowModal;
      if FItemStore.Tag = 1 then
      begin
        SomaValores(False,fdmt_ItemSUBTOTAL.AsCurrency);
        fdmt_Item.Edit;
        fdmt_ItemID_PRODUTO_SERVICO.AsString:= FItemStore.edtProdutoServico.Hint;
        fdmt_ItemNOME.AsString:= FItemStore.edtProdutoServico.Text;
        fdmt_ItemDETALHE.AsString:= FItemStore.edtDetalhe.Text;
        fdmt_ItemQUANTIDADE.AsCurrency:= ConvertCurrency(FItemStore.edtQuantidade.Text);
        fdmt_ItemCUSTO.AsCurrency:= ConvertCurrency(FItemStore.edtCusto.Text);
        fdmt_ItemSUBTOTAL.AsCurrency:= ConvertCurrency(FItemStore.lblSubTotal.Caption);
        fdmt_Item.Post;
        SomaValores(True,ConvertCurrency(FItemStore.lblSubTotal.Caption));
      end;
    finally
      FreeAndNil(FItemStore);
    end;
  end;
end;

procedure TFCompraStore.ActionExcluirItemExecute(Sender: TObject);
begin
  if not fdmt_Item.IsEmpty then
  begin
    try
      FMensagem:= TFMensagem.Create(nil);
      FMensagem.Height:= FMenu.Height;
      FMensagem.Width:= FMenu.Width;
      FMensagem.tipo:= 1;
      FMensagem.ImagemInfo:= 0;
      FMensagem.Label2.Caption:= 'Deseja realmente excluir o item selecionado?';
      FMensagem.ShowModal;
      if FMensagem.Tag = 1 then
      begin
        SomaValores(False,fdmt_ItemSUBTOTAL.AsCurrency);
        SomaDesconto;
        fdmt_Item.Delete;
      end;
    finally
      FreeAndNil(FMensagem);
    end;
  end;
end;

procedure TFCompraStore.ActionSalvarExecute(Sender: TObject);
var
  Msg: String;
  Item: TCpItemVO;
  I: Integer;
begin
  Msg:= Validacoes;
  if Msg = '' then
  begin
    EdtToObj;
    if TCompraService.save(ObjCompra) then
    begin
      if Assigned(ObjItemList) then
      begin
        for I := 0 to Pred(ObjItemList.Count) do
        begin
          fdmt_Item.Filter:= 'ID = ' + QuotedStr(Trim(ObjItemList.Items[I].Id));
          fdmt_Item.Filtered:= True;
          if not fdmt_Item.IsEmpty then
          begin
            ObjItemList.Items[I].IdCompra:= ObjCompra.Id;
            ObjItemList.Items[I].IdProduto:= fdmt_ItemID_PRODUTO_SERVICO.AsString;
            ObjItemList.Items[I].Detalhe:= fdmt_ItemDETALHE.AsString;
            ObjItemList.Items[I].Quantidade:= fdmt_ItemQUANTIDADE.AsCurrency;
            ObjItemList.Items[I].Custo:= fdmt_ItemCUSTO.AsCurrency;
            ObjItemList.Items[I].Subtotal:= fdmt_ItemSUBTOTAL.AsCurrency;
            TCompraItemService.save(ObjItemList.Items[I]);
          end
          else
            TCompraItemService.destroyer(Trim(ObjItemList.Items[I].Id));
        end;
      end
      else
      begin
        fdmt_Item.First;
        while not fdmt_Item.Eof do
        begin
          Item:= TCpItemVO.Create;
          Item.IdCompra:= ObjCompra.Id;
          Item.IdProduto:= fdmt_ItemID_PRODUTO_SERVICO.AsString;
          Item.Detalhe:= fdmt_ItemDETALHE.AsString;
          Item.Quantidade:= fdmt_ItemQUANTIDADE.AsCurrency;
          item.Custo:= fdmt_ItemCUSTO.AsCurrency;
          item.Subtotal:= fdmt_ItemSUBTOTAL.AsCurrency;
          TCompraItemService.save(Item);
          FreeAndNil(Item);
          fdmt_Item.Next;
        end;
      end;

      Close;
    end;
  end
  else
  begin
    try
      FMensagem:= TFMensagem.Create(nil);
      FMensagem.Height:= FMenu.Height;
      FMensagem.Width:= FMenu.Width;
      FMensagem.tipo:= 0;
      FMensagem.ImagemInfo:= 1;
      FMensagem.Label2.Caption:= Msg;
      FMensagem.ShowModal;
    finally
      FreeAndNil(FMensagem);
    end;
  end;
end;

procedure TFCompraStore.edtCategoriaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F1 then
    imgSearchCategoriaClick(Sender)
  else
  if Key = VK_BACK then
  begin
    edtCategoria.Text:= '';
    ObjCompra.IdPlanoConta:= '';
  end;
end;

procedure TFCompraStore.edtFornecedorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F1 then
    imgSearchFornecedorClick(Sender)
  else
  if Key = VK_BACK then
  begin
    edtFornecedor.Text:= '';
    ObjCompra.IdPessoa:= '';
  end;
end;

procedure TFCompraStore.EdtToObj;
begin
  ObjCompra.Codigo:= RemoveAcentos(Trim(edtCodigoReferencia.Text));
  ObjCompra.DataCompra:= edtDataCompra.Date;
  ObjCompra.CondicaoPgt:= Trim(cbxCondicaoPagamento.Text);
  ObjCompra.DataVencimento:= edtDataVencimento.Date;
  ObjCompra.Obs:= RemoveAcentos(Trim(mmObs.Text));
  ObjCompra.TipoDesconto:= Trim(cbxTipoDesconto.Text);
  ObjCompra.Desconto:= ConvertCurrency(edtTotalDesconto.Text);
  ObjCompra.ValorTotal:= ConvertCurrency(lblValorTotal.Caption);
  ObjCompra.Frete:= ConvertCurrency(edtValorFrete.Text);
  ObjCompra.TotalLiquido:= ConvertCurrency(lblTotalLiquido.Caption);
end;

procedure TFCompraStore.edtTotalDescontoChange(Sender: TObject);
begin
  SomaDesconto;
end;

procedure TFCompraStore.FormCreate(Sender: TObject);
begin
  ObjCompra:= TCompraService.getById(varBaseIdCompra);
  fdmt_Item.Open;
  if not Assigned(ObjCompra) then
  begin
    ObjCompra:= TCpCompraVO.Create;
  end
  else
  begin
    ObjItemList:= TCompraItemRepository.index(ObjCompra.Id);
  end;

  ObjToEdt;
end;

procedure TFCompraStore.FormDestroy(Sender: TObject);
begin
  FreeAndNil(ObjCompra);
  FreeAndNil(ObjItemList);
end;

procedure TFCompraStore.imgSearchCategoriaClick(Sender: TObject);
begin
  try
    FPlanoConta:= TFPlanoConta.Create(nil);
    FPlanoConta.pnlMain.Align:= alNone;
    FPlanoConta.pnlMain.Anchors:= [];
    FPlanoConta.AlphaBlend:= True;
    FPlanoConta.AlphaBlendValue:= 240;
    FPlanoConta.pnlMain.BevelKind:= bkSoft;
    FPlanoConta.Height:= FMenu.Height;
    FPlanoConta.Width:= FMenu.Width;
    FPlanoConta.Tag:= 1;
    FPlanoConta.ShowModal;
    ObjCompra.IdPlanoConta:= FPlanoConta.fdmt_ModeloID.AsString;
    edtCategoria.Text:= RemoveTracoENumeros(FPlanoConta.fdmt_ModeloNome.AsString);
  finally
    FreeAndNil(FPlanoConta);
  end;
end;

procedure TFCompraStore.imgSearchFornecedorClick(Sender: TObject);
begin
  try
    FFornecedor:= TFFornecedor.Create(nil);
    FFornecedor.pnlMain.Align:= alNone;
    FFornecedor.pnlMain.Anchors:= [];
    FFornecedor.AlphaBlend:= True;
    FFornecedor.AlphaBlendValue:= 240;
    FFornecedor.pnlMain.BevelKind:= bkSoft;
    FFornecedor.Height:= FMenu.Height;
    FFornecedor.Width:= FMenu.Width;
    FFornecedor.Tag:= 1;
    FFornecedor.ShowModal;
    ObjCompra.IdPessoa:= FFornecedor.fdmt_ModeloID.AsString;
    edtFornecedor.Text:= FFornecedor.fdmt_ModeloFORNECEDOR.AsString;
  finally
    FreeAndNil(FFornecedor);
  end;
end;

procedure TFCompraStore.ObjToEdt;
var
  ProdutoServico: TPrProdutoVO;
  Pessoa: TPsPessoaVO;
  PlanoConta: TFnPlanoContaVO;
  I: Integer;
begin
  Pessoa:= TPessoaService.getById(ObjCompra.IdPessoa);
  if Assigned(Pessoa) then
    edtFornecedor.Text:= Pessoa.Nome;
  FreeAndNil(Pessoa);
  PlanoConta:= TPlanoContaService.getById(ObjCompra.IdPlanoConta);
  if Assigned(PlanoConta) then
    edtCategoria.Text:= PlanoConta.Nome;
  FreeAndNil(PlanoConta);
  edtCodigoReferencia.Text:= Trim(ObjCompra.Codigo);
  edtDataCompra.Date:= ObjCompra.DataCompra;
  cbxCondicaoPagamento.ItemIndex:= cbxCondicaoPagamento.Items.IndexOf(Trim(ObjCompra.CondicaoPgt));
  if cbxCondicaoPagamento.Text = '' then
    cbxCondicaoPagamento.ItemIndex:= 0;
  edtDataVencimento.Date:= ObjCompra.DataVencimento;
  mmObs.Text:= Trim(ObjCompra.Obs);
  cbxTipoDesconto.ItemIndex:= cbxTipoDesconto.Items.IndexOf(Trim(ObjCompra.TipoDesconto));
  if cbxTipoDesconto.Text = '' then
    cbxTipoDesconto.ItemIndex:= 0;
  edtTotalDesconto.Text:= FloatToStrF(ObjCompra.Desconto,ffNumber,12,2);
  edtValorFrete.Text:= FloatToStrF(ObjCompra.Frete,ffNumber,12,2);

  if Assigned(ObjItemList) then
  begin
    for I := 0 to Pred(ObjItemList.Count) do
    begin
      fdmt_Item.Insert;
      fdmt_ItemID.AsString:= Trim(ObjItemList.Items[I].Id);
      fdmt_ItemID_PRODUTO_SERVICO.AsString:= Trim(ObjItemList.Items[I].IdProduto);
      ProdutoServico:= TProdutoService.getById(Trim(ObjItemList.Items[I].IdProduto));
      fdmt_ItemNOME.AsString:= Trim(ProdutoServico.Nome);
      FreeAndNil(ProdutoServico);
      fdmt_ItemDETALHE.AsString:= Trim(ObjItemList.Items[I].Detalhe);
      fdmt_ItemQUANTIDADE.AsCurrency:= ObjItemList.Items[I].Quantidade;
      fdmt_ItemCUSTO.AsCurrency:= ObjItemList.Items[I].Custo;
      fdmt_ItemSUBTOTAL.AsCurrency:= ObjItemList.Items[I].Subtotal;
      fdmt_Item.Post;

      SomaValores(True,ObjItemList.Items[I].Subtotal);
    end;

    SomaDesconto;
  end;
end;

procedure TFCompraStore.SomaDesconto;
var
  Result: Currency;
begin
  if cbxTipoDesconto.ItemIndex = 0 then
    Result:= ConvertCurrency(lblValorTotal.Caption) -
    ((ConvertCurrency(edtTotalDesconto.Text) / 100) * ConvertCurrency(lblValorTotal.Caption))
  else
    Result:= ConvertCurrency(lblValorTotal.Caption) - ConvertCurrency(edtTotalDesconto.Text);

  Result:= Result + ConvertCurrency(edtValorFrete.Text);
  lblTotalLiquido.Caption:= FloatToStrF(Result,ffCurrency,12,2);
  lblValorTotalTitle.Caption:= lblTotalLiquido.Caption;
end;

procedure TFCompraStore.SomaValores(Status: Boolean; Valor: Currency);
var
  Result: Currency;
begin
  if Status = True then
    Result:= ConvertCurrency(lblValorTotal.Caption) + Valor
  else
    Result:= ConvertCurrency(lblValorTotal.Caption) - Valor;

  lblValorTotal.Caption:= FloatToStrF(Result,ffCurrency,12,2);
  SomaDesconto;
end;

function TFCompraStore.Validacoes: String;
begin
  Result:= '';
  if edtFornecedor.Text = '' then
    Result:= 'É necessário o Preenchimento do Fornecedor!';

  if edtCodigoReferencia.Text = '' then
    Result:= 'O Código de Referência não pode ficar vazio!';

  if fdmt_Item.IsEmpty then
    Result:= 'É necessário adicionar algum item para efetuar uma compra!';

  if ConvertCurrency(lblTotalLiquido.Caption) <= 0 then
    Result:= 'Não é possivel fazer uma compra com valor Menor ou Igual a 0!';

  if edtCategoria.Text = '' then
    Result:= 'É necessário o Preenchimento da Categoria!';
end;

end.
