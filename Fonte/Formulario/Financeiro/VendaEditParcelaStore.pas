unit VendaEditParcelaStore;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ModeloStore, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.StdCtrls,
  Vcl.ComCtrls;

type
  TFVendaEditParcelaStore = class(TFModeloStore)
    pnlVenda: TPanel;
    lblDataVenda: TLabel;
    edtDataVencimento: TDateTimePicker;
    edtObs: TLabeledEdit;
    pnlTitle: TPanel;
    lblTituloForm: TLabel;
    Bevel1: TBevel;
    edtValor: TLabeledEdit;
    procedure ActionSalvarExecute(Sender: TObject);
    procedure ActionCancelarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVendaEditParcelaStore: TFVendaEditParcelaStore;

implementation

{$R *.dfm}

procedure TFVendaEditParcelaStore.ActionCancelarExecute(Sender: TObject);
begin
  Self.Tag:= 0;
  inherited;
end;

procedure TFVendaEditParcelaStore.ActionSalvarExecute(Sender: TObject);
begin
  Self.Tag:= 1;
  Close;
end;

end.
