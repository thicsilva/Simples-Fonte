unit InventarioEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ModeloStore, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.StdCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, ProdutoService, PrProdutoVO, frxClass, frxDBSet,
  System.Generics.Collections, PsEmpresaVO, PessoaRepository, PsPessoaVO,
  DadosEmpresaService, frxGradient;

type
  TFInventarioEstoque = class(TFModeloStore)
    Panel1: TPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    Panel2: TPanel;
    Image1: TImage;
    Label2: TLabel;
    edtProduto: TLabeledEdit;
    edtCodigoProduto: TLabeledEdit;
    edtCategoriaProduto: TLabeledEdit;
    edtQtDisponivel: TLabeledEdit;
    edtFornecedor: TLabeledEdit;
    Image2: TImage;
    Label3: TLabel;
    Grid: TDBGrid;
    pnlGridTitle: TPanel;
    bvBorderBottomGridTitle: TBevel;
    Label5: TLabel;
    Label4: TLabel;
    ds_Inventario: TDataSource;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label47: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    ActionEditar: TAction;
    ActionAdicionarMais: TAction;
    ActionRemoverMenos: TAction;
    ActionConfirma: TAction;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Image3: TImage;
    SpeedButton3: TSpeedButton;
    Image4: TImage;
    fdmt_Inventario: TFDMemTable;
    fdmt_InventarioID: TStringField;
    fdmt_InventarioCODIGO: TStringField;
    fdmt_InventarioPRODUTO: TStringField;
    fdmt_InventarioMEDIDA: TStringField;
    fdmt_InventarioCATEGORIA: TStringField;
    fdmt_InventarioCUSTO: TCurrencyField;
    fdmt_InventarioSALDO_ESTOQUE: TCurrencyField;
    fdmt_InventarioNOVO_SALDO: TCurrencyField;
    fdmt_InventarioDIFERENCA: TCurrencyField;
    SpeedButton4: TSpeedButton;
    Image5: TImage;
    SpeedButton5: TSpeedButton;
    Image6: TImage;
    SpeedButton6: TSpeedButton;
    Image7: TImage;
    SpeedButton7: TSpeedButton;
    Image8: TImage;
    fdmt_Apoio: TFDMemTable;
    fdmt_ApoioCODIGO: TStringField;
    fdmt_ApoioDESCRICAO: TStringField;
    fdmt_ApoioQUANTIDADE: TCurrencyField;
    frxGradientObject1: TfrxGradientObject;
    frxReport1: TfrxReport;
    procedure ActionExitExecute(Sender: TObject);
    procedure ActionEditarExecute(Sender: TObject);
    procedure ActionAdicionarMaisExecute(Sender: TObject);
    procedure ActionRemoverMenosExecute(Sender: TObject);
    procedure ActionConfirmaExecute(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure edtFornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCategoriaProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    function Parametros: String;
  public
    { Public declarations }
  end;

var
  FInventarioEstoque: TFInventarioEstoque;

implementation

{$R *.dfm}

uses CategoriaProduto, Menu, Mensagem, ProdutoStore;

procedure TFInventarioEstoque.ActionAdicionarMaisExecute(Sender: TObject);
begin
  if not fdmt_Inventario.IsEmpty then
  begin
    fdmt_Inventario.Edit;
    fdmt_InventarioNOVO_SALDO.AsCurrency:= fdmt_InventarioNOVO_SALDO.AsCurrency + 1;
    fdmt_InventarioDIFERENCA.AsCurrency:= fdmt_InventarioNOVO_SALDO.AsCurrency - fdmt_InventarioSALDO_ESTOQUE.AsCurrency;
    fdmt_Inventario.Post;
  end;
end;

procedure TFInventarioEstoque.ActionConfirmaExecute(Sender: TObject);
var
  Produto: TPrProdutoVO;
  Result: Integer;
begin
  try
    FMensagem:= TFMensagem.Create(nil);
    FMensagem.Height:= FMenu.Height;
    FMensagem.Width:= FMenu.Width;
    FMensagem.tipo:= 1;
    FMensagem.ImagemInfo:= 0;
    FMensagem.Label2.Caption:= 'Deseja realmente atualizar seu inventário?';
    FMensagem.ShowModal;
    Result:= FMensagem.Tag;
  finally
    FreeAndNil(FMensagem);
    if Result = 1 then
    begin
      fdmt_Inventario.First;
      while not fdmt_Inventario.eof do
      begin
        if fdmt_InventarioDIFERENCA.AsCurrency <> 0 then
        begin
          Produto:= TProdutoService.getById(fdmt_InventarioID.AsString);
          Produto.UpdateEstoque:= 0;
          Produto.DisponivelEstoque:= fdmt_InventarioNOVO_SALDO.AsCurrency;
          TProdutoService.save(Produto);
          FreeAndNil(Produto);
        end;

        fdmt_Inventario.Next;
      end;
    end;

    try
      Result:= 0;
      FMensagem:= TFMensagem.Create(nil);
      FMensagem.Height:= FMenu.Height;
      FMensagem.Width:= FMenu.Width;
      FMensagem.tipo:= 1;
      FMensagem.ImagemInfo:= 0;
      FMensagem.Label2.Caption:= 'Inventário atualizado com sucesso. Deseja Continuar Atualizando Inventário?';
      FMensagem.ShowModal;
      Result:= FMensagem.Tag;
    finally
      FreeAndNil(FMensagem);
      if Result = 0 then
        Close;
    end;
  end;
end;

procedure TFInventarioEstoque.ActionEditarExecute(Sender: TObject);
begin
  if  not fdmt_Inventario.IsEmpty then
  begin
    varBaseIdProduto:= fdmt_InventarioID.AsString;
    try
      FProdutoStore:= TFProdutoStore.Create(nil);
      FProdutoStore.Height:= FMenu.Height;
      FProdutoStore.Width:= FMenu.Width;
      FProdutoStore.ShowModal;
    finally
      fdmt_Inventario.Edit;
      fdmt_InventarioCODIGO.AsString:= FProdutoStore.edtCodigoProduto.Text;
      fdmt_InventarioPRODUTO.AsString:= FProdutoStore.edtNomeProduto.Text;
      fdmt_InventarioMEDIDA.AsString:= FProdutoStore.edtUnidadeMedida.Text;
      fdmt_InventarioCATEGORIA.AsString:= FProdutoStore.edtCategoriaProduto.Text;
      fdmt_InventarioCUSTO.AsCurrency:= ConvertCurrency(FProdutoStore.edtValorCusto.Text);
      fdmt_InventarioSALDO_ESTOQUE.AsCurrency:= ConvertCurrency(FProdutoStore.edtDisponivelEstoque.Text);
      fdmt_InventarioNOVO_SALDO.AsCurrency:= ConvertCurrency(FProdutoStore.edtDisponivelEstoque.Text);
      fdmt_InventarioDIFERENCA.AsCurrency:= 0;
      fdmt_Inventario.Post;
      FreeAndNil(FProdutoStore);
    end;
  end;
end;

procedure TFInventarioEstoque.ActionExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TFInventarioEstoque.ActionRemoverMenosExecute(Sender: TObject);
begin
  if not fdmt_Inventario.IsEmpty then
  begin
    fdmt_Inventario.Edit;
    fdmt_InventarioNOVO_SALDO.AsCurrency:= fdmt_InventarioNOVO_SALDO.AsCurrency - 1;
    fdmt_InventarioDIFERENCA.AsCurrency:= fdmt_InventarioNOVO_SALDO.AsCurrency - fdmt_InventarioSALDO_ESTOQUE.AsCurrency;
    fdmt_Inventario.Post;
  end;
end;

procedure TFInventarioEstoque.edtCategoriaProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_BACK then
  begin
    edtCategoriaProduto.Text:= '';
    edtCategoriaProduto.Hint:= '';
  end;
end;

procedure TFInventarioEstoque.edtFornecedorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_BACK then
  begin
    edtFornecedor.Text:= '';
    edtFornecedor.Hint:= '';
  end;
end;

procedure TFInventarioEstoque.Image1Click(Sender: TObject);
begin
  try
    FCategoriaProduto:= TFCategoriaProduto.Create(nil);
    FCategoriaProduto.pnlMain.Align:= alNone;
    FCategoriaProduto.pnlMain.Anchors:= [];
    FCategoriaProduto.AlphaBlend:= True;
    FCategoriaProduto.AlphaBlendValue:= 240;
    FCategoriaProduto.pnlMain.BevelKind:= bkSoft;
    FCategoriaProduto.Height:= FMenu.Height;
    FCategoriaProduto.Width:= FMenu.Width;
    FCategoriaProduto.Tag:= 1;
    FCategoriaProduto.ShowModal;
    edtCategoriaProduto.Hint:= FCategoriaProduto.fdmt_ModeloID.AsString;
    edtCategoriaProduto.Text:= FCategoriaProduto.fdmt_ModeloNOME.AsString;
  finally
    FreeAndNil(FCategoriaProduto);
  end;
end;

function TFInventarioEstoque.Parametros: String;
begin
  Result:= '';
  if edtProduto.Text <> '' then
    Result:= ' NOME LIKE ' + QuotedStr(edtProduto.Text+'%');

  if edtCodigoProduto.Text <> '' then
  begin
    if Result <> '' then
      Result:= Result + ' AND CODIGO LIKE ' + QuotedStr(edtCodigoProduto.Text+'%')
    else
      Result:= ' CODIGO LIKE ' + QuotedStr(edtCodigoProduto.Text+'%')
  end;

  if edtCategoriaProduto.Text <> '' then
  begin
    if Result <> '' then
      Result:= Result + ' AND ID_CATEGORIA = ' + QuotedStr(edtCategoriaProduto.Hint)
    else
      Result:= ' ID_CATEGORIA = ' + QuotedStr(edtCategoriaProduto.Hint);
  end;

  if edtFornecedor.Text <> '' then
  begin
    if Result <> '' then
      Result:= Result + ' AND ID_PESSOA = ' + QuotedStr(edtFornecedor.Hint)
    else
      Result:= ' ID_PESSOA = ' + QuotedStr(edtFornecedor.Hint);
  end;

  if edtQtDisponivel.Text <> '' then
  begin
    if Result <> '' then
      Result:= Result + ' AND ESTOQUE < ' + FloatToStr(ConvertCurrency(edtQtDisponivel.Text))
    else
      Result:= ' ESTOQUE < ' + FloatToStr(ConvertCurrency(edtQtDisponivel.Text));
  end;

end;

procedure TFInventarioEstoque.SpeedButton2Click(Sender: TObject);
var
  frxReport: TfrxReport;
  frxDBDataSet: TfrxDBDataset;
  ObjPessoa: TPsPessoaVO;
  ObjEmpresa: TPsEmpresaVO;
begin
  ObjPessoa:= TPessoaRepository.getByIdEmpresa;
  ObjEmpresa:= TDadosEmpresaService.getByIdPessoa(ObjPessoa.Id);

  fdmt_Apoio.Open;
  TProdutoService.indexApoioInventario(fdmt_Apoio,'');

  frxDBDataset:= TfrxDBDataset.Create(nil);
  frxDbDataset.DataSet:= fdmt_Apoio;
  frxDBDataset.UserName:= 'frxDBDataset';
  frxDBDataset.Name:= 'frxDBDataset';

  frxReport:= TfrxReport.Create(nil);
  frxReport.DataSets.Add(frxDBDataset);
  frxReport.LoadFromFile('..\relatorios\ApoioInventarioEstoque.fr3');
  FrxReport.Variables['EMPRESA'] := QuotedStr(Trim(ObjEmpresa.NomeFantasia));
  FrxReport.Variables['LOGO'] := QuotedStr(Trim(ObjEmpresa.Logo));
  frxReport.ShowReport;

  FreeAndNil(ObjPessoa);
  FreeAndNil(ObjEmpresa);
end;

procedure TFInventarioEstoque.SpeedButton3Click(Sender: TObject);
begin
  fdmt_Inventario.Open;
  TProdutoService.indexInventario(fdmt_Inventario,Parametros);
  Grid.SetFocus;
end;

end.
