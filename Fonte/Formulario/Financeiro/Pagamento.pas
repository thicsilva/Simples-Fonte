unit Pagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ModeloStore, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.StdCtrls,
  Vcl.ComCtrls, Biblioteca, FnCrediarioVO, CrediarioService, FnPlanoContaVO,
  PlanoContaService, PsPessoaVO, PessoaService, FnCentroCustoVO,
  CentroCustoService, FnBancoVO, BancoService;

type
  TFPagamento = class(TFModeloStore)
    pnlTitle: TPanel;
    lblTituloForm: TLabel;
    Bevel1: TBevel;
    edtDescricao: TLabeledEdit;
    edtCategoria: TLabeledEdit;
    imgSearchCategoria: TImage;
    edtFornecedor: TLabeledEdit;
    imgSearchFornecedor: TImage;
    Bevel3: TBevel;
    edtDataVencimento: TDateTimePicker;
    Label5: TLabel;
    edtContaBancaria: TLabeledEdit;
    imgSearchConta: TImage;
    edtCentroCusto: TLabeledEdit;
    imgSearchCentroCusto: TImage;
    edtObs: TLabeledEdit;
    Bevel4: TBevel;
    cbxPagoSN: TCheckBox;
    edtDescontosTaxas: TLabeledEdit;
    edtJurosMulta: TLabeledEdit;
    edtValorPago: TLabeledEdit;
    edtValor: TLabeledEdit;
    edtDataPagamento: TDateTimePicker;
    lblDataPagamento: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure imgSearchFornecedorClick(Sender: TObject);
    procedure imgSearchCategoriaClick(Sender: TObject);
    procedure imgSearchCentroCustoClick(Sender: TObject);
    procedure edtFornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCategoriaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCentroCustoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbxPagoSNClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ActionSalvarExecute(Sender: TObject);
    procedure imgSearchContaClick(Sender: TObject);
    procedure edtContaBancariaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    ObjCrediario: TFnCrediarioVO;

    procedure EdtToObj;
    procedure ObjToEdt;
    function Validacoes: String;

    procedure SomaValores;
  public
    { Public declarations }
  end;

var
  FPagamento: TFPagamento;

implementation

{$R *.dfm}

uses Fornecedor, Menu, PlanoConta, CentroCusto, Mensagem, Banco;

procedure TFPagamento.ActionSalvarExecute(Sender: TObject);
var
  Msg: String;
begin
  Msg:= Validacoes;
  if Msg = '' then
  begin
    EdtToObj;
    if TCrediarioService.save(ObjCrediario) then
      Close;
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

procedure TFPagamento.cbxPagoSNClick(Sender: TObject);
begin
  if cbxPagoSN.Checked = True then
  begin
    lblDataPagamento.Enabled:= True;
    edtDataPagamento.Enabled:= True;
    edtDescontosTaxas.Enabled:= True;
    edtJurosMulta.Enabled:= True;
    edtValorPago.Enabled:= True;
  end
  else
  if cbxPagoSN.Checked = False then
  begin
    lblDataPagamento.Enabled:= False;
    edtDataPagamento.Enabled:= False;
    edtDescontosTaxas.Enabled:= False;
    edtDescontosTaxas.Text:= '';
    edtJurosMulta.Enabled:= False;
    edtJurosMulta.Text:= '';
    edtValorPago.Enabled:= False;
    edtValorPago.Text:= '';
  end;
end;

procedure TFPagamento.edtCategoriaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F1 then
    imgSearchCategoriaClick(Sender)
  else
  if Key = VK_BACK then
  begin
    edtCategoria.Text:= '';
    ObjCrediario.IdPlanoConta:= '';
  end;
end;

procedure TFPagamento.edtCentroCustoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F1 then
    imgSearchCentroCustoClick(Sender)
  else
  if Key = VK_BACK then
  begin
    edtCentroCusto.Text:= '';
    ObjCrediario.IdCentroCusto:= '';
  end;
end;

procedure TFPagamento.edtContaBancariaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F1 then
    imgSearchContaClick(Sender)
  else
  if Key = VK_BACK then
  begin
    edtCategoria.Text:= '';
    ObjCrediario.IdBanco:= '';
  end;
end;

procedure TFPagamento.edtFornecedorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F1 then
    imgSearchFornecedorClick(Sender)
  else
  if Key = VK_BACK then
  begin
    edtFornecedor.Text:= '';
    ObjCrediario.IdPessoa:= '';
  end;
end;

procedure TFPagamento.EdtToObj;
begin
  ObjCrediario.Descricao:= RemoveAcentos(Trim(edtDescricao.Text));
  ObjCrediario.DataVencimento:= edtDataVencimento.Date;
  ObjCrediario.Valor:= ConvertCurrency(edtValor.Text);
  ObjCrediario.Obs:= edtObs.Text;
  if cbxPagoSN.Checked = True then
  begin
    ObjCrediario.Status:= 'PAGO';
    ObjCrediario.DataPagamento:= edtDataPagamento.Date;
    ObjCrediario.Desconto:= ConvertCurrency(edtDescontosTaxas.Text);
    ObjCrediario.JurosMulta:= ConvertCurrency(edtJurosMulta.Text);
    ObjCrediario.ValorPago:= ConvertCurrency(edtValorPago.Text);
  end
  else
  begin
    ObjCrediario.Status:= 'A PAGAR';
    ObjCrediario.DataPagamento:= now;
    ObjCrediario.Desconto:= 0;
    ObjCrediario.JurosMulta:= 0;
    ObjCrediario.ValorPago:= 0;
  end;

  ObjCrediario.TipoCadastro:= Trim(lblTituloForm.Hint);
end;

procedure TFPagamento.edtValorChange(Sender: TObject);
begin
  SomaValores;
end;

procedure TFPagamento.FormCreate(Sender: TObject);
begin
  ObjCrediario:= TCrediarioService.getById(varBaseIdPagamento);
  if not Assigned(ObjCrediario) then
  begin
    ObjCrediario:= TFnCrediarioVO.Create;
  end
  else
  begin
    lblTituloForm.Caption:= 'Alterando Pagamento!';
  end;

  ObjToEdt;
end;

procedure TFPagamento.FormDestroy(Sender: TObject);
begin
  FreeAndNil(ObjCrediario);
end;

procedure TFPagamento.FormShow(Sender: TObject);
begin
  if Trim(lblTituloForm.Hint) = 'CONTA A RECEBER' then
    lblTituloForm.Caption:= 'Novo Recebimento!'
  else
    lblTituloForm.Caption:= 'Novo Pagamento!';
end;

procedure TFPagamento.imgSearchCategoriaClick(Sender: TObject);
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
    ObjCrediario.IdPlanoConta:= FPlanoConta.fdmt_ModeloID.AsString;
    edtCategoria.Text:= RemoveTracoENumeros(FPlanoConta.fdmt_ModeloNome.AsString);
  finally
    FreeAndNil(FPlanoConta);
  end;
end;

procedure TFPagamento.imgSearchCentroCustoClick(Sender: TObject);
begin
  try
    FCentroCusto:= TFCentroCusto.Create(nil);
    FCentroCusto.pnlMain.Align:= alNone;
    FCentroCusto.pnlMain.Anchors:= [];
    FCentroCusto.AlphaBlend:= True;
    FCentroCusto.AlphaBlendValue:= 240;
    FCentroCusto.pnlMain.BevelKind:= bkSoft;
    FCentroCusto.Height:= FMenu.Height;
    FCentroCusto.Width:= FMenu.Width;
    FCentroCusto.Tag:= 1;
    FCentroCusto.ShowModal;
    ObjCrediario.IdCentroCusto:= FCentroCusto.fdmt_ModeloID.AsString;
    edtCentroCusto.Text:= FCentroCusto.fdmt_ModeloNOME.AsString;
  finally
    FreeAndNil(FCentroCusto);
  end;
end;

procedure TFPagamento.imgSearchContaClick(Sender: TObject);
begin
  try
    FBanco:= TFBanco.Create(nil);
    FBanco.pnlMain.Align:= alNone;
    FBanco.pnlMain.Anchors:= [];
    FBanco.AlphaBlend:= True;
    FBanco.AlphaBlendValue:= 240;
    FBanco.pnlMain.BevelKind:= bkSoft;
    FBanco.Height:= FMenu.Height;
    FBanco.Width:= FMenu.Width;
    FBanco.Tag:= 1;
    FBanco.ShowModal;
    ObjCrediario.IdBanco:= FBanco.fdmt_ModeloID.AsString;
    edtContaBancaria.Text:= Trim(FBanco.fdmt_ModeloDESCRICAO.AsString);
  finally
    FreeAndNil(FBanco);
  end;
end;

procedure TFPagamento.imgSearchFornecedorClick(Sender: TObject);
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
    ObjCrediario.IdPessoa:= FFornecedor.fdmt_ModeloID.AsString;
    edtFornecedor.Text:= FFornecedor.fdmt_ModeloFORNECEDOR.AsString;
  finally
    FreeAndNil(FFornecedor);
  end;
end;

procedure TFPagamento.ObjToEdt;
var
  ObjCategoria: TFnPlanoContaVO;
  ObjFornecedor: TPsPessoaVO;
  ObjCentroCusto: TFnCentroCustoVO;
  ObjBanco: TFnBancoVO;
begin
  edtDescricao.Text:= Trim(ObjCrediario.Descricao);
  edtObs.Text:= Trim(ObjCrediario.Obs);

  ObjCategoria:= TPlanoContaService.getById(ObjCrediario.IdPlanoConta);
  if Assigned(ObjCategoria) then
    edtCategoria.Text:= Trim(ObjCategoria.Nome);
  FreeAndNil(ObjCategoria);

  ObjFornecedor:= TPessoaService.getById(ObjCrediario.IdPessoa);
  if Assigned(ObjFornecedor) then
    edtFornecedor.Text:= Trim(ObjFornecedor.Nome);
  FreeAndNil(ObjFornecedor);

  ObjCentroCusto:= TCentroCustoService.getById(ObjCrediario.IdCentroCusto);
  if Assigned(ObjCentroCusto) then
    edtCentroCusto.Text:= Trim(ObjCentroCusto.Nome);
  FreeAndNil(ObjCentroCusto);

  ObjBanco:= TBancoService.getById(ObjCrediario.IdBanco);
  if Assigned(ObjBanco) then
    edtContaBancaria.Text:= Trim(ObjBanco.Descricao);
  FreeAndNil(ObjBanco);

  edtDataVencimento.Date:= ObjCrediario.DataVencimento;
  edtValor.Text:= FloatToStrF(ObjCrediario.Valor,ffNumber,12,2);

  if Trim(ObjCrediario.Status) = 'PAGO' then
  begin
    cbxPagoSN.Checked:= True;
    edtDataPagamento.Date:= ObjCrediario.DataPagamento;
    edtDescontosTaxas.Text:= FloatToStrF(ObjCrediario.Desconto,ffNumber,12,2);
    edtJurosMulta.Text:= FloatToStrF(ObjCrediario.JurosMulta,ffNumber,12,2);
    edtValorPago.Text:= FloatToStrF(ObjCrediario.ValorPago,ffNumber,12,2);
  end
  else
  if Trim(ObjCrediario.Status) = 'A PAGAR' then
  begin
    cbxPagoSN.Checked:= False;
    edtDataPagamento.Date:= now;
    edtDescontosTaxas.Text:= '';
    edtJurosMulta.Text:= '';
    edtValorPago.Text:= '';
  end ;
end;

procedure TFPagamento.SomaValores;
var
  Result: Currency;
begin
  Result:= (ConvertCurrency(edtValor.Text) - ConvertCurrency(edtDescontosTaxas.Text)) +
            ConvertCurrency(edtJurosMulta.Text);

  edtValorPago.Text:= FloatToStrF(Result,ffNumber,12,2);
end;

function TFPagamento.Validacoes: String;
begin
  Result:= '';
  if edtDescricao.Text = '' then
    Result:= 'É necessário o preenchimento do campo Descrição!';

  if edtCategoria.Text = '' then
    Result:= 'É necessário o preenchimento do campo Categoria!';

  if edtContaBancaria.Text = '' then
    Result:= 'É necessário o preenchimento do campo Conta Bancária!';

  if ConvertCurrency(edtValor.Text) <= 0 then
    Result:= 'O campo Valor não pode ser Menor ou Igual a 0!';

  if edtDataVencimento.Date = null then
    Result:= 'É necessário o preenchimento do campo Data Vencimento!';

  if cbxPagoSN.Checked = True then
  begin
    if edtDataPagamento.Date = Null then
      Result:= 'É necessário o preenchimento do campo Data Pagamento!';

    if ConvertCurrency(edtValorPago.Text) <= 0 then
      Result:= 'O campo Valor Pago não pode ser Menor ou Igual a 0!';
  end;
end;

end.
