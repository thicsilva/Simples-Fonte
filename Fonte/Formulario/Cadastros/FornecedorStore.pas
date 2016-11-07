unit FornecedorStore;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ModeloStore, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.StdCtrls,
  Vcl.ComCtrls, PsPessoaVO, PessoaService, PsJuridicaVO, PsFisicaVO, PsContatoVO,
  System.Generics.Collections, PessoaFisicaService, PessoaJuridicaService,
  PessoaContatoRepository, PessoaContatoService, Biblioteca;

type
  TFFornecedorStore = class(TFModeloStore)
    pnlTitle: TPanel;
    lblTituloForm: TLabel;
    Bevel1: TBevel;
    pnlNomeFornecedor: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Bevel5: TBevel;
    Image2: TImage;
    edtNomeFornecedor: TLabeledEdit;
    pnlPessoaFisica: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Bevel3: TBevel;
    edtCPF: TLabeledEdit;
    cbxTipoPessoaFisica: TComboBox;
    cbxIndicadorInscEstadual: TComboBox;
    edtRG: TLabeledEdit;
    edtIdentificadorEstrangeiroFisica: TLabeledEdit;
    edtDataNascimento: TDateTimePicker;
    pnlPessoaJuridica: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Bevel4: TBevel;
    edtCNPJ: TLabeledEdit;
    cbxTipoPessoaJuridica: TComboBox;
    cbxIndicadorInscEstadualJuridica: TComboBox;
    edtRazaoSocial: TLabeledEdit;
    edtInscEstadual: TLabeledEdit;
    edtInscMunicipal: TLabeledEdit;
    edtDataFundacao: TDateTimePicker;
    edtIdentificadorEstrangeiroJuridica: TLabeledEdit;
    pnlContato: TPanel;
    Bevel7: TBevel;
    edtTelefoneComercial: TLabeledEdit;
    edtContato: TLabeledEdit;
    edtEmail: TLabeledEdit;
    edtTelefoneResidencial: TLabeledEdit;
    edtCelular: TLabeledEdit;
    pnlContatoTitle: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    pnlEndereco: TPanel;
    Bevel6: TBevel;
    edtCEP: TLabeledEdit;
    edtComplemento: TLabeledEdit;
    edtBairro: TLabeledEdit;
    edtEndereco: TLabeledEdit;
    edtNumero: TLabeledEdit;
    edtCidade: TLabeledEdit;
    pnlEnderecoTitle: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    Image3: TImage;
    pnlObsTitle: TPanel;
    Label6: TLabel;
    Label10: TLabel;
    pnlObs: TPanel;
    Bevel8: TBevel;
    Label15: TLabel;
    mmObs: TMemo;
    procedure Label11Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label13Click(Sender: TObject);
    procedure cbxTipoPessoaFisicaChange(Sender: TObject);
    procedure cbxTipoPessoaJuridicaChange(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionSalvarExecute(Sender: TObject);
    procedure edtNomeFornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtIdentificadorEstrangeiroFisicaKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure edtIdentificadorEstrangeiroJuridicaKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure edtCelularKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    ObjFornecedor: TPsPessoaVO;
    ObjPessoaFisica: TPsFisicaVO;
    ObjPessoaJuridica: TPsJuridicaVO;
    ObjPessoaContato: TPsContatoVO;

    procedure EdtToObj;
    procedure ObjToEdt;
    function Validacoes: String;
  public
    { Public declarations }
  end;

var
  FFornecedorStore: TFFornecedorStore;

implementation

{$R *.dfm}

uses Mensagem, Menu;

procedure TFFornecedorStore.ActionSalvarExecute(Sender: TObject);
var
  Msg: String;
  I: Integer;
begin
  Msg:= Validacoes;
  if Msg = '' then
  begin
    EdtToObj;
    if TPessoaService.save(ObjFornecedor) then
    begin
      if trim(ObjFornecedor.TipoPessoa) = 'FISICA' then
      begin
        if not Assigned(ObjPessoaFisica) then
          ObjPessoaFisica:= TPsFisicaVO.Create
        else
          ObjPessoaFisica:= TPessoaFisicaService.getByIdPessoa(ObjFornecedor.Id);

        ObjPessoaFisica.IdPessoa:= Trim(ObjFornecedor.Id);
        ObjPessoaFisica.Cpf:= Trim(edtCPF.Text);
        ObjPessoaFisica.IndicadoInscEstadual:= RemoveAcentos(cbxIndicadorInscEstadual.Text);
        ObjPessoaFisica.Rg:= Trim(edtRG.Text);
        ObjPessoaFisica.Email:= Trim(RemoveAcentos(edtEmail.Text));
        ObjPessoaFisica.Telefone:= Trim(edtContato.Text);
        ObjPessoaFisica.Celular:= Trim(edtCelular.Text);
        ObjPessoaFisica.Nascimento:= edtDataNascimento.Date;
        ObjPessoaFisica.Obs:= Trim(RemoveAcentos(mmObs.Text));
        ObjPessoaFisica.IdenEstrangeiro:= RemoveAcentos(Trim(edtIdentificadorEstrangeiroFisica.Text));
        TPessoaFisicaService.save(ObjPessoaFisica);

        ObjPessoaJuridica:= TPessoaJuridicaService.getByIdPessoa(ObjFornecedor.Id);
        if Assigned(ObjPessoaJuridica) then
          TPessoaJuridicaService.destroyer(ObjPessoaJuridica.Id);
      end
      else
      if trim(ObjFornecedor.TipoPessoa) = 'JURIDICA' then
      begin
        if not Assigned(ObjPessoaJuridica) then
          ObjPessoaJuridica:= TPsJuridicaVO.Create
        else
          ObjPessoaJuridica:= TPessoaJuridicaService.getByIdPessoa(ObjFornecedor.Id);

        ObjPessoaJuridica.IdPessoa:= Trim(ObjFornecedor.Id);
        ObjPessoaJuridica.Cnpj:= Trim(edtCNPJ.Text);
        ObjPessoaJuridica.RazaoSocial:= Trim(RemoveAcentos(edtRazaoSocial.Text));
        ObjPessoaJuridica.IndicadoInscEstadual:= cbxIndicadorInscEstadualJuridica.Text;
        ObjPessoaJuridica.InscEstadual:= Trim(RemoveAcentos(edtInscEstadual.Text));
        ObjPessoaJuridica.InscMunicipal:= Trim(RemoveAcentos(edtInscMunicipal.Text));
        ObjPessoaJuridica.DataFundacao:= edtDataFundacao.Date;
        ObjPessoaJuridica.Email:= Trim(RemoveAcentos(edtEmail.Text));
        ObjPessoaJuridica.Telefone:= Trim(edtContato.Text);
        ObjPessoaJuridica.Celular:= Trim(edtCelular.Text);
        ObjPessoaJuridica.Obs:= Trim(mmObs.Text);
        ObjPessoaJuridica.IdenEstrangeiro:= RemoveAcentos(Trim(edtIdentificadorEstrangeiroJuridica.Text));
        TPessoaJuridicaService.save(ObjPessoaJuridica);

        ObjPessoaFisica:= TPessoaFisicaService.getByIdPessoa(ObjFornecedor.Id);
        if Assigned(ObjPessoaFisica) then
          TPessoaFisicaService.destroyer(ObjPessoaFisica.Id);
      end;

      if not Assigned(ObjPessoaContato) then
        ObjPessoaContato:= TPsContatoVO.Create
      else
        ObjPessoaContato:= TPessoaContatoService.getByIdPessoa(ObjFornecedor.Id);

      ObjPessoaContato.IdPessoa:= Trim(ObjFornecedor.Id);
      ObjPessoaContato.FoneComercial:= Trim(edtTelefoneComercial.Text);
      ObjPessoaContato.FoneResidencial:= Trim(edtTelefoneResidencial.Text);
      TPessoaContatoService.save(ObjPessoaContato);

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

procedure TFFornecedorStore.cbxTipoPessoaFisicaChange(Sender: TObject);
begin
  if cbxTipoPessoaFisica.ItemIndex = 1 then
  begin
    pnlPessoaFisica.Height:= 1;
    pnlPessoaJuridica.Height:= 95;
    cbxTipoPessoaJuridica.ItemIndex:= 1;
    pnlPessoaFisica.Enabled:= False;
    pnlPessoaJuridica.Enabled:= True;
  end;
end;

procedure TFFornecedorStore.cbxTipoPessoaJuridicaChange(Sender: TObject);
begin
  if cbxTipoPessoaJuridica.ItemIndex = 0 then
  begin
    pnlPessoaFisica.Height:= 95;
    pnlPessoaJuridica.Height:= 1;
    cbxTipoPessoaFisica.ItemIndex:= 0;
    pnlPessoaFisica.Enabled:= True;
    pnlPessoaJuridica.Enabled:= False;
  end;
end;

procedure TFFornecedorStore.edtCelularKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    pnlContato.Height:= 1;
    pnlEndereco.Height:= 92;
  end;
end;

procedure TFFornecedorStore.edtCidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    pnlContato.Height:= 1;
    pnlObs.Height:= 101;
  end;
end;

procedure TFFornecedorStore.edtIdentificadorEstrangeiroFisicaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    pnlPessoaFisica.Height:= 1;
    pnlContato.Height:= 92;
  end;
end;

procedure TFFornecedorStore.edtIdentificadorEstrangeiroJuridicaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    pnlPessoaJuridica.Height:= 1;
    pnlContato.Height:= 92;
  end;
end;

procedure TFFornecedorStore.edtNomeFornecedorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    if pnlPessoaFisica.Enabled = True then
    begin
      pnlPessoaFisica.Height:= 95;
      pnlContato.Height:= 1;
      pnlEndereco.Height:= 1;
      pnlObs.Height:= 1;
    end
    else
    if pnlPessoaJuridica.Enabled = True then
    begin
      pnlPessoaJuridica.Height:= 95;
      pnlContato.Height:= 1;
      pnlEndereco.Height:= 1;
      pnlObs.Height:= 1;
    end;
  end;
end;

procedure TFFornecedorStore.EdtToObj;
begin
  ObjFornecedor.Nome:= Trim(edtNomeFornecedor.Text);
  if pnlPessoaFisica.Enabled = True then
    ObjFornecedor.TipoPessoa:= 'FISICA'
  else
    ObjFornecedor.TipoPessoa:= 'JURIDICA';
  ObjFornecedor.TipoCadastro:= 'FORNECEDOR';
  ObjFornecedor.Cep:= Trim(edtCEP.Text);
  ObjFornecedor.Endereco:= RemoveAcentos(Trim(edtEndereco.Text));
  ObjFornecedor.Numero:= Trim(edtNumero.Text);
  ObjFornecedor.Complemento:= RemoveAcentos(Trim(edtComplemento.Text));
  ObjFornecedor.Bairro:= RemoveAcentos(Trim(edtBairro.Text));
  ObjFornecedor.Cidade:= RemoveAcentos(Trim(edtCidade.Text));
end;

procedure TFFornecedorStore.FormCreate(Sender: TObject);
begin
  ObjFornecedor:= TPessoaService.getById(varBaseIdPessoa);
  if not Assigned(ObjFornecedor) then
  begin
    ObjFornecedor:= TPsPessoaVO.Create;
    lblTituloForm.Caption:= 'Cadastro de novo Fornecedor!';
  end
  else
  begin
    lblTituloForm.Caption:= 'Alterando Dados de Fornecedor!';
    if Trim(ObjFornecedor.TipoPessoa) = 'FISICA' then
      ObjPessoaFisica:= TPessoaFisicaService.getByIdPessoa(ObjFornecedor.Id)
    else
    if Trim(ObjFornecedor.TipoPessoa) = 'JURIDICA' then
      ObjPessoaJuridica:= TPessoaJuridicaService.getByIdPessoa(ObjFornecedor.Id);
    ObjPessoaContato:= TPessoaContatoService.getByIdPessoa(ObjFornecedor.Id);
  end;

  ObjToEdt;
end;

procedure TFFornecedorStore.FormDestroy(Sender: TObject);
begin
  FreeAndNil(ObjFornecedor);
  FreeAndNil(ObjPessoaFisica);
  FreeAndNil(ObjPessoaJuridica);
  FreeAndNil(ObjPessoaContato);
end;

procedure TFFornecedorStore.Label11Click(Sender: TObject);
begin
  if pnlPessoaFisica.Enabled = True then
  begin
    if pnlPessoaFisica.Height = 1 then
    begin
      pnlPessoaFisica.Height:= 95;
      pnlContato.Height:= 1;
      pnlEndereco.Height:= 1;
      pnlObs.Height:= 1;
    end
    else
      pnlPessoaFisica.Height:= 1;
  end
  else
  if pnlPessoaJuridica.Enabled = True then
  begin
    if pnlPessoaJuridica.Height = 1 then
    begin
      pnlPessoaJuridica.Height:= 95;
      pnlContato.Height:= 1;
      pnlEndereco.Height:= 1;
      pnlObs.Height:= 1;
    end
    else
      pnlPessoaJuridica.Height:= 1;
  end;
end;

procedure TFFornecedorStore.Label13Click(Sender: TObject);
begin
  if pnlEndereco.Height = 1 then
  begin
    pnlEndereco.Height:= 92;
    pnlPessoaFisica.Height:= 1;
    pnlPessoaJuridica.Height:= 1;
    pnlContato.Height:= 1;
    pnlObs.Height:= 1;
  end
  else
    pnlEndereco.Height:= 1;
end;

procedure TFFornecedorStore.Label1Click(Sender: TObject);
begin
  if pnlContato.Height = 1 then
  begin
    pnlContato.Height:= 92;
    pnlEndereco.Height:= 1;
    pnlPessoaFisica.Height:= 1;
    pnlPessoaJuridica.Height:= 1;
    pnlObs.Height:= 1;
  end
  else
    pnlContato.Height:= 1;
end;

procedure TFFornecedorStore.Label6Click(Sender: TObject);
begin
  if pnlObs.Height = 1 then
  begin
    pnlObs.Height:= 101;
    pnlPessoaFisica.Height:= 1;
    pnlPessoaJuridica.Height:= 1;
    pnlContato.Height:= 1;
    pnlEndereco.height:= 1;
  end
  else
    pnlObs.Height:= 1;
end;

procedure TFFornecedorStore.ObjToEdt;
begin
  edtNomeFornecedor.Text:= Trim(ObjFornecedor.Nome);
  edtCEP.Text:= Trim(ObjFornecedor.Cep);
  edtEndereco.Text:= Trim(ObjFornecedor.Endereco);
  edtNumero.Text:= Trim(ObjFornecedor.Numero);
  edtComplemento.Text:= Trim(ObjFornecedor.Complemento);
  edtBairro.Text:= Trim(ObjFornecedor.Bairro);
  edtCidade.Text:= Trim(ObjFornecedor.Cidade);

  if Assigned(ObjPessoaFisica) then
  begin
    pnlPessoaFisica.Enabled:= True;
    pnlPessoaJuridica.Enabled:= False;
    cbxTipoPessoaFisica.ItemIndex:= 0;

    edtCPF.Text:= Trim(ObjPessoaFisica.Cpf);
    cbxIndicadorInscEstadual.ItemIndex:= cbxIndicadorInscEstadual.Items.IndexOf(Trim(ObjPessoaFisica.IndicadoInscEstadual));
    edtRG.Text:= Trim(ObjPessoaFisica.Rg);
    edtEmail.Text:= Trim(ObjPessoaFisica.Email);
    edtContato.Text:= Trim(ObjPessoaFisica.Telefone);
    edtCelular.Text:= Trim(ObjPessoaFisica.Celular);
    edtDataNascimento.Date:= ObjPessoaFisica.Nascimento;
    edtIdentificadorEstrangeiroFisica.Text:= Trim(ObjPessoaFisica.IdenEstrangeiro);
    mmObs.Text:= Trim(ObjPessoaFisica.Obs);
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
    edtDataFundacao.Date:= ObjPessoaJuridica.DataFundacao;
    edtEmail.Text:= Trim(ObjPessoaJuridica.Email);
    edtContato.Text:= Trim(ObjPessoaJuridica.Telefone);
    edtCelular.Text:= Trim(ObjPessoaJuridica.Celular);
    edtIdentificadorEstrangeiroJuridica.Text:= Trim(ObjPessoaJuridica.IdenEstrangeiro);
    mmObs.Text:= Trim(ObjPessoaJuridica.Obs);
  end;

  if Assigned(ObjPessoaContato) then
  begin
    edtTelefoneComercial.Text:= Trim(ObjPessoaContato.FoneComercial);
    edtTelefoneResidencial.Text:= Trim(ObjPessoaContato.FoneResidencial);
  end;
end;

function TFFornecedorStore.Validacoes: String;
begin
  Result:= '';
  if edtNomeFornecedor.Text = '' then
    Result:= 'O Nome do fornecedor não pode ficar vazio!';

  if (edtContato.Text <> '') and (Length(edtContato.Text) < 10) then
    Result:= 'Telefone Comercial deve conter no minimo 9 caracteres. Obs: Necessário o prefixo!';
  if (edtCelular.Text <> '') and (Length(edtCelular.Text) < 10) then
    Result:= 'Telefone Celular deve conter no minimo 9 caracteres. Obs: Necessário o prefixo!';

  if pnlPessoaFisica.Enabled = True then
  begin
    if edtCPF.Text <> '' then
    begin
      if ValidaCPF(edtCPF.Text) = False then
        Result:= 'CPF fornecido é inválido!';
    end;
  end
  else
  if pnlPessoaJuridica.Enabled = True then
  begin
    if edtCNPJ.Text <> '' then
    begin
      if ValidaCNPJ(edtCNPJ.Text) = False then
        Result:= 'CNPJ fornecido é inválido!';
    end;
  end;

  if (edtTelefoneComercial.Text <> '') and (Length(edtTelefoneComercial.Text) < 10) then
    Result:= 'Telefone Comercial deve conter no minimo 9 caracteres. Obs: Necessário o prefixo!';
  if (edtTelefoneResidencial.Text <> '') and (Length(edtTelefoneResidencial.Text) < 10) then
    Result:= 'Telefone Redidencial deve conter no minimo 9 caracteres. Obs: Necessário o prefixo!';

  if (edtCEP.Text <> '') and (Length(edtCep.Text) < 8) then
    Result:= 'CEP fornecido não é válido!';
end;

end.
