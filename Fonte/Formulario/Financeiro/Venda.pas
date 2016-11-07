unit Venda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Modelo, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.Imaging.pngimage, VendaService, FnCrediarioVO,
  CrediarioRepository, System.Generics.Collections, NFEStore;

type
  TFVenda = class(TFModelo)
    fdmt_ModeloDATA_VENDA: TDateField;
    fdmt_ModeloVENDA: TStringField;
    fdmt_ModeloCLIENTE: TStringField;
    fdmt_ModeloSTATUS: TStringField;
    fdmt_ModeloNOTA_FISCAL: TStringField;
    fdmt_ModeloVALOR: TCurrencyField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Panel1: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    pnlRecusados: TPanel;
    lblValorTotalRecusados: TLabel;
    lblTotalRecusados: TLabel;
    Panel2: TPanel;
    pnlVendas: TPanel;
    lblValorTotalVendas: TLabel;
    lblTotalVendas: TLabel;
    Panel4: TPanel;
    pnlPrevisao: TPanel;
    lblValorTotalPrevisao: TLabel;
    lblPrevisao: TLabel;
    Panel5: TPanel;
    pnlOrcamentos: TPanel;
    lblValorTotalOrcamentos: TLabel;
    lblTotalOrcamentos: TLabel;
    Panel7: TPanel;
    Bevel5: TBevel;
    pnlAceitos: TPanel;
    lblValorTotalAceitos: TLabel;
    lblTotalAceitos: TLabel;
    Panel6: TPanel;
    Bevel4: TBevel;
    SpeedButton1: TSpeedButton;
    Image1: TImage;
    ActionGerarNFE: TAction;
    procedure ActionCadastrarExecute(Sender: TObject);
    procedure ActionAlrerarExecute(Sender: TObject);
    procedure ActionExcluirExecute(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionGerarNFEExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVenda: TFVenda;

implementation

{$R *.dfm}

uses VendaStore, Mensagem, Menu;

procedure TFVenda.ActionAlrerarExecute(Sender: TObject);
var
  PossueParcelaPaga: TList<TFnCrediarioVO>;
begin
  if  not fdmt_Modelo.IsEmpty then
  begin
    PossueParcelaPaga:= TCrediarioRepository.indexVendaPaga(fdmt_ModeloID.AsString);
    if not Assigned(PossueParcelaPaga) then
    begin
      varBaseIdVenda:= fdmt_ModeloID.AsString;
      OpenForm(FVendaStore,TFVendaStore);
      fdmt_Modelo.Open;
      TVendaService.index(fdmt_Modelo,'');
    end
    else
      Mensagem('Está venda possue parcelas já paga, logo a mesma não pode ser alterada.',0,1);
    FreeAndNil(PossueParcelaPaga);
  end;
end;

procedure TFVenda.ActionCadastrarExecute(Sender: TObject);
begin
  varBaseIdVenda:= EmptyStr;
  OpenForm(FVendaStore,TFVendaStore);
  fdmt_Modelo.Open;
  TVendaService.index(fdmt_Modelo,'');
end;

procedure TFVenda.ActionExcluirExecute(Sender: TObject);
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
            PossueParcelaPaga:= TCrediarioRepository.indexVendaPaga(fdmt_ModeloID.AsString);
            if not Assigned(PossueParcelaPaga) then
            begin
              if TVendaService.destroyer(fdmt_ModeloID.AsString) then
                fdmt_Modelo.Delete;
            end
            else
              Mensagem('Venda '+ fdmt_ModeloVENDA.AsString +' possue parcelas já paga, logo a mesma não pode ser Excluida.',0,1);
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

procedure TFVenda.ActionGerarNFEExecute(Sender: TObject);
begin
  OpenForm(FNFEStore,TFNFEStore);
end;

procedure TFVenda.edtPesquisaChange(Sender: TObject);
begin
  if Trim(edtPesquisa.Text) <> EmptyStr then
    TVendaService.index(fdmt_Modelo,Trim(edtPesquisa.Text));
end;

procedure TFVenda.FormCreate(Sender: TObject);
var
  Tamanho: Extended;
begin
  Tamanho:= (FMenu.pnlMain.Width / 5);
  pnlRecusados.Width:= Round(Tamanho);
  pnlOrcamentos.Width:= Round(Tamanho);
  pnlAceitos.Width:= Round(Tamanho);
  pnlVendas.Width:= Round(Tamanho);
  pnlPrevisao.Width:= Round(Tamanho);

  fdmt_Modelo.Open;
  TVendaService.index(fdmt_Modelo,'');
end;

end.
