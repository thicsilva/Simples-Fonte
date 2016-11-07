unit Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Base, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.Buttons, PsUsuarioVO, PessoaUsuarioService,
  PessoaUsuarioRepository, IniFiles, Bibli, Biblioteca, PsPessoaVO,
  PessoaService, PessoaRepository, PsJuridicaVO, PessoaJuridicaService,
  DadosEmpresaRepository, DadosEmpresaService, PsEmpresaVO,DateUtils;

type
  TFLogin = class(TFBase)
    Image1: TImage;
    pnlLogin: TPanel;
    Label1: TLabel;
    imgBorderBlueAlterar: TImage;
    spbLogin: TSpeedButton;
    edtEmail: TLabeledEdit;
    edtSenha: TLabeledEdit;
    cbxLembrar: TCheckBox;
    pnlChaveSerial: TPanel;
    Label2: TLabel;
    Image2: TImage;
    spbLiberarChave: TSpeedButton;
    edtChave: TLabeledEdit;
    procedure spbLoginClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure spbLiberarChaveClick(Sender: TObject);
  private
    { Private declarations }
    ObjUsuario: TPsUsuarioVO;

    procedure Lembrar(Sim: Boolean);
  public
    { Public declarations }
  end;

var
  FLogin: TFLogin;

implementation

{$R *.dfm}

uses Mensagem, Menu;

procedure TFLogin.edtSenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    spbLoginClick(Sender);
end;

procedure TFLogin.FormCreate(Sender: TObject);
var
  ArqIni: TIniFile;
begin
  if FileExists('..\Bin\Lembrar-Email.ini') then
  begin
    cbxLembrar.Checked:= True;
    ArqIni:= TIniFile.Create('..\Bin\Lembrar-Email.ini');
    try
      edtEmail.Text:= ArqIni.ReadString('Login','Email','');
    finally
      ArqIni.Free;
    end;
  end;

  SetWindowLong(Self.Handle, GWL_ExStyle, GetWindowLong(Self.Handle, GWL_ExStyle) or
  WS_EX_AppWindow);
end;

procedure TFLogin.FormDestroy(Sender: TObject);
begin
  FreeAndNil(ObjUsuario);
end;

procedure TFLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TFLogin.FormShow(Sender: TObject);
begin
  edtEmail.SetFocus;
end;

procedure TFLogin.Lembrar(Sim: Boolean);
var
  arqIni: TIniFile;
begin
  if Sim = True  then
  begin
    if FileExists('..\Bin\Lembrar-Email.ini') then
      DeleteFile('..\Bin\Lembrar-Email.ini');

    arqIni:= TIniFile.Create('..\Bin\Lembrar-Email.ini');
    try
      arqIni.WriteString('Login','Email',edtEmail.Text);
    finally
      arqIni.Free;
    end;
  end
  else
  if FileExists('..\Bin\Lembrar-Email.ini') then
      DeleteFile('..\Bin\Lembrar-Email.ini');
end;

procedure TFLogin.spbLiberarChaveClick(Sender: TObject);
var
  ObjPessoa: TPsPessoaVO;
  ObjJuridica: TPsJuridicaVO;
  ObjEmpresa: TPsEmpresaVO;
  Liberacao: String;
begin
  ObjPessoa:= TPessoaRepository.getByIdEmpresa;
  if Assigned(ObjPessoa) then
  begin
    ObjJuridica:= TPessoaJuridicaService.getByIdPessoa(ObjPessoa.Id);
    ObjEmpresa:= TDadosEmpresaService.getByIdPessoa(ObjPessoa.Id);

    Liberacao:= MD5String('CNPJ: ' + Trim(ObjJuridica.Cnpj) + ', Senha: if1+1==2, '+
    'Inicio: ' + DateToStr(ObjEmpresa.Inicio) +', Termino: ' + DateToStr(ObjEmpresa.Termino));
    if UpperCase(Liberacao) = edtChave.Text then
    begin
      Mensagem('Sistema Liberado com sucesso. Aproveite seus ' +
      IntToStr(DaysBetween(ObjEmpresa.Inicio,ObjEmpresa.Termino)) + ' dias de Liberação!',0,0);
      pnlLogin.BringToFront;
      ObjEmpresa.Serial:= UpperCase(Liberacao);
      TDadosEmpresaService.save(ObjEmpresa);
    end
    else
    begin
      Mensagem('Chave informada é inválida!',0,1);
    end;
  end;

  FreeAndNil(ObjPessoa);
  FreeAndNil(ObjJuridica);
  FreeAndNil(ObjEmpresa);
end;

procedure TFLogin.spbLoginClick(Sender: TObject);
var
  Msg: String;
  Pessoa: TPsPessoaVO;
begin
  if edtEmail.Text = '' then
    Msg:= 'É necessário o preenchimento do campo E-mail!';

  if edtSenha.Text = '' then
    Msg:= 'É necessário o preenchimento da Senha!';

  ObjUsuario:= TPessoaUsuarioRepository.getByLoginUsuario(edtEmail.Text,edtSenha.Text);
  if not Assigned(ObjUsuario) then
    Msg:= 'E-mail ou Senha não existem ou não estão corretos!';

  if Msg <> '' then
  begin
     try
      FMensagem:= TFMensagem.Create(nil);
      FMensagem.Height:= Screen.Height;
      FMensagem.Width:= Screen.Width;
      FMensagem.tipo:= 0;
      FMensagem.ImagemInfo:= 1;
      FMensagem.Label2.Caption:= Msg;
      FMensagem.ShowModal;
    finally
      FreeAndNil(FMensagem);
    end;
  end
  else
  begin
    if cbxLembrar.Checked = True then
      Lembrar(True)
    else
      Lembrar(False);

    Pessoa:= TPessoaService.getById(ObjUsuario.IdPessoa);
    varBaseIdUsuarioLogado:= ObjUsuario.IdPessoa;
    varBaseNomeUsuarioLogado:= Pessoa.Nome;
    FreeAndNil(Pessoa);
    ModalResult:= mrOk;
  end;
end;

end.
