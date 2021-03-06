unit Compra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Modelo, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.Imaging.pngimage, CompraService,System.Generics.Collections,
  FnCrediarioVO, CrediarioRepository;

type
  TFCompra = class(TFModelo)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    fdmt_ModeloDATA_COMPRA: TDateField;
    fdmt_ModeloCOMPRA: TStringField;
    fdmt_ModeloFORNECEDOR: TStringField;
    fdmt_ModeloVENCIMENTO: TDateField;
    fdmt_ModeloPAGAMENTO: TStringField;
    fdmt_ModeloVALOR: TCurrencyField;
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
  FCompra: TFCompra;

implementation

{$R *.dfm}

uses CompraStore, Mensagem, Menu;

procedure TFCompra.ActionAlrerarExecute(Sender: TObject);
var
  PossueParcelaPaga: TList<TFnCrediarioVO>;
begin
  if  not fdmt_Modelo.IsEmpty then
  begin
    PossueParcelaPaga:= TCrediarioRepository.indexCompraPaga(fdmt_ModeloID.AsString);
    if not Assigned(PossueParcelaPaga) then
    begin
      varBaseIdCompra:= fdmt_ModeloID.AsString;
      OpenForm(FCompraStore,TFCompraStore);
      fdmt_Modelo.Open;
      TCompraService.index(fdmt_Modelo,'');
    end
    else
      Mensagem('Est� compra possue parcelas j� paga, logo a mesma n�o pode ser alterada.',0,1);
    FreeAndNil(PossueParcelaPaga);
  end;
end;

procedure TFCompra.ActionCadastrarExecute(Sender: TObject);
begin
  varBaseIdCompra:= EmptyStr;
  OpenForm(FCompraStore,TFCompraStore);
  fdmt_Modelo.Open;
  TCompraService.index(fdmt_Modelo,'');
end;

procedure TFCompra.ActionExcluirExecute(Sender: TObject);
var
  PossueParcelaPaga: TList<TFnCrediarioVO>;
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
            PossueParcelaPaga:= TCrediarioRepository.indexCompraPaga(fdmt_ModeloID.AsString);
            if not Assigned(PossueParcelaPaga) then
            begin
              if TCompraService.destroyer(fdmt_ModeloID.AsString) then
                fdmt_Modelo.Delete;
            end
            else
              Mensagem('Compra '+ fdmt_ModeloCOMPRA.AsString +' possue parcelas j� paga, logo a mesma n�o pode ser alterada.',0,1);
            FreeAndNil(PossueParcelaPaga);
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

procedure TFCompra.edtPesquisaChange(Sender: TObject);
begin
  if Trim(edtPesquisa.Text) <> EmptyStr then
    TCompraService.index(fdmt_Modelo,Trim(edtPesquisa.Text));
end;

procedure TFCompra.FormCreate(Sender: TObject);
begin
  fdmt_Modelo.Open;
  TCompraService.index(fdmt_Modelo,'');
end;

end.

