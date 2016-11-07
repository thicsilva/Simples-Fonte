unit ThreadEnviarSimplesEmail;

interface

uses
  System.Classes, IdSMTP, IdSSLOpenSSL, IdMessage, IdAttachmentFile,
  IdExplicitTLSClientServerBase, System.SysUtils, Vcl.Dialogs;

type
  TEnviarSimplesEmail = class(TThread)
  private
    FHost: String;
    FUserName: String;
    FPassword: String;
    FPorta: Integer;
    FMensagemAddress: String;
    FMensagemName: String;
    FMensagemEMailAddresses: String;
    FMensagemSubject: String;
    FMensagemBody: String;
    FEmailEnviado: String;
  public
    constructor Create; overload;

    procedure Execute; override;

    property ClienteSmtpHost: String read FHost write FHost;
    property ClienteSmtpUserName: String read FUserName write FUserName;
    property ClienteSmtpPassword: String read FPassword write FPassword;
    property ClienteSmtpPorta: Integer read FPorta write FPorta;
    property MensagemAddress: String read FMensagemAddress write FMensagemAddress;
    property MensagemName: String read FMensagemName write FMensagemName;
    property MensagemEMailAddresses: String read FMensagemEMailAddresses write FMensagemEMailAddresses;
    property MensagemSubject: String read FMensagemSubject write FMensagemSubject;
    property MensagemBody: String read FMensagemBody write FMensagemBody;
    property EmailEnviado: String read FEmailEnviado write FEmailEnviado;
  end;

implementation

uses Menu;

constructor TEnviarSimplesEmail.Create;
begin
  inherited Create(True);
end;

procedure TEnviarSimplesEmail.Execute;
var
  ClienteSmtp: TIdSMTP;
  SSLHandler: TIdSSLIOHandlerSocketOpenSSL;
  Mensagem: TIdMessage;
begin
  ClienteSmtp := TIdSMTP.Create(nil);
  SSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  Mensagem := TIdMessage.Create(nil);

  with ClienteSmtp do
  begin
    Host := ClienteSmtpHost;
    Username := ClienteSmtpUserName;
    Password := ClienteSmtpPassword;
    Port := ClienteSmtpPorta;
    IOHandler := SSLHandler;
    UseTLS := utUseRequireTLS;
  end;

  with Mensagem do
  begin
    From.Address := MensagemAddress;
    From.Name := MensagemName;
    Recipients.EMailAddresses := MensagemEMailAddresses;
    Subject := MensagemSubject;
    Body.Add(MensagemBody);
    ContentType:= 'text/html';
    CharSet:= 'UTF-8'
  end;

  try
    try
      ClienteSmtp.Connect;
    except on e:Exception do
      ShowMessage('Houve um erro na conexão: '+ e.Message);
    end;

    ClienteSmtp.Send(Mensagem);
  finally
    ClienteSmtp.Disconnect;
    FreeAndNil(ClienteSmtp);
    FreeAndNil(Mensagem);
    FreeAndNil(SSLHandler);
  end;

  EmailEnviado:= 'SIM';
  Suspend;
end;

end.
