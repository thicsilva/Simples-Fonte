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
unit CategoriaProdutoStore;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ModeloStore, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.StdCtrls,
  PrCategoriaVO, Bibli, Biblioteca;

type
  TFCategoriaProdutoStore = class(TFModeloStore)
    pnlTitle: TPanel;
    lblTituloForm: TLabel;
    Bevel1: TBevel;
    edtNome: TLabeledEdit;
    procedure ActionSalvarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    ObjCategoria: TPrCategoriaVO;

    procedure EdtToObj;
    procedure ObjToEdt;
  public
    { Public declarations }
  end;

var
  FCategoriaProdutoStore: TFCategoriaProdutoStore;

implementation

{$R *.dfm}

uses CategoriaProdutoService, Mensagem, Menu;

procedure TFCategoriaProdutoStore.ActionSalvarExecute(Sender: TObject);
begin
  if edtNome.Text <> '' then
  begin
    EdtToObj;
    if TCategoriaProdutoService.save(ObjCategoria) then
      Close;
  end
  else
  begin
    try
      FMensagem:= TFMensagem.Create(nil);
      FMensagem.Height:= FMenu.Height;
      FMensagem.Width:= FMenu.Width;
      FMensagem.tipo:= 0;
      FMensagem.ImagemInfo:= 1;
      FMensagem.Label2.Caption:= 'É necessário o preenchimento do campo Nome!';
      FMensagem.ShowModal;
    finally
      FreeAndNil(FMensagem);
    end;
  end;
end;

procedure TFCategoriaProdutoStore.EdtToObj;
begin
  ObjCategoria.Nome:= RemoveAcentos(Trim(edtNome.Text));
end;

procedure TFCategoriaProdutoStore.FormCreate(Sender: TObject);
begin
  ObjCategoria:= TCategoriaProdutoService.getById(varBaseIdCategoria);
  if not Assigned(ObjCategoria) then
  begin
    ObjCategoria:= TPrCategoriaVO.Create;
    lblTituloForm.Caption:= 'Cadastro de nova Categoria!';
  end
  else
  begin
    lblTituloForm.Caption:= 'Alterando Dados de Categoria!';
  end;

  ObjToEdt;
end;

procedure TFCategoriaProdutoStore.FormDestroy(Sender: TObject);
begin
  FreeAndNil(ObjCategoria);
end;

procedure TFCategoriaProdutoStore.ObjToEdt;
begin
  edtNome.Text:= Trim(ObjCategoria.Nome);
end;

end.
