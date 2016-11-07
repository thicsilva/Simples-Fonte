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
unit CategoriaProduto;

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
  TFCategoriaProduto = class(TFModelo)
    fdmt_ModeloNOME: TStringField;
    Label1: TLabel;
    procedure ActionCadastrarExecute(Sender: TObject);
    procedure ActionExcluirExecute(Sender: TObject);
    procedure ActionAlrerarExecute(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCategoriaProduto: TFCategoriaProduto;

implementation

{$R *.dfm}

uses CategoriaProdutoStore, CategoriaProdutoService, Mensagem, Menu;

procedure TFCategoriaProduto.ActionAlrerarExecute(Sender: TObject);
begin
  if not fdmt_Modelo.IsEmpty then
  begin
    varBaseIdCAtegoria:= fdmt_ModeloID.AsString;
    OpenForm(FCategoriaProdutoStore,TFCategoriaProdutoStore);
    fdmt_Modelo.Open;
    TCategoriaProdutoService.index(fdmt_Modelo,'');
  end;
end;

procedure TFCategoriaProduto.ActionCadastrarExecute(Sender: TObject);
begin
  varBaseIdCategoria:= EmptyStr;
  OpenForm(FCategoriaProdutoStore,TFCategoriaProdutoStore);
  fdmt_Modelo.Open;
  TCategoriaProdutoService.index(fdmt_Modelo,'');
end;

procedure TFCategoriaProduto.ActionExcluirExecute(Sender: TObject);
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
            if TCategoriaProdutoService.destroyer(fdmt_ModeloID.AsString) then
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

procedure TFCategoriaProduto.edtPesquisaChange(Sender: TObject);
begin
  if Trim(edtPesquisa.Text) <> EmptyStr then
    TCategoriaProdutoService.index(fdmt_Modelo,Trim(edtPesquisa.Text));
end;

procedure TFCategoriaProduto.FormCreate(Sender: TObject);
begin
  fdmt_Modelo.Open;
  TCategoriaProdutoService.index(fdmt_Modelo,'');
end;

end.
