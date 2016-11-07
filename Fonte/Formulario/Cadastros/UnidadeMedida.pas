unit UnidadeMedida;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Modelo, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.Imaging.pngimage;

type
  TFUnidadeMedida = class(TFModelo)
    fdmt_ModeloNOME: TStringField;
    fdmt_ModeloSIMBOLO: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUnidadeMedida: TFUnidadeMedida;

implementation

{$R *.dfm}

uses ProdutoMedidaService;

procedure TFUnidadeMedida.edtPesquisaChange(Sender: TObject);
begin
  if Trim(edtPesquisa.Text) <> EmptyStr then
    TProdutoMedidaService.index(fdmt_Modelo,Trim(edtPesquisa.Text));
end;

procedure TFUnidadeMedida.FormCreate(Sender: TObject);
begin
  fdmt_Modelo.Open;
  TProdutoMedidaService.index(fdmt_Modelo,'');
end;

end.
