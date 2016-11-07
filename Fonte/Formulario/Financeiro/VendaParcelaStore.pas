unit VendaParcelaStore;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ModeloStore, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Data.DB,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TFVendaParcelasStore = class(TFModeloStore)
    Grid: TDBGrid;
    pnlGridTitle: TPanel;
    bvBorderBottomGridTitle: TBevel;
    Label6: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    pnlTitle: TPanel;
    lblTituloForm: TLabel;
    Bevel1: TBevel;
    Label1: TLabel;
    lblValorTotalTitle: TLabel;
    ds_Parcela: TDataSource;
    Image1: TImage;
    spbAlterar: TSpeedButton;
    ActionEditar: TAction;
    procedure ActionCancelarExecute(Sender: TObject);
    procedure ActionSalvarExecute(Sender: TObject);
    procedure ActionEditarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVendaParcelasStore: TFVendaParcelasStore;

implementation

{$R *.dfm}

uses VendaStore, VendaEditParcelaStore, Menu, Biblioteca;

procedure TFVendaParcelasStore.ActionCancelarExecute(Sender: TObject);
begin
  Self.Tag:= 0;
  inherited;
end;

procedure TFVendaParcelasStore.ActionEditarExecute(Sender: TObject);
begin
  try
    FVendaEditParcelaStore:= TFVendaEditParcelaStore.Create(nil);
    FVendaEditParcelaStore.pnlMain.Align:= alNone;
    FVendaEditParcelaStore.pnlMain.Anchors:= [];
    FVendaEditParcelaStore.AlphaBlend:= True;
    FVendaEditParcelaStore.AlphaBlendValue:= 240;
    FVendaEditParcelaStore.pnlMain.BevelKind:= bkSoft;
    FVendaEditParcelaStore.Height:= FMenu.Height;
    FVendaEditParcelaStore.Width:= FMenu.Width;
    FVendaEditParcelaStore.Tag:= 1;
    FVendaEditParcelaStore.lblTituloForm.Caption:= 'Alterando parcela '+ ds_Parcela.DataSet.FieldByName('PARCELA').AsString;
    FVendaEditParcelaStore.edtDataVencimento.Date:= ds_Parcela.DataSet.FieldByName('VENCIMENTO').AsDateTime;
    FVendaEditParcelaStore.edtObs.text:= ds_Parcela.DataSet.FieldByName('OBS').AsString;
    FVendaEditParcelaStore.edtValor.Text:= FloatToStrF(ds_Parcela.DataSet.FieldByName('VALOR').AsCurrency,ffNumber,12,2);
    FVendaEditParcelaStore.ShowModal;
    if FVendaEditParcelaStore.Tag = 1 then
    begin
      ds_Parcela.DataSet.Edit;
      ds_Parcela.DataSet.FieldByName('VENCIMENTO').AsDateTime:= FVendaEditParcelaStore.edtDataVencimento.Date;
      ds_Parcela.DataSet.FieldByName('OBS').AsString:= RemoveAcentos(Trim(FVendaEditParcelaStore.edtObs.Text));
      ds_Parcela.DataSet.FieldByName('VALOR').AsCurrency:= ConvertCurrency(FVendaEditParcelaStore.edtValor.Text);
      ds_Parcela.DataSet.Post;
    end;
  finally
    FreeAndNil(FVendaEditParcelaStore);
  end;
end;

procedure TFVendaParcelasStore.ActionSalvarExecute(Sender: TObject);
var
  Result: Currency;
begin
  Result:= 0;
  ds_Parcela.DataSet.First;
  while not ds_Parcela.DataSet.Eof do
  begin
    Result:= Result + ds_Parcela.DataSet.FieldByName('VALOR').AsCurrency;
    ds_Parcela.DataSet.Next;
  end;

  if Result > ConvertCurrency(lblValorTotalTitle.Caption) then
    Mensagem('O Valor das parcelas não bate com o Valor Da Venda!',0,1)
  else
  begin
    Self.Tag:= 1;
    Close;
  end;
end;

end.
