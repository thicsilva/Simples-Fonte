{*******************************************************************************
Title: iTEC-SOFTWARE                                                            
Description:  VO  relational the table [PR_TRIBUTACAO] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2010 www.itecsoftware.com.br                           
                                                                                
Permission is hereby granted, free of charge, to any person                     
obtaining a copy of this software and associated documentation                  
files (the "Software"), to deal in the Software without                         
restriction, including without limitation the rights to use,                    
copy, modify, merge, publish, distribute, sub license, and/or sell              
copies of the Software, and to permit persons to whom the                       
Software is furnished to do so, subject to the following                        
conditions:                                                                     
                                                                                
The above copyright notice and this permission notice shall be                  
included in all copies or substantial portions of the Software.                 
                                                                                
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,                 
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES                 
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND                        
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT                     
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,                    
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING                    
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR                   
OTHER DEALINGS IN THE SOFTWARE.                                                 
                                                                                
       The author may be contacted at:                                          
           william@itecsoftware.com.br                                          
                                                                                
@author Thiago Ribeiro (lemestec@gmail.com)                    
@version 1.0                                                                    
*******************************************************************************}
unit PrTributacaoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('PR_TRIBUTACAO')]
  TPrTributacaoVO = class(TVO)
  private
    FID: String;
    FID_PRODUTO: String;
    FID_CATEGORIA: String;
    FID_MEDIDA: String;
    FID_NCM: String;
    FID_CEST: String;
    FID_CFOP: String;
    FORIGEM: String;
    FSITUACAO_TRIBUTARIA: String;
    FALIQUOTA_ICMS: Extended;
    FALIQUOTA_CREDITO_ICMS: Extended;
    FICMS_INTERESTADUAL: Extended;
    FICMS_INTERNO: Extended;
    FFCP: Extended;
    FREDUCAO_ICMS: Extended;
    FALIQUOTA_ICMS_ST: Extended;
    FMARGEM_VALOR_AGREGADO_MVA: Extended;
    FREDUCAO_MVA_ICMS_ST: Extended;
    FBASE_CALCULO_ICMS_ST_RETIDO: Extended;
    FVALOR_ICMS_ST_RETIDO: Extended;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: String  read FID write FID;
    [TColumn('ID_PRODUTO','Id Produto',450,[ldGrid, ldLookup, ldCombobox], False)]
    property IdProduto: String  read FID_PRODUTO write FID_PRODUTO;
    [TColumn('ID_CATEGORIA','Id Categoria',450,[ldGrid, ldLookup, ldCombobox], False)]
    property IdCategoria: String  read FID_CATEGORIA write FID_CATEGORIA;
    [TColumn('ID_MEDIDA','Id Medida',450,[ldGrid, ldLookup, ldCombobox], False)]
    property IdMedida: String  read FID_MEDIDA write FID_MEDIDA;
    [TColumn('ID_NCM','Id Ncm',450,[ldGrid, ldLookup, ldCombobox], False)]
    property IdNcm: String  read FID_NCM write FID_NCM;
    [TColumn('ID_CEST','Id Cest',450,[ldGrid, ldLookup, ldCombobox], False)]
    property IdCest: String  read FID_CEST write FID_CEST;
    [TColumn('ID_CFOP','Id Cfop',450,[ldGrid, ldLookup, ldCombobox], False)]
    property IdCfop: String  read FID_CFOP write FID_CFOP;
    [TColumn('ORIGEM','Origem',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Origem: String  read FORIGEM write FORIGEM;
    [TColumn('SITUACAO_TRIBUTARIA','Situacao Tributaria',450,[ldGrid, ldLookup, ldCombobox], False)]
    property SituacaoTributaria: String  read FSITUACAO_TRIBUTARIA write FSITUACAO_TRIBUTARIA;
    [TColumn('ALIQUOTA_ICMS','Aliquota Icms',128,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaIcms: Extended  read FALIQUOTA_ICMS write FALIQUOTA_ICMS;
    [TColumn('ALIQUOTA_CREDITO_ICMS','Aliquota Credito Icms',128,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaCreditoIcms: Extended  read FALIQUOTA_CREDITO_ICMS write FALIQUOTA_CREDITO_ICMS;
    [TColumn('ICMS_INTERESTADUAL','Icms Interestadual',128,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property IcmsInterestadual: Extended  read FICMS_INTERESTADUAL write FICMS_INTERESTADUAL;
    [TColumn('ICMS_INTERNO','Icms Interno',128,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property IcmsInterno: Extended  read FICMS_INTERNO write FICMS_INTERNO;
    [TColumn('FCP','Fcp',128,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Fcp: Extended  read FFCP write FFCP;
    [TColumn('REDUCAO_ICMS','Reducao Icms',128,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ReducaoIcms: Extended  read FREDUCAO_ICMS write FREDUCAO_ICMS;
    [TColumn('ALIQUOTA_ICMS_ST','Aliquota Icms St',128,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaIcmsSt: Extended  read FALIQUOTA_ICMS_ST write FALIQUOTA_ICMS_ST;
    [TColumn('MARGEM_VALOR_AGREGADO_MVA','Margem Valor Agregado Mva',128,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property MargemValorAgregadoMva: Extended  read FMARGEM_VALOR_AGREGADO_MVA write FMARGEM_VALOR_AGREGADO_MVA;
    [TColumn('REDUCAO_MVA_ICMS_ST','Reducao Mva Icms St',128,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ReducaoMvaIcmsSt: Extended  read FREDUCAO_MVA_ICMS_ST write FREDUCAO_MVA_ICMS_ST;
    [TColumn('BASE_CALCULO_ICMS_ST_RETIDO','Base Calculo Icms St Retido',128,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property BaseCalculoIcmsStRetido: Extended  read FBASE_CALCULO_ICMS_ST_RETIDO write FBASE_CALCULO_ICMS_ST_RETIDO;
    [TColumn('VALOR_ICMS_ST_RETIDO','Valor Icms St Retido',128,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcmsStRetido: Extended  read FVALOR_ICMS_ST_RETIDO write FVALOR_ICMS_ST_RETIDO;

  end;

implementation



end.
