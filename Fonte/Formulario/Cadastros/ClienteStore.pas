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
unit ClienteStore;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ModeloStore, Vcl.Buttons,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Imaging.GIFImg, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.AppEvnts, PsPessoaVO, PsFisicaVO, PsJuridicaVO, PsContatoVO,
  System.Generics.Collections, System.Actions, Vcl.ActnList;

type
  TFClienteStore = class(TFModeloStore)
    pnlPessoaFisica: TPanel;
    edtCPF: TLabeledEdit;
    Label3: TLabel;
    cbxTipoPessoaFisica: TComboBox;
    cbxIndicadorInscEstadual: TComboBox;
    Label4: TLabel;
    edtRG: TLabeledEdit;
    edtEmailFisica: TLabeledEdit;
    edtTelefoneFisica: TLabeledEdit;
    edtCelularFisica: TLabeledEdit;
    edtDataNascimento: TDateTimePicker;
    Label5: TLabel;
    Label6: TLabel;
    mmPessoaFisicaObs: TMemo;
    pnlPessoaJuridica: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edtCNPJ: TLabeledEdit;
    cbxTipoPessoaJuridica: TComboBox;
    cbxIndicadorInscEstadualJuridica: TComboBox;
    edtRazaoSocial: TLabeledEdit;
    edtInscEstadual: TLabeledEdit;
    edtInscMunicipal: TLabeledEdit;
    edtInscSuframa: TLabeledEdit;
    edtDataFundacao: TDateTimePicker;
    edtEmailJuridica: TLabeledEdit;
    edtTelefoneJuridica: TLabeledEdit;
    edtCelularJuridica: TLabeledEdit;
    cbxInsentoInscEstadual: TCheckBox;
    cbxOptaSimples: TCheckBox;
    mmObsJuridica: TMemo;
    Label10: TLabel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    pnlNomeCliente: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Bevel5: TBevel;
    Image2: TImage;
    edtNomeCliente: TLabeledEdit;
    pnlEnderecoTitle: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    Image3: TImage;
    pnlTitle: TPanel;
    lblTituloForm: TLabel;
    Bevel1: TBevel;
    pnlEndereco: TPanel;
    Bevel6: TBevel;
    edtCEP: TLabeledEdit;
    edtComplemento: TLabeledEdit;
    edtBairro: TLabeledEdit;
    edtEndereco: TLabeledEdit;
    edtNumero: TLabeledEdit;
    edtCidade: TLabeledEdit;
    pnlContatoTitle: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    pnlContato: TPanel;
    Bevel7: TBevel;
    Label15: TLabel;
    Label17: TLabel;
    edtContatoNome1: TLabeledEdit;
    edtContatoCargo1: TLabeledEdit;
    edtContatoEmail1: TLabeledEdit;
    edtContatoFone1: TLabeledEdit;
    edtContatoNome2: TLabeledEdit;
    EdtContatoEmail2: TLabeledEdit;
    edtContatoFone2: TLabeledEdit;
    edtContatoCargo2: TLabeledEdit;
    procedure cbxTipoPessoaFisicaChange(Sender: TObject);
    procedure cbxTipoPessoaJuridicaChange(Sender: TObject);
    procedure Label13MouseEnter(Sender: TObject);
    procedure Label13MouseLeave(Sender: TObject);
    procedure Label13Click(Sender: TObject);
    procedure Label11Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure mmPessoaFisicaObsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtContatoCargo2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNomeClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure mmObsJuridicaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure ActionSalvarExecute(Sender: TObject);
  private
    { Private declarations }
    ObjCliente: TPsPessoaVO;
    ObjPessoaFisica: TPsFisicaVO;
    ObjPessoaJuridica: TPsJuridicaVO;
    ObjPessoaContatoList: TList<TPsContatoVO>;
    ObjPessoaContato: TPsContatoVO;

    procedure EdtToObj;
    procedure ObjToEdt;
    function Validacoes: String;
  public
    { Public declarations }
  end;

var
  FClienteStore: TFClienteStore;

implementation

{$R *.dfm}

uses PessoaService, PessoaFisicaService,PessoaContatoService, Biblioteca,Bibli,
  PessoaJuridicaService, Mensagem, Menu, PessoaContatoRepository;

procedure TFClienteStore.ObjToEdt;
var
  I: Integer;
begin
  edtNomeCliente.Text:= Trim(ObjCliente.Nome);
  edtCEP.Text:= Trim(ObjCliente.Cep);
  edtEndereco.Text:= Trim(ObjCliente.Endereco);
  edtNumero.Text:= Trim(ObjCliente.Numero);
  edtComplemento.Text:= Trim(ObjCliente.Complemento);
  edtBairro.Text:= Trim(ObjCliente.Bairro);
  edtCidade.Text:= Trim(ObjCliente.Cidade);

  if Assigned(ObjPessoaFisica) then
  begin
    pnlPessoaFisica.Enabled:= True;
    pnlPessoaJuridica.Enabled:= False;
    cbxTipoPessoaFisica.ItemIndex:= 0;

    edtCPF.Text:= Trim(ObjPessoaFisica.Cpf);
    cbxIndicadorInscEstadual.ItemIndex:= cbxIndicadorInscEstadual.Items.IndexOf(Trim(ObjPessoaFisica.IndicadoInscEstadual));
    edtRG.Text:= Trim(ObjPessoaFisica.Rg);
    edtEmailFisica.Text:= Trim(ObjPessoaFisica.Email);
    edtTelefoneFisica.Text:= Trim(ObjPessoaFisica.Telefone);
    edtCelularFisica.Text:= Trim(ObjPessoaFisica.Celular);
    edtDataNascimento.Date:= ObjPessoaFisica.Nascimento;
    mmPessoaFisicaObs.Text:= Trim(ObjPessoaFisica.Obs);
  end
  else
  if Assigned(ObjPessoaJuridica) then
  begin
    pnlPessoaFisica.Enabled:= False;
    pnlPessoaJuridica.Enabled:= True;
    cbxTipoPessoaJuridica.ItemIndex:= 1;

    edtCNPJ.Text:= Trim(ObjPessoaJuridica.Cnpj);
    edtRazaoSocial.Text:= Trim(ObjPessoaJuridica.RazaoSocial);
    cbxIndicadorInscEstadualJuridica.ItemIndex:= cbxIndicadorInscEstadualJuridica.Items.IndexOf(Trim(ObjPessoaJuridica.IndicadoInscEstadual));
    edtInscEstadual.Text:= Trim(ObjPessoaJuridica.InscEstadual);
    edtInscMunicipal.Text:= Trim(ObjPessoaJuridica.InscMunicipal);
    edtInscSuframa.Text:= Trim(ObjPessoaJuridica.InscSuframa);
    edtDataFundacao.Date:= ObjPessoaJuridica.DataFundacao;
    edtEmailJuridica.Text:= Trim(ObjPessoaJuridica.Email);
    edtTelefoneJuridica.Text:= Trim(ObjPessoaJuridica.Telefone);
    edtCelularJuridica.Text:= Trim(ObjPessoaJuridica.Celular);
    if ObjPessoaJuridica.InsentoInscEstadual = 'SIM' then
      cbxInsentoInscEstadual.Checked:= True
    else
      cbxInsentoInscEstadual.Checked:= False;
    if ObjPessoaJuridica.Simples = 'SIM' then
      cbxOptaSimples.Checked:= True
    else
      cbxOptaSimples.Checked:= False;
    mmObsJuridica.Text:= Trim(ObjPessoaJuridica.Obs);
  end;

  if Assigned(ObjPessoaContatoList) then
  begin
    for I := 0 to Pred(ObjPessoaContatoList.Count) do
    begin
      if I = 0 then
      begin
        edtContatoNome1.Text:= Trim(ObjPessoaContatoList.Items[I].Nome);
        edtContatoCargo1.Text:= Trim(ObjPessoaContatoList.Items[I].Cargo);
        edtContatoEmail1.Text:= Trim(ObjPessoaContatoList.Items[I].Email);
        edtContatoFone1.Text:= Trim(ObjPessoaContatoList.Items[I].Fone);
      end
      else
      if I = 1 then
      begin
        edtContatoNome2.Text:= Trim(ObjPessoaContatoList.Items[I].Nome);
        edtContatoCargo2.Text:= Trim(ObjPessoaContatoList.Items[I].Cargo);
        edtContatoEmail2.Text:= Trim(ObjPessoaContatoList.Items[I].Email);
        edtContatoFone2.Text:= Trim(ObjPessoaContatoList.Items[I].Fone);
      end;
    end;
  end;
end;

procedure TFClienteStore.EdtToObj;
begin
  ObjCliente.Nome:= Trim(edtNomeCliente.Text);
  if pnlPessoaFisica.Enabled = True then
    ObjCliente.TipoPessoa:= 'FISICA'
  else
    ObjCliente.TipoPessoa:= 'JURIDICA';
  ObjCliente.TipoCadastro:= 'CLIENTE';
  ObjCliente.Cep:= Trim(edtCEP.Text);
  ObjCliente.Endereco:= RemoveAcentos(Trim(edtEndereco.Text));
  ObjCliente.Numero:= Trim(edtNumero.Text);
  ObjCliente.Complemento:= RemoveAcentos(Trim(edtComplemento.Text));
  ObjCliente.Bairro:= RemoveAcentos(Trim(edtBairro.Text));
  ObjCliente.Cidade:= RemoveAcentos(Trim(edtCidade.Text));
end;

procedure TFClienteStore.FormCreate(Sender: TObject);
begin
  ObjCliente:= TPessoaService.getById(varBaseIdPessoa);
  if not Assigned(ObjCliente) then
  begin
    ObjCliente:= TPsPessoaVO.Create;
    lblTituloForm.Caption:= 'Cadastro de novo Cliente!';
  end
  else
  begin
    lblTituloForm.Caption:= 'Alterando Dados de Cliente!';
    if Trim(ObjCliente.TipoPessoa) = 'FISICA' then
      ObjPessoaFisica:= TPessoaFisicaService.getByIdPessoa(ObjCliente.Id)
    else
    if Trim(ObjCliente.TipoPessoa) = 'JURIDICA' then
      ObjPessoaJuridica:= TPessoaJuridicaService.getByIdPessoa(ObjCliente.Id);
    ObjPessoaContatoList:= TPessoaContatoRepository.index(ObjCliente.Id);
  end;

  ObjToEdt;
end;

procedure TFClienteStore.ActionSalvarExecute(Sender: TObject);
var
  Msg: String;
  I: Integer;
begin
  Msg:= Validacoes;
  if Msg = '' then
  begin
    EdtToObj;
    if TPessoaService.save(ObjCliente) then
    begin
      if trim(ObjCliente.TipoPessoa) = 'FISICA' then
      begin
        if not Assigned(ObjPessoaFisica) then
          ObjPessoaFisica:= TPsFisicaVO.Create
        else
          ObjPessoaFisica:= TPessoaFisicaService.getByIdPessoa(ObjCliente.Id);

        ObjPessoaFisica.IdPessoa:= Trim(ObjCliente.Id);
        ObjPessoaFisica.Cpf:= Trim(edtCPF.Text);
        ObjPessoaFisica.IndicadoInscEstadual:= RemoveAcentos(cbxIndicadorInscEstadual.Text);
        ObjPessoaFisica.Rg:= Trim(edtRG.Text);
        ObjPessoaFisica.Email:= Trim(RemoveAcentos(edtEmailFisica.Text));
        ObjPessoaFisica.Telefone:= Trim(edtTelefoneFisica.Text);
        ObjPessoaFisica.Celular:= Trim(edtCelularFisica.Text);
        ObjPessoaFisica.Nascimento:= edtDataNascimento.Date;
        ObjPessoaFisica.Obs:= Trim(RemoveAcentos(mmPessoaFisicaObs.Text));
        TPessoaFisicaService.save(ObjPessoaFisica);

        ObjPessoaJuridica:= TPessoaJuridicaService.getByIdPessoa(ObjCliente.Id);
        if Assigned(ObjPessoaJuridica) then
          TPessoaJuridicaService.destroyer(ObjPessoaJuridica.Id);
      end
      else
      if trim(ObjCliente.TipoPessoa) = 'JURIDICA' then
      begin
        if not Assigned(ObjPessoaJuridica) then
          ObjPessoaJuridica:= TPsJuridicaVO.Create
        else
          ObjPessoaJuridica:= TPessoaJuridicaService.getByIdPessoa(ObjCliente.Id);

        ObjPessoaJuridica.IdPessoa:= Trim(ObjCliente.Id);
        ObjPessoaJuridica.Cnpj:= Trim(edtCNPJ.Text);
        ObjPessoaJuridica.RazaoSocial:= Trim(RemoveAcentos(edtRazaoSocial.Text));
        ObjPessoaJuridica.IndicadoInscEstadual:= cbxIndicadorInscEstadualJuridica.Text;
        ObjPessoaJuridica.InscEstadual:= Trim(RemoveAcentos(edtInscEstadual.Text));
        ObjPessoaJuridica.InscMunicipal:= Trim(RemoveAcentos(edtInscMunicipal.Text));
        ObjPessoaJuridica.InscSuframa:= Trim(RemoveAcentos(edtInscSuframa.Text));
        ObjPessoaJuridica.DataFundacao:= edtDataFundacao.Date;
        ObjPessoaJuridica.Email:= Trim(RemoveAcentos(edtEmailJuridica.Text));
        ObjPessoaJuridica.Telefone:= Trim(edtTelefoneJuridica.Text);
        ObjPessoaJuridica.Celular:= Trim(edtCelularJuridica.Text);
        if cbxInsentoInscEstadual.Checked = True then
          ObjPessoaJuridica.InsentoInscEstadual:= 'SIM'
        else
          ObjPessoaJuridica.InsentoInscEstadual:= 'NAO';
        if cbxOptaSimples.Checked = True then
          ObjPessoaJuridica.Simples:= 'SIM'
        else
          ObjPessoaJuridica.Simples:= 'NAO';
        ObjPessoaJuridica.Obs:= Trim(mmObsJuridica.Text);
        TPessoaJuridicaService.save(ObjPessoaJuridica);

        ObjPessoaFisica:= TPessoaFisicaService.getByIdPessoa(ObjCliente.Id);
        if Assigned(ObjPessoaFisica) then
          TPessoaFisicaService.destroyer(ObjPessoaFisica.Id);
      end;


      if (edtContatoNome1.Text <> '') or (edtContatoCargo1.Text <> '') or (edtContatoEmail1.Text <> '') or
      (edtContatoFone1.Text <> '') then
      begin
        if Assigned(ObjPessoaContatoList) and (ObjPessoaContatoList.Count > 0) then
        begin
          if Assigned(ObjPessoaContatoList.Items[0] as TPsContatoVO) then
            ObjPessoaContato:= TPessoaContatoService.getById(ObjPessoaContatoList.Items[0].id)
          else
            ObjPessoaContato:= TPsContatoVO.Create;
        end
        else
          ObjPessoaContato:= TPsContatoVO.Create;

        ObjPessoaContato.IdPessoa:=  Trim(ObjCliente.Id);
        ObjPessoaContato.Nome:= RemoveAcentos(Trim(edtContatoNome1.Text));
        ObjPessoaContato.Fone:= Trim(edtContatoFone1.Text);
        ObjPessoaContato.Email:= RemoveAcentos(Trim(edtContatoEmail1.Text));
        ObjPessoaContato.Cargo:= RemoveAcentos(Trim(edtContatoCargo1.Text));
        TPessoaContatoService.save(ObjPessoaContato);
        FreeAndNil(ObjPessoaContato);
        if Assigned(ObjPessoaContatoList) and (not ObjPessoaContatoList.Count > 1) then
          FreeAndNil(ObjPessoaContatoList);
      end
      else
      if (Assigned(ObjPessoaContatoList)) and (ObjPessoaContatoList.Count > 0) then
      begin
        if Assigned(ObjPessoaContatoList.Items[0] as TPsContatoVO) then
          TPessoaContatoService.destroyer(ObjPessoaContatoList.Items[0].id);
      end;

      if (edtContatoNome2.Text <> '') or (edtContatoCargo2.Text <> '') or (edtContatoEmail2.Text <> '') or
      (edtContatoFone2.Text <> '') then
      begin
        if Assigned(ObjPessoaContatoList) and (ObjPessoaContatoList.Count > 1) then
        begin
          if Assigned(ObjPessoaContatoList.Items[1] as TPsContatoVO) then
            ObjPessoaContato:= TPessoaContatoService.getById(ObjPessoaContatoList.Items[1].id)
          else
            ObjPessoaContato:= TPsContatoVO.Create;
        end
        else
          ObjPessoaContato:= TPsContatoVO.Create;

        ObjPessoaContato.IdPessoa:=  Trim(ObjCliente.Id);
        ObjPessoaContato.Nome:= RemoveAcentos(Trim(edtContatoNome2.Text));
        ObjPessoaContato.Fone:= Trim(edtContatoFone2.Text);
        ObjPessoaContato.Email:= RemoveAcentos(Trim(edtContatoEmail2.Text));
        ObjPessoaContato.Cargo:= RemoveAcentos(Trim(edtContatoCargo2.Text));
        TPessoaContatoService.save(ObjPessoaContato);
        FreeAndNil(ObjPessoaContato);
      end
      else
      if (Assigned(ObjPessoaContatoList)) and (ObjPessoaContatoList.Count > 1) then
      begin
        if Assigned(ObjPessoaContatoList.Items[1] as TPsContatoVO) then
          TPessoaContatoService.destroyer(ObjPessoaContatoList.Items[1].id);
      end;

      Close;
    end;
  end
  else
    Mensagem(Msg,0,1);
end;

procedure TFClienteStore.cbxTipoPessoaFisicaChange(Sender: TObject);
begin
  if cbxTipoPessoaFisica.ItemIndex = 1 then
  begin
    pnlPessoaFisica.Height:= 1;
    pnlPessoaJuridica.Height:= 223;
    cbxTipoPessoaJuridica.ItemIndex:= 1;
    pnlPessoaFisica.Enabled:= False;
    pnlPessoaJuridica.Enabled:= True;
  end;
end;

procedure TFClienteStore.cbxTipoPessoaJuridicaChange(Sender: TObject);
begin
  if cbxTipoPessoaJuridica.ItemIndex = 0 then
  begin
    pnlPessoaFisica.Height:= 173;
    pnlPessoaJuridica.Height:= 1;
    cbxTipoPessoaFisica.ItemIndex:= 0;
    pnlPessoaFisica.Enabled:= True;
    pnlPessoaJuridica.Enabled:= False;
  end;
end;

procedure TFClienteStore.edtContatoCargo2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    pnlContato.Height:= 1;
    pnlEndereco.Height:= 92;
  end;
end;

procedure TFClienteStore.FormDestroy(Sender: TObject);
begin
  FreeAndNil(ObjCliente);
  FreeAndNil(ObjPessoaFisica);
  FreeAndNil(ObjPessoaJuridica);
  FreeAndNil(ObjPessoaContato);
  FreeAndNil(ObjPessoaContatoList);
end;

procedure TFClienteStore.FormShow(Sender: TObject);
begin
  edtNomeCliente.SetFocus;
end;

procedure TFClienteStore.Label11Click(Sender: TObject);
begin
  if pnlPessoaFisica.Enabled = True then
  begin
    if pnlPessoaFisica.Height = 1 then
    begin
      pnlPessoaFisica.Height:= 173;
      pnlContato.Height:= 1;
      pnlEndereco.Height:= 1;
    end
    else
      pnlPessoaFisica.Height:= 1;
  end
  else
  if pnlPessoaJuridica.Enabled = True then
  begin
    if pnlPessoaJuridica.Height = 1 then
    begin
      pnlPessoaJuridica.Height:= 223;
      pnlContato.Height:= 1;
      pnlEndereco.Height:= 1;
    end
    else
      pnlPessoaJuridica.Height:= 1;
  end;
end;

procedure TFClienteStore.Label13Click(Sender: TObject);
begin
  if pnlEndereco.Height = 1 then
  begin
    pnlEndereco.Height:= 92;
    pnlPessoaFisica.Height:= 1;
    pnlPessoaJuridica.Height:= 1;
    pnlContato.Height:= 1;
  end
  else
    pnlEndereco.Height:= 1;
end;

procedure TFClienteStore.Label13MouseEnter(Sender: TObject);
begin
  TLabel(Sender).Font.Style:= [TFontStyle.fsUnderline];
end;

procedure TFClienteStore.Label13MouseLeave(Sender: TObject);
begin
  TLabel(Sender).Font.Style:= [];
end;

procedure TFClienteStore.Label1Click(Sender: TObject);
begin
  if pnlContato.Height = 1 then
  begin
    pnlContato.Height:= 92;
    pnlEndereco.Height:= 1;
    pnlPessoaFisica.Height:= 1;
    pnlPessoaJuridica.Height:= 1;
  end
  else
    pnlContato.Height:= 1;
end;

procedure TFClienteStore.edtNomeClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    if pnlPessoaFisica.Enabled = True then
    begin
      pnlPessoaFisica.Height:= 173;
      pnlContato.Height:= 1;
      pnlEndereco.Height:= 1;
    end
    else
    if pnlPessoaJuridica.Enabled = True then
    begin
      pnlPessoaJuridica.Height:= 223;
      pnlContato.Height:= 1;
      pnlEndereco.Height:= 1;
    end;
  end;
end;

procedure TFClienteStore.mmObsJuridicaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    pnlPessoaJuridica.Height:= 1;
    pnlContato.Height:= 92;
  end;
end;

procedure TFClienteStore.mmPessoaFisicaObsKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    pnlPessoaFisica.Height:= 1;
    pnlContato.Height:= 92;
  end;
end;

function TFClienteStore.Validacoes: String;
begin
  Result:= '';
  if edtNomeCliente.Text = '' then
    Result:= 'O Nome do cliente não pode ficar vazio!';

  if pnlPessoaFisica.Enabled = True then
  begin
    if edtCPF.Text <> '' then
    begin
      if ValidaCPF(edtCPF.Text) = False then
        Result:= 'CPF fornecido é inválido!';
    end;

    if (edtTelefoneFisica.Text <> '') and (Length(edtTelefoneFisica.Text) < 10) then
      Result:= 'Telefone Comercial deve conter no minimo 9 caracteres. Obs: Necessário o prefixo!';
    if (edtCelularFisica.Text <> '') and (Length(edtCelularFisica.Text) < 10) then
      Result:= 'Telefone Celular deve conter no minimo 9 caracteres. Obs: Necessário o prefixo!';
  end
  else
  if pnlPessoaJuridica.Enabled = True then
  begin
    if edtCNPJ.Text <> '' then
    begin
      if ValidaCNPJ(edtCNPJ.Text) = False then
        Result:= 'CNPJ fornecido é inválido!';
    end;

    if (edtTelefoneJuridica.Text <> '') and (Length(edtTelefoneJuridica.Text) < 10) then
      Result:= 'Telefone Comercial deve conter no minimo 9 caracteres. Obs: Necessário o prefixo!';
    if (edtCelularJuridica.Text <> '') and (Length(edtCelularJuridica.Text) < 10) then
      Result:= 'Telefone Celular deve conter no minimo 9 caracteres. Obs: Necessário o prefixo!';
  end;

  if (edtContatoFone1.Text <> '') and (Length(edtContatoFone1.Text) < 10) then
    Result:= 'Fone do Contato 1 deve conter no minimo 9 caracteres. Obs: Necessário o prefixo!';
  if (edtContatoFone2.Text <> '') and (Length(edtContatoFone2.Text) < 10) then
    Result:= 'Fone do Contato 2 deve conter no minimo 9 caracteres. Obs: Necessário o prefixo!';

  if (edtCEP.Text <> '') and (Length(edtCep.Text) < 8) then
    Result:= 'CEP fornecido não é válido!';
end;

end.
