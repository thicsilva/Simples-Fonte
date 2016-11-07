unit PlanoConta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Modelo, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.Imaging.pngimage, PlanoContaService;

type
  TFPlanoConta = class(TFModelo)
    fdmt_ModeloNOME: TStringField;
    Label1: TLabel;
    fdmt_ModeloNIVEL: TIntegerField;
    procedure ActionCadastrarExecute(Sender: TObject);
    procedure ActionAlrerarExecute(Sender: TObject);
    procedure ActionExcluirExecute(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPlanoConta: TFPlanoConta;

implementation

{$R *.dfm}

uses PlanoContaStore, Mensagem, Menu;

procedure TFPlanoConta.ActionAlrerarExecute(Sender: TObject);
begin
  if not fdmt_Modelo.IsEmpty then
  begin
    varBaseIdPlanoConta:= fdmt_ModeloID.AsString;
    OpenForm(FPlanoContaStore,TFPlanoContaStore);
    fdmt_Modelo.Open;
    TPlanoContaService.index(fdmt_Modelo,'',True);
  end;
end;

procedure TFPlanoConta.ActionCadastrarExecute(Sender: TObject);
begin
  varBaseIdPlanoConta:= EmptyStr;
  OpenForm(FPlanoContaStore,TFPlanoContaStore);
  fdmt_Modelo.Open;
  TPlanoContaService.index(fdmt_Modelo,'',True);
end;

procedure TFPlanoConta.ActionExcluirExecute(Sender: TObject);
begin
  if not fdmt_Modelo.IsEmpty then
  begin
    try
      FMensagem:= TFMensagem.Create(nil);
      FMensagem.Height:= FMenu.Height;
      FMensagem.Width:= FMenu.Width;
      FMensagem.tipo:= 1;
      FMensagem.ImagemInfo:= 0;
      FMensagem.Label2.Caption:= 'Deseja realmente excluir todos os registros selecionados?';
      FMensagem.ShowModal;
      if FMensagem.Tag = 1 then
      begin
        fdmt_Modelo.First;
        while not fdmt_Modelo.Eof do
        begin
          if fdmt_ModeloMARK.AsInteger = 1 then
          begin
            if TPlanoContaService.destroyer(fdmt_ModeloID.AsString) then
              fdmt_Modelo.Delete;
          end;

          fdmt_Modelo.Next;
        end;
      end;
    finally
      FreeAndNil(FMensagem);
      fdmt_Modelo.First;
    end;
  end;
end;

procedure TFPlanoConta.edtPesquisaChange(Sender: TObject);
begin
  if Trim(edtPesquisa.Text) <> EmptyStr then
    TPlanoContaService.index(fdmt_Modelo,Trim(edtPesquisa.Text),False);
end;

procedure TFPlanoConta.FormCreate(Sender: TObject);
begin
  fdmt_Modelo.Open;
  TPlanoContaService.index(fdmt_Modelo,'',True);
end;

end.
