{******************************************************************************}
{ Projeto: Simples Sistema                                                     }
{  Um sistema como o nome mesmo já dis Simples mas que possa ser utilizado para}
{ qualquer ramo, com diferentes versões. Objetivo de obter melhor resultado a  }
{ nossos clientes.                                                             }
{                                                                              }
{ Direitos Autorais Reservados (c) 2016 Lemes Tecnologia é Arte!               }
{                                                                              }
{ Colaboradores nesse arquivo: Thiago Ribeiro Lemes de Brito                   }
{                                                                              }
{ Este software possui registro INPI de uso comercial. Utiliza-lo sem licença  }
{ implica em ações legais sob lei Nº 9.610, de 19 de fevereiro de 1998.        }
{                                                                              }
{                           Lemes Tecnologia é Arte!                           }
{                        lemestecart@lemestecart.com.br                        }
{               Rua Juares Klasner, 21 - Cotriguaçu - MT - 78330-000           }
{                                                                              }
{******************************************************************************}

{*******************************************************************************
|* Historico                                                                  |*
|*                                                                            |*
|* 07/10/2016: Primeira Versao                                                |*
|*   Thiago Ribeiro Lemes de Brito                                            |*
*******************************************************************************}
unit Modelo;

interface

uses
  //Uses da Interface
  {$REGION}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Base, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.WinXCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Imaging.pngimage, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  System.ImageList, Vcl.ImgList, System.Actions, Vcl.ActnList;
  {$ENDREGION}

type
  TFModelo = class(TFBase)
  //Componetes do Form
  {$REGION}
    pnlHeader: TPanel;
    spbNovo: TSpeedButton;
    spbAlterar: TSpeedButton;
    spbExcluir: TSpeedButton;
    edtPesquisa: TSearchBox;
    pnlGridTitle: TPanel;
    Grid: TDBGrid;
    bvBorderBottomGridTitle: TBevel;
    bvBorderBottomHeader: TBevel;
    imgBorderGreenCadastro: TImage;
    imgBorderBlueAlterar: TImage;
    imgBorderRedExcluir: TImage;
    pnlMain: TPanel;
    fdmt_Modelo: TFDMemTable;
    ImageList: TImageList;
    ds_Modelo: TDataSource;
    imgMark0: TImage;
    imgMark1: TImage;
    fdmt_ModeloID: TStringField;
    fdmt_ModeloMARK: TIntegerField;
    spbEportar: TSpeedButton;
    imgBorderExportar: TImage;
    ActionList: TActionList;
    ActionCadastrar: TAction;
    ActionAlrerar: TAction;
    ActionExcluir: TAction;
    ActionExportar: TAction;
  {$ENDREGION}

  //Procedimentos feitos em cima dos componentes do form
  {$REGION}
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure imgMark1Click(Sender: TObject);
    procedure imgMark0Click(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure ActionExportarExecute(Sender: TObject);
    procedure GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  {$ENDREGION}

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FModelo: TFModelo;

implementation

{$R *.dfm}

uses Menu;

procedure TFModelo.ActionExportarExecute(Sender: TObject);
begin
  Close;
end;

procedure TFModelo.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
begin
  imgBorderExportar.Visible:= Self.Tag = 1;
  ActionExportar.Visible:= Self.Tag = 1;
end;

procedure TFModelo.FormShow(Sender: TObject);
begin
  inherited;
  Grid.SetFocus;
end;

procedure TFModelo.GridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not TDBGrid(Sender).DataSource.DataSet.IsEmpty then
  begin
    TDBGrid(Sender).Canvas.Brush.Color:= clBtnFace;
    TDBGrid(Sender).Canvas.Font.Style:= [];
    TDBGrid(Sender).Canvas.Font.Color:= clBlack;


    If gdselected in state then
    begin
      TDBGrid(Sender).Canvas.Brush.Color:= $00FFCF9F;
      TDBGrid(Sender).Canvas.Font.Style:= [];
      TDBGrid(Sender).Canvas.Font.Color:= clBlack;
    end;
  end;

  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).columns[datacol].Field, State);

  if not fdmt_Modelo.IsEmpty then
  begin
    if Column.FieldName = 'MARK' then
    begin
      Grid.Canvas.FillRect(Rect);
      case fdmt_Modelo.FieldByName('MARK').AsInteger of
        0:ImageList.Draw(Grid.Canvas,Rect.Left + 7, Rect.Top + 1, 0);
        1:ImageList.Draw(Grid.Canvas,Rect.Left + 7, Rect.Top + 1, 1);
      end;
    end;
  end;
end;

procedure TFModelo.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_SPACE then
  begin
    fdmt_Modelo.Edit;
    if fdmt_ModeloMARK.AsInteger = 1 then
      fdmt_ModeloMARK.AsInteger:= 0
    else
      fdmt_ModeloMARK.AsInteger:= 1;
    fdmt_Modelo.Post;
  end;
end;

procedure TFModelo.imgMark0Click(Sender: TObject);
begin
  imgMark1.BringToFront;
  fdmt_Modelo.First;
  while not fdmt_Modelo.Eof do
  begin
    fdmt_Modelo.Edit;
    fdmt_ModeloMARK.AsInteger:= 1;
    fdmt_Modelo.Post;
    fdmt_Modelo.Next;
  end;
  fdmt_Modelo.First;
end;

procedure TFModelo.imgMark1Click(Sender: TObject);
begin
  imgMark0.BringToFront;
  fdmt_Modelo.First;
  while not fdmt_Modelo.Eof do
  begin
    fdmt_Modelo.Edit;
    fdmt_ModeloMARK.AsInteger:= 0;
    fdmt_Modelo.Post;
    fdmt_Modelo.Next;
  end;
  fdmt_Modelo.First;
end;

end.
