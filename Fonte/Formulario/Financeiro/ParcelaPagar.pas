unit ParcelaPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Base, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.WinXCtrls,
  CrediarioService, System.ImageList, Vcl.ImgList, System.Actions, Vcl.ActnList,
  Vcl.Imaging.pngimage, Vcl.Buttons;

type
  TFParcelaPagar = class(TFBase)
    pnlHeader: TPanel;
    bvBorderBottomHeader: TBevel;
    pnlEmAtraso: TPanel;
    lblValorTotalEmAtraso: TLabel;
    Bevel1: TBevel;
    lblTotalEmAtraso: TLabel;
    pnlAPagar: TPanel;
    lblValorTotalAPagar: TLabel;
    lblTotalAPagar: TLabel;
    Bevel2: TBevel;
    pnlPago: TPanel;
    lblValorTotalPago: TLabel;
    lblTotalPago: TLabel;
    Bevel3: TBevel;
    pnlTotal: TPanel;
    lblValorTotal: TLabel;
    lblTotal: TLabel;
    pnlGridTitle: TPanel;
    bvBorderBottomGridTitle: TBevel;
    Grid: TDBGrid;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    ds_modelo: TDataSource;
    fdmt_Modelo: TFDMemTable;
    fdmt_ModeloID: TStringField;
    fdmt_ModeloVENCIMENTO: TDateField;
    fdmt_ModeloCOMPRA: TStringField;
    fdmt_ModeloFORNECEDOR: TStringField;
    fdmt_ModeloPARCELA: TStringField;
    fdmt_ModeloVALOR: TCurrencyField;
    fdmt_ModeloRECEBIDO: TCurrencyField;
    Panel5: TPanel;
    Bevel4: TBevel;
    edtPesquisa: TSearchBox;
    fdmt_ModeloSTATUS: TIntegerField;
    fdmt_ModeloSTATUS_IMG: TIntegerField;
    ImageList: TImageList;
    spbNovo: TSpeedButton;
    imgBorderGreenCadastro: TImage;
    Action: TActionList;
    ActionReceber: TAction;
    procedure FormCreate(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ActionReceberExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FParcelaPagar: TFParcelaPagar;

implementation

{$R *.dfm}

uses Menu, Pagamento;

procedure TFParcelaPagar.ActionReceberExecute(Sender: TObject);
begin
  varBaseIdPagamento:= fdmt_ModeloID.AsString;
  try
    FPagamento:= TFPagamento.Create(nil);
    FPagamento.Height:= FMenu.Height;
    FPagamento.Width:= FMenu.Width;
    FPagamento.lblTituloForm.Hint:= 'CONTA A PAGAR';
    FPagamento.ShowModal;
  finally
    FreeAndNil(FPagamento);
  end;
  fdmt_Modelo.Open;
  TCrediarioService.indexParcelaPagar(fdmt_Modelo,lblTotalEmAtraso,
  lblValorTotalEmAtraso,lblTotalAPagar,lblValorTotalAPagar,lblTotalPago,lblValorTotalPago,
  lblTotal,lblValorTotal,'');
end;

procedure TFParcelaPagar.edtPesquisaChange(Sender: TObject);
begin
  if Trim(edtPesquisa.Text) <> EmptyStr then
  begin
    TCrediarioService.indexParcelaPagar(fdmt_Modelo,lblTotalEmAtraso,
    lblValorTotalEmAtraso,lblTotalAPagar,lblValorTotalAPagar,lblTotalPago,lblValorTotalPago,
    lblTotal,lblValorTotal,Trim(edtPesquisa.Text));
  end;
end;

procedure TFParcelaPagar.FormCreate(Sender: TObject);
var
  Tamanho: Extended;
begin
  Tamanho:= (FMenu.pnlMain.Width / 4);
  pnlEmAtraso.Width:= Round(Tamanho);
  pnlAPagar.Width:= Round(Tamanho);
  pnlPago.Width:= Round(Tamanho);
  pnlTotal.Width:= Round(Tamanho);

  fdmt_Modelo.Open;
  TCrediarioService.indexParcelaPagar(fdmt_Modelo,lblTotalEmAtraso,
  lblValorTotalEmAtraso,lblTotalAPagar,lblValorTotalAPagar,lblTotalPago,lblValorTotalPago,
  lblTotal,lblValorTotal,'');
end;

procedure TFParcelaPagar.GridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not TDBGrid(Sender).DataSource.DataSet.IsEmpty then
  begin
    TDBGrid(Sender).Canvas.Brush.Color:= clBtnFace;
    TDBGrid(Sender).Canvas.Font.Style:= [];
    TDBGrid(Sender).Canvas.Font.Color:= clBlack;


    If gdselected in state then
    begin
      TDBGrid(Sender).Canvas.Brush.Color:= $00FFCF9F;
      TDBGrid(Sender).Canvas.Font.Style:= [];
      TDBGrid(Sender).Canvas.Font.Color:= clBlack;
    end;
  end;

  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).columns[datacol].Field, State);

  if not fdmt_Modelo.IsEmpty then
  begin
    if Column.FieldName = 'STATUS_IMG' then
    begin
      Grid.Canvas.FillRect(Rect);
      case fdmt_Modelo.FieldByName('STATUS').AsInteger of
        0:ImageList.Draw(Grid.Canvas,Rect.Left + 7, Rect.Top + 1, 0);
        1:ImageList.Draw(Grid.Canvas,Rect.Left + 7, Rect.Top + 1, 1);
        2:ImageList.Draw(Grid.Canvas,Rect.Left + 7, Rect.Top + 1, 2);
        3:ImageList.Draw(Grid.Canvas,Rect.Left + 7, Rect.Top + 1, 3);
        4:ImageList.Draw(Grid.Canvas,Rect.Left + 7, Rect.Top + 1, 4);
        5:ImageList.Draw(Grid.Canvas,Rect.Left + 7, Rect.Top + 1, 5);
      end;
    end;
  end;
end;

end.
