{*******************************************************************************
Title: iTEC-SOFTWARE                                                            
Description:  VO  relational the table [FN_BANCO_BOLETO] 
                                                                                
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
unit FnBancoBoletoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('FN_BANCO_BOLETO')]
  TFnBancoBoletoVO = class(TVO)
  private
    FID: String;
    FID_BANCO: String;
    FCOBRANCA_REGISTRADA: String;
    FCARTEIRA_PADRAO: String;
    FAGENCIA: String;
    FTARIFA_COBRANCA: Extended;
    FCODIGO_BENEFICIARIO: String;
    FNOSSO_NUMERO: String;
    FNUMERO_REMESSA: String;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: String  read FID write FID;
    [TColumn('ID_BANCO','Id Banco',450,[ldGrid, ldLookup, ldCombobox], False)]
    property IdBanco: String  read FID_BANCO write FID_BANCO;
    [TColumn('COBRANCA_REGISTRADA','Cobranca Registrada',96,[ldGrid, ldLookup, ldCombobox], False)]
    property CobrancaRegistrada: String  read FCOBRANCA_REGISTRADA write FCOBRANCA_REGISTRADA;
    [TColumn('CARTEIRA_PADRAO','Carteira Padrao',450,[ldGrid, ldLookup, ldCombobox], False)]
    property CarteiraPadrao: String  read FCARTEIRA_PADRAO write FCARTEIRA_PADRAO;
    [TColumn('AGENCIA','Agencia',128,[ldGrid, ldLookup, ldCombobox], False)]
    property Agencia: String  read FAGENCIA write FAGENCIA;
    [TColumn('TARIFA_COBRANCA','Tarifa Cobranca',128,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TarifaCobranca: Extended  read FTARIFA_COBRANCA write FTARIFA_COBRANCA;
    [TColumn('CODIGO_BENEFICIARIO','Codigo Beneficiario',352,[ldGrid, ldLookup, ldCombobox], False)]
    property CodigoBeneficiario: String  read FCODIGO_BENEFICIARIO write FCODIGO_BENEFICIARIO;
    [TColumn('NOSSO_NUMERO','Nosso Numero',450,[ldGrid, ldLookup, ldCombobox], False)]
    property NossoNumero: String  read FNOSSO_NUMERO write FNOSSO_NUMERO;
    [TColumn('NUMERO_REMESSA','Numero Remessa',224,[ldGrid, ldLookup, ldCombobox], False)]
    property NumeroRemessa: String  read FNUMERO_REMESSA write FNUMERO_REMESSA;

  end;

implementation



end.
