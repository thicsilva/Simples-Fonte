unit NFEStore;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ModeloStore, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, ACBrBase,
  ACBrDFe, ACBrNFe, pcnConversao, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.OleCtrls, SHDocVw,
  PsEmpresaVO, PsEpNfeVO, PsJuridicaVO, PsPessoaVO, PessoaJuridicaService,
  PessoaService, ConfigNFEService, DadosEmpresaService, PessoaRepository;

type
  TFNFEStore = class(TFModeloStore)
    ACBrNFe: TACBrNFe;
    SpeedButton1: TSpeedButton;
    Image1: TImage;
    ActionStatusService: TAction;
    pgcNFE: TPageControl;
    tbStatus: TTabSheet;
    mmDados: TMemo;
    Panel1: TPanel;
    WsBw: TWebBrowser;
    procedure ActionStatusServiceExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

    procedure AtualizaConfiguracoesNFE;
  public
    { Public declarations }
  end;

var
  FNFEStore: TFNFEStore;

implementation

{$R *.dfm}

procedure TFNFEStore.ActionStatusServiceExecute(Sender: TObject);
var
  mmRetornoWs: TMemo;
begin
  mmRetornoWs:= TMemo.Create(nil);
  ACBrNFe.WebServices.StatusServico.Executar;
  mmRetornoWS.Clear;
  mmRetornoWS.Lines.Text:= UTF8Encode(ACBrNFe.WebServices.StatusServico.RetWS);

  mmRetornoWS.lines.SaveToFile(ExtractFilePath(Application.ExeName)+'retornoWs.xml');
  WsBw.Navigate(ExtractFilePath(Application.ExeName)+'retornoWs.xml');
  FreeAndNil(mmRetornoWs);

  mmDados.Clear;
  mmDados.Lines.Add('TpAmb: ' + TpAmbToStr(ACBrNFe.WebServices.StatusServico.tpAmb));
  mmDados.Lines.Add('VerAplicativo: '+ ACBrNFe.WebServices.StatusServico.verAplic);
  mmDados.Lines.Add('Status: '+ IntToStr(ACBrNFe.WebServices.StatusServico.cStat));
  mmDados.Lines.Add('Motivo: '+ ACBrNFe.WebServices.StatusServico.xMotivo);
  mmDados.Lines.Add('UF: '+ IntToStr(ACBrNFe.WebServices.StatusServico.cUF));
  mmDados.Lines.Add('Data hora Recebimento: '+ DateTimeToStr(ACBrNFe.WebServices.StatusServico.dhRecbto));
  mmDados.Lines.Add('Data hora Retorno: '+ DateTimeToStr(ACBrNFe.WebServices.StatusServico.dhRetorno));
  mmDados.Lines.Add('Observação: '+ ACBrNFe.WebServices.StatusServico.xObs);
end;

procedure TFNFEStore.AtualizaConfiguracoesNFE;
var
  ObjPessoa: TPsPessoaVO;
  ObjJuridica: TPsJuridicaVO;
  ObjEmpresa: TPsEmpresaVO;
  ObjConfigNFE: TPsEpNfeVO;
begin
  ObjPessoa:= TPessoaRepository.getByIdEmpresa;
  ObjJuridica:= TPessoaJuridicaService.getByIdPessoa(ObjPessoa.Id);
  ObjEmpresa:= TDadosEmpresaService.getByIdPessoa(ObjPessoa.Id);
  ObjConfigNFE:= TConfigNFEService.getByIdEmpresa(ObjEmpresa.Id);
  {$IFDEF AcBrNFeOpenSSL}
  //ACBrNFe.Configuracoes.Certificados.
  ACBrNFe.Configuracoes.Certificados.Senha:= Trim(ObjConfigNFE.CtSenha);
  {$ELSE}
  ACBrNFe.Configuracoes.Certificados.NumeroSerie:= Trim(ObjConfigNFE.CtNumeroSerie);
  {$ENDIF}

  //Geral
 // ACBrNFe.Configuracoes.Geral.FormaEmissao:= StrToTpEmis(ok,Trim(ObjConfigNFE.Emissao));

  //Arquivos
  if Trim(ObjConfigNFE.SalvarArquivos) = 'SIM' then
  begin
    ACBrNFe.Configuracoes.Arquivos.Salvar:= True;
    ACBrNFe.Configuracoes.Arquivos.PathSalvar:= Trim(ObjConfigNFE.PathArquivos);
  end
  else
    ACBrNFe.Configuracoes.Arquivos.Salvar:= False;

  //WebServices
  ACBrNFe.Configuracoes.WebServices.UF:= Trim(ObjConfigNFE.WsUf);
 // ACBrNFe.Configuracoes.WebServices.Ambiente:= StrToTpAmb(True,Trim(ObjConfigNFE.WsAmbienteDestino));
  ACBrNFe.Configuracoes.WebServices.Visualizar:= True;
  ACBrNFe.Configuracoes.WebServices.ProxyHost:= Trim(ObjConfigNFE.ConexaoHost);
  ACBrNFe.Configuracoes.WebServices.ProxyPort:= Trim(ObjConfigNFE.ConexaoPorta);
  ACBrNFe.Configuracoes.WebServices.ProxyUser:= Trim(ObjConfigNFE.ConexaoUsuario);
  ACBrNFe.Configuracoes.WebServices.ProxyPass:= Trim(ObjConfigNFE.ConexaoSenha);

  if ACBrNFe.DANFE <> nil then
  begin
    //ACBrNFe.DANFE.TipoDANFE:= StrToTpImp(True,'1');
    //ACBrNFe.DANFE.Logo:= ObjEmpresa.Logo;
  end;
end;

procedure TFNFEStore.FormShow(Sender: TObject);
begin
  AtualizaConfiguracoesNFE;
end;

end.
