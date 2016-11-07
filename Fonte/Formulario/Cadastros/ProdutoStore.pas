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
|* 10/10/2016: Primeira Versao                                                |*
|*   Thiago Ribeiro Lemes de Brito                                            |*
*******************************************************************************}
unit ProdutoStore;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ModeloStore, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.StdCtrls,
  PrProdutoVO, ProdutoService, PrCategoriaVO, CategoriaProdutoService,
  PrTributacaoVO, ProdutoMedidaService, PrMedidaVO, FnCestVO,
  ProdutoCestRepository, ProdutoCestService, Bibli, Biblioteca,
  ProdutoTributacaoService, PsPessoaVO,System.Generics.Collections,
  PessoaService, PrFornecedorVO, ProdutoFornecedorRepository;

type
  TFProdutoStore = class(TFModeloStore)
    pnlTitle: TPanel;
    lblTituloForm: TLabel;
    Bevel1: TBevel;
    pnlProduto: TPanel;
    Bevel5: TBevel;
    Image2: TImage;
    edtNomeProduto: TLabeledEdit;
    edtCodigoProduto: TLabeledEdit;
    edtCodigoBarras: TLabeledEdit;
    edtCategoriaProduto: TLabeledEdit;
    imgSearchCategoria: TImage;
    edtValorVenda: TLabeledEdit;
    edtValorCusto: TLabeledEdit;
    edtDisponivelEstoque: TLabeledEdit;
    edtMinimoEstoque: TLabeledEdit;
    edtMaximoEstoque: TLabeledEdit;
    pnlDadosFiscaisTitle: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    pnlDadosFiscais: TPanel;
    Bevel3: TBevel;
    imgSearchMedida: TImage;
    imgSearchNCM: TImage;
    imgSearchCEST: TImage;
    edtPesoLiquido: TLabeledEdit;
    edtPesoBruto: TLabeledEdit;
    edtUnidadeMedida: TLabeledEdit;
    edtNCM: TLabeledEdit;
    edtCEST: TLabeledEdit;
    pnlFornecedorTitle: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Image9: TImage;
    pnlFornecedor: TPanel;
    Bevel7: TBevel;
    Label15: TLabel;
    Label17: TLabel;
    edtNomeFornecedor1: TLabeledEdit;
    imgSearchFornecedor1: TImage;
    edtNomeFornecedor2: TLabeledEdit;
    imgSearchFornecedor2: TImage;
    edtNomeFornecedor3: TLabeledEdit;
    imgSearchFornecedor3: TImage;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ActionSalvarExecute(Sender: TObject);
    procedure imgSearchCategoriaClick(Sender: TObject);
    procedure imgSearchMedidaClick(Sender: TObject);
    procedure edtCategoriaProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtUnidadeMedidaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure imgSearchNCMClick(Sender: TObject);
    procedure imgSearchCESTClick(Sender: TObject);
    procedure edtNCMKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtCESTKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Label1Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure imgSearchFornecedor1Click(Sender: TObject);
    procedure imgSearchFornecedor2Click(Sender: TObject);
    procedure imgSearchFornecedor3Click(Sender: TObject);
    procedure edtNomeFornecedor1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNomeFornecedor2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNomeFornecedor3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtMaximoEstoqueKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPesoBrutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    ObjProduto: TPrProdutoVO;
    ObjProdutoTributacao: TPrTributacaoVO;
    ObjFornecedorList: TList<TPrFornecedorVO>;
    ObjForncedor: TPrFornecedorVO;

    procedure EdtToObj;
    procedure ObjToEdt;
    function Validacoes: String;
  public
    { Public declarations }
  end;

var
  FProdutoStore: TFProdutoStore;

implementation

{$R *.dfm}

uses Mensagem, Menu, CategoriaProduto, UnidadeMedida, NCM_CEST,
  ProdutoFornecedorService, Fornecedor;

{ TFProdutoStore }

procedure TFProdutoStore.ActionSalvarExecute(Sender: TObject);
var
  Msg: String;
begin
  Msg:= Validacoes;
  if Msg = '' then
  begin
    EdtToObj;
    if TProdutoService.save(ObjProduto) then
    begin
      ObjProdutoTributacao.IdProduto:= ObjProduto.Id;
      TProdutoTributacaoService.save(ObjProdutoTributacao);

      if edtNomeFornecedor1.Text <> '' then
      begin
        if Assigned(ObjFornecedorList) and (ObjFornecedorList.Count > 0) then
        begin
          if Assigned(ObjFornecedorList.Items[0] as TPrFornecedorVO) then
            ObjForncedor:= TProdutoFornecedorService.getById(ObjFornecedorList.Items[0].Id)
          else
            ObjForncedor:= TPrFornecedorVO.Create;
        end
        else
          ObjForncedor:= TPrFornecedorVO.Create;

        ObjForncedor.IdProduto:= ObjProduto.Id;
        ObjForncedor.IdPessoa:= edtNomeFornecedor1.Hint;
        TProdutoFornecedorService.save(ObjForncedor);
        FreeAndNil(ObjForncedor);
        if Assigned(ObjFornecedorList) and (not ObjFornecedorList.Count > 1) then
          FreeAndNil(ObjFornecedorList);
      end
      else
      if Assigned(ObjFornecedorList) and (ObjFornecedorList.Count > 0) then
      begin
        if Assigned(ObjFornecedorList.Items[0] as TPrFornecedorVO) then
          TProdutoFornecedorService.destroyer(ObjFornecedorList.Items[0].Id)
      end;

      if edtNomeFornecedor2.Text <> '' then
      begin
        if Assigned(ObjFornecedorList) and (ObjFornecedorList.Count > 1) then
        begin
          if Assigned(ObjFornecedorList.Items[1] as TPrFornecedorVO) then
            ObjForncedor:= TProdutoFornecedorService.getById(ObjFornecedorList.Items[1].Id)
          else
            ObjForncedor:= TPrFornecedorVO.Create;
        end
        else
          ObjForncedor:= TPrFornecedorVO.Create;

        ObjForncedor.IdProduto:= ObjProduto.Id;
        ObjForncedor.IdPessoa:= edtNomeFornecedor2.Hint;
        TProdutoFornecedorService.save(ObjForncedor);
        FreeAndNil(ObjForncedor);
        if Assigned(ObjFornecedorList) and (not ObjFornecedorList.Count > 2) then
          FreeAndNil(ObjFornecedorList);
      end
      else
      if Assigned(ObjFornecedorList) and (ObjFornecedorList.Count > 1) then
      begin
        if Assigned(ObjFornecedorList.Items[1] as TPrFornecedorVO) then
          TProdutoFornecedorService.destroyer(ObjFornecedorList.Items[1].Id)
      end;

      if edtNomeFornecedor3.Text <> '' then
      begin
        if Assigned(ObjFornecedorList) and (ObjFornecedorList.Count > 2) then
        begin
          if Assigned(ObjFornecedorList.Items[2] as TPrFornecedorVO) then
            ObjForncedor:= TProdutoFornecedorService.getById(ObjFornecedorList.Items[2].Id)
          else
            ObjForncedor:= TPrFornecedorVO.Create;
        end
        else
          ObjForncedor:= TPrFornecedorVO.Create;

        ObjForncedor.IdProduto:= ObjProduto.Id;
        ObjForncedor.IdPessoa:= edtNomeFornecedor3.Hint;
        TProdutoFornecedorService.save(ObjForncedor);
        FreeAndNil(ObjForncedor);
      end
      else
      if Assigned(ObjFornecedorList) and (ObjFornecedorList.Count > 2) then
      begin
        if Assigned(ObjFornecedorList.Items[2] as TPrFornecedorVO) then
          TProdutoFornecedorService.destroyer(ObjFornecedorList.Items[2].Id)
      end;
      
      Close;
    end;
  end
  else
  begin
    try
      FMensagem:= TFMensagem.Create(nil);
      FMensagem.Height:= FMenu.Height;
      FMensagem.Width:= FMenu.Width;
      FMensagem.tipo:= 0;
      FMensagem.ImagemInfo:= 1;
      FMensagem.Label2.Caption:= Msg;
      FMensagem.ShowModal;
    finally
      FreeAndNil(FMensagem);
    end;
  end;
end;

procedure TFProdutoStore.edtCategoriaProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F1 then
    imgSearchCategoriaClick(Sender)
  else
  if key = VK_BACK then
  begin
    edtCategoriaProduto.Text:= '';
    ObjProdutoTributacao.IdCategoria:= '';
  end;
end;

procedure TFProdutoStore.edtCESTKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F1 then
    imgSearchCESTClick(Sender)
  else
  if key = VK_BACK then
  begin
    edtCEST.Text:= '';
    ObjProdutoTributacao.IdCest:= '';
  end;
end;

procedure TFProdutoStore.edtMaximoEstoqueKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    pnlFornecedor.Height:= 1;
    pnlDadosFiscais.Height:= 92;
  end;
end;

procedure TFProdutoStore.edtNCMKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F1 then
    imgSearchNCMClick(Sender)
  else
  if key = VK_BACK then
  begin
    edtNCM.Text:= '';
    ObjProdutoTributacao.IdNcm:= '';
  end;
end;

procedure TFProdutoStore.edtNomeFornecedor1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F1 then
    imgSearchFornecedor1Click(Sender)
  else
  if Key = VK_BACK then
  begin
    edtNomeFornecedor1.Hint:= '';
    edtNomeFornecedor1.Text:= '';
  end;
end;

procedure TFProdutoStore.edtNomeFornecedor2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F1 then
    imgSearchFornecedor2Click(Sender)
  else
  if Key = VK_BACK then
  begin
    edtNomeFornecedor2.Hint:= '';
    edtNomeFornecedor2.Text:= '';
  end;
end;

procedure TFProdutoStore.edtNomeFornecedor3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F1 then
    imgSearchFornecedor3Click(Sender)
  else
  if Key = VK_BACK then
  begin
    edtNomeFornecedor3.Hint:= '';
    edtNomeFornecedor3.Text:= '';
  end;
end;

procedure TFProdutoStore.edtPesoBrutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    pnlDadosFiscais.Height:= 1;
    pnlFornecedor.Height:= 140;
  end;
end;

procedure TFProdutoStore.EdtToObj;
begin
  ObjProduto.TipoCadastro:= 'PRODUTO';
  ObjProduto.UpdateEstoque:= 0;
  ObjProduto.Nome:= RemoveAcentos(Trim(edtNomeProduto.Text));
  ObjProduto.Codigo:= RemoveAcentos(Trim(edtCodigoProduto.Text));
  ObjProduto.CodigoBarras:= RemoveAcentos(Trim(edtCodigoBarras.Text));
  ObjProduto.ValorVenda:= ConvertCurrency(Trim(edtValorVenda.Text));
  ObjProduto.ValorCusto:= ConvertCurrency(Trim(edtValorCusto.Text));
  ObjProduto.DisponivelEstoque:= ConvertCurrency(Trim(edtDisponivelEstoque.Text));
  ObjProduto.MinimoEstoque:= ConvertCurrency(Trim(edtMinimoEstoque.Text));
  ObjProduto.MaximoEstoque:= ConvertCurrency(Trim(edtMaximoEstoque.Text));
  ObjProduto.PesoLiquido:= ConvertCurrency(Trim(edtPesoLiquido.Text));
  ObjProduto.PesoBruto:= ConvertCurrency(Trim(edtPesoBruto.Text));
end;

procedure TFProdutoStore.edtUnidadeMedidaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F1 then
    imgSearchMedidaClick(Sender)
  else
  if key = VK_BACK then
  begin
    edtUnidadeMedida.Text:= '';
    ObjProdutoTributacao.IdMedida:= '';
  end;
end;

procedure TFProdutoStore.FormCreate(Sender: TObject);
begin
  ObjProduto:= TProdutoService.getById(varBaseIdProduto);
  if not Assigned(ObjProduto) then
  begin
    ObjProduto:= TPrProdutoVO.Create;
    ObjProdutoTributacao:= TPrTributacaoVO.Create;
    lblTituloForm.Caption:= 'Cadastro de novo Produto!';
  end
  else
  begin
    lblTituloForm.Caption:= 'Alterando Dados de Produto!';
    ObjProdutoTributacao:= TProdutoTributacaoService.getByIdProduto(ObjProduto.Id);
    ObjFornecedorList:= TProdutoFornecedorRepository.index(ObjProduto.Id);
  end;

  ObjToEdt;
end;

procedure TFProdutoStore.FormDestroy(Sender: TObject);
begin
  FreeAndNil(ObjProduto);
  FreeAndNil(ObjProdutoTributacao);
  FreeAndNil(ObjFornecedorList);
end;

procedure TFProdutoStore.FormShow(Sender: TObject);
begin
  edtNomeProduto.SetFocus;
end;

procedure TFProdutoStore.imgSearchCategoriaClick(Sender: TObject);
begin
  try
    FCategoriaProduto:= TFCategoriaProduto.Create(nil);
    FCategoriaProduto.pnlMain.Align:= alNone;
    FCategoriaProduto.pnlMain.Anchors:= [];
    FCategoriaProduto.AlphaBlend:= True;
    FCategoriaProduto.AlphaBlendValue:= 240;
    FCategoriaProduto.pnlMain.BevelKind:= bkSoft;
    FCategoriaProduto.Height:= FMenu.Height;
    FCategoriaProduto.Width:= FMenu.Width;
    FCategoriaProduto.Tag:= 1;
    FCategoriaProduto.ShowModal;
    ObjProdutoTributacao.IdCategoria:= FCategoriaProduto.fdmt_ModeloID.AsString;
    edtCategoriaProduto.Text:= FCategoriaProduto.fdmt_ModeloNOME.AsString;
  finally
    FreeAndNil(FCategoriaProduto);
  end;
end;

procedure TFProdutoStore.imgSearchCESTClick(Sender: TObject);
begin
  try
    FNCM_CEST:= TFNCM_CEST.Create(nil);
    FNCM_CEST.pnlMain.Align:= alNone;
    FNCM_CEST.pnlMain.Anchors:= [];
    FNCM_CEST.AlphaBlend:= True;
    FNCM_CEST.AlphaBlendValue:= 240;
    FNCM_CEST.pnlMain.BevelKind:= bkSoft;
    FNCM_CEST.Height:= FMenu.Height;
    FNCM_CEST.Width:= FMenu.Width;
    FNCM_CEST.Tag:= 1;
    FNCM_CEST.ShowModal;
    ObjProdutoTributacao.IdCest:= FNCM_CEST.fdmt_ModeloID.AsString;
    edtCEST.Text:= FNCM_CEST.fdmt_ModeloCEST.AsString + ' - '+ FNCM_CEST.fdmt_ModeloDESCRICAO.AsString;
  finally
    FreeAndNil(FNCM_CEST);
  end;
end;

procedure TFProdutoStore.imgSearchFornecedor1Click(Sender: TObject);
begin
  try
    FFornecedor:= TFFornecedor.Create(nil);
    FFornecedor.pnlMain.Align:= alNone;
    FFornecedor.pnlMain.Anchors:= [];
    FFornecedor.AlphaBlend:= True;
    FFornecedor.AlphaBlendValue:= 240;
    FFornecedor.pnlMain.BevelKind:= bkSoft;
    FFornecedor.Height:= FMenu.Height;
    FFornecedor.Width:= FMenu.Width;
    FFornecedor.Tag:= 1;
    FFornecedor.ShowModal;
    edtNomeFornecedor1.Hint:= FFornecedor.fdmt_ModeloID.AsString;
    edtNomeFornecedor1.Text:= FFornecedor.fdmt_ModeloFORNECEDOR.AsString;
  finally
    FreeAndNil(FFornecedor);
  end;
end;

procedure TFProdutoStore.imgSearchFornecedor2Click(Sender: TObject);
begin
  try
    FFornecedor:= TFFornecedor.Create(nil);
    FFornecedor.pnlMain.Align:= alNone;
    FFornecedor.pnlMain.Anchors:= [];
    FFornecedor.AlphaBlend:= True;
    FFornecedor.AlphaBlendValue:= 240;
    FFornecedor.pnlMain.BevelKind:= bkSoft;
    FFornecedor.Height:= FMenu.Height;
    FFornecedor.Width:= FMenu.Width;
    FFornecedor.Tag:= 1;
    FFornecedor.ShowModal;
    edtNomeFornecedor2.Hint:= FFornecedor.fdmt_ModeloID.AsString;
    edtNomeFornecedor2.Text:= FFornecedor.fdmt_ModeloFORNECEDOR.AsString;
  finally
    FreeAndNil(FFornecedor);
  end;
end;

procedure TFProdutoStore.imgSearchFornecedor3Click(Sender: TObject);
begin
  try
    FFornecedor:= TFFornecedor.Create(nil);
    FFornecedor.pnlMain.Align:= alNone;
    FFornecedor.pnlMain.Anchors:= [];
    FFornecedor.AlphaBlend:= True;
    FFornecedor.AlphaBlendValue:= 240;
    FFornecedor.pnlMain.BevelKind:= bkSoft;
    FFornecedor.Height:= FMenu.Height;
    FFornecedor.Width:= FMenu.Width;
    FFornecedor.Tag:= 1;
    FFornecedor.ShowModal;
    edtNomeFornecedor3.Hint:= FFornecedor.fdmt_ModeloID.AsString;
    edtNomeFornecedor3.Text:= FFornecedor.fdmt_ModeloFORNECEDOR.AsString;
  finally
    FreeAndNil(FFornecedor);
  end;
end;

procedure TFProdutoStore.imgSearchMedidaClick(Sender: TObject);
begin
  try
    FUnidadeMedida:= TFUnidadeMedida.Create(nil);
    FUnidadeMedida.pnlMain.Align:= alNone;
    FUnidadeMedida.pnlMain.Anchors:= [];
    FUnidadeMedida.AlphaBlend:= True;
    FUnidadeMedida.AlphaBlendValue:= 240;
    FUnidadeMedida.pnlMain.BevelKind:= bkSoft;
    FUnidadeMedida.Height:= FMenu.Height;
    FUnidadeMedida.Width:= FMenu.Width;
    FUnidadeMedida.Tag:= 1;
    FUnidadeMedida.ShowModal;
    ObjProdutoTributacao.IdMedida:= FUnidadeMedida.fdmt_ModeloID.AsString;
    edtUnidadeMedida.Text:= FUnidadeMedida.fdmt_ModeloNOME.AsString;
  finally
    FreeAndNil(FUnidadeMedida);
  end;
end;

procedure TFProdutoStore.imgSearchNCMClick(Sender: TObject);
begin
  try
    FNCM_CEST:= TFNCM_CEST.Create(nil);
    FNCM_CEST.pnlMain.Align:= alNone;
    FNCM_CEST.pnlMain.Anchors:= [];
    FNCM_CEST.AlphaBlend:= True;
    FNCM_CEST.AlphaBlendValue:= 240;
    FNCM_CEST.pnlMain.BevelKind:= bkSoft;
    FNCM_CEST.Height:= FMenu.Height;
    FNCM_CEST.Width:= FMenu.Width;
    FNCM_CEST.Tag:= 1;
    FNCM_CEST.ShowModal;
    ObjProdutoTributacao.IdNcm:= FNCM_CEST.fdmt_ModeloID.AsString;
    edtNCM.Text:= FNCM_CEST.fdmt_ModeloNCM.AsString + ' - '+ FNCM_CEST.fdmt_ModeloDESCRICAO.AsString;
  finally
    FreeAndNil(FNCM_CEST);
  end;
end;

procedure TFProdutoStore.Label1Click(Sender: TObject);
begin
  if pnlDadosFiscais.Height = 1 then
  begin
    pnlDadosFiscais.Height:= 92;
    pnlFornecedor.Height:= 1;
  end
  else
    pnlDadosFiscais.Height:= 1;
end;

procedure TFProdutoStore.Label3Click(Sender: TObject);
begin
  if pnlFornecedor.Height = 1 then
  begin
    pnlFornecedor.Height:= 140;
    pnlDadosFiscais.Height:= 1;
  end
  else
    pnlFornecedor.Height:= 1;
end;

procedure TFProdutoStore.ObjToEdt;
var
  Categoria: TPrCategoriaVO;
  UnidadeMedida: TPrMedidaVO;
  NCM: TFnCestVO;
  CEST: TFnCestVO;
  Fornecedor: TPsPessoaVO;
  I: Integer;
begin
  edtNomeProduto.Text:= Trim(ObjProduto.Nome);
  edtCodigoProduto.Text:= Trim(ObjProduto.Codigo);
  edtCodigoBarras.Text:= Trim(ObjProduto.CodigoBarras);
  edtValorVenda.Text:= FloatToStrF(ObjProduto.ValorVenda,ffNumber,12,2);
  edtValorCusto.Text:= FloatToStrF(ObjProduto.ValorCusto,ffNumber,12,2);
  edtDisponivelEstoque.Text:= FloatToStrF(ObjProduto.DisponivelEstoque,ffNumber,12,2);
  edtMinimoEstoque.Text:= FloatToStrF(ObjProduto.MinimoEstoque,ffNumber,12,2);
  edtMaximoEstoque.Text:= FloatToStrF(ObjProduto.MaximoEstoque,ffNumber,12,2);
  edtPesoLiquido.Text:= FloatToStrF(ObjProduto.PesoLiquido,ffNumber,12,3);
  edtPesoBruto.Text:= FloatToStrF(ObjProduto.PesoBruto,ffNumber,12,3);

  if Assigned(ObjProdutoTributacao) then
  begin
    Categoria:= TCategoriaProdutoService.getById(ObjProdutoTributacao.IdCategoria);
    if Assigned(Categoria) then
      edtCategoriaProduto.Text:= Trim(Categoria.Nome);
    FreeAndNil(Categoria);
    UnidadeMedida:= TProdutoMedidaService.getById(ObjProdutoTributacao.IdMedida);
    if Assigned(UnidadeMedida) then
      edtUnidadeMedida.Text:= Trim(UnidadeMedida.Nome);
    FreeAndNil(UnidadeMedida);
    NCM:= TProdutoCestService.getById(ObjProdutoTributacao.IdNcm);
    if Assigned(NCM) then
      edtNCM.Text:= Trim(NCM.Ncm);
    FreeAndNil(NCM);
    CEST:= TProdutoCestService.getById(ObjProdutoTributacao.IdCest);
    if Assigned(CEST) then
      edtCEST.Text:= Trim(CEST.Cest);
    FreeAndNil(CEST);
  end;

  if Assigned(ObjFornecedorList) then
  begin
    for I := 0 to Pred(ObjFornecedorList.Count) do
    begin
      if I = 0 then
      begin
        Fornecedor:= TPessoaService.getById(ObjFornecedorList.Items[I].IdPessoa);
        if Assigned(Fornecedor) then
        begin
          edtNomeFornecedor1.Text:= Trim(Fornecedor.Nome);
          edtNomeFornecedor1.Hint:= Trim(ObjFornecedorList.Items[I].IdPessoa);
        end;
        FreeAndNil(Fornecedor);
      end
      else
      if I = 1 then
      begin
        Fornecedor:= TPessoaService.getById(ObjFornecedorList.Items[I].IdPessoa);
        if Assigned(Fornecedor) then
        begin
          edtNomeFornecedor2.Text:= Trim(Fornecedor.Nome);
          edtNomeFornecedor2.Hint:= Trim(ObjFornecedorList.Items[I].IdPessoa);
        end;
        FreeAndNil(Fornecedor);
      end
      else
      if I = 2 then
      begin
        Fornecedor:= TPessoaService.getById(ObjFornecedorList.Items[I].IdPessoa);
        if Assigned(Fornecedor) then
        begin
          edtNomeFornecedor3.Text:= Trim(Fornecedor.Nome);
          edtNomeFornecedor3.Hint:= Trim(ObjFornecedorList.Items[I].IdPessoa);
        end;
        FreeAndNil(Fornecedor);
      end;
    end;
  end;
end;

function TFProdutoStore.Validacoes: String;
begin
  Result:= '';
  if edtNomeProduto.Text = '' then
    Result:= 'Nome do Produto não pode ficar em branco!';

  if (edtNomeFornecedor1.Hint <> '') then
  begin
    if  (edtNomeFornecedor1.Hint = edtNomeFornecedor2.Hint) or
    (edtNomeFornecedor1.Hint = edtNomeFornecedor3.Hint) then
      Result:= 'Não é possivel adicionar o mesmo fornecedor mais de uma vez!';
  end;

  if (edtNomeFornecedor2.Hint <> '') then
  begin
    if (edtNomeFornecedor2.Hint = edtNomeFornecedor1.Hint) or
    (edtNomeFornecedor2.Hint = edtNomeFornecedor3.Hint) then
      Result:= 'Não é possivel adicionar o mesmo fornecedor mais de uma vez!';
  end;

  if (edtNomeFornecedor3.Hint <> '') then
  begin
    if (edtNomeFornecedor3.Hint = edtNomeFornecedor1.Hint) or
    (edtNomeFornecedor3.Hint = edtNomeFornecedor2.Hint) then
      Result:= 'Não é possivel adicionar o mesmo fornecedor mais de uma vez!';
  end;
end;

end.
