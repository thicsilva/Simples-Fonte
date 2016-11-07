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
unit Mensagem;

interface

uses
  //Uses da Interface
  {$REGION}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Base, System.Actions, Vcl.ActnList,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Imaging.pngimage;
  {$ENDREGION}

type
  TFMensagem = class(TFBase)
  //Componetes do Form
  {$REGION}
    Panel1: TPanel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ActionList: TActionList;
    ActionCancelar: TAction;
    ActionConfirmar: TAction;
    imgInfo: TImage;
    imgStop: TImage;
  {$ENDREGION}

  //Procedimentos feitos em cima dos componentes do form
  {$REGION}
    procedure ActionCancelarExecute(Sender: TObject);
    procedure ActionConfirmarExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure FormShow(Sender: TObject);
  {$ENDREGION}

  private
    { Private declarations }
  public
    { Public declarations }
    class var tipo: Integer;
    class var ImagemInfo: Integer;
  end;

var
  FMensagem: TFMensagem;

implementation

{$R *.dfm}

procedure TFMensagem.ActionCancelarExecute(Sender: TObject);
begin
  Self.Tag:= 0;
  Close;
end;

procedure TFMensagem.ActionConfirmarExecute(Sender: TObject);
begin
  Self.Tag:= 1;
  Close;
end;

procedure TFMensagem.ActionListUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  ActionCancelar.Visible:= (tipo = 1);
  imgInfo.Visible:= ImagemInfo = 0;
  imgStop.Visible:= ImagemInfo = 1;
end;

procedure TFMensagem.FormShow(Sender: TObject);
begin
  if (tipo = 1) then
    BitBtn2.SetFocus
  else
    BitBtn1.SetFocus;
end;

end.
