unit NCM_CEST;

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
  TFNCM_CEST = class(TFModelo)
    Label1: TLabel;
    Label2: TLabel;
    fdmt_ModeloCEST: TStringField;
    fdmt_ModeloNCM: TStringField;
    fdmt_ModeloDESCRICAO: TStringField;
    Label3: TLabel;
    procedure edtPesquisaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNCM_CEST: TFNCM_CEST;

implementation

{$R *.dfm}

uses ProdutoCestService;

procedure TFNCM_CEST.edtPesquisaChange(Sender: TObject);
begin
  if Trim(edtPesquisa.Text) <> EmptyStr then
    TProdutoCestService.index(fdmt_Modelo,Trim(edtPesquisa.Text));
end;

procedure TFNCM_CEST.FormCreate(Sender: TObject);
begin
  fdmt_Modelo.Open;
  TProdutoCestService.index(fdmt_Modelo,'');
end;

end.
