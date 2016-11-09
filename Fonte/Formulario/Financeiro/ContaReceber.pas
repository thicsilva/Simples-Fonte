unit ContaReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Modelo, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.ComCtrls, CrediarioService, frxClass,
  frxDBSet, PsPessoaVO, PsEmpresaVO, PessoaRepository, DadosEmpresaService;

type
  TFContaReceber = class(TFModelo)
    Label12: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    pnlBottom: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    lblValorRecebidas: TLabel;
    Panel2: TPanel;
    lblValorAreceber: TLabel;
    Panel3: TPanel;
    lblValorVencidas: TLabel;
    Panel4: TPanel;
    lblValorRecebimentos: TLabel;
    Panel5: TPanel;
    lblNLancamentos: TLabel;
    Panel6: TPanel;
    lblNLancamentosSelecionados: TLabel;
    Panel7: TPanel;
    lblTotalLancamentosSelecionados: TLabel;
    pnlPesquisa: TPanel;
    Bevel2: TBevel;
    Bevel1: TBevel;
    Image1: TImage;
    Label1: TLabel;
    lblTotalPeriodo: TLabel;
    Label2: TLabel;
    imgSearchCliente: TImage;
    edtPeriodoInicio: TDateTimePicker;
    edtPeriodoFinal: TDateTimePicker;
    fdmt_ModeloVENCIMENTO: TDateField;
    fdmt_ModeloDESCRICAO: TStringField;
    fdmt_ModeloFORNECEDOR: TStringField;
    fdmt_ModeloVALOR: TCurrencyField;
    fdmt_ModeloSTATUS: TIntegerField;
    fdmt_ModeloSTATUS_IMG: TIntegerField;
    fdmt_ModeloLANCAMENTO: TStringField;
    SpeedButton1: TSpeedButton;
    Image2: TImage;
    ActionImprimir: TAction;
    frxReport1: TfrxReport;
    fdmt_ModeloID_VENDA: TStringField;
    procedure ActionCadastrarExecute(Sender: TObject);
    procedure ActionExcluirExecute(Sender: TObject);
    procedure ActionAlrerarExecute(Sender: TObject);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure imgMark0Click(Sender: TObject);
    procedure imgMark1Click(Sender: TObject);
    procedure imgSearchClienteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionImprimirExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContaReceber: TFContaReceber;

implementation

{$R *.dfm}

uses Pagamento, Menu, Mensagem;

procedure TFContaReceber.ActionAlrerarExecute(Sender: TObject);
begin
  varBaseIdPagamento:= fdmt_ModeloID.AsString;
  try
    FPagamento:= TFPagamento.Create(nil);
    FPagamento.Height:= FMenu.Height;
    FPagamento.Width:= FMenu.Width;
    FPagamento.lblTituloForm.Hint:= 'CONTA A RECEBER';
    FPagamento.ShowModal;
  finally
    FreeAndNil(FPagamento);
  end;
  fdmt_Modelo.Open;
  fdmt_Modelo.Open;
  TCrediarioService.indexContaReceber(fdmt_Modelo,lblValorRecebidas,lblValorAreceber,
  lblValorVencidas,lblValorRecebimentos,lblNLancamentos,'','0',now,now);
end;

procedure TFContaReceber.ActionCadastrarExecute(Sender: TObject);
begin
  varBaseIdPagamento:= EmptyStr;
  try
    FPagamento:= TFPagamento.Create(nil);
    FPagamento.Height:= FMenu.Height;
    FPagamento.Width:= FMenu.Width;
    FPagamento.lblTituloForm.Hint:= 'CONTA A RECEBER';
    FPagamento.ShowModal;
  finally
    FreeAndNil(FPagamento);
  end;
  fdmt_Modelo.Open;
  TCrediarioService.indexContaReceber(fdmt_Modelo,lblValorRecebidas,lblValorAreceber,
  lblValorVencidas,lblValorRecebimentos,lblNLancamentos,'','0',now,now);
end;

procedure TFContaReceber.ActionExcluirExecute(Sender: TObject);
begin
  if not fdmt_Modelo.IsEmpty then
  begin
    if Trim(fdmt_ModeloID_VENDA.AsString) = '' then
    begin
      try
        FMensagem:= TFMensagem.Create(nil);
        FMensagem.Height:= FMenu.Height;
        FMensagem.Width:= FMenu.Width;
        FMensagem.tipo:= 1;
        FMensagem.ImagemInfo:= 0;
        FMensagem.Label2.Caption:= 'Deseja realmente excluir todos os registros selecionados?';
        FMensagem.ShowModal;
        if FMensagem.Tag = 1 then
        begin
          fdmt_Modelo.First;
          while not fdmt_Modelo.Eof do
          begin
            if fdmt_ModeloMARK.AsInteger = 1 then
            begin
              if TCrediarioService.destroyer(fdmt_ModeloID.AsString) then
                fdmt_Modelo.Delete;
            end;

            fdmt_Modelo.Next;
          end;
        end;
      finally
        FreeAndNil(FMensagem);
        fdmt_Modelo.First;
        TCrediarioService.indexContaReceber(fdmt_Modelo,lblValorRecebidas,lblValorAreceber,
        lblValorVencidas,lblValorRecebimentos,lblNLancamentos,'','0',now,now);
      end;
    end
    else
      Mensagem('Não é possivel excluir está parcela, pois a mesma está ligada a uma Venda!',0,1);
  end;
end;

procedure TFContaReceber.ActionImprimirExecute(Sender: TObject);
var
  frxReport: TfrxReport;
  frxDBDataSet: TfrxDBDataset;
  ObjPessoa: TPsPessoaVO;
  ObjEmpresa: TPsEmpresaVO;
begin
  try
    ObjPessoa:= TPessoaRepository.getByIdEmpresa;
    ObjEmpresa:= TDadosEmpresaService.getByIdPessoa(ObjPessoa.Id);

    frxDBDataset:= TfrxDBDataset.Create(nil);
    frxDbDataset.DataSet:= fdmt_Modelo;
    frxDBDataset.UserName:= 'frxDBDataset';
    frxDBDataset.Name:= 'frxDBDataset';

    frxReport:= TfrxReport.Create(nil);
    frxReport.DataSets.Add(frxDBDataset);
    frxReport.LoadFromFile('..\relatorios\ContasAReceber.fr3');
    FrxReport.Variables['EMPRESA'] := QuotedStr(Trim(ObjEmpresa.NomeFantasia));
    FrxReport.Variables['LOGO'] := QuotedStr(Trim(ObjEmpresa.Logo));
    FrxReport.Variables['USUARIO'] := QuotedStr(Trim(varBaseNomeUsuarioLogado));
    FrxReport.Variables['RECEBIDAS'] := QuotedStr(Trim(lblValorRecebidas.Caption));
    FrxReport.Variables['ARECEBER'] := QuotedStr(Trim(lblValorAreceber.Caption));
    FrxReport.Variables['VENCIDAS'] := QuotedStr(Trim(lblValorVencidas.Caption));
    FrxReport.Variables['TOTAL_RECEBIMENTO'] := QuotedStr(Trim(lblValorRecebimentos.Caption));
    FrxReport.Variables['N_LANCAMENTOS'] := QuotedStr(Trim(lblNLancamentos.Caption));
    FrxReport.Variables['N_LANCAMENTOS_SELECIONADOS'] := QuotedStr(Trim(lblNLancamentosSelecionados.Caption));
    FrxReport.Variables['T_LANCAMENTO_SELECIONADO'] := QuotedStr(Trim(lblTotalLancamentosSelecionados.Caption));
    FrxReport.Variables['PERIODO'] := QuotedStr(Trim(lblTotalPeriodo.Caption));
    frxReport.ShowReport;
  finally
    FreeAndNil(ObjPessoa);
    FreeAndNil(ObjEmpresa);
  end;
end;

procedure TFContaReceber.FormCreate(Sender: TObject);
begin
  edtPeriodoInicio.Date:= Now - 30;
  edtPeriodoFinal.Date:= Now;
  lblTotalPeriodo.Caption:= 'Total do período ('+FormatDateTime('dd mmm yyyy',edtPeriodoInicio.Date)+' - ' +
  FormatDateTime('dd mmm yyyy',edtPeriodoFinal.Date) + ')';
  fdmt_Modelo.Open;
  TCrediarioService.indexContaReceber(fdmt_Modelo,lblValorRecebidas,lblValorAreceber,
  lblValorVencidas,lblValorRecebimentos,lblNLancamentos,'','0',now,now);
end;

procedure TFContaReceber.GridDrawColumnCell(Sender: TObject; const Rect: TRect;
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

    if Column.FieldName = 'MARK' then
    begin
      Grid.Canvas.FillRect(Rect);
      case fdmt_Modelo.FieldByName('MARK').AsInteger of
        0:ImageList.Draw(Grid.Canvas,Rect.Left + 7, Rect.Top + 1, 7);
        1:ImageList.Draw(Grid.Canvas,Rect.Left + 7, Rect.Top + 1, 6);
      end;
    end;
  end;
end;

procedure TFContaReceber.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
  begin
    if fdmt_ModeloMARK.AsInteger = 0 then
    begin
      lblTotalLancamentosSelecionados.Caption:=
      FloatToStrF(ConvertCurrency(lblTotalLancamentosSelecionados.Caption) - fdmt_ModeloVALOR.AsCurrency,ffNumber,12,2);
      lblNLancamentosSelecionados.Caption:= FloatToStrF(ConvertCurrency(lblNLancamentosSelecionados.Caption) - 1,ffNumber,12,1);
    end
    else
    if fdmt_ModeloMARK.AsInteger = 1 then
    begin
      lblTotalLancamentosSelecionados.Caption:=
      FloatToStrF(ConvertCurrency(lblTotalLancamentosSelecionados.Caption) + fdmt_ModeloVALOR.AsCurrency,ffNumber,12,2);
      lblNLancamentosSelecionados.Caption:= FloatToStrF(ConvertCurrency(lblNLancamentosSelecionados.Caption) + 1,ffNumber,12,1);
    end;
  end;
end;

procedure TFContaReceber.imgMark0Click(Sender: TObject);
begin
  imgMark1.BringToFront;
  fdmt_Modelo.First;
  lblTotalLancamentosSelecionados.Caption:= '0,00';
  lblNLancamentosSelecionados.Caption:= '0';
  while not fdmt_Modelo.Eof do
  begin
    fdmt_Modelo.Edit;
    fdmt_ModeloMARK.AsInteger:= 1;
    lblTotalLancamentosSelecionados.Caption:=
    FloatToStrF(ConvertCurrency(lblTotalLancamentosSelecionados.Caption) + fdmt_ModeloVALOR.AsCurrency,ffNumber,12,2);
    lblNLancamentosSelecionados.Caption:= FloatToStrF(ConvertCurrency(lblNLancamentosSelecionados.Caption) + 1,ffNumber,12,1);
    fdmt_Modelo.Post;
    fdmt_Modelo.Next;
  end;
  fdmt_Modelo.First;
end;

procedure TFContaReceber.imgMark1Click(Sender: TObject);
begin
  imgMark0.BringToFront;
  fdmt_Modelo.First;
  while not fdmt_Modelo.Eof do
  begin
    fdmt_Modelo.Edit;
    fdmt_ModeloMARK.AsInteger:= 0;
    lblTotalLancamentosSelecionados.Caption:= '0,00';
    lblNLancamentosSelecionados.Caption:= '0';
    fdmt_Modelo.Post;
    fdmt_Modelo.Next;
  end;
  fdmt_Modelo.First;
end;

procedure TFContaReceber.imgSearchClienteClick(Sender: TObject);
begin
  lblTotalPeriodo.Caption:= 'Total do período ('+FormatDateTime('dd mmm yyyy',edtPeriodoInicio.Date)+' - ' +
  FormatDateTime('dd mmm yyyy',edtPeriodoFinal.Date)+ ')';
  TCrediarioService.indexContaReceber(fdmt_Modelo,lblValorRecebidas,lblValorAreceber,
  lblValorVencidas,lblValorRecebimentos,lblNLancamentos,'','1',edtPeriodoInicio.Date,edtPeriodoFinal.Date);
end;

end.
