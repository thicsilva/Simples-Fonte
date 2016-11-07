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
|* 10/10/2016: Primeira Versao                                                |*
|*   Thiago Ribeiro Lemes de Brito                                            |*
*******************************************************************************}
unit UsuarioStore;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ModeloStore, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.StdCtrls,
  PsUsuarioVO, PessoaUsuarioService, VO, PsPessoaVO, Bibli, Biblioteca,
  PessoaService;

type
  TFUsuarioStore = class(TFModeloStore)
    pnlTitle: TPanel;
    lblTituloForm: TLabel;
    Bevel1: TBevel;
    pnlNomeCliente: TPanel;
    edtNomeUsuario: TLabeledEdit;
    edtEmail: TLabeledEdit;
    edtSenha: TLabeledEdit;
    edtConfirmaSenha: TLabeledEdit;
    Panel1: TPanel;
    Label1: TLabel;
    Bevel3: TBevel;
    Panel2: TPanel;
    pnlGridTitle: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Panel3: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Panel4: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Panel5: TPanel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Panel6: TPanel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Panel7: TPanel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Panel8: TPanel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    rbtnAdministrador: TRadioButton;
    Bevel4: TBevel;
    Bevel5: TBevel;
    rbtnComprador: TRadioButton;
    rbtnVendedorSenior: TRadioButton;
    Bevel6: TBevel;
    rbtnVendedorJunior: TRadioButton;
    Bevel7: TBevel;
    Bevel8: TBevel;
    rbtnFinanceiroSenior: TRadioButton;
    rbtnFinanceiroJunior: TRadioButton;
    Bevel9: TBevel;
    cbxrRecebeEmail: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure ActionSalvarExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    ObjPessoa: TPsPessoaVO;
    ObjUsuario: TPsUsuarioVO;

    procedure EdtToObj;
    procedure ObjToEdt;
    function Validacoes: String;
  public
    { Public declarations }
  end;

var
  FUsuarioStore: TFUsuarioStore;

implementation

{$R *.dfm}

uses Mensagem, Menu;

procedure TFUsuarioStore.ActionSalvarExecute(Sender: TObject);
var
  Msg: String;
  I: Integer;
begin
  Msg:= Validacoes;
  if Msg = '' then
  begin
    EdtToObj;
    if TPessoaService.save(ObjPessoa) then
    begin
      ObjUsuario.IdPessoa:= ObjPessoa.Id;
      ObjUsuario.Senha:= Trim(edtSenha.Text);
      ObjUsuario.Email:= RemoveAcentos(Trim(edtEmail.Text));
      if cbxrRecebeEmail.Checked = True then
        ObjUsuario.NotificacaoEmail:= 'SIM'
      else
        ObjUsuario.NotificacaoEmail:= 'NAO';

      if rbtnAdministrador.Checked = True then
        ObjUsuario.Perfil:= 'ADMINISTRADOR'
      else
      if rbtnComprador.Checked = True then
        ObjUsuario.Perfil:= 'COMPRADOR'
      else
      if rbtnVendedorSenior.Checked = True then
        ObjUsuario.Perfil:= 'VENDEDOR SENIOR'
      else
      if rbtnVendedorJunior.Checked = True then
        ObjUsuario.Perfil:= 'VENDEDOR JUNIOR'
      else
      if rbtnFinanceiroSenior.Checked = True then
        ObjUsuario.Perfil:= 'FINANCEIRO SENIOR'
      else
      if rbtnFinanceiroJunior.Checked = True then
        ObjUsuario.Perfil:= 'FIANANCEIRO JUNIOR';

      TPessoaUsuarioService.save(ObjUsuario);
      Close;
    end;
  end
  else
  begin
    try
      FMensagem:= TFMensagem.Create(nil);
      FMensagem.Height:= FMenu.Height;
      FMensagem.Width:= FMenu.Width;
      FMensagem.tipo:= 0;
      FMensagem.ImagemInfo:= 1;
      FMensagem.Label2.Caption:= Msg;
      FMensagem.ShowModal;
    finally
      FreeAndNil(FMensagem);
    end;
  end;
end;

procedure TFUsuarioStore.EdtToObj;
begin
  ObjPessoa.TipoCadastro:= 'USUARIO';
  ObjPessoa.Nome:= RemoveAcentos(Trim(edtNomeUsuario.Text));
end;

procedure TFUsuarioStore.FormCreate(Sender: TObject);
begin
  ObjPessoa:= TPessoaService.getById(varBaseIdPessoa);
  if not Assigned(ObjPessoa) then
  begin
    ObjPessoa:= TPsPessoaVO.Create;
    ObjUsuario:= TPsUsuarioVO.Create;
    lblTituloForm.Caption:= 'Cadastro de novo Usuário!';
  end
  else
  begin
    ObjUsuario:= TPessoaUsuarioService.getByIdPessoa(ObjPessoa.id);
    lblTituloForm.Caption:= 'Alterando Dados de Usuário!';
  end;

  ObjToEdt;
end;

procedure TFUsuarioStore.FormDestroy(Sender: TObject);
begin
  FreeAndNil(ObjPessoa);
  FreeAndNil(ObjUsuario);
end;

procedure TFUsuarioStore.ObjToEdt;
begin
  edtNomeUsuario.Text:= Trim(ObjPessoa.Nome);
  edtEmail.Text:= Trim(ObjUsuario.Email);
  if Trim(ObjUsuario.Perfil) = 'ADMINISTRADOR' then
    rbtnAdministrador.Checked:= True
  else
  if Trim(ObjUsuario.Perfil) = 'COMPRADOR' then
    rbtnComprador.Checked:= True
  else
  if Trim(ObjUsuario.Perfil) = 'VENDEDOR SENIOR' then
    rbtnVendedorSenior.Checked:= True
  else
  if Trim(ObjUsuario.Perfil) = 'VENDEDOR JUNIOR' then
    rbtnVendedorJunior.Checked:= True
  else
  if Trim(ObjUsuario.Perfil) = 'FINANCEIRO SENIOR' then
    rbtnFinanceiroSenior.Checked:= True
  else
  if Trim(ObjUsuario.Perfil) = 'FINANCEIRO JUNIOR' then
    rbtnFinanceiroJunior.Checked:= True;

  if Trim(ObjUsuario.Perfil) = 'SIM' then
    cbxrRecebeEmail.Checked:= True;

end;

function TFUsuarioStore.Validacoes: String;
begin
  Result:= '';

  if edtNomeUsuario.Text = '' then
    Result:= 'É necessário o preenchimento do nome do Usuário!';

  if edtEmail.Text = '' then
    Result:= 'É necessário o preenchimento do Email de Login!';

  if edtSenha.Text = '' then
    Result:= 'É necessário o preenchimento da Senha de Usuário!';

  if edtConfirmaSenha.Text = '' then
    Result:= 'É necessário confirmar a Senha de Usuário!';

  if edtSenha.Text <> edtConfirmaSenha.Text then
    Result:= 'A Senha de Confirmação é Diferente da Senha Atual!';
end;

end.
