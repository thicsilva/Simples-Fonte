unit CadastroEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ModeloStore, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.StdCtrls,
  PsPessoaVO, PsEmpresaVO, PsJuridicaVO, Biblioteca, PessoaService,
  PessoaJuridicaService, DadosEmpresaService, ThreadEnviarVendaEmail,
  ThreadEnviarSimplesEmail,IdSMTP, IdSSLOpenSSL, IdMessage,
  IdExplicitTLSClientServerBase, IdAttachmentFile, Bibli;

type
  TFCadastroEmpresa = class(TFModeloStore)
    Bevel1: TBevel;
    edtCNPJ: TLabeledEdit;
    edtNomePessoa: TLabeledEdit;
    edtEmail: TLabeledEdit;
    edtTelefoneContato: TLabeledEdit;
    cbxTamanhoEmpresa: TComboBox;
    Label8: TLabel;
    Bevel3: TBevel;
    edtQuantidadePessoas: TLabeledEdit;
    cbxEmpresaVende: TComboBox;
    Label1: TLabel;
    cbxQualSegmentoEmpresa: TComboBox;
    Label2: TLabel;
    cbxComoSoubeSimples: TComboBox;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    cbxFinanceiro: TCheckBox;
    cbxVendas: TCheckBox;
    cbxEstoque: TCheckBox;
    cbxNotasFiscais: TCheckBox;
    TimerEnviando: TTimer;
    pnlLoading: TPanel;
    imgLoading: TImage;
    spbAdicionarChave: TSpeedButton;
    imgAdicionarChave: TImage;
    ActionAdicionarChave: TAction;
    pnlMsg: TPanel;
    lblEnviando: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ActionSalvarExecute(Sender: TObject);
    procedure TimerEnviandoTimer(Sender: TObject);
    procedure ActionAdicionarChaveExecute(Sender: TObject);
  private
    { Private declarations }
    function validacoes: String;
  public
    { Public declarations }
  end;

var
  FCadastroEmpresa: TFCadastroEmpresa;
  Enviar: TEnviarSimplesEmail;

implementation

{$R *.dfm}

procedure TFCadastroEmpresa.ActionAdicionarChaveExecute(Sender: TObject);
begin
  Self.ModalResult:= mrOk;
end;

procedure TFCadastroEmpresa.ActionSalvarExecute(Sender: TObject);
var
  Msg: string;
  ObjPessoa: TPsPessoaVO;
  ObjJuricica: TPsJuridicaVO;
  ObjEmpresa: TPsEmpresaVO;
begin
  MSg:= validacoes;
  if Msg = '' then
  begin
    try
      ObjPessoa:= TPsPessoaVO.Create;
      ObjPessoa.Nome:= Trim(RemoveAcentos(edtNomePessoa.Text));
      ObjPessoa.TipoPessoa:= 'JURIDICA';
      ObjPessoa.TipoCadastro:= 'EMPRESA';
      TPessoaService.save(ObjPessoa);

      ObjJuricica:= TPsJuridicaVO.Create;
      ObjJuricica.IdPessoa:= ObjPessoa.Id;
      ObjJuricica.Email:= Trim(RemoveAcentos(edtEmail.Text));
      ObjJuricica.Telefone:= Trim(RemoveAcentos(edtTelefoneContato.Text));
      ObjJuricica.Cnpj:= Trim(edtCNPJ.Text);
      TPessoaJuridicaService.save(ObjJuricica);

      ObjEmpresa:= TPsEmpresaVO.Create;
      ObjEmpresa.IdPessoa:= ObjPessoa.Id;
      ObjEmpresa.Inicio:= now;
      ObjEmpresa.Termino:= now + 7;
      TDadosEmpresaService.save(ObjEmpresa);

      Enviar:= TEnviarSimplesEmail.Create;

      with Enviar do
      begin
        ClienteSmtpHost := 'smtp.gmail.com';
        ClienteSmtpUserName := 'lemestec@gmail.com';
        ClienteSmtpPassword := 'if1+1==2';
        ClienteSmtpPorta := 465;
        MensagemAddress := 'lemestec@gmail.com';
        MensagemName := 'Chave de Liberação Sistema';
        MensagemEMailAddresses := Trim(edtEmail.Text);
        MensagemSubject := 'Chave de Liberação Sistema';
        MensagemBody:=
        '<!DOCTYPE html>'+
        '<html lang="pt-br">'+
        '<head>'+
        '<meta charset="UTF-8">'+
        '</head>'+
        '<body>'+
        '<div style="float: left; width: 100%;">'+
        '  <div style="display: block; margin: 0 auto; padding: 40px 0; max-width: 400px;width: 50%; border-radius: 4px; border: 1px #dceaf5 solid;">'+
        '   <img style="background: #00aaff; border-radius: 4px; border: 1px #dceaf5 solid; margin: 0 auto; width: 100px; display: block;" src="https://www.mindmeister.com/images/download/28054256">'+
        '    <p style="display: block; margin: 0 auto; padding: 40px 0 0 0; width: 80%">Olá, '+Copy(ObjPessoa.Nome,0,Pos(' ',ObjPessoa.Nome))+',</p>'+
        '    <p style="display: block; margin: 0 auto; padding: 15px 0 0 0; width: 80%">Precebemos que você cadastrou sua empresa do CNPJ: '+ bb.colocamascara(Trim(ObjJuricica.Cnpj),5) +', ao Simples. Que Legal!</p> '+
        '    <p style="display: block; margin: 0 auto; padding: 15px 0 0 0; width: 80%">Você está recebendo uma chave de licença de 7 dias gratuitos.<p> '+
        '      <p style="display: block; margin: 0 auto; padding: 15px 0; width: 80%;background: #eee; text-transform: uppercase; text-align: center; font-size: 1em; border: 1px #dceaf5 solid;">'+ MD5String('CNPJ: ' + edtCNPJ.Text + ', Senha: if1+1==2, Inicio: ' + DateToStr(ObjEmpresa.Inicio) +', Termino: ' + DateToStr(ObjEmpresa.Termino))+'</p>'+
        '    <p style="display: block; margin: 0 auto; padding: 15px 0 0 0; width: 80%">Caso tenha alguma dúvida, visite nosso site clicando no botão abaxo.<p> '+
        '    <a style="display: block; margin: 0 auto; padding: 15px 0; width: 60%;background: #00aaff; text-align: center; font-size: 1em; border: 1px #dceaf5 solid;'+
        ' text-decoration: none; font-weight: bold; border-radius: 4px; color: #fff;" href="https://lemestecart.com.br" target="_blank">Ir para o Site!</a> '+
        '  </div> '+
        '<div>'+
        '</body>'+
        '</html>';
        EmailEnviado:= 'NAO';
      end;

      pnlLoading.Visible:= True;
      Enviar.Resume;
      TimerEnviando.Enabled:= True;
    finally
      FreeAndNil(ObjPessoa);
      FreeAndNil(ObjJuricica);
      FreeAndNil(ObjEmpresa);
    end;
  end
  else
    Mensagem(Msg,0,1);
end;

procedure TFCadastroEmpresa.FormCreate(Sender: TObject);
begin
  inherited;
  SetWindowLong(Self.Handle, GWL_ExStyle, GetWindowLong(Self.Handle, GWL_ExStyle) or
  WS_EX_AppWindow);
end;

procedure TFCadastroEmpresa.TimerEnviandoTimer(Sender: TObject);
begin
  if lblEnviando.Caption = 'Enviando ...' then
    lblEnviando.Caption:= 'Enviando .';

  if lblEnviando.Caption = 'Enviando .' then
    lblEnviando.Caption:= 'Enviando ..';

  if lblEnviando.Caption = 'Enviando ..' then
    lblEnviando.Caption:= 'Enviando ...';


  if Enviar.EmailEnviado = 'SIM' then
  begin
    TimerEnviando.Enabled:= False;
    lblEnviando.Caption:= 'Chave de Liberação Enviada Para o E-mail Cadastrado!';
    spbAdicionarChave.Visible:= True;
    imgAdicionarChave.Visible:= True;
  end;
end;

function TFCadastroEmpresa.validacoes: String;
begin
  Result:= '';
  if edtNomePessoa.Text = '' then
    Result:= 'É necessário o preenchimento do campo Pessoa!';

  if edtEmail.Text = '' then
    Result:= 'É necessário o preenchimento do compo E-mail!';

  if edtTelefoneContato.Text = '' then
    Result:= 'É necessário o preenchimento do compo Telefone de Contato!';

  if edtCNPJ.Text = '' then
    Result:= 'É necessário o preenchimento do compo CNPJ!';

  if ValidaCNPJ(edtCNPJ.Text) = False then
    Result:= 'CNPJ Inválido!';

  if edtQuantidadePessoas.Text = '' then
    Result:= 'É necessário o preenchimento do compo Quantidade de Pessoas!';

end;

end.




