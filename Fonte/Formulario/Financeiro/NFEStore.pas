unit NFEStore;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ModeloStore, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, ACBrBase,
  ACBrDFe, ACBrNFe, pcnConversao, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.OleCtrls, SHDocVw;

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
  private
    { Private declarations }
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

end.
