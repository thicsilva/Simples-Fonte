{******************************************************************************}
{ Projeto: Simples Sistema                                                     }
{  Um sistema como o nome mesmo já dis Simples mas que possa ser utilizado para}
{ qualquer ramo, com diferentes versões. Objetivo de obter melhor resultado a  }
{ nossos clientes.                                                             }
{                                                                              }
{ Direitos Autorais Reservados (c) 2016 Lemes Tecnologia é Arte!               }
{                                                                              }
{ Colaboradores nesse arquivo: Thiago Ribeiro Lemes de Brito                   }
{                                                                              }
{ Este software possui registro INPI de uso comercial. Utiliza-lo sem licença  }
{ implica em ações legais sob lei Nº 9.610, de 19 de fevereiro de 1998.        }
{                                                                              }
{                           Lemes Tecnologia é Arte!                           }
{                        lemestecart@lemestecart.com.br                        }
{               Rua Juares Klasner, 21 - Cotriguaçu - MT - 78330-000           }
{                                                                              }
{******************************************************************************}

{*******************************************************************************
|* Historico                                                                  |*
|*                                                                            |*
|* 07/10/2016: Primeira Versao                                                |*
|*   Thiago Ribeiro Lemes de Brito                                            |*
*******************************************************************************}
unit Menu;

interface

uses
  //Uses da Interface
  {$REGION}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Base, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, Vcl.Menus, Vcl.AppEvnts, Vcl.themes, Vcl.Styles,
  System.ImageList, Vcl.ImgList, PsPessoaVO, PessoaRepository, PsJuridicaVO,
  PessoaJuridicaService, DadosEmpresaService, PsEmpresaVO, Biblioteca, DateUtils;
  {$ENDREGION}

type
  TFMenu = class(TFBase)
  //Componetes do Form
  {$REGION}
    pnlHeader: TPanel;
    imgLogoSistema: TImage;
    lblNomeEmpresa: TLabel;
    lblVisaoGeral: TLabel;
    lblVendas: TLabel;
    lblFinanceiro: TLabel;
    lblCompras: TLabel;
    lblRelatorio: TLabel;
    popVendas: TPopupMenu;
    OrdensdeServio1: TMenuItem;
    N1: TMenuItem;
    Contratos1: TMenuItem;
    N2: TMenuItem;
    VendaseOramentos1: TMenuItem;
    N3: TMenuItem;
    ParcelasaReceber1: TMenuItem;
    N4: TMenuItem;
    NotasFiscaisdeProduto1: TMenuItem;
    N5: TMenuItem;
    NotasFiscaisdeServio1: TMenuItem;
    CONTROLE1: TMenuItem;
    N6: TMenuItem;
    MOVIMENTAO1: TMenuItem;
    Clientes1: TMenuItem;
    N7: TMenuItem;
    Produtos1: TMenuItem;
    N8: TMenuItem;
    Servios1: TMenuItem;
    N9: TMenuItem;
    Estoque1: TMenuItem;
    pnlAside: TPanel;
    pnlMain: TPanel;
    imgConfig: TImage;
    Bevel1: TBevel;
    imgUser: TImage;
    Bevel2: TBevel;
    Label1: TLabel;
    lblTempoLiberacao: TLabel;
    Label3: TLabel;
    popUser: TPopupMenu;
    mnItemNomeUsuario: TMenuItem;
    N10: TMenuItem;
    MeusDados1: TMenuItem;
    N11: TMenuItem;
    MeuPlano1: TMenuItem;
    N12: TMenuItem;
    SairdoSistema1: TMenuItem;
    popConfig: TPopupMenu;
    Marcadaempresa1: TMenuItem;
    N13: TMenuItem;
    Dadosdaempresa1: TMenuItem;
    N14: TMenuItem;
    Certificadodigital1: TMenuItem;
    N15: TMenuItem;
    Configuraesgerais1: TMenuItem;
    N16: TMenuItem;
    MeuContador1: TMenuItem;
    pnlFooter: TPanel;
    cbxStyle: TComboBox;
    pnlOrdemServicoHelp: TPanel;
    Label4: TLabel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Label5: TLabel;
    Image1: TImage;
    Label6: TLabel;
    Label7: TLabel;
    Image2: TImage;
    Image3: TImage;
    Label8: TLabel;
    Label9: TLabel;
    Image4: TImage;
    img16: TImageList;
    pnlClienteHelp: TPanel;
    Label10: TLabel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Label11: TLabel;
    Image5: TImage;
    Label12: TLabel;
    Label13: TLabel;
    Image6: TImage;
    Image7: TImage;
    Label14: TLabel;
    Label15: TLabel;
    Image8: TImage;
    Usurios1: TMenuItem;
    N17: TMenuItem;
    CategoriadeProdutos1: TMenuItem;
    N18: TMenuItem;
    CentrodeCusto1: TMenuItem;
    N19: TMenuItem;
    Faturamento1: TMenuItem;
    N20: TMenuItem;
    Sistema1: TMenuItem;
    pnlCentroCustoHelp: TPanel;
    Label16: TLabel;
    Bevel7: TBevel;
    Bevel8: TBevel;
    Label17: TLabel;
    Image9: TImage;
    Label18: TLabel;
    Label19: TLabel;
    Image10: TImage;
    Image11: TImage;
    Label20: TLabel;
    Label21: TLabel;
    Image12: TImage;
    pnlCategoriaProdutoHelp: TPanel;
    Label22: TLabel;
    Bevel9: TBevel;
    Bevel10: TBevel;
    Label23: TLabel;
    Image13: TImage;
    Label24: TLabel;
    Label25: TLabel;
    Image14: TImage;
    Image15: TImage;
    Label26: TLabel;
    Label27: TLabel;
    Image16: TImage;
    pnlProdutoHelp: TPanel;
    Label28: TLabel;
    Bevel11: TBevel;
    Bevel12: TBevel;
    Label29: TLabel;
    Image17: TImage;
    Label30: TLabel;
    Label31: TLabel;
    Image18: TImage;
    Image19: TImage;
    Label32: TLabel;
    Label33: TLabel;
    Image20: TImage;
    pnlServicoHelp: TPanel;
    Label34: TLabel;
    Bevel13: TBevel;
    Bevel14: TBevel;
    Label35: TLabel;
    Image21: TImage;
    Label36: TLabel;
    Label37: TLabel;
    Image22: TImage;
    Image23: TImage;
    Label38: TLabel;
    Label39: TLabel;
    Image24: TImage;
    pnlUsuarioHelp: TPanel;
    Label40: TLabel;
    Bevel15: TBevel;
    Bevel16: TBevel;
    Label41: TLabel;
    Image25: TImage;
    Label42: TLabel;
    Label43: TLabel;
    Image26: TImage;
    Image27: TImage;
    Label45: TLabel;
    Image28: TImage;
    Label44: TLabel;
    pnlEstoqueHelp: TPanel;
    Label46: TLabel;
    Bevel17: TBevel;
    Bevel18: TBevel;
    Label47: TLabel;
    Image29: TImage;
    Label48: TLabel;
    Label49: TLabel;
    Image30: TImage;
    Image31: TImage;
    Label50: TLabel;
    Image32: TImage;
    Label51: TLabel;
    popCompras: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    N21: TMenuItem;
    Estoque2: TMenuItem;
    pnlFornecedorHelp: TPanel;
    Label52: TLabel;
    Bevel19: TBevel;
    Bevel20: TBevel;
    Label53: TLabel;
    Image33: TImage;
    Label54: TLabel;
    Label55: TLabel;
    Image34: TImage;
    Image35: TImage;
    Label56: TLabel;
    Image36: TImage;
    Label57: TLabel;
    pnlTransportadoraHelp: TPanel;
    Label58: TLabel;
    Bevel21: TBevel;
    Bevel22: TBevel;
    Label59: TLabel;
    Image37: TImage;
    Label60: TLabel;
    Label61: TLabel;
    Image38: TImage;
    Image39: TImage;
    Label62: TLabel;
    Image40: TImage;
    Label63: TLabel;
    popFinanceiro: TPopupMenu;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem28: TMenuItem;
    N22: TMenuItem;
    ContasaPagar1: TMenuItem;
    N23: TMenuItem;
    ContasaReceber1: TMenuItem;
    pnlCompraHelp: TPanel;
    Label64: TLabel;
    Bevel23: TBevel;
    Bevel24: TBevel;
    Label65: TLabel;
    Image41: TImage;
    Label66: TLabel;
    Label67: TLabel;
    Image42: TImage;
    Image43: TImage;
    Label68: TLabel;
    Image44: TImage;
    Label69: TLabel;
  {$ENDREGION}

  //Procedimentos feitos em cima dos componentes do form
  {$REGION}
    procedure lblVendasClick(Sender: TObject);
    procedure imgUserClick(Sender: TObject);
    procedure imgConfigClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SairdoSistema1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure cbxStyleChange(Sender: TObject);
    procedure OrdensdeServio1Click(Sender: TObject);
    procedure CategoriadeProdutos1Click(Sender: TObject);
    procedure CentrodeCusto1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Servios1Click(Sender: TObject);
    procedure Usurios1Click(Sender: TObject);
    procedure Estoque1Click(Sender: TObject);
    procedure lblComprasClick(Sender: TObject);
    procedure MenuItem15Click(Sender: TObject);
    procedure MenuItem21Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem28Click(Sender: TObject);
    procedure lblFinanceiroClick(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure VendaseOramentos1Click(Sender: TObject);
    procedure Sistema1Click(Sender: TObject);
    procedure Dadosdaempresa1Click(Sender: TObject);
    procedure Marcadaempresa1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ContasaPagar1Click(Sender: TObject);
    procedure ContasaReceber1Click(Sender: TObject);
  {$ENDREGION}

  private
    { Private declarations }
  public
    { Public declarations }
    FormPrincipal: TForm;
    procedure LoadStyles;
    procedure OpenFormMain(Form: TForm; FormClass: TFormClass);

    function VerificaEmpresa: Integer;   // 0: Não Exite, 1: Tempo Esgotado, 2: Existe Normal
  end;

var
  FMenu: TFMenu;

implementation

{$R *.dfm}

uses Modelo, Cliente, OS, CategoriaProduto, CentroCusto, Produto, Servico,
  Usuario, Login, Estoque, Fornecedor, Transportadora, Compra, PlanoConta,
  ParcelaPagar, Banco, Venda, Sistema, DadosEmpresa, MarcaEmpresa,
  CadastroEmpresa, ContaPagar, ContaReceber;

procedure TFMenu.LoadStyles;
var
  Styles: String;
begin
  cbxStyle.Items.BeginUpdate;
  try
    cbxStyle.Items.Clear;

    for Styles in TStyleManager.StyleNames do
      cbxStyle.Items.Add(Styles);

    cbxStyle.Sorted:= True;
    cbxStyle.ItemIndex:= cbxStyle.Items.IndexOf(TStyleManager.ActiveStyle.Name);
  finally
    cbxStyle.items.EndUpdate;
  end;
end;

procedure TFMenu.Marcadaempresa1Click(Sender: TObject);
begin
  OpenForm(FMarcaEmpresa,TFMarcaEmpresa);
end;

procedure TFMenu.MenuItem15Click(Sender: TObject);
begin
  pnlFornecedorHelp.BringToFront;
  OpenFormMain(FFornecedor,TFFornecedor);
end;

procedure TFMenu.MenuItem21Click(Sender: TObject);
begin
  pnlTransportadoraHelp.BringToFront;
  OpenFormMain(FTransportadora,TFTransportadora);
end;

procedure TFMenu.MenuItem28Click(Sender: TObject);
begin
  OpenFormMain(FPlanoConta,TFPlanoConta);
end;

procedure TFMenu.MenuItem2Click(Sender: TObject);
begin
  OpenFormMain(FCompra,TFCompra);
end;

procedure TFMenu.MenuItem4Click(Sender: TObject);
begin
  OpenFormMain(FParcelaPagar,TFParcelaPagar);
end;

procedure TFMenu.MenuItem6Click(Sender: TObject);
begin
  OpenFormMain(FBanco,TFBanco);
end;

procedure TFMenu.OpenFormMain(Form: TForm; FormClass: TFormClass);
begin
  if Assigned(FormPrincipal) then
    FreeAndNil(FormPrincipal);

  Form:= FormClass.Create(pnlMain);
  Form.Parent:= pnlMain;
  Form.Align:= alClient;
  Form.Show;
  FormPrincipal:= Form;
end;

procedure TFMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caNone;
  if MessageDlg('Deseja Realmente Sair do Sistema?',mtInformation,mbYesNo,1) = mrYes then
    Action:= caFree;
end;

procedure TFMenu.FormCreate(Sender: TObject);
var
  StatusEmpresa: Integer;
begin
  StatusEmpresa:= VerificaEmpresa;
  if StatusEmpresa = 2  then
  begin
    try
      FLogin:= TFLogin.Create(nil);
      FLogin.pnlChaveSerial.SendToBack;
      if FLogin.ShowModal <> mrOk then
        Application.Terminate
      else
      begin
        mnItemNomeUsuario.Caption:= Copy(varBaseNomeUsuarioLogado,0,1) +
        LowerCase(Copy(varBaseNomeUsuarioLogado,2,Pos(' ',varBaseNomeUsuarioLogado) -2));
        lblTempoLiberacao.Caption:= varBaseTempoLiberacao;
        LoadStyles;
      end;
    finally
      FreeAndNil(FLogin);
    end;
  end
  else
  if StatusEmpresa = 1 then
  begin
    try
      FCadastroEmpresa:= TFCadastroEmpresa.Create(nil);
      if FCadastroEmpresa.ShowModal <> mrOk then
        Application.Terminate
      else
      begin
        try
          FLogin:= TFLogin.Create(nil);
          FLogin.pnlChaveSerial.BringToFront;
          if FLogin.ShowModal <> mrOk then
            Application.Terminate
          else
          begin
            mnItemNomeUsuario.Caption:= Copy(varBaseNomeUsuarioLogado,0,1) +
            LowerCase(Copy(varBaseNomeUsuarioLogado,2,Pos(' ',varBaseNomeUsuarioLogado) -2));
            lblTempoLiberacao.Caption:= varBaseTempoLiberacao;
            LoadStyles;
          end;
        finally
          FreeAndNil(FLogin);
        end;
      end;
    finally
      FreeAndNil(FCadastroEmpresa);
    end;
  end
  else
  if StatusEmpresa = 3 then
  begin
    try
      FLogin:= TFLogin.Create(nil);
      FLogin.pnlChaveSerial.BringToFront;
      if FLogin.ShowModal <> mrOk then
        Application.Terminate
      else
      begin
        mnItemNomeUsuario.Caption:= Copy(varBaseNomeUsuarioLogado,0,1) +
        LowerCase(Copy(varBaseNomeUsuarioLogado,2,Pos(' ',varBaseNomeUsuarioLogado) -2));
        lblTempoLiberacao.Caption:= varBaseTempoLiberacao;
        LoadStyles;
      end;
    finally
      FreeAndNil(FLogin);
    end;
  end;
end;

procedure TFMenu.CategoriadeProdutos1Click(Sender: TObject);
begin
  pnlCategoriaProdutoHelp.BringToFront;
  OpenFormMain(FCategoriaProduto,TFCategoriaProduto);
end;

procedure TFMenu.cbxStyleChange(Sender: TObject);
begin
  TStyleManager.TrySetStyle(cbxStyle.Items[cbxStyle.ItemIndex]);
end;

procedure TFMenu.CentrodeCusto1Click(Sender: TObject);
begin
  pnlCentroCustoHelp.BringToFront;
  OpenFormMain(FCentroCusto,TFCentroCusto);
end;

procedure TFMenu.Clientes1Click(Sender: TObject);
begin
  pnlClienteHelp.BringToFront;
  OpenFormMain(FCliente,TFCliente);
end;

procedure TFMenu.ContasaPagar1Click(Sender: TObject);
begin
  OpenFormMain(FContaPagar,TFContaPagar);
end;

procedure TFMenu.ContasaReceber1Click(Sender: TObject);
begin
  OpenFormMain(FContaReceber,TFContaReceber);
end;

procedure TFMenu.Dadosdaempresa1Click(Sender: TObject);
begin
  OpenForm(FDadosEmpresa,TFDadosEmpresa);
end;

procedure TFMenu.Estoque1Click(Sender: TObject);
begin
  pnlEstoqueHelp.BringToFront;
  OpenFormMain(FEstoque,TFEstoque);
end;

procedure TFMenu.OrdensdeServio1Click(Sender: TObject);
begin
  pnlOrdemServicoHelp.BringToFront;
  OpenFormMain(FOS,TFOS);
end;

procedure TFMenu.Produtos1Click(Sender: TObject);
begin
  pnlProdutoHelp.BringToFront;
  OpenFormMain(FProduto,TFProduto);
end;

procedure TFMenu.imgConfigClick(Sender: TObject);
begin
  popConfig.Popup(self.Left + Self.Width - 15,Self.Top + 75);
end;

procedure TFMenu.imgUserClick(Sender: TObject);
begin
  popUser.Popup(self.Left + Self.Width - 65,Self.Top + 75);
end;

procedure TFMenu.lblComprasClick(Sender: TObject);
begin
  popCompras.Popup(Self.left + 425,Self.Top + 75);
end;

procedure TFMenu.lblFinanceiroClick(Sender: TObject);
begin
  popFinanceiro.Popup(Self.left + 510,Self.Top + 75);
end;

procedure TFMenu.lblVendasClick(Sender: TObject);
begin
  popVendas.Popup(Self.left + 350,Self.Top + 75);
end;

procedure TFMenu.SairdoSistema1Click(Sender: TObject);
begin
  Close;
end;

procedure TFMenu.Servios1Click(Sender: TObject);
begin
  pnlServicoHelp.BringToFront;
  OpenFormMain(FServico,TFServico);
end;

procedure TFMenu.Sistema1Click(Sender: TObject);
begin
  OpenForm(FSistema,TFSistema);
end;

procedure TFMenu.Usurios1Click(Sender: TObject);
begin
  pnlUsuarioHelp.BringToFront;
  OpenFormMain(FUsuario,TFUsuario);
end;

procedure TFMenu.VendaseOramentos1Click(Sender: TObject);
begin
  OpenFormMain(FVenda,TFVenda);
end;

function TFMenu.VerificaEmpresa: Integer;
var
  ObjPessoa: TPsPessoaVO;
  ObjJuridica: TPsJuridicaVO;
  ObjEmpresa: TPsEmpresaVO;
  Liberacao: String;
begin
  Result:= 1;//Não Existe
  ObjPessoa:= TPessoaRepository.getByIdEmpresa;

  if Assigned(ObjPessoa) then
  begin
    Result:= 2;//Existe Normal

    ObjJuridica:= TPessoaJuridicaService.getByIdPessoa(ObjPessoa.Id);
    ObjEmpresa:= TDadosEmpresaService.getByIdPessoa(ObjPessoa.Id);

    Liberacao:= MD5String('CNPJ: ' + Trim(ObjJuridica.Cnpj) + ', Senha: if1+1==2, '+
    'Inicio: ' + DateToStr(ObjEmpresa.Inicio) +', Termino: ' + DateToStr(ObjEmpresa.Termino));
    varBaseTempoLiberacao:= IntToStr(DaysBetween(now,ObjEmpresa.Termino));

    if UpperCase(Liberacao) <> Trim(ObjEmpresa.Serial) then
      Result:= 3
    else
    begin
      if ObjEmpresa.Termino < now  then
        Result:= 3;
    end;

    FreeAndNil(ObjEmpresa);
    FreeAndNil(ObjJuridica);
  end;

  FreeAndNil(ObjPessoa);
end;

initialization
  ReportMemoryLeaksOnShutdown:= True;


end.
