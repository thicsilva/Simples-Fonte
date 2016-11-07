unit ItemStore;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ModeloStore, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.StdCtrls;

type
  TFItemStore = class(TFModeloStore)
    pnlTitle: TPanel;
    lblTituloForm: TLabel;
    Bevel1: TBevel;
    edtProdutoServico: TLabeledEdit;
    imgSearchProdutoServico: TImage;
    Label6: TLabel;
    edtDetalhe: TLabeledEdit;
    edtQuantidade: TLabeledEdit;
    edtCusto: TLabeledEdit;
    Panel3: TPanel;
    lblSubTotal: TLabel;
    Label13: TLabel;
    procedure imgSearchProdutoServicoClick(Sender: TObject);
    procedure edtProdutoServicoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtQuantidadeChange(Sender: TObject);
    procedure edtCustoChange(Sender: TObject);
    procedure ActionSalvarExecute(Sender: TObject);
    procedure ActionCancelarExecute(Sender: TObject);
  private
    { Private declarations }
    procedure SomaValores;
    function Validacoes: String;
  public
    { Public declarations }
  end;

var
  FItemStore: TFItemStore;

implementation

{$R *.dfm}

uses Mensagem, Menu, Servico, Produto;

procedure TFItemStore.ActionCancelarExecute(Sender: TObject);
begin
  Self.Tag:= 0;
  inherited;
end;

procedure TFItemStore.ActionSalvarExecute(Sender: TObject);
begin
  Self.Tag:= 1;
  Close;
end;

procedure TFItemStore.edtCustoChange(Sender: TObject);
begin
  SomaValores;
end;

procedure TFItemStore.edtProdutoServicoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F1 then
    imgSearchProdutoServicoClick(Sender)
  else
  if key = VK_BACK then
  begin
    edtProdutoServico.Text:= '';
    edtProdutoServico.Hint:= '';
  end;
end;

procedure TFItemStore.edtQuantidadeChange(Sender: TObject);
begin
  SomaValores;
end;

procedure TFItemStore.imgSearchProdutoServicoClick(Sender: TObject);
var
  Result: Integer;
begin
  try
    FMensagem:= TFMensagem.Create(nil);
    FMensagem.Height:= FMenu.Height;
    FMensagem.Width:= FMenu.Width;
    FMensagem.BitBtn2.Caption:= 'Produto';
    FMensagem.BitBtn1.Caption:= 'Serviço';
    FMensagem.tipo:= 1;
    FMensagem.ImagemInfo:= 0;
    FMensagem.Label2.Caption:= 'Deseja Pesquisar por Produro ou Serviço?';
    FMensagem.ShowModal;
    Result:= FMensagem.Tag;
  finally
    FreeAndNil(FMensagem);
    if Result = 1 then
    begin
      try
        FServico:= TFServico.Create(nil);
        FServico.pnlMain.Align:= alNone;
        FServico.pnlMain.Anchors:= [];
        FServico.AlphaBlend:= True;
        FServico.AlphaBlendValue:= 240;
        FServico.pnlMain.BevelKind:= bkSoft;
        FServico.Height:= FMenu.Height;
        FServico.Width:= FMenu.Width;
        FServico.Tag:= 1;
        FServico.ShowModal;
        edtProdutoServico.Hint:= FServico.fdmt_ModeloID.AsString;
        edtProdutoServico.Text:= FServico.fdmt_ModeloNOME.AsString;
        edtCusto.Text:= FloatToStrF(FServico.fdmt_ModeloVALOR_CUSTO.AsCurrency,ffNumber,12,2);
        SomaValores;
      finally
        FreeAndNil(FServico);
      end;
    end
    else
    begin
      try
        FProduto:= TFProduto.Create(nil);
        FProduto.pnlMain.Align:= alNone;
        FProduto.pnlMain.Anchors:= [];
        FProduto.AlphaBlend:= True;
        FProduto.AlphaBlendValue:= 240;
        FProduto.pnlMain.BevelKind:= bkSoft;
        FProduto.Height:= FMenu.Height;
        FProduto.Width:= FMenu.Width;
        FProduto.Tag:= 1;
        FProduto.ShowModal;
        edtProdutoServico.Hint:= FProduto.fdmt_ModeloID.AsString;
        edtProdutoServico.Text:= FProduto.fdmt_ModeloNOME.AsString;
        edtCusto.Text:= FloatToStrF(FProduto.fdmt_ModeloVALOR_CUSTO.AsCurrency,ffNumber,12,2);
        SomaValores;
      finally
        FreeAndNil(FProduto);
      end;
    end;
  end;
end;

procedure TFItemStore.SomaValores;
var
  Result: Currency;
begin
  Result:= ConvertCurrency(edtQuantidade.Text) * ConvertCurrency(edtCusto.Text);
  lblSubTotal.Caption:= FloatToStrF(Result,ffNumber,12,2);
end;

function TFItemStore.Validacoes: String;
begin
  Result:= '';
  if edtProdutoServico.Text = '' then
    Result:= 'É necessário selecionar um Produto/Serviço!';

  if ConvertCurrency(edtQuantidade.Text) <= 0 then
    Result:= 'O Campo Quantidade não pode ser Menor ou Igual a 0';

  if ConvertCurrency(edtCusto.Text) <= 0 then
    edtCusto.Text:= '0,00';
end;

end.
