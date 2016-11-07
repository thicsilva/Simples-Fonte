{*******************************************************************************
Title: iTEC-SOFTWARE                                                            
Description:  VO  relational the table [CP_ITEM] 
                                                                                
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
unit CpItemVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('CP_ITEM')]
  TCpItemVO = class(TVO)
  private
    FID: String;
    FID_COMPRA: String;
    FID_PRODUTO: String;
    FDETALHE: String;
    FQUANTIDADE: Extended;
    FCUSTO: Extended;
    FSUBTOTAL: Extended;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: String  read FID write FID;
    [TColumn('ID_COMPRA','Id Compra',450,[ldGrid, ldLookup, ldCombobox], False)]
    property IdCompra: String  read FID_COMPRA write FID_COMPRA;
    [TColumn('ID_PRODUTO','Id Produto',450,[ldGrid, ldLookup, ldCombobox], False)]
    property IdProduto: String  read FID_PRODUTO write FID_PRODUTO;
    [TColumn('DETALHE','Detalhe',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Detalhe: String  read FDETALHE write FDETALHE;
    [TColumn('QUANTIDADE','Quantidade',128,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Quantidade: Extended  read FQUANTIDADE write FQUANTIDADE;
    [TColumn('CUSTO','Custo',128,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Custo: Extended  read FCUSTO write FCUSTO;
    [TColumn('SUBTOTAL','Subtotal',128,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Subtotal: Extended  read FSUBTOTAL write FSUBTOTAL;

  end;

implementation



end.
