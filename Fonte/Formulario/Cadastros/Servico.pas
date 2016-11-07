unit Servico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Modelo, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.Imaging.pngimage, ProdutoService;

type
  TFServico = class(TFModelo)
    fdmt_ModeloNOME: TStringField;
    fdmt_ModeloVALOR_CUSTO: TCurrencyField;
    fdmt_ModeloVALOR_VENDA: TCurrencyField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
    procedure ActionExcluirExecute(Sender: TObject);
    procedure ActionAlrerarExecute(Sender: TObject);
    procedure ActionCadastrarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FServico: TFServico;

implementation

{$R *.dfm}

uses Mensagem, Menu, ServicoStore;

procedure TFServico.ActionAlrerarExecute(Sender: TObject);
begin
  if  not fdmt_Modelo.IsEmpty then
  begin
    varBaseIdServico:= fdmt_ModeloID.AsString;
    OpenForm(FServicoStore,TFServicoStore);
    fdmt_Modelo.Open;
    TProdutoService.indexServico(fdmt_Modelo,'');
  end;
end;

procedure TFServico.ActionCadastrarExecute(Sender: TObject);
begin
  varBaseIdServico:= EmptyStr;
  OpenForm(FServicoStore,TFServicoStore);
  fdmt_Modelo.Open;
  TProdutoService.indexServico(fdmt_Modelo,'');
end;

procedure TFServico.ActionExcluirExecute(Sender: TObject);
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
            if TProdutoService.destroyer(fdmt_ModeloID.AsString) then
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

procedure TFServico.edtPesquisaChange(Sender: TObject);
begin
  if Trim(edtPesquisa.Text) <> EmptyStr then
    TProdutoService.indexServico(fdmt_Modelo,Trim(edtPesquisa.Text));
end;

procedure TFServico.FormCreate(Sender: TObject);
begin
  fdmt_Modelo.Open;
  TProdutoService.indexServico(fdmt_Modelo,'');
end;

end.
