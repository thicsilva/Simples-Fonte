{*******************************************************************************
Title: iTEC-SOFTWARE                                                            
Description:  VO  relational the table [PR_ESTOQUE] 
                                                                                
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
unit PrEstoqueVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('PR_ESTOQUE')]
  TPrEstoqueVO = class(TVO)
  private
    FID: String;
    FID_PRODUTO: String;
    FID_PESSOA: String;
    FID_COMPRA_ITEM: String;
    FID_VENDA_ITEM: String;
    FMOVIMENTACAO: String;
    FVALOR_UNITARIO: Extended;
    FVALOR_CUSTO: Extended;
    FQT_MOVIMENTADA: Extended;
    FSALDO_ESTOQUE: Extended;
    FDATA_HORA: TDateTime;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: String  read FID write FID;
    [TColumn('ID_PRODUTO','Id Produto',450,[ldGrid, ldLookup, ldCombobox], False)]
    property IdProduto: String  read FID_PRODUTO write FID_PRODUTO;
    [TColumn('ID_PESSOA','Id Pessoa',450,[ldGrid, ldLookup, ldCombobox], False)]
    property IdPessoa: String  read FID_PESSOA write FID_PESSOA;
    [TColumn('ID_COMPRA_ITEM','Id Compra Item',450,[ldGrid, ldLookup, ldCombobox], False)]
    property IdCompraItem: String  read FID_COMPRA_ITEM write FID_COMPRA_ITEM;
    [TColumn('ID_VENDA_ITEM','Id Venda Item',450,[ldGrid, ldLookup, ldCombobox], False)]
    property IdVendaItem: String  read FID_VENDA_ITEM write FID_VENDA_ITEM;
    [TColumn('MOVIMENTACAO','Movimentacao',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Movimentacao: String  read FMOVIMENTACAO write FMOVIMENTACAO;
    [TColumn('VALOR_UNITARIO','Valor Unitario',128,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorUnitario: Extended  read FVALOR_UNITARIO write FVALOR_UNITARIO;
    [TColumn('VALOR_CUSTO','Valor Custo',128,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorCusto: Extended  read FVALOR_CUSTO write FVALOR_CUSTO;
    [TColumn('QT_MOVIMENTADA','Qt Movimentada',128,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property QtMovimentada: Extended  read FQT_MOVIMENTADA write FQT_MOVIMENTADA;
    [TColumn('SALDO_ESTOQUE','Saldo Estoque',128,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property SaldoEstoque: Extended  read FSALDO_ESTOQUE write FSALDO_ESTOQUE;
    [TColumn('DATA_HORA','Data Hora',272,[ldGrid, ldLookup, ldCombobox], False)]
    property DataHora: TDateTime  read FDATA_HORA write FDATA_HORA;

  end;

implementation



end.
