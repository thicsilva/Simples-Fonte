unit MarcaEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ModeloStore, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.StdCtrls,
  PsEmpresaVO, PsPessoaVO, PessoaRepository, DadosEmpresaService,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFMarcaEmpresa = class(TFModeloStore)
    pnlTitle: TPanel;
    lblTituloForm: TLabel;
    Bevel1: TBevel;
    Panel1: TPanel;
    Image1: TImage;
    edtLogo: TLabeledEdit;
    Image3: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Panel2: TPanel;
    imgLogoEmpresa: TImage;
    procedure Image3Click(Sender: TObject);
    procedure ActionSalvarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  ObjPessoa: TPsPessoaVO;
  ObjEmpresa: TPsEmpresaVO;

  public
    { Public declarations }
  end;

var
  FMarcaEmpresa: TFMarcaEmpresa;

implementation

{$R *.dfm}

procedure TFMarcaEmpresa.ActionSalvarExecute(Sender: TObject);
var
  Local,Tipo: String;
  Tamanho: Integer;
begin
  if edtLogo.Text <> '' then
  begin
    Tamanho:= Length(ExtractFilePath(Application.ExeName)) -4;

    if Pos('.png',LowerCase(edtLogo.Text)) > 0 then
      Tipo:= '.png'
    else
    if Pos('.jpeg',LowerCase(edtLogo.Text)) > 0 then
      Tipo:= '.jpeg'
    else
      Tipo:= '';

    if Tipo <> '' then
    begin
      Local:= Copy(ExtractFilePath(Application.ExeName),0,tamanho) + 'Uploads\imagens\LogoEmpresa'+Tipo;
      CopyFile(PWideChar(edtLogo.Text),PWideChar(Local),True);

      ObjEmpresa.Logo:= Local;
      TDadosEmpresaService.save(ObjEmpresa);
      Close;
    end
    else
       Mensagem('Tipo de Arquivo não é Valido!',0,1);
  end
  else
    Mensagem('É Necessário Selecionar Uma Imagem!',0,1);
end;

procedure TFMarcaEmpresa.FormCreate(Sender: TObject);
begin
  ObjPessoa:= TPessoaRepository.getByIdEmpresa;
  ObjEmpresa:= TDadosEmpresaService.getByIdPessoa(ObjPessoa.Id);
  imgLogoEmpresa.Picture.LoadFromFile(Trim(ObjEmpresa.Logo));
end;

procedure TFMarcaEmpresa.FormDestroy(Sender: TObject);
begin
  FreeAndNil(ObjPessoa);
  FreeAndNil(ObjEmpresa);
end;

procedure TFMarcaEmpresa.Image3Click(Sender: TObject);
var
  OpenDir: TOpenDialog;
begin
  OpenDir:= TOpenDialog.Create(nil);
  if OpenDir.Execute then
    imgLogoEmpresa.Picture.LoadFromFile(OpenDir.FileName);

  edtLogo.Text:= OpenDir.FileName;
end;

end.
