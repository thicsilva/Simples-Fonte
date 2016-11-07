unit Sistema;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ModeloStore, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.ComCtrls,
  Vcl.StdCtrls, PsEmpresaVO, PsEpNfeVO, PsJuridicaVO, PsPessoaVO,
  PessoaRepository, PessoaJuridicaService, DadosEmpresaService,
  ConfigBoletoService, ConfigNFEService, PessoaService, Biblioteca;

type
  TFSistema = class(TFModeloStore)
    pgcSistema: TPageControl;
    tbNFE: TTabSheet;
    rgpFormaEmissao: TRadioGroup;
    gpbArquivos: TGroupBox;
    cbxSalvarAquivos: TCheckBox;
    edtArquivos: TLabeledEdit;
    imgSearchCliente: TImage;
    Label2: TLabel;
    OpenDialog: TOpenDialog;
    gpbCertificado: TGroupBox;
    Image1: TImage;
    Label1: TLabel;
    edtLocalCertificado: TLabeledEdit;
    edtSenhaCertificado: TLabeledEdit;
    edtNumeroSerie: TLabeledEdit;
    gpbWebService: TGroupBox;
    edtUF: TLabeledEdit;
    rgpAmbienteDestino: TRadioGroup;
    gpbConexao: TGroupBox;
    edtHost: TLabeledEdit;
    edtPorta: TLabeledEdit;
    edtUsuario: TLabeledEdit;
    edtSenhaConexao: TLabeledEdit;
    procedure imgSearchClienteClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionSalvarExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    ObjPessoa: TPsPessoaVO;
    ObjJuridica: TPsJuridicaVO;
    ObjEmpresa: TPsEmpresaVO;
    ObjConfigNFE: TPsEpNfeVO;

    procedure EdtToObj;
    procedure ObjToEdt;
    function Validacoes: String;
  public
    { Public declarations }
  end;

var
  FSistema: TFSistema;

implementation

{$R *.dfm}

procedure TFSistema.ActionSalvarExecute(Sender: TObject);
var
  Msg: String;
begin
  Msg:= Validacoes;
  if Msg = '' then
  begin
    if TPessoaService.save(ObjPessoa) then
    begin
      TDadosEmpresaService.save(ObjEmpresa);
      EdtToObj;
      TConfigNFEService.save(ObjConfigNFE);
      Close;
    end;
  end
  else
    Mensagem(Msg,0,1);
end;

procedure TFSistema.EdtToObj;
begin
  if not Assigned(ObjConfigNFE) then
    ObjConfigNFE:= TPsEpNfeVO.Create;

  ObjConfigNFE.Emissao:= Trim(RemoveAcentos(rgpFormaEmissao.Items.Strings[rgpFormaEmissao.ItemIndex]));
  if cbxSalvarAquivos.Checked = True then
    ObjConfigNFE.SalvarArquivos:= 'SIM'
  else
    ObjConfigNFE.SalvarArquivos:= 'NAO';
  ObjConfigNFE.PathArquivos:= Trim(RemoveAcentos(edtArquivos.Text));
  ObjConfigNFE.CtPath:= Trim(RemoveAcentos(edtLocalCertificado.Text));
  ObjConfigNFE.CtSenha:= Trim(RemoveAcentos(edtSenhaCertificado.Text));
  ObjConfigNFE.CtNumeroSerie:= Trim(RemoveAcentos(edtNumeroSerie.Text));
  ObjConfigNFE.WsUf:= Trim(RemoveAcentos(edtUF.Text));
  ObjConfigNFE.WsAmbienteDestino:= Trim(RemoveAcentos(rgpAmbienteDestino.Items.Strings[rgpAmbienteDestino.ItemIndex]));
  ObjConfigNFE.ConexaoHost:= Trim(RemoveAcentos(edtHost.Text));
  ObjConfigNFE.ConexaoPorta:= Trim(RemoveAcentos(edtPorta.Text));
  ObjConfigNFE.ConexaoUsuario:= Trim(RemoveAcentos(edtUsuario.Text));
  ObjConfigNFE.ConexaoSenha:= Trim(RemoveAcentos(edtSenhaConexao.Text));
  ObjConfigNFE.IdEmpresa:= ObjEmpresa.Id;
end;

procedure TFSistema.FormCreate(Sender: TObject);
begin
  ObjPessoa:= TPessoaRepository.getByIdEmpresa;
  ObjEmpresa:= TDadosEmpresaService.getByIdPessoa(ObjPessoa.Id);
  ObjConfigNFE:= TConfigNFEService.getByIdEmpresa(ObjEmpresa.Id);
  ObjToEdt;
end;

procedure TFSistema.FormDestroy(Sender: TObject);
begin
  FreeAndNil(ObjPessoa);
  FreeAndNil(ObjJuridica);
  FreeAndNil(ObjEmpresa);
  FreeAndNil(ObjConfigNFE);
end;

procedure TFSistema.Image1Click(Sender: TObject);
begin
  OpenDialog.Execute;
  edtLocalCertificado.Text:= OpenDialog.FileName;
end;

procedure TFSistema.imgSearchClienteClick(Sender: TObject);
begin
  OpenDialog.Execute;
  edtArquivos.Text:= OpenDialog.FileName;
end;

procedure TFSistema.ObjToEdt;
begin
  if Assigned(ObjConfigNFE) then
  begin
    rgpFormaEmissao.ItemIndex:= rgpFormaEmissao.Items.IndexOf(Trim(ObjConfigNFE.Emissao));
    cbxSalvarAquivos.Checked:= Trim(ObjConfigNFE.SalvarArquivos) = 'SIM';
    edtArquivos.Text:= Trim(ObjConfigNFE.PathArquivos);
    edtLocalCertificado.Text:= Trim(ObjConfigNFE.CtPath);
    edtSenhaCertificado.Text:= Trim(ObjConfigNFE.CtSenha);
    edtNumeroSerie.Text:= Trim(ObjConfigNFE.CtNumeroSerie);
    edtUF.Text:= Trim(ObjConfigNFE.WsUf);
    rgpAmbienteDestino.ItemIndex:= rgpAmbienteDestino.Items.IndexOf(Trim(ObjConfigNFE.WsAmbienteDestino));
    edtHost.Text:= Trim(ObjConfigNFE.ConexaoHost);
    edtPorta.Text:= Trim(ObjConfigNFE.ConexaoPorta);
    edtUsuario.Text:= Trim(ObjConfigNFE.ConexaoUsuario);
    edtSenhaConexao.Text:= Trim(ObjConfigNFE.ConexaoSenha);
  end;
end;

function TFSistema.Validacoes: String;
begin
  Result:= '';
  if (cbxSalvarAquivos.Checked = True) and (edtArquivos.Text = '') then
    Result:= 'É necessário Selecionar um Path de Aquivos!';

  if (edtLocalCertificado.Text <> '') and (edtSenhaCertificado.Text = '') then
    Result:= 'É necessário o preenchimento de uma Senha para o Certificado!';

  if (edtLocalCertificado.Text <> '') and (edtNumeroSerie.Text = '') then
    Result:= 'É necessário o preenchimento de um Número de Série!';

  if edtUF.Text = '' then
    Result:= 'É necessário o preenchimento do Campo UF!';
end;

end.
