unit DadosEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ModeloStore, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.StdCtrls,
  Vcl.ComCtrls, PsPessoaVO, PsEmpresaVO, PsJuridicaVO, PessoaService,
  PessoaRepository, PessoaJuridicaService, DadosEmpresaService, Biblioteca;

type
  TFDadosEmpresa = class(TFModeloStore)
    pnlTitle: TPanel;
    lblTituloForm: TLabel;
    Bevel1: TBevel;
    pnlNomeCliente: TPanel;
    Bevel5: TBevel;
    Image2: TImage;
    edtInscEstadual: TLabeledEdit;
    edtInscMunicipal: TLabeledEdit;
    Panel1: TPanel;
    Bevel3: TBevel;
    Image1: TImage;
    Image3: TImage;
    Label1: TLabel;
    edtCNPJ: TLabeledEdit;
    edtRazaoSocial: TLabeledEdit;
    edtNomeFantasia: TLabeledEdit;
    edtCNAE: TLabeledEdit;
    cbxInsentoInscEstadual: TCheckBox;
    cbxNaturezaOperacao: TComboBox;
    Label8: TLabel;
    cbxRegEspecialTributacao: TComboBox;
    Label2: TLabel;
    edtDataFundacao: TDateTimePicker;
    Label9: TLabel;
    cbxSimplesNacional: TCheckBox;
    cbxImportacaoProdutos: TCheckBox;
    pnlEndereco: TPanel;
    Bevel6: TBevel;
    edtCEP: TLabeledEdit;
    edtComplemento: TLabeledEdit;
    edtBairro: TLabeledEdit;
    edtEndereco: TLabeledEdit;
    edtNumero: TLabeledEdit;
    edtCidade: TLabeledEdit;
    Image4: TImage;
    procedure FormCreate(Sender: TObject);
    procedure cbxInsentoInscEstadualClick(Sender: TObject);
    procedure ActionSalvarExecute(Sender: TObject);
  private
    { Private declarations }
    ObjPessoa: TPsPessoaVO;
    ObjEmpresa: TPsEmpresaVO;
    ObjJuridica: TPsJuridicaVO;

    procedure EdtToObj;
    procedure ObjToEdt;
    function Validacoes: String;
  public
    { Public declarations }
  end;

var
  FDadosEmpresa: TFDadosEmpresa;

implementation

{$R *.dfm}

{ TFDadosEmpresa }

procedure TFDadosEmpresa.ActionSalvarExecute(Sender: TObject);
var
  Msg: String;
begin
  Msg:= Validacoes;
  if Msg = '' then
  begin
    EdtToObj;
    if TPessoaService.save(ObjPessoa) then
    begin
      ObjJuridica.Cnpj:= Trim(edtCNPJ.Text);
      ObjJuridica.RazaoSocial:= Trim(RemoveAcentos(edtRazaoSocial.Text));
      ObjJuridica.InscEstadual:= Trim(RemoveAcentos(edtInscEstadual.Text));
      if cbxInsentoInscEstadual.Checked = True then
        ObjJuridica.InsentoInscEstadual:= 'SIM'
      else
        ObjJuridica.InsentoInscEstadual:= 'NAO';
      ObjJuridica.InscEstadual:= Trim(edtInscEstadual.Text);
      ObjJuridica.InscMunicipal:= Trim(edtInscMunicipal.Text);
      ObjJuridica.DataFundacao:= edtDataFundacao.Date;
      if cbxSimplesNacional.Checked = True then
        ObjJuridica.Simples:= 'SIM'
      else
        ObjJuridica.Simples:= 'NAO';
      TPessoaJuridicaService.save(ObjJuridica);

      if cbxImportacaoProdutos.Checked = True then
        ObjEmpresa.ImportaProduto:= 'SIM'
      else
        ObjEmpresa.ImportaProduto:= 'NAO';
      ObjEmpresa.NaturezaOperacao:= Trim(cbxNaturezaOperacao.Text);
      ObjEmpresa.EspecialTributacao:= Trim(cbxRegEspecialTributacao.Text);
      ObjEmpresa.NomeFantasia:= Trim(RemoveAcentos(edtNomeFantasia.Text));
      TDadosEmpresaService.save(ObjEmpresa);

      Close;
    end;
  end
  else
    Mensagem(Msg,0,1);
end;

procedure TFDadosEmpresa.cbxInsentoInscEstadualClick(Sender: TObject);
begin
  if cbxInsentoInscEstadual.Checked = True then
  begin
    edtInscEstadual.Enabled:= False;
    edtInscEstadual.Text:= 'ISENTO';
  end
  else
  begin
    edtInscEstadual.Enabled:= True;
    edtInscEstadual.Text:= '';
  end;
end;

procedure TFDadosEmpresa.FormCreate(Sender: TObject);
begin
  ObjPessoa:= TPessoaRepository.getByIdEmpresa;
  ObjJuridica:= TPessoaJuridicaService.getByIdPessoa(ObjPessoa.Id);
  ObjEmpresa:= TDadosEmpresaService.getByIdPessoa(ObjPessoa.Id);
  ObjToEdt;
end;

procedure TFDadosEmpresa.ObjToEdt;
begin
  edtCNPJ.Text:= Trim(ObjJuridica.Cnpj);
  edtRazaoSocial.Text:= Trim(ObjJuridica.RazaoSocial);
  edtNomeFantasia.Text:= Trim(ObjEmpresa.NomeFantasia);
  edtInscEstadual.Text:= Trim(ObjJuridica.InscEstadual);

  if Trim(ObjJuridica.InsentoInscEstadual) = 'SIM' then
  begin
    edtInscEstadual.Enabled:= False;
    edtInscEstadual.Text:= 'ISENTO';
  end
  else
  begin
    edtInscEstadual.Enabled:= True;
    edtInscEstadual.Text:= Trim(ObjJuridica.InscEstadual);
  end;

  edtInscMunicipal.Text:= Trim(ObjJuridica.InscMunicipal);
  cbxNaturezaOperacao.ItemIndex:= cbxNaturezaOperacao.Items.IndexOf(Trim(ObjEmpresa.NaturezaOperacao));
  cbxRegEspecialTributacao.ItemIndex:= cbxRegEspecialTributacao.Items.IndexOf(Trim(ObjEmpresa.EspecialTributacao));
  edtDataFundacao.Date:= ObjJuridica.DataFundacao;
  cbxSimplesNacional.Checked:= Trim(ObjJuridica.Simples) = 'SIM';
  cbxImportacaoProdutos.Checked:= TRim(ObjEmpresa.ImportaProduto) = 'SIM';

  edtCEP.Text:= Trim(ObjPessoa.Cep);
  edtEndereco.Text:= Trim(ObjPessoa.Endereco);
  edtNumero.Text:= Trim(ObjPessoa.Numero);
  edtComplemento.Text:= Trim(ObjPessoa.Complemento);
  edtBairro.Text:= Trim(ObjPessoa.Bairro);
  edtCidade.Text:= Trim(ObjPessoa.Cidade);
end;

procedure TFDadosEmpresa.EdtToObj;
begin
  ObjPessoa.Cep:= Trim(edtCEP.Text);
  ObjPessoa.Endereco:= Trim(RemoveAcentos(edtEndereco.Text));
  ObjPessoa.Numero:= Trim(RemoveAcentos(edtNumero.Text));
  ObjPessoa.Complemento:= Trim(RemoveAcentos(edtComplemento.Text));
  ObjPessoa.Bairro:= Trim(RemoveAcentos(edtBairro.Text));
  ObjPessoa.Cidade:= Trim(RemoveAcentos(edtCidade.Text));
end;

function TFDadosEmpresa.Validacoes: String;
begin
  Result:= '';
  if edtCNPJ.Text = '' then
    Result:= 'É necessário o preenchimento do CNPJ!';

  if edtRazaoSocial.Text = '' then
    Result:= 'É necessário o preenchimento da Razão Social!';

  if edtNomeFantasia.Text = '' then
    Result:= 'É necessário o preenchimento do Nome Fantasia!';
end;

end.
