unit BancoStore;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ModeloStore, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.StdCtrls,
  FnBancoVO, BancoService, Biblioteca, Vcl.ComCtrls;

type
  TFBancoStore = class(TFModeloStore)
    pnlTitle: TPanel;
    lblTituloForm: TLabel;
    Bevel1: TBevel;
    cbxBanco: TComboBox;
    Label4: TLabel;
    edtDescricao: TLabeledEdit;
    cbxTipoConta: TComboBox;
    Label1: TLabel;
    edtSaldoInicial: TLabeledEdit;
    cbxContaPadrao: TCheckBox;
    edtDataSaldo: TDateTimePicker;
    Label2: TLabel;
    procedure ActionSalvarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    ObjBanco: TFnBancoVO;

    procedure EdtToObj;
    procedure ObjToEdt;
    function Validacoes: String;
  public
    { Public declarations }
  end;

var
  FBancoStore: TFBancoStore;

implementation

{$R *.dfm}

uses Mensagem, Menu;

procedure TFBancoStore.ActionSalvarExecute(Sender: TObject);
var
  Msg: String;
begin
  Msg:= Validacoes;
  if Msg = '' then
  begin
    EdtToObj;
    if TBancoService.save(ObjBanco) then
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

procedure TFBancoStore.EdtToObj;
begin
  ObjBanco.Banco:= Trim(cbxBanco.Text);
  ObjBanco.Descricao:= RemoveAcentos(Trim(edtDescricao.Text));
  ObjBanco.TipoConta:= Trim(cbxTipoConta.Text);
  ObjBanco.SaldoInicial:= ConvertCurrency(edtSaldoInicial.Text);
  if cbxContaPadrao.Checked = True then
    ObjBanco.ContaPadrao:= 'SIM'
  else
    ObjBanco.ContaPadrao:= 'NAO';
  ObjBanco.DataSaldo:= edtDataSaldo.Date;
end;

procedure TFBancoStore.FormCreate(Sender: TObject);
begin
  ObjBanco:= TBancoService.getById(varBaseIdBanco);
  if not Assigned(ObjBanco) then
  begin
    ObjBanco:= TFnBancoVO.Create;
    lblTituloForm.Caption:= 'Alterando Banco!';
  end
  else
  begin
    lblTituloForm.Caption:= 'Cadastrando Novo Banco!';
  end;

  ObjToEdt;
end;

procedure TFBancoStore.FormDestroy(Sender: TObject);
begin
  FreeAndNil(ObjBanco);
end;

procedure TFBancoStore.ObjToEdt;
begin
  if Trim(ObjBanco.Banco) <> '' then
    cbxBanco.ItemIndex:= cbxBanco.Items.IndexOf(Trim(ObjBanco.Banco));
  edtDescricao.Text:= Trim(ObjBanco.Descricao);
  if Trim(ObjBanco.TipoConta) <> '' then
    cbxTipoConta.ItemIndex:= cbxTipoConta.Items.IndexOf(Trim(ObjBanco.TipoConta));
  edtSaldoInicial.Text:= FloatToStrF(ObjBanco.SaldoInicial,ffNumber,12,2);
  edtDataSaldo.Date:= ObjBanco.DataSaldo;
    
  if Trim(ObjBanco.ContaPadrao) = 'SIM' then
    cbxContaPadrao.Checked:= True
  else
    cbxContaPadrao.Checked:= False;
end;

function TFBancoStore.Validacoes: String;
begin
  Result:= '';
  if edtDescricao.Text = '' then
    Result:= 'É necessário o preenchimento do campo Decrição!';

  if ConvertCurrency(edtSaldoInicial.Text) <= 0  then
    Result:= 'O Saldo Inicial não pode ser Menor ou Igual a 0!';

  if edtDataSaldo.Date = null then
    Result:= 'É necessário o preenchimento do campo Data Saldo!';
end;

end.
