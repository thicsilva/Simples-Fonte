unit OSStore;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ModeloStore, Vcl.Buttons,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  FnOsVO, PessoaService, PsPessoaVO, Bibli, Biblioteca, System.Actions,
  Vcl.ActnList;

type
  TFOSStore = class(TFModeloStore)
    edtCliente: TLabeledEdit;
    cbxStatusOs: TComboBox;
    Label4: TLabel;
    edtNumeroOs: TLabeledEdit;
    edtDataInicio: TDateTimePicker;
    Label5: TLabel;
    edtPrevisaoEntrega: TDateTimePicker;
    Label1: TLabel;
    edtResponsavel: TLabeledEdit;
    edtEquipamentoRecebido: TLabeledEdit;
    edtMarca: TLabeledEdit;
    edtModelo: TLabeledEdit;
    edtNSerie: TLabeledEdit;
    mmObsRecebidoEquipamento: TMemo;
    Label6: TLabel;
    mmDescPoblemaDefeito: TMemo;
    Label2: TLabel;
    mmServicoPrestado: TMemo;
    Label3: TLabel;
    mmObsInternas: TMemo;
    Label7: TLabel;
    lblTitle: TLabel;
    Bevel3: TBevel;
    imgOsPendente: TImage;
    imgSearch: TImage;
    imgOsConcluido: TImage;
    imgOsServico: TImage;
    imgOsAndamento: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure imgSearchClick(Sender: TObject);
    procedure ActionSalvarExecute(Sender: TObject);
    procedure cbxStatusOsChange(Sender: TObject);
  private
    { Private declarations }
    ObjOs: TFnOsVO;
    procedure EdtToObj;
    procedure ObjToEdt;
    function Validacoes: String;
  public
    { Public declarations }
  end;

var
  FOSStore: TFOSStore;

implementation

{$R *.dfm}

uses OSService, Cliente, Menu, Mensagem;

procedure TFOSStore.FormCreate(Sender: TObject);
begin
  ObjOs:= TOSService.getById(varBaseIdOS);
  if not Assigned(ObjOs) then
  begin
    ObjOs:= TFnOsVO.Create;
    lblTitle.Caption:= 'Alterando Ordem de Serviço';
  end
  else
  begin
    lblTitle.Caption:= 'Cadastrando Ordem de Serviço';
  end;

  ObjToEdt;
end;

procedure TFOSStore.FormDestroy(Sender: TObject);
begin
  FreeAndNil(ObjOs);
end;

procedure TFOSStore.imgSearchClick(Sender: TObject);
begin
  try
    FCliente:= TFCliente.Create(nil);
    FCliente.pnlMain.Align:= alNone;
    FCliente.pnlMain.Anchors:= [];
    FCliente.AlphaBlend:= True;
    FCliente.AlphaBlendValue:= 240;
    FCliente.pnlMain.BevelKind:= bkSoft;
    FCliente.Height:= FMenu.Height;
    FCliente.Width:= FMenu.Width;
    FCliente.Tag:= 1;
    FCliente.ShowModal;
    ObjOs.IdPessoa:= FCliente.fdmt_ModeloID.AsString;
    edtCliente.Text:= FCliente.fdmt_ModeloCLIENTE.AsString;
  finally
    FreeAndNil(FCliente);
  end;
end;

procedure TFOSStore.ObjToEdt;
var
  Cliente: TPsPessoaVO;
begin
  Cliente:= TPessoaService.getById(ObjOs.IdPessoa);
  if Assigned(Cliente) then
    edtCliente.Text:= Trim(Cliente.Nome);
  FreeAndNil(Cliente);
  cbxStatusOs.ItemIndex:= cbxStatusOs.Items.IndexOf(Trim(ObjOs.Status));
  edtNumeroOs.Text:= Trim(ObjOs.NumeroOs);
  edtDataInicio.Date:= ObjOs.DataInicio;
  edtPrevisaoEntrega.Date:= ObjOs.DataEntrega;
  edtResponsavel.Text:= Trim(ObjOs.Responsavel);
  edtEquipamentoRecebido.Text:= Trim(ObjOs.Esquipamento);
  edtNSerie.Text:= Trim(ObjOs.NSerie);
  edtMarca.Text:= Trim(ObjOs.Marca);
  edtModelo.Text:= Trim(ObjOs.Modelo);
  mmObsRecebidoEquipamento.Text:= Trim(ObjOs.ObsRecebimento);
  mmDescPoblemaDefeito.Text:= Trim(ObjOs.PoblemaDefeito);
  mmServicoPrestado.Text:= Trim(ObjOs.ServicoPrestado);
  mmObsInternas.Text:= Trim(ObjOs.ObsInterna);
end;

function TFOSStore.Validacoes: String;
begin
  Result:= '';
  if edtCliente.Text = '' then
    Result:= 'É necessário selecionar um Cliente!';
  if edtNumeroOs.Text = '' then
    Result:= 'É necessário o preenchimento do Número da O.S.';
  if edtResponsavel.Text = '' then
    Result:= 'É necessário adicionar nome do Responsável!';
  if cbxStatusOs.ItemIndex = -1 then
    Result:= 'É necessário selecionar o Status da O.S.';
end;

procedure TFOSStore.ActionSalvarExecute(Sender: TObject);
var
  Msg: String;
begin
  Msg:= Validacoes;
  if Msg = '' then
  begin
    EdtToObj;
    if TOSService.save(ObjOs) then
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

procedure TFOSStore.cbxStatusOsChange(Sender: TObject);
begin
  imgOsPendente.Visible:= cbxStatusOs.ItemIndex = 0;
  imgOsServico.Visible:= cbxStatusOs.ItemIndex = 1;
  imgOsAndamento.Visible:= cbxStatusOs.ItemIndex = 2;
  imgOsConcluido.Visible:= cbxStatusOs.ItemIndex = 3;
end;

procedure TFOSStore.EdtToObj;
begin
  ObjOs.Status:= RemoveAcentos(Trim(cbxStatusOs.Text));
  ObjOs.NumeroOs:= RemoveAcentos(Trim(edtNumeroOs.Text));
  ObjOs.DataInicio:= edtDataInicio.Date;
  ObjOs.DataEntrega:= edtPrevisaoEntrega.Date;
  ObjOs.Responsavel:= RemoveAcentos(Trim(edtResponsavel.Text));
  ObjOs.Esquipamento:= RemoveAcentos(Trim(edtEquipamentoRecebido.Text));
  ObjOs.NSerie:= RemoveAcentos(Trim(edtNSerie.Text));
  ObjOs.Marca:= RemoveAcentos(Trim(edtMarca.Text));
  ObjOs.Modelo:= RemoveAcentos(Trim(edtModelo.Text));
  ObjOs.ObsRecebimento:= RemoveAcentos(Trim(mmObsRecebidoEquipamento.Text));
  ObjOs.PoblemaDefeito:= RemoveAcentos(Trim(mmDescPoblemaDefeito.Text));
  ObjOs.ServicoPrestado:= RemoveAcentos(Trim(mmServicoPrestado.Text));
  ObjOs.ObsInterna:= RemoveAcentos(Trim(mmObsInternas.Text));
end;

end.
