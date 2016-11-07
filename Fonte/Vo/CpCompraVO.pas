{*******************************************************************************
Title: iTEC-SOFTWARE                                                            
Description:  VO  relational the table [CP_COMPRA] 
                                                                                
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
unit CpCompraVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('CP_COMPRA')]
  TCpCompraVO = class(TVO)
  private
    FID: String;
    FID_PESSOA: String;
    FID_PLANO_CONTA: String;
    FCODIGO: String;
    FDATA_COMPRA: TDateTime;
    FCONDICAO_PGT: String;
    FDATA_VENCIMENTO: TDateTime;
    FTIPO_DESCONTO: String;
    FDESCONTO: Extended;
    FVALOR_TOTAL: Extended;
    FTOTAL_LIQUIDO: Extended;
    FOBS: String;
    FFRETE: Extended;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: String  read FID write FID;
    [TColumn('ID_PESSOA','Id Pessoa',450,[ldGrid, ldLookup, ldCombobox], False)]
    property IdPessoa: String  read FID_PESSOA write FID_PESSOA;
    [TColumn('ID_PLANO_CONTA','Id Plano Conta',450,[ldGrid, ldLookup, ldCombobox], False)]
    property IdPlanoConta: String  read FID_PLANO_CONTA write FID_PLANO_CONTA;
    [TColumn('CODIGO','Codigo',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Codigo: String  read FCODIGO write FCODIGO;
    [TColumn('DATA_COMPRA','Data Compra',80,[ldGrid, ldLookup, ldCombobox], False)]
    property DataCompra: TDateTime  read FDATA_COMPRA write FDATA_COMPRA;
    [TColumn('CONDICAO_PGT','Condicao Pgt',450,[ldGrid, ldLookup, ldCombobox], False)]
    property CondicaoPgt: String  read FCONDICAO_PGT write FCONDICAO_PGT;
    [TColumn('DATA_VENCIMENTO','Data Vencimento',80,[ldGrid, ldLookup, ldCombobox], False)]
    property DataVencimento: TDateTime  read FDATA_VENCIMENTO write FDATA_VENCIMENTO;
    [TColumn('TIPO_DESCONTO','Tipo Desconto',96,[ldGrid, ldLookup, ldCombobox], False)]
    property TipoDesconto: String  read FTIPO_DESCONTO write FTIPO_DESCONTO;
    [TColumn('DESCONTO','Desconto',128,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Desconto: Extended  read FDESCONTO write FDESCONTO;
    [TColumn('VALOR_TOTAL','Valor Total',128,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorTotal: Extended  read FVALOR_TOTAL write FVALOR_TOTAL;
    [TColumn('TOTAL_LIQUIDO','Total Liquido',128,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TotalLiquido: Extended  read FTOTAL_LIQUIDO write FTOTAL_LIQUIDO;
    [TColumn('OBS','Obs',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Obs: String  read FOBS write FOBS;
    [TColumn('FRETE','Frete',128,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Frete: Extended  read FFRETE write FFRETE;

  end;

implementation



end.
