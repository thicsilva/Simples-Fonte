unit ServicoStore;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ModeloStore, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, PrProdutoVO,
  ProdutoService, Vcl.StdCtrls, Bibli, Biblioteca;

type
  TFServicoStore = class(TFModeloStore)
    pnlTitle: TPanel;
    lblTituloForm: TLabel;
    Bevel1: TBevel;
    pnlNomeServico: TPanel;
    Bevel5: TBevel;
    Image2: TImage;
    imgSearchCategoria: TImage;
    edtNomeServico: TLabeledEdit;
    Label11: TLabel;
    Label12: TLabel;
    pnlServicoDados: TPanel;
    Bevel3: TBevel;
    Image3: TImage;
    edtValorVenda: TLabeledEdit;
    edtValorCusto: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure Label11Click(Sender: TObject);
    procedure ActionSalvarExecute(Sender: TObject);
    procedure edtNomeServicoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    ObjServico: TPrProdutoVO;

    procedure EdtToObj;
    procedure ObjToEdt;
    function Validacoes: String;
  public
    { Public declarations }
  end;

var
  FServicoStore: TFServicoStore;

implementation

{$R *.dfm}

uses Mensagem, Menu;

procedure TFServicoStore.ActionSalvarExecute(Sender: TObject);
var
  Msg: String;
begin
  Msg:= Validacoes;
  if Msg = '' then
  begin
    EdtToObj;
    if TProdutoService.save(ObjServico) then
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

procedure TFServicoStore.edtNomeServicoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    pnlServicoDados.Height:= 54;
end;

procedure TFServicoStore.EdtToObj;
begin
  ObjServico.TipoCadastro:= 'SERVICO';
  ObjServico.Nome:= RemoveAcentos(Trim(edtNomeServico.text));
  ObjServico.ValorCusto:= ConvertCurrency(edtValorCusto.Text);
  ObjServico.ValorVenda:= ConvertCurrency(edtValorVenda.Text);
end;

procedure TFServicoStore.FormCreate(Sender: TObject);
begin
  ObjServico:= TProdutoService.getById(varBaseIdServico);
  if not Assigned(ObjServico) then
  begin
    ObjServico:= TPrProdutoVO.Create;
    lblTituloForm.Caption:= 'Cadastro de novo Serviço!';
  end
  else
  begin
    lblTituloForm.Caption:= 'Alterando Dados de Serviço!';
  end;

  ObjToEdt;
end;

procedure TFServicoStore.FormDestroy(Sender: TObject);
begin
  FreeAndNil(ObjServico);
end;

procedure TFServicoStore.Label11Click(Sender: TObject);
begin
  if pnlServicoDados.Height = 1 then
    pnlServicoDados.Height:= 54
  else
    pnlServicoDados.Height:= 1;
end;

procedure TFServicoStore.ObjToEdt;
begin
  edtNomeServico.text:= Trim(ObjServico.Nome);
  edtValorCusto.Text:= FloatToStrF(ObjServico.ValorCusto,ffNumber,12,2);
  edtValorVenda.Text:= FloatToStrF(ObjServico.ValorVenda,ffNumber,12,2);
end;

function TFServicoStore.Validacoes: String;
begin
  Result:= '';
  if edtNomeServico.Text = '' then
    Result:= 'É necessário preenchimento do nome do Serviço!';
end;

end.
