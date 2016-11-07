unit CentroCustoStore;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ModeloStore, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, FnCentroCustoVO,
  Vcl.StdCtrls, Biblioteca;

type
  TFCentroCustoStore = class(TFModeloStore)
    pnlTitle: TPanel;
    lblTituloForm: TLabel;
    Bevel1: TBevel;
    edtNome: TLabeledEdit;
    procedure ActionSalvarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    ObjCentroCusto: TFnCentroCustoVO;

    procedure EdtToObj;
    procedure ObjToEdt;
  public
    { Public declarations }
  end;

var
  FCentroCustoStore: TFCentroCustoStore;

implementation

{$R *.dfm}

uses CentroCustoService, Mensagem, Menu;

{ TFCentroCustoStore }

procedure TFCentroCustoStore.ActionSalvarExecute(Sender: TObject);
begin
  if edtNome.Text <> '' then
  begin
    EdtToObj;
    if TCentroCustoService.save(ObjCentroCusto) then
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
      FMensagem.Label2.Caption:= 'É necessário o preenchimento do campo Nome!';
      FMensagem.ShowModal;
    finally
      FreeAndNil(FMensagem);
    end;
  end;
end;

procedure TFCentroCustoStore.EdtToObj;
begin
  ObjCentroCusto.Nome:= RemoveAcentos(Trim(edtNome.Text));
end;

procedure TFCentroCustoStore.FormCreate(Sender: TObject);
begin
  ObjCentroCusto:= TCentroCustoService.getById(varBaseIdCategoria);
  if not Assigned(ObjCentroCusto) then
  begin
    ObjCentroCusto:= TFnCentroCustoVO.Create;
    lblTituloForm.Caption:= 'Cadastro de novo Centro de Custo!';
  end
  else
  begin
    lblTituloForm.Caption:= 'Alterando Dados de Centro de Custo!';
  end;

  ObjToEdt;
end;

procedure TFCentroCustoStore.FormDestroy(Sender: TObject);
begin
  FreeAndNil(ObjCentroCusto);
end;

procedure TFCentroCustoStore.ObjToEdt;
begin
  edtNome.Text:= Trim(ObjCentroCusto.Nome);
end;

end.
