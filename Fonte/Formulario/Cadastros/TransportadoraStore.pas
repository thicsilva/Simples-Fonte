unit TransportadoraStore;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ModeloStore, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.StdCtrls,
  PsPessoaVO, PsContatoVO, PsFisicaVO, PsJuridicaVO, Biblioteca, PessoaService,
  PessoaContatoService, PessoaJuridicaService;

type
  TFTransportadoraStore = class(TFModeloStore)
    pnlTitle: TPanel;
    lblTituloForm: TLabel;
    Bevel1: TBevel;
    pnlNomeTransportadora: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Bevel5: TBevel;
    Image2: TImage;
    edtNomeTransportadora: TLabeledEdit;
    pnlPessoaJuridica: TPanel;
    Label8: TLabel;
    Bevel4: TBevel;
    edtCNPJ: TLabeledEdit;
    cbxIndicadorInscEstadualJuridica: TComboBox;
    edtInscEstadual: TLabeledEdit;
    edtInscMunicipal: TLabeledEdit;
    pnlContato: TPanel;
    Bevel7: TBevel;
    edtTelefoneComercial: TLabeledEdit;
    edtContato: TLabeledEdit;
    edtEmail: TLabeledEdit;
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
    edtCidade: TLabeledEdit;
    pnlEnderecoTitle: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    Image3: TImage;
    pnlFrete: TPanel;
    Bevel3: TBevel;
    edtValorFrete: TLabeledEdit;
    pnlFreteTitle: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Image4: TImage;
    procedure Label11Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label13Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure edtNomeTransportadoraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCelularKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbxIndicadorInscEstadualJuridicaKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure edtCidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ActionSalvarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    ObjTransportadora: TPsPessoaVO;
    ObjPessoaJuridica: TPsJuridicaVO;
    ObjPessoaContato: TPsContatoVO;

    procedure EdtToObj;
    procedure ObjToEdt;
    function Validacoes: String;
  public
    { Public declarations }
  end;

var
  FTransportadoraStore: TFTransportadoraStore;

implementation

{$R *.dfm}

uses Mensagem, Menu;

procedure TFTransportadoraStore.ActionSalvarExecute(Sender: TObject);
var
  Msg: String;
  I: Integer;
begin
  Msg:= Validacoes;
  if Msg = '' then
  begin
    EdtToObj;
    if TPessoaService.save(ObjTransportadora) then
    begin
      if trim(ObjTransportadora.TipoPessoa) = 'JURIDICA' then
      begin
        if not Assigned(ObjPessoaJuridica) then
          ObjPessoaJuridica:= TPsJuridicaVO.Create
        else
          ObjPessoaJuridica:= TPessoaJuridicaService.getByIdPessoa(ObjTransportadora.Id);

        ObjPessoaJuridica.IdPessoa:= Trim(ObjTransportadora.Id);
        ObjPessoaJuridica.Cnpj:= Trim(edtCNPJ.Text);
        ObjPessoaJuridica.IndicadoInscEstadual:= cbxIndicadorInscEstadualJuridica.Text;
        ObjPessoaJuridica.InscEstadual:= Trim(RemoveAcentos(edtInscEstadual.Text));
        ObjPessoaJuridica.InscMunicipal:= Trim(RemoveAcentos(edtInscMunicipal.Text));
        ObjPessoaJuridica.Email:= Trim(RemoveAcentos(edtEmail.Text));
        ObjPessoaJuridica.Telefone:= Trim(edtContato.Text);
        ObjPessoaJuridica.Celular:= Trim(edtCelular.Text);
        ObjPessoaJuridica.Frete:= ConvertCurrency(edtValorFrete.Text);

        TPessoaJuridicaService.save(ObjPessoaJuridica);
      end;

      if not Assigned(ObjPessoaContato) then
        ObjPessoaContato:= TPsContatoVO.Create
      else
        ObjPessoaContato:= TPessoaContatoService.getByIdPessoa(ObjTransportadora.Id);

      ObjPessoaContato.IdPessoa:= Trim(ObjTransportadora.Id);
      ObjPessoaContato.FoneComercial:= Trim(edtTelefoneComercial.Text);
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

procedure TFTransportadoraStore.cbxIndicadorInscEstadualJuridicaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    pnlPessoaJuridica.Height:= 1;
    pnlEndereco.Height:= 1;
    pnlContato.Height:= 50;
    pnlFrete.Height:= 1;
  end;
end;

procedure TFTransportadoraStore.edtCelularKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    pnlPessoaJuridica.Height:= 1;
    pnlEndereco.Height:= 95;
    pnlContato.Height:= 1;
    pnlFrete.Height:= 1;
  end;
end;

procedure TFTransportadoraStore.edtCidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    pnlPessoaJuridica.Height:= 1;
    pnlEndereco.Height:= 1;
    pnlContato.Height:= 1;
    pnlFrete.Height:= 50;
  end;
end;

procedure TFTransportadoraStore.edtNomeTransportadoraKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    pnlPessoaJuridica.Height:= 50;
    pnlEndereco.Height:= 1;
    pnlContato.Height:= 1;
    pnlFrete.Height:= 1;
  end;
end;

procedure TFTransportadoraStore.EdtToObj;
begin
  ObjTransportadora.Nome:= Trim(edtNomeTransportadora.Text);
  ObjTransportadora.TipoPessoa:= 'JURIDICA';
  ObjTransportadora.TipoCadastro:= 'TRANSPORTADORA';
  ObjTransportadora.Cep:= Trim(edtCEP.Text);
  ObjTransportadora.Endereco:= RemoveAcentos(Trim(edtEndereco.Text));
  ObjTransportadora.Complemento:= RemoveAcentos(Trim(edtComplemento.Text));
  ObjTransportadora.Bairro:= RemoveAcentos(Trim(edtBairro.Text));
  ObjTransportadora.Cidade:= RemoveAcentos(Trim(edtCidade.Text));
end;

procedure TFTransportadoraStore.FormCreate(Sender: TObject);
begin
  ObjTransportadora:= TPessoaService.getById(varBaseIdPessoa);
  if not Assigned(ObjTransportadora) then
  begin
    ObjTransportadora:= TPsPessoaVO.Create;
    lblTituloForm.Caption:= 'Cadastro de nova Transportadora!';
  end
  else
  begin
    lblTituloForm.Caption:= 'Alterando Dados de Transportadora!';
    ObjPessoaJuridica:= TPessoaJuridicaService.getByIdPessoa(ObjTransportadora.Id);
    ObjPessoaContato:= TPessoaContatoService.getByIdPessoa(ObjTransportadora.Id);
  end;

  ObjToEdt;
end;

procedure TFTransportadoraStore.FormDestroy(Sender: TObject);
begin
  FreeAndNil(ObjTransportadora);
  FreeAndNil(ObjPessoaJuridica);
  FreeAndNil(ObjPessoaContato);
end;

procedure TFTransportadoraStore.Label11Click(Sender: TObject);
begin
  if pnlPessoaJuridica.Height = 1 then
  begin
    pnlPessoaJuridica.Height:= 50;
    pnlEndereco.Height:= 1;
    pnlContato.Height:= 1;
    pnlFrete.Height:= 1;
  end
  else
    pnlPessoaJuridica.Height:= 1;
end;

procedure TFTransportadoraStore.Label13Click(Sender: TObject);
begin
  if pnlEndereco.Height = 1 then
  begin
    pnlEndereco.Height:= 95;
    pnlContato.Height:= 1;
    pnlPessoaJuridica.Height:= 1;
    pnlFrete.Height:= 1;
  end
  else
    pnlEndereco.Height:= 1;
end;

procedure TFTransportadoraStore.Label1Click(Sender: TObject);
begin
  if pnlContato.Height = 1 then
  begin
    pnlContato.Height:= 50;
    pnlEndereco.Height:= 1;
    pnlPessoaJuridica.Height:= 1;
    pnlFrete.Height:= 1;
  end
  else
    pnlContato.Height:= 1;
end;

procedure TFTransportadoraStore.Label3Click(Sender: TObject);
begin
  if pnlFrete.Height = 1 then
  begin
    pnlFrete.Height:= 50;
    pnlEndereco.Height:= 1;
    pnlPessoaJuridica.Height:= 1;
    pnlContato.Height:= 1;
  end
  else
    pnlFrete.Height:= 1;
end;

procedure TFTransportadoraStore.ObjToEdt;
begin
  edtNomeTransportadora.Text:= Trim(ObjTransportadora.Nome);
  edtCEP.Text:= Trim(ObjTransportadora.Cep);
  edtEndereco.Text:= Trim(ObjTransportadora.Endereco);
  edtComplemento.Text:= Trim(ObjTransportadora.Complemento);
  edtBairro.Text:= Trim(ObjTransportadora.Bairro);
  edtCidade.Text:= Trim(ObjTransportadora.Cidade);

  if Assigned(ObjPessoaJuridica) then
  begin
    edtCNPJ.Text:= Trim(ObjPessoaJuridica.Cnpj);
    cbxIndicadorInscEstadualJuridica.ItemIndex:= cbxIndicadorInscEstadualJuridica.Items.IndexOf(Trim(ObjPessoaJuridica.IndicadoInscEstadual));
    edtInscEstadual.Text:= Trim(ObjPessoaJuridica.InscEstadual);
    edtInscMunicipal.Text:= Trim(ObjPessoaJuridica.InscMunicipal);
    edtEmail.Text:= Trim(ObjPessoaJuridica.Email);
    edtContato.Text:= Trim(ObjPessoaJuridica.Telefone);
    edtCelular.Text:= Trim(ObjPessoaJuridica.Celular);
    edtValorFrete.Text:= FloatToStrF(ObjPessoaJuridica.frete,ffNumber,12,2);
  end;

  if Assigned(ObjPessoaContato) then
    edtTelefoneComercial.Text:= Trim(ObjPessoaContato.FoneComercial);

end;

function TFTransportadoraStore.Validacoes: String;
begin
  Result:= '';
  if edtNomeTransportadora.Text = '' then
    Result:= 'O Nome do fornecedor não pode ficar vazio!';

  if (edtContato.Text <> '') and (Length(edtContato.Text) < 10) then
    Result:= 'Telefone Comercial deve conter no minimo 9 caracteres. Obs: Necessário o prefixo!';
  if (edtCelular.Text <> '') and (Length(edtCelular.Text) < 10) then
    Result:= 'Telefone Celular deve conter no minimo 9 caracteres. Obs: Necessário o prefixo!';

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

  if (edtCEP.Text <> '') and (Length(edtCep.Text) < 8) then
    Result:= 'CEP fornecido não é válido!';
end;

end.
