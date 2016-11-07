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
unit Base;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFBase = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
    class var varBaseIdOS: String;
    class var varBaseIdPessoa: String;
    class var varBaseIdCategoria: String;
    class var varBaseIdCentroCusto: String;
    class var varBaseIdProduto: String;
    class var varBaseIdServico: String;
    class var varBaseIdCompra: String;
    class var varBaseIdVenda: String;
    class var varBaseIdPlanoConta: String;
    class var varBaseIdPagamento: String;
    class var varBaseIdBanco: String;
    class var varBaseIdConfBoleto: String;

    class var varBaseIdUsuarioLogado: String;
    class var varBaseNomeUsuarioLogado: String;
    class var varBaseTempoLiberacao: String;
  published
    //Converte um texto para Flutuante
    function ConvertCurrency(Text: String):Currency;

    //Abre ShowForm
    procedure OpenForm(Form: TForm; FormClass: TFormClass);

    //Converte Currency para String
    procedure ConvertCurrencyString(Sender: TObject);

    //Converte de String para Formato Currency
    procedure StringFormatCurrency2(Sender: TObject);

    //Converte de String para Formato Currency
    procedure StringFormatCurrency3(Sender: TObject);

    //Pressionando qualquer tecla verifica se é um número,virgula ou ponto
    procedure SomenteNumerosVirgulaPontoKeyPress(Sender: TObject; var Key: Char);

    //Mensagem Personalizada
    procedure Mensagem(Text: String; Tipo,ImagemInfo: Integer);
  end;

var
  FBase: TFBase;

implementation

{$R *.dfm}

uses Menu, Mensagem;

{ TFBase }

function TFBase.ConvertCurrency(Text: String): Currency;
var
  VALOR: String;
begin
  //Se o text for diferente de vazio
  if Text <> '' then
  begin
    //Variavel valor recebe o mesmo
    VALOR:= Text;
    //Faz um loop para encontrar o ponto e se encontrar deleta o mesmo
    while Pos('.',VALOR) > 0 do
      Delete(VALOR,Pos('.',VALOR),1);

    while Pos('R$',VALOR) > 0 do
      Delete(VALOR,Pos('R$',VALOR),2);
    //Remove os espaços e convert para Currency
    Result:= StrToCurr(Trim(Valor));
  end
  //Se for vazio passa 0
  else
    Result:= 0;
end;

procedure TFBase.OpenForm(Form: TForm; FormClass: TFormClass);
begin
  try
    Form:= FormClass.Create(nil);
    Form.Height:= FMenu.Height;
    Form.Width:= FMenu.Width;
    Form.ShowModal;
  finally
    FreeAndNil(Form);
  end;
end;

procedure TFBase.ConvertCurrencyString(Sender: TObject);
var
  VALOR: String;
begin
  if TLabeledEdit(Sender).Text <> '' then
  begin
    VALOR:= TLabeledEdit(Sender).Text;
    while Pos('.',VALOR) > 0 do
      Delete(VALOR,Pos('.',VALOR),1);

    TLabeledEdit(Sender).Text:= VALOR;
  end;
end;

procedure TFBase.Mensagem(Text: String; Tipo,ImagemInfo: Integer);
begin
  try
    FMensagem:= TFMensagem.Create(nil);
    FMensagem.Height:= Screen.Height;
    FMensagem.Width:= Screen.Width;
    FMensagem.tipo:= Tipo;
    FMensagem.ImagemInfo:= ImagemInfo;
    FMensagem.Label2.Caption:= Text;
    FMensagem.ShowModal;
  finally
    FreeAndNil(FMensagem);
  end;
end;

procedure TFBase.SomenteNumerosVirgulaPontoKeyPress(Sender: TObject; var Key: Char);
begin
  if (not(Key in ['0'..'9','.',','])) and (ord(Key)<> 8) and (Key <> #0)then
    Key:= #0;
end;

procedure TFBase.StringFormatCurrency2(Sender: TObject);
begin
  if TLabeledEdit(Sender).Text <> '' then
  begin
    TLabeledEdit(Sender).Text:= FloatToStrF(ConvertCurrency(TLabeledEdit(Sender).Text),ffNumber,12,2);
  end;
end;

procedure TFBase.StringFormatCurrency3(Sender: TObject);
begin
  if TLabeledEdit(Sender).Text <> '' then
  begin
    TLabeledEdit(Sender).Text:= FloatToStrF(ConvertCurrency(TLabeledEdit(Sender).Text),ffNumber,12,3);
  end;
end;

end.
