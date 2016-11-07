unit Fornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Modelo, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.Imaging.pngimage, PessoaService;

type
  TFFornecedor = class(TFModelo)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    fdmt_ModeloFORNECEDOR: TStringField;
    fdmt_ModeloCPF_CNPJ: TStringField;
    fdmt_ModeloCONTATO: TStringField;
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
  FFornecedor: TFFornecedor;

implementation

{$R *.dfm}

uses FornecedorStore, Mensagem, Menu;

procedure TFFornecedor.ActionAlrerarExecute(Sender: TObject);
begin
  if  not fdmt_Modelo.IsEmpty then
  begin
    varBaseIdPessoa:= fdmt_ModeloID.AsString;
    OpenForm(FFornecedorStore,TFFornecedorStore);
    fdmt_Modelo.Open;
    TPessoaService.indexFornecedor(fdmt_Modelo,'');
  end;
end;

procedure TFFornecedor.ActionCadastrarExecute(Sender: TObject);
begin
  varBaseIdPessoa:= EmptyStr;
  OpenForm(FFornecedorStore,TFFornecedorStore);
  fdmt_Modelo.Open;
  TPessoaService.indexFornecedor(fdmt_Modelo,'');
end;

procedure TFFornecedor.ActionExcluirExecute(Sender: TObject);
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
            if TPessoaService.destroyer(fdmt_ModeloID.AsString) then
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

procedure TFFornecedor.edtPesquisaChange(Sender: TObject);
begin
  if Trim(edtPesquisa.Text) <> EmptyStr then
    TPessoaService.indexFornecedor(fdmt_Modelo,Trim(edtPesquisa.Text));
end;

procedure TFFornecedor.FormCreate(Sender: TObject);
begin
  fdmt_Modelo.Open;
  TPessoaService.indexFornecedor(fdmt_Modelo,'');
end;

end.
