unit MarcaEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ModeloStore, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.StdCtrls;

type
  TFMarcaEmpresa = class(TFModeloStore)
    pnlTitle: TPanel;
    lblTituloForm: TLabel;
    Bevel1: TBevel;
    Panel1: TPanel;
    Image1: TImage;
    edtLogo: TLabeledEdit;
    Image3: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Panel2: TPanel;
    Image2: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMarcaEmpresa: TFMarcaEmpresa;

implementation

{$R *.dfm}

end.
