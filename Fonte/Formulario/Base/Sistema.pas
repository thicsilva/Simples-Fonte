unit Sistema;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ModeloStore, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.ComCtrls,
  Vcl.StdCtrls;

type
  TFSistema = class(TFModeloStore)
    pgcSistema: TPageControl;
    tbNFE: TTabSheet;
    rgpFormaEmissao: TRadioGroup;
    gpbArquivos: TGroupBox;
    cbxSalvarAquivos: TCheckBox;
    edtArquivos: TLabeledEdit;
    imgSearchCliente: TImage;
    Label2: TLabel;
    OpenDialog: TOpenDialog;
    gpbCertificado: TGroupBox;
    Image1: TImage;
    Label1: TLabel;
    edtLocalCertificado: TLabeledEdit;
    edtSenhaCertificado: TLabeledEdit;
    edtNumeroSerie: TLabeledEdit;
    gpbWebService: TGroupBox;
    LabeledEdit2: TLabeledEdit;
    rgpAmbienteDestino: TRadioGroup;
    gpbConexao: TGroupBox;
    edtHost: TLabeledEdit;
    edtPorta: TLabeledEdit;
    edtUsuario: TLabeledEdit;
    edtSenhaConexao: TLabeledEdit;
    procedure imgSearchClienteClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSistema: TFSistema;

implementation

{$R *.dfm}

procedure TFSistema.Image1Click(Sender: TObject);
begin
  OpenDialog.Execute;
  edtLocalCertificado.Text:= OpenDialog.FileName;
end;

procedure TFSistema.imgSearchClienteClick(Sender: TObject);
begin
  OpenDialog.Execute;
  edtArquivos.Text:= OpenDialog.FileName;
end;

end.
