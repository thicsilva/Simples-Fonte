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
unit ModeloStore;

interface

uses
  //Uses da Interface
  {$REGION}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Base, Vcl.Buttons, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, System.Actions, Vcl.ActnList, Vcl.StdCtrls;
  {$ENDREGION}

type
  TFModeloStore = class(TFBase)
  //Componetes do Form
  {$REGION}
    pnlMain: TPanel;
    pnlHeader: TPanel;
    imgBorderGreenCadastro: TImage;
    spbCancelar: TSpeedButton;
    imgBorderBlueAlterar: TImage;
    spbSalvar: TSpeedButton;
    Bevel2: TBevel;
    ActionList: TActionList;
    ActionCancelar: TAction;
    ActionSalvar: TAction;
  {$ENDREGION}

  //Procedimentos feitos em cima dos componentes do form
  {$REGION}
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure spbCancelarClick(Sender: TObject);
    procedure ActionCancelarExecute(Sender: TObject);
  {$ENDREGION}

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FModeloStore: TFModeloStore;

implementation

{$R *.dfm}

uses Menu;

procedure TFModeloStore.ActionCancelarExecute(Sender: TObject);
begin
  Close;
end;

procedure TFModeloStore.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TFModeloStore.spbCancelarClick(Sender: TObject);
begin
  Close;
end;

end.
