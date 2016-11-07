unit Estoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Modelo, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.Imaging.pngimage, ProdutoService, Vcl.ComCtrls,
  EstoqueService;

type
  TFEstoque = class(TFModelo)
    spbRealizarInventario: TSpeedButton;
    ActionRealizarInventario: TAction;
    ActionHistoricoMovimentacoes: TAction;
    spbHistoricoMovimentacoes: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    fdmt_ModeloCODIGO: TStringField;
    fdmt_ModeloPRODUTO: TStringField;
    fdmt_ModeloUNIDADE_MEDIDA: TStringField;
    fdmt_ModeloCATEGORIA: TStringField;
    fdmt_ModeloVALOR_CUSTO: TCurrencyField;
    fdmt_ModeloVALOR_VENDA: TCurrencyField;
    fdmt_ModeloQT_ESTOQUE: TCurrencyField;
    fdmt_ModeloCUSTO_TOTAL: TCurrencyField;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    pnlFooter: TPanel;
    Label9: TLabel;
    Panel2: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label10: TLabel;
    Panel3: TPanel;
    lblQuantidadeTotalEstoque: TLabel;
    lblCustoTotalEstoque: TLabel;
    Panel4: TPanel;
    Panel5: TPanel;
    pnlHistorico: TPanel;
    pnlHeaderHistorico: TPanel;
    Bevel3: TBevel;
    Image3: TImage;
    SpeedButton6: TSpeedButton;
    ActionVoltarGrid: TAction;
    pnlGridTitleHistorico: TPanel;
    Bevel4: TBevel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    pnlFooterHistorico: TPanel;
    Label19: TLabel;
    Bevel5: TBevel;
    Panel8: TPanel;
    lblSaldoFinal: TLabel;
    Panel9: TPanel;
    GridHistorico: TDBGrid;
    fdmt_Historico: TFDMemTable;
    ds_Estoque: TDataSource;
    fdmt_HistoricoDATA_HORA: TDateTimeField;
    fdmt_HistoricoMOVIMENTACAO: TStringField;
    fdmt_HistoricoPESSOA: TStringField;
    fdmt_HistoricoVALOR_UNITARIO: TCurrencyField;
    fdmt_HistoricoVALOR_CUSTO: TCurrencyField;
    fdmt_HistoricoQT_MOVIMENTADA: TCurrencyField;
    fdmt_HistoricoSALDO_ESTOQUE: TCurrencyField;
    edtDataInicio: TDateTimePicker;
    Label18: TLabel;
    edtDataFinal: TDateTimePicker;
    Label20: TLabel;
    SpeedButton1: TSpeedButton;
    Image1: TImage;
    ActionPesquisar: TAction;
    procedure ActionRealizarInventarioExecute(Sender: TObject);
    procedure ActionHistoricoMovimentacoesExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
    procedure ActionVoltarGridExecute(Sender: TObject);
    procedure ActionPesquisarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEstoque: TFEstoque;

implementation

{$R *.dfm}

uses InventarioEstoque;

procedure TFEstoque.ActionHistoricoMovimentacoesExecute(Sender: TObject);
begin
  if not fdmt_Modelo.IsEmpty then
  begin
    pnlHistorico.BringToFront;
    lblSaldoFinal.Caption:= FloatToStrF(fdmt_ModeloQT_ESTOQUE.AsCurrency,ffNumber,12,0);
    fdmt_Historico.Open;
    edtDataInicio.Date:= now;
    edtDataFinal.Date:= now;
    TEstoqueService.index(fdmt_Historico,fdmt_ModeloID.AsString,edtDataInicio.DateTime,edtDataFinal.DateTime);
  end;
end;

procedure TFEstoque.ActionPesquisarExecute(Sender: TObject);
begin
  fdmt_Historico.Open;
  TEstoqueService.index(fdmt_Historico,fdmt_ModeloID.AsString,edtDataInicio.Date,edtDataFinal.Date);
end;

procedure TFEstoque.ActionRealizarInventarioExecute(Sender: TObject);
begin
  OpenForm(FInventarioEstoque,TFInventarioEstoque);
  fdmt_Modelo.Open;
  TProdutoService.indexEstoque(fdmt_Modelo,'',lblCustoTotalEstoque,lblQuantidadeTotalEstoque);
end;

procedure TFEstoque.ActionVoltarGridExecute(Sender: TObject);
begin
  pnlMain.BringToFront;
end;

procedure TFEstoque.edtPesquisaChange(Sender: TObject);
begin
  if Trim(edtPesquisa.Text) <> EmptyStr then
    TProdutoService.indexEstoque(fdmt_Modelo,Trim(edtPesquisa.Text),lblCustoTotalEstoque,lblQuantidadeTotalEstoque);
end;

procedure TFEstoque.FormCreate(Sender: TObject);
begin
  pnlMain.BringToFront;
  fdmt_Modelo.Open;
  TProdutoService.indexEstoque(fdmt_Modelo,'',lblCustoTotalEstoque,lblQuantidadeTotalEstoque);
end;

end.
