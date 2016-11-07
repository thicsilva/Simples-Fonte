unit OS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Modelo, Data.DB, Vcl.StdCtrls,
  Vcl.WinXCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList;

type
  TFOS = class(TFModelo)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    fdmt_ModeloDATA_INICIO: TDateField;
    fdmt_ModeloDATA_ENTREGA: TDateField;
    fdmt_ModeloNUMERO_OS: TStringField;
    fdmt_ModeloCLIENTE: TStringField;
    fdmt_ModeloSTATUS: TStringField;
    fdmt_ModeloRESPONSAVEL: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
    procedure ActionCadastrarExecute(Sender: TObject);
    procedure ActionAlrerarExecute(Sender: TObject);
    procedure ActionExcluirExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOS: TFOS;

implementation

{$R *.dfm}

uses OSStore, OSService, Mensagem, Menu;

procedure TFOS.ActionAlrerarExecute(Sender: TObject);
begin
  if  not fdmt_Modelo.IsEmpty then
  begin
    varBaseIdOS:= fdmt_ModeloID.AsString;
    OpenForm(FOSStore,TFOSStore);
    fdmt_Modelo.Open;
    TOSService.index(fdmt_Modelo,'');
  end;
end;

procedure TFOS.ActionCadastrarExecute(Sender: TObject);
begin
  varBaseIdOS:= EmptyStr;
  OpenForm(FOSStore,TFOSStore);
  fdmt_Modelo.Open;
  TOSService.index(fdmt_Modelo,'');
end;

procedure TFOS.ActionExcluirExecute(Sender: TObject);
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
            if TOSService.destroyer(fdmt_ModeloID.AsString) then
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

procedure TFOS.edtPesquisaChange(Sender: TObject);
begin
  if Trim(edtPesquisa.Text) <> EmptyStr then
    TOSService.index(fdmt_Modelo,Trim(edtPesquisa.Text));
end;

procedure TFOS.FormCreate(Sender: TObject);
begin
  fdmt_Modelo.Open;
  TOSService.index(fdmt_Modelo,'');
end;

end.
