unit VendaStore;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ModeloStore, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.StdCtrls,
  Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, VdVendaVO, VdItemVO,
  System.Generics.Collections, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, VendaService,
  VendaItemRepository, VendaItemService, PrProdutoVO, PsPessoaVO, FnPlanoContaVO,
  PessoaService, ProdutoService, Biblioteca, FnCrediarioVO, CrediarioService,
  CrediarioRepository,System.DateUtils;

type
  TFVendaStore = class(TFModeloStore)
    pnlTitle: TPanel;
    lblTituloForm: TLabel;
    Bevel1: TBevel;
    Label1: TLabel;
    lblValorTotalTitle: TLabel;
    pnlContrato: TPanel;
    Label9: TLabel;
    Bevel3: TBevel;
    cbxCobranca: TComboBox;
    pnlVenda: TPanel;
    imgSearchCliente: TImage;
    Label2: TLabel;
    lblDataVenda: TLabel;
    Label4: TLabel;
    Bevel4: TBevel;
    edtDataVenda: TDateTimePicker;
    edtCliente: TLabeledEdit;
    edtNumero: TLabeledEdit;
    cbxStatusNegosiacao: TComboBox;
    cbxContrato: TCheckBox;
    cbxVigencia: TComboBox;
    Label5: TLabel;
    pnlOrcamento: TPanel;
    Label7: TLabel;
    Bevel5: TBevel;
    edtDataValidade: TDateTimePicker;
    edtDataOrcamento: TDateTimePicker;
    Label10: TLabel;
    edtPrevisaoEntrega: TLabeledEdit;
    mmObs: TMemo;
    Label18: TLabel;
    Grid: TDBGrid;
    pnlGridTitle: TPanel;
    bvBorderBottomGridTitle: TBevel;
    Label6: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    pnlBtns: TPanel;
    Bevel6: TBevel;
    Label14: TLabel;
    Label15: TLabel;
    Bevel7: TBevel;
    Bevel8: TBevel;
    Label16: TLabel;
    Image2: TImage;
    spbAddItem: TSpeedButton;
    Label17: TLabel;
    Image3: TImage;
    SpeedButton1: TSpeedButton;
    Image4: TImage;
    SpeedButton2: TSpeedButton;
    cbxTipoDesconto: TComboBox;
    Panel3: TPanel;
    lblValorTotal: TLabel;
    edtTotalDesconto: TEdit;
    Panel4: TPanel;
    lblTotalLiquido: TLabel;
    edtValorFrete: TEdit;
    ActionAdicionarItem: TAction;
    ActionAlterarItem: TAction;
    ActionExcluirItem: TAction;
    pnlObs: TPanel;
    Label21: TLabel;
    mmFormaPagamento: TMemo;
    Bevel10: TBevel;
    mmObsVenda: TMemo;
    Label19: TLabel;
    edtResponsavel: TLabeledEdit;
    imgSearchVendedor: TImage;
    Label20: TLabel;
    fdmt_Item: TFDMemTable;
    fdmt_ItemID: TStringField;
    fdmt_ItemID_PRODUTO_SERVICO: TStringField;
    fdmt_ItemNOME: TStringField;
    fdmt_ItemDETALHE: TStringField;
    fdmt_ItemQUANTIDADE: TCurrencyField;
    fdmt_ItemCUSTO: TCurrencyField;
    fdmt_ItemSUBTOTAL: TCurrencyField;
    ds_Item: TDataSource;
    pnlStatusVenda: TPanel;
    Label23: TLabel;
    Bevel9: TBevel;
    cbxVendaCondicaoParcela: TComboBox;
    edtDataVencimento: TDateTimePicker;
    lblVencimento: TLabel;
    edtObsParcelaAvista: TLabeledEdit;
    fdmt_Parcelas: TFDMemTable;
    fdmt_ParcelasPARCELA: TStringField;
    fdmt_ParcelasVENCIMENTO: TDateField;
    spbVisualizarParcelas: TSpeedButton;
    imgBorderVisuParcela: TImage;
    ActionVisualizarParcelas: TAction;
    fdmt_ParcelasVALOR: TCurrencyField;
    fdmt_ParcelasOBS: TStringField;
    procedure cbxStatusNegosiacaoChange(Sender: TObject);
    procedure cbxContratoClick(Sender: TObject);
    procedure imgSearchClienteClick(Sender: TObject);
    procedure edtClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure imgSearchVendedorClick(Sender: TObject);
    procedure edtResponsavelKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ActionAdicionarItemExecute(Sender: TObject);
    procedure ActionAlterarItemExecute(Sender: TObject);
    procedure ActionExcluirItemExecute(Sender: TObject);
    procedure edtTotalDescontoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbxVendaCondicaoParcelaChange(Sender: TObject);
    procedure ActionSalvarExecute(Sender: TObject);
    procedure ActionVisualizarParcelasExecute(Sender: TObject);
  private
    { Private declarations }
    ObjVenda: TVdVendaVO;
    ObjItemList: TList<TVdItemVO>;
    ObjCrediarioList: TList<TFnCrediarioVO>;

    procedure EdtToObj;
    procedure ObjToEdt;
    function Validacoes: String;

    procedure SomaValores(Status: Boolean; Valor: Currency);
    procedure SomaDesconto;
    procedure StatusNegosiacao;
    procedure AdicionaParcelas;
  public
    { Public declarations }
  end;

var
  FVendaStore: TFVendaStore;

implementation

{$R *.dfm}

uses Cliente, Menu, Usuario, ItemStore, Mensagem, VendaParcelaStore;

procedure TFVendaStore.ActionAdicionarItemExecute(Sender: TObject);
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
      AdicionaParcelas;
    end;
  finally
    FreeAndNil(FItemStore);
  end;
end;

procedure TFVendaStore.ActionAlterarItemExecute(Sender: TObject);
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
        AdicionaParcelas;
      end;
    finally
      FreeAndNil(FItemStore);
    end;
  end;
end;

procedure TFVendaStore.ActionExcluirItemExecute(Sender: TObject);
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
        AdicionaParcelas;
        fdmt_Item.Delete;
      end;
    finally
      FreeAndNil(FMensagem);
    end;
  end;
end;

procedure TFVendaStore.ActionSalvarExecute(Sender: TObject);
var
  Msg: String;
  Item: TVdItemVO;
  Parcelas: TFnCrediarioVO;
  QtdParcelas,I: Integer;
  UltimoDia: TDateTime;
begin
  Msg:= Validacoes;
  if Msg = '' then
  begin
    EdtToObj;
    if TVendaService.save(ObjVenda) then
    begin
      if Assigned(ObjItemList) then
      begin
        for I := 0 to Pred(ObjItemList.Count) do
        begin
          fdmt_Item.Filter:= 'ID = ' + QuotedStr(Trim(ObjItemList.Items[I].Id));
          fdmt_Item.Filtered:= True;
          if not fdmt_Item.IsEmpty then
          begin
            ObjItemList.Items[I].IdVenda:= ObjVenda.Id;
            ObjItemList.Items[I].IdProduto:= fdmt_ItemID_PRODUTO_SERVICO.AsString;
            ObjItemList.Items[I].Detalhe:= fdmt_ItemDETALHE.AsString;
            ObjItemList.Items[I].Quantidade:= fdmt_ItemQUANTIDADE.AsCurrency;
            ObjItemList.Items[I].Custo:= fdmt_ItemCUSTO.AsCurrency;
            ObjItemList.Items[I].Subtotal:= fdmt_ItemSUBTOTAL.AsCurrency;
            TVendaItemService.save(ObjItemList.Items[I]);
          end
          else
            TVendaItemService.destroyer(Trim(ObjItemList.Items[I].Id));
        end;
      end
      else
      begin
        fdmt_Item.First;
        while not fdmt_Item.Eof do
        begin
          Item:= TVdItemVO.Create;
          Item.IdVenda:= ObjVenda.Id;
          Item.IdProduto:= fdmt_ItemID_PRODUTO_SERVICO.AsString;
          Item.Detalhe:= fdmt_ItemDETALHE.AsString;
          Item.Quantidade:= fdmt_ItemQUANTIDADE.AsCurrency;
          item.Custo:= fdmt_ItemCUSTO.AsCurrency;
          item.Subtotal:= fdmt_ItemSUBTOTAL.AsCurrency;
          TVendaItemService.save(Item);
          FreeAndNil(Item);
          fdmt_Item.Next;
        end;
      end;

      if Assigned(ObjCrediarioList) then
      begin
        for I := 0 to Pred(ObjCrediarioList.Count) do
          TCrediarioService.destroyer(ObjCrediarioList.Items[I].Id);
      end;

      if (Trim(ObjVenda.StatusNegosiacao) = 'VENDA') and (Trim(ObjVenda.Contrato) = 'NAO') then
      begin
        fdmt_Parcelas.First;
        while not fdmt_Parcelas.Eof do
        begin
          Parcelas:= TFnCrediarioVO.Create;
          Parcelas.IdVenda:= ObjVenda.Id;
          Parcelas.IdPlanoConta:= '2EDDB78E-802A-2047-A223-42D94D248266';//Vendas
          Parcelas.IdPessoa:= ObjVenda.IdPessoa;
          Parcelas.Parcela:= Trim(fdmt_ParcelasPARCELA.AsString);
          Parcelas.DataVencimento:= fdmt_ParcelasVENCIMENTO.AsDateTime;
          Parcelas.Valor:= fdmt_ParcelasVALOR.AsCurrency;
          Parcelas.Status:= 'A PAGAR';
          Parcelas.Descricao:= '('+Trim(fdmt_ParcelasPARCELA.AsString)+') Venda ' + ObjVenda.Numero;
          Parcelas.TipoCadastro:= 'CONTA A RECEBER';
          Parcelas.Obs:= Trim(fdmt_ParcelasOBS.AsString);
          TCrediarioService.save(Parcelas);
          FreeAndNil(Parcelas);
          fdmt_Parcelas.Next;
        end;
      end
      else
      if (Trim(ObjVenda.StatusNegosiacao) = 'VENDA') and (Trim(ObjVenda.Contrato) = 'SIM') then
      begin
        QtdParcelas:= cbxVigencia.ItemIndex + 1;

        for I := 1 to Pred(QtdParcelas) do
        begin
          Parcelas:= TFnCrediarioVO.Create;
          Parcelas.IdVenda:= ObjVenda.Id;
          Parcelas.IdPlanoConta:= '2EDDB78E-802A-2047-A223-42D94D248266';//Vendas
          Parcelas.IdPessoa:= ObjVenda.IdPessoa;
          Parcelas.Parcela:= '1/1';
          if cbxCobranca.ItemIndex <> 28 then
          begin
            Parcelas.DataVencimento:= IncMonth(EncodeDate(YearOf(now), MonthOf(now),cbxCobranca.ItemIndex + 1), I - 1);
          end
          else
          begin
            UltimoDia:= EndOfTheMonth(IncMonth(Now,I -1));
            Parcelas.DataVencimento:= IncMonth(UltimoDia, I - 1);
          end;
          Parcelas.Valor:= ObjVenda.ValorTotal;
          Parcelas.Status:= 'A PAGAR';
          Parcelas.Descricao:= '(1/1) Venda ' + ObjVenda.Numero +', '+ mmObsVenda.Text;
          Parcelas.TipoCadastro:= 'CONTA A RECEBER';
          Parcelas.Obs:= mmObsVenda.Text;
          TCrediarioService.save(Parcelas);
          FreeAndNil(Parcelas);
        end;
      end;

      Close;
    end;
  end
  else
    Mensagem(Msg,0,1);
end;

procedure TFVendaStore.ActionVisualizarParcelasExecute(Sender: TObject);
begin
  try
    FVendaParcelasStore:= TFVendaParcelasStore.Create(nil);
    FVendaParcelasStore.pnlMain.Align:= alNone;
    FVendaParcelasStore.pnlMain.Anchors:= [];
    FVendaParcelasStore.AlphaBlend:= True;
    FVendaParcelasStore.AlphaBlendValue:= 240;
    FVendaParcelasStore.pnlMain.BevelKind:= bkSoft;
    FVendaParcelasStore.Height:= FMenu.Height;
    FVendaParcelasStore.Width:= FMenu.Width;
    FVendaParcelasStore.Tag:= 1;
    FVendaParcelasStore.lblValorTotalTitle.Caption:= lblValorTotalTitle.Caption;
    FVendaParcelasStore.ShowModal;
    if FVendaParcelasStore.Tag <> 1 then
      AdicionaParcelas;
  finally
    FreeAndNil(FVendaParcelasStore);
  end;
end;

procedure TFVendaStore.AdicionaParcelas;
var
  Parcelas,I: Integer;
  Sobras: Currency;
begin
  if cbxVendaCondicaoParcela.ItemIndex >= 2 then
  begin
    lblVencimento.Visible:= False;
    edtDataVencimento.Visible:= False;
    edtObsParcelaAvista.Visible:= false;
    imgBorderVisuParcela.Visible:= True;
    ActionVisualizarParcelas.Visible:= True;

    fdmt_Parcelas.Open;
    fdmt_Parcelas.DisableControls;
    fdmt_Parcelas.EmptyDataSet;

    Parcelas:= StrToInt(Copy(cbxVendaCondicaoParcela.Text,0,Pos('X',cbxVendaCondicaoParcela.Text) -1));

    for I:= 0 to Pred(Parcelas) do
    begin
      fdmt_Parcelas.Append;
      fdmt_Parcelas.FieldByName('PARCELA').AsString:= IntToStr(I+1) +'/'+IntToStr(Parcelas);
      fdmt_Parcelas.FieldByName('VENCIMENTO').AsDateTime:= IncMonth(now,I);
      fdmt_Parcelas.FieldByName('OBS').AsString:= '';
      if I+1 = Parcelas then
      begin
        Sobras:= (ConvertCurrency(lblTotalLiquido.Caption) -
        ConvertCurrency(FloatToStrF((ConvertCurrency(lblTotalLiquido.Caption) / Parcelas),ffNumber,12,2)) * Parcelas);
        fdmt_Parcelas.FieldByName('VALOR').AsCurrency:= Sobras + (ConvertCurrency(lblTotalLiquido.Caption) / Parcelas);
      end
      else
        fdmt_Parcelas.FieldByName('VALOR').AsCurrency:= ConvertCurrency(lblTotalLiquido.Caption) / Parcelas;
      fdmt_Parcelas.Post;
    end;

    fdmt_Parcelas.First;
    fdmt_Parcelas.EnableControls;
  end
  else
  begin
    lblVencimento.Visible:= True;
    edtDataVencimento.Visible:= True;
    edtObsParcelaAvista.Visible:= True;
    imgBorderVisuParcela.Visible:= False;
    ActionVisualizarParcelas.Visible:= False;
  end;
end;

procedure TFVendaStore.cbxContratoClick(Sender: TObject);
begin
  if cbxContrato.Checked = True then
  begin
    pnlContrato.Height:= 60;
    Grid.Height:= 121;
    pnlStatusVenda.Height:= 1;
  end
  else
  begin
    pnlContrato.Height:= 1;
    Grid.Height:= 110;
    pnlStatusVenda.Height:= 65;
  end;
end;

procedure TFVendaStore.cbxStatusNegosiacaoChange(Sender: TObject);
begin
  StatusNegosiacao;
end;

procedure TFVendaStore.cbxVendaCondicaoParcelaChange(Sender: TObject);
begin
  AdicionaParcelas;
end;

procedure TFVendaStore.edtClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F1 then
    imgSearchClienteClick(Sender)
  else
  if Key = VK_BACK then
  begin
    edtCliente.Text:= '';
    ObjVenda.IdPessoa:= '';
  end;
end;

procedure TFVendaStore.edtResponsavelKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F1 then
    imgSearchVendedorClick(Sender)
  else
  if Key = VK_BACK then
  begin
    edtResponsavel.Text:= '';
    ObjVenda.IdUsuario:= '';
  end;
end;

procedure TFVendaStore.EdtToObj;
begin
  ObjVenda.Numero:= Trim(edtNumero.Text);
  ObjVenda.StatusNegosiacao:= Trim(cbxStatusNegosiacao.Text);

  if cbxStatusNegosiacao.ItemIndex <> 3 then
  begin
    ObjVenda.DataVendaOrcamento:= edtDataOrcamento.Date;
    ObjVenda.DataVencimento:= edtDataValidade.Date;
    ObjVenda.PrevisaoEntrega:= RemoveAcentos(Trim(edtPrevisaoEntrega.Text));
    ObjVenda.Introducao:= RemoveAcentos(Trim(mmObs.Text));
  end
  else
  begin
    ObjVenda.DataVendaOrcamento:= edtDataVenda.Date;
    if cbxContrato.Checked = True then
    begin
      ObjVenda.Cobranca:= Trim(cbxCobranca.Text);
      ObjVenda.Vigencia:= Trim(cbxVigencia.Text);
      cbxCobranca.Enabled:= False;
      cbxVigencia.Enabled:= False;
      ObjVenda.Contrato:= 'SIM';
    end
    else
    begin
      ObjVenda.Contrato:= 'NAO';
      ObjVenda.CondicaoPgt:= Trim(cbxVendaCondicaoParcela.Text);
    end;
  end;

  ObjVenda.Obs:= RemoveAcentos(Trim(mmObsVenda.Text));
  ObjVenda.FormaPagamento:= RemoveAcentos(Trim(mmFormaPagamento.Text));
  ObjVenda.TipoDesconto:= Trim(cbxTipoDesconto.Text);
  ObjVenda.Desconto:= ConvertCurrency(edtTotalDesconto.Text);
  ObjVenda.Frete:= ConvertCurrency(edtValorFrete.Text);
  ObjVenda.ValorTotal:= ConvertCurrency(lblValorTotal.Caption);
  ObjVenda.TotalLiquido:= ConvertCurrency(lblTotalLiquido.Caption);
end;

procedure TFVendaStore.edtTotalDescontoChange(Sender: TObject);
begin
  SomaDesconto;
end;

procedure TFVendaStore.FormCreate(Sender: TObject);
begin
  ObjVenda:= TVendaService.getById(varBaseIdVenda);
  fdmt_Item.Open;
  if not Assigned(ObjVenda) then
  begin
    ObjVenda:= TVdVendaVO.Create;
  end
  else
  begin
    ObjItemList:= TVendaItemRepository.index(ObjVenda.Id);
    if Trim(ObjVenda.StatusNegosiacao) = 'VENDA' then
      ObjCrediarioList:= TCrediarioRepository.indexVenda(ObjVenda.Id);
  end;

  ObjToEdt;
end;

procedure TFVendaStore.FormDestroy(Sender: TObject);
begin
  FreeAndNil(ObjVenda);
  FreeAndNil(ObjItemList);
  FreeAndNil(ObjCrediarioList);
end;

procedure TFVendaStore.imgSearchClienteClick(Sender: TObject);
begin
  try
    FCliente:= TFCliente.Create(nil);
    FCliente.pnlMain.Align:= alNone;
    FCliente.pnlMain.Anchors:= [];
    FCliente.AlphaBlend:= True;
    FCliente.AlphaBlendValue:= 240;
    FCliente.pnlMain.BevelKind:= bkSoft;
    FCliente.Height:= FMenu.Height;
    FCliente.Width:= FMenu.Width;
    FCliente.Tag:= 1;
    FCliente.ShowModal;
    ObjVenda.IdPessoa:= FCliente.fdmt_ModeloID.AsString;
    edtCliente.Text:= FCliente.fdmt_ModeloCLIENTE.AsString;
  finally
    FreeAndNil(FCliente);
  end;
end;

procedure TFVendaStore.imgSearchVendedorClick(Sender: TObject);
begin
  try
    FUsuario:= TFUsuario.Create(nil);
    FUsuario.pnlMain.Align:= alNone;
    FUsuario.pnlMain.Anchors:= [];
    FUsuario.AlphaBlend:= True;
    FUsuario.AlphaBlendValue:= 240;
    FUsuario.pnlMain.BevelKind:= bkSoft;
    FUsuario.Height:= FMenu.Height;
    FUsuario.Width:= FMenu.Width;
    FUsuario.Tag:= 1;
    FUsuario.ShowModal;
    ObjVenda.IdUsuario:= FUsuario.fdmt_ModeloID.AsString;
    edtResponsavel.Text:= FUsuario.fdmt_ModeloNOME.AsString;
  finally
    FreeAndNil(FUsuario);
  end;
end;

procedure TFVendaStore.ObjToEdt;
var
  ProdutoServico: TPrProdutoVO;
  Pessoa: TPsPessoaVO;
  PlanoConta: TFnPlanoContaVO;
  I: Integer;
begin
  Pessoa:= TPessoaService.getById(ObjVenda.IdPessoa);
  if Assigned(Pessoa) then
    edtCliente.Text:= Trim(Pessoa.Nome);
  FreeAndNil(Pessoa);

  Pessoa:= TPessoaService.getById(ObjVenda.IdUsuario);
  if Assigned(Pessoa) then
    edtResponsavel.Text:= Trim(Pessoa.Nome);
  FreeAndNil(Pessoa);

  edtNumero.Text:= Trim(ObjVenda.Numero);
  mmObsVenda.Text:= Trim(ObjVenda.Obs);
  mmFormaPagamento.Text:= Trim(ObjVenda.FormaPagamento);
  cbxTipoDesconto.ItemIndex:= cbxTipoDesconto.Items.IndexOf(Trim(ObjVenda.TipoDesconto));
  if cbxTipoDesconto.Text = '' then
    cbxTipoDesconto.ItemIndex:= 0;
  edtTotalDesconto.Text:= FloatToStrF(ObjVenda.Desconto,ffNumber,12,2);
  edtValorFrete.Text:= FloatToStrF(ObjVenda.Frete,ffNumber,12,2);

  cbxStatusNegosiacao.ItemIndex:= cbxStatusNegosiacao.Items.IndexOf(Trim(ObjVenda.StatusNegosiacao));
  if cbxStatusNegosiacao.text = '' then
    cbxStatusNegosiacao.ItemIndex:= 3;
  StatusNegosiacao;

  if Trim(ObjVenda.StatusNegosiacao) <> 'VENDA' then
  begin
    mmObs.Text:= Trim(ObjVenda.Obs);
    edtDataOrcamento.Date:= ObjVenda.DataVendaOrcamento;
    edtDataValidade.Date:= ObjVenda.DataVencimento;
    edtPrevisaoEntrega.Text:= Trim(ObjVenda.PrevisaoEntrega);
  end
  else
  begin
    edtDataVenda.Date:= ObjVenda.DataVendaOrcamento;
    if Trim(ObjVenda.Contrato) = 'SIM' then
    begin
      cbxContrato.Checked:= True;
      cbxCobranca.ItemIndex:= cbxCobranca.Items.IndexOf(Trim(ObjVenda.Cobranca));
      cbxVigencia.ItemIndex:= cbxVigencia.Items.IndexOf(Trim(ObjVenda.Vigencia));
    end
    else
    begin
      cbxContrato.Checked:= False;
      cbxVendaCondicaoParcela.ItemIndex:= cbxVendaCondicaoParcela.Items.IndexOf(Trim(ObjVenda.CondicaoPgt));
      fdmt_Parcelas.Open;
      if Assigned(ObjCrediarioList) then
      begin
        for I := 0 to Pred(ObjCrediarioList.Count) do
        begin
          fdmt_Parcelas.Insert;
          fdmt_ParcelasPARCELA.AsString:= Trim(ObjCrediarioList.Items[I].Parcela);
          fdmt_ParcelasVENCIMENTO.AsDateTime:= ObjCrediarioList.Items[I].DataVencimento;
          fdmt_ParcelasOBS.AsString:= Trim(ObjCrediarioList.Items[I].Obs);
          fdmt_ParcelasVALOR.AsCurrency:= ObjCrediarioList.Items[I].Valor;
          fdmt_Parcelas.Post;
        end;
      end;

      if cbxVendaCondicaoParcela.ItemIndex <= 1 then
      begin
        edtDataVencimento.Date:= fdmt_ParcelasVENCIMENTO.AsDateTime;
        edtObsParcelaAvista.Text:= fdmt_ParcelasOBS.AsString;
      end
      else
      begin
        edtDataVencimento.Visible:= False;
        edtObsParcelaAvista.Visible:= False;
        lblVencimento.Visible:= False;
        ActionVisualizarParcelas.Visible:= True;
        imgBorderVisuParcela.Visible:= True;
      end;
    end;
  end;


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

procedure TFVendaStore.SomaDesconto;
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

procedure TFVendaStore.SomaValores(Status: Boolean; Valor: Currency);
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

procedure TFVendaStore.StatusNegosiacao;
begin
  if cbxStatusNegosiacao.ItemIndex <> 3 then
  begin
    lblTituloForm.Caption:= 'ORCAMENTO';
    lblDataVenda.Visible:= False;
    edtDataVenda.Visible:= False;
    edtNumero.Width:= 233;
    pnlOrcamento.Height:= 83;
    pnlContrato.Height:= 1;
    pnlStatusVenda.Height:= 1;
    cbxContrato.Visible:= False;
    Grid.Height:= 98;
  end
  else
  begin
    lblTituloForm.Caption:= 'VENDA';
    lblDataVenda.Visible:= True;
    edtDataVenda.Visible:= True;
    edtNumero.Width:= 96;
    pnlOrcamento.Height:= 1;
    pnlContrato.Height:= 1;
    cbxContrato.Visible:= True;
    cbxContrato.Checked:= False;
    Grid.Height:= 110;
    pnlStatusVenda.Height:= 65;
  end;
end;

function TFVendaStore.Validacoes: String;
begin
  Result:= '';
  if edtCliente.Text = '' then
    Result:= 'É necessário o Preenchimento do Cliente!';

  if edtNumero.Text = '' then
    Result:= 'O Número não pode ficar vazio!';

  if fdmt_Item.IsEmpty then
    Result:= 'É necessário adicionar algum item para efetuar uma compra!';

  if ConvertCurrency(lblTotalLiquido.Caption) <= 0 then
    Result:= 'Não é possivel fazer uma compra com valor Menor ou Igual a 0!';

  if edtResponsavel.Text = '' then
    Result:= 'É necessário o Preenchimento do Vendedor Responsável!';
end;

end.
