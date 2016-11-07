unit PlanoContaStore;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ModeloStore, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.StdCtrls,
  FnPlanoContaVO, PlanoContaService, Biblioteca;

type
  TFPlanoContaStore = class(TFModeloStore)
    pnlTitle: TPanel;
    lblTituloForm: TLabel;
    Bevel1: TBevel;
    edtCategoriaPai: TLabeledEdit;
    Label6: TLabel;
    imgSearchCategoriaPai: TImage;
    edtNomeCategoria: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure imgSearchCategoriaPaiClick(Sender: TObject);
    procedure edtCategoriaPaiKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ActionSalvarExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    ObjPlanoConta: TFnPlanoContaVO;

    procedure EdtToObj;
    procedure ObjToEdt;
    function Validacoes: String;
  public
    { Public declarations }
  end;

var
  FPlanoContaStore: TFPlanoContaStore;

implementation

{$R *.dfm}

uses PlanoConta, Menu, Mensagem;

procedure TFPlanoContaStore.ActionSalvarExecute(Sender: TObject);
var
  Msg: String;
begin
  Msg:= Validacoes;
  if Msg = '' then
  begin
    EdtToObj;
    if TPlanoContaService.save(ObjPlanoConta) then
      Close;
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

procedure TFPlanoContaStore.edtCategoriaPaiKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F1 then
    imgSearchCategoriaPaiClick(Sender)
  else
  if key = VK_BACK then
  begin
    edtCategoriaPai.Text:= '';
    ObjPlanoConta.IdPai:= '';
  end;
end;

procedure TFPlanoContaStore.EdtToObj;
var
  PlanoPai: TFnPlanoContaVO;
begin
  PlanoPai:= TPlanoContaService.getByIdPlanoPai(ObjPlanoConta.IdPai);
  if Assigned(PlanoPai) then
  begin
    ObjPlanoConta.Plano:= PlanoPai.Plano;
    ObjPlanoConta.Nivel:= PlanoPai.Nivel + 1;
  end;
  FreeAndNil(PlanoPai);
  ObjPlanoConta.Nome:= RemoveAcentos(Trim(edtNomeCategoria.Text));
end;

procedure TFPlanoContaStore.FormCreate(Sender: TObject);
begin
  ObjPlanoConta:= TPlanoContaService.getById(varBaseIdPlanoConta);
  if not Assigned(ObjPlanoConta) then
  begin
    ObjPlanoConta:= TFnPlanoContaVO.Create;
    lblTituloForm.Caption:= 'Cadastro de novo Plano de Contas!';
  end
  else
  begin
    lblTituloForm.Caption:= 'Alterando Dados de Plano de Contas!';
  end;

  ObjToEdt;
end;

procedure TFPlanoContaStore.FormDestroy(Sender: TObject);
begin
  FreeAndNil(ObjPlanoConta);
end;

procedure TFPlanoContaStore.imgSearchCategoriaPaiClick(Sender: TObject);
begin
  try
    FPlanoConta:= TFPlanoConta.Create(nil);
    FPlanoConta.pnlMain.Align:= alNone;
    FPlanoConta.pnlMain.Anchors:= [];
    FPlanoConta.AlphaBlend:= True;
    FPlanoConta.AlphaBlendValue:= 240;
    FPlanoConta.pnlMain.BevelKind:= bkSoft;
    FPlanoConta.Height:= FMenu.Height;
    FPlanoConta.Width:= FMenu.Width;
    FPlanoConta.Tag:= 1;
    FPlanoConta.ShowModal;
    ObjPlanoConta.IdPai:= FPlanoConta.fdmt_ModeloID.AsString;
    edtCategoriaPai.Text:= RemoveTracoENumeros(FPlanoConta.fdmt_ModeloNOME.AsString);
    edtCategoriaPai.Tag:= FPlanoConta.fdmt_ModeloNIVEL.AsInteger;
  finally
    FreeAndNil(FPlanoConta);
  end;
end;

procedure TFPlanoContaStore.ObjToEdt;
var
  PlanoPai: TFnPlanoContaVO;
begin
  edtNomeCategoria.Text:= Trim(ObjPlanoConta.Nome);
  PlanoPai:= TPlanoContaService.getByIdPlanoPai(ObjPlanoConta.IdPai);
  if Assigned(PlanoPai) then
    edtCategoriaPai.Text:= Trim(PlanoPai.Nome);
  FreeAndNil(PlanoPai);
end;

function TFPlanoContaStore.Validacoes: String;
begin
  Result:= '';
  if edtNomeCategoria.Text = '' then
    Result:= 'Nome da Categoria não pode Ficar Vazio!';

  if edtCategoriaPai.Text = '' then
    Result:= 'É Necessário Escolher uma Categoria Pai!';

  if edtCategoriaPai.Tag = 3 then
    Result:= 'Não é Possivel Cadastrar essa Categoria como Sendo Pai!'
end;

end.
