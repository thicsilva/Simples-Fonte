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
unit Cliente;

interface

uses
  //Uses da Interface
  {$REGION}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Modelo, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Imaging.pngimage,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls,Vcl.ActnMan,
  System.ImageList, Vcl.ImgList, System.Actions, Vcl.ActnList;
  {$ENDREGION}

type
  TFCliente = class(TFModelo)
  //Componetes do Form
  {$REGION}
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    fdmt_ModeloCLIENTE: TStringField;
    fdmt_ModeloCPF_CNPJ: TStringField;
    fdmt_ModeloEMAIL: TStringField;
    fdmt_ModeloFONE_COMERCIAL: TStringField;
    fdmt_ModeloCRIADO_EM: TDateTimeField;
  {$ENDREGION}

  //Procedimentos feitos em cima dos componentes do form
  {$REGION}
    procedure edtPesquisaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionCadastrarExecute(Sender: TObject);
    procedure ActionAlrerarExecute(Sender: TObject);
    procedure ActionExcluirExecute(Sender: TObject);
  {$ENDREGION}

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCliente: TFCliente;

implementation

{$R *.dfm}

uses  Menu, ClienteStore, PessoaRepository, PessoaService, Mensagem;

procedure TFCliente.FormCreate(Sender: TObject);
begin
  fdmt_Modelo.Open;
  TPessoaService.indexCliente(fdmt_Modelo,'');
end;

procedure TFCliente.ActionAlrerarExecute(Sender: TObject);
begin
  if  not fdmt_Modelo.IsEmpty then
  begin
    varBaseIdPessoa:= fdmt_ModeloID.AsString;
    OpenForm(FClienteStore,TFClienteStore);
    fdmt_Modelo.Open;
    TPessoaService.indexCliente(fdmt_Modelo,'');
  end;
end;

procedure TFCliente.ActionCadastrarExecute(Sender: TObject);
begin
  varBaseIdPessoa:= EmptyStr;
  OpenForm(FClienteStore,TFClienteStore);
  fdmt_Modelo.Open;
  TPessoaService.indexCliente(fdmt_Modelo,'');
end;

procedure TFCliente.ActionExcluirExecute(Sender: TObject);
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

procedure TFCliente.edtPesquisaChange(Sender: TObject);
begin
  if Trim(edtPesquisa.Text) <> EmptyStr then
    TPessoaService.indexCliente(fdmt_Modelo,Trim(edtPesquisa.Text));
end;


end.
