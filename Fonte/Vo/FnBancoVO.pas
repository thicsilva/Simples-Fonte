{*******************************************************************************
Title: iTEC-SOFTWARE                                                            
Description:  VO  relational the table [FN_BANCO] 
                                                                                
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
unit FnBancoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('FN_BANCO')]
  TFnBancoVO = class(TVO)
  private
    FID: String;
    FBANCO: String;
    FDESCRICAO: String;
    FTIPO_CONTA: String;
    FSALDO_INICIAL: Extended;
    FDATA_SALDO: TDateTime;
    FCONTA_PADRAO: String;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: String  read FID write FID;
    [TColumn('BANCO','Banco',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Banco: String  read FBANCO write FBANCO;
    [TColumn('DESCRICAO','Descricao',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Descricao: String  read FDESCRICAO write FDESCRICAO;
    [TColumn('TIPO_CONTA','Tipo Conta',450,[ldGrid, ldLookup, ldCombobox], False)]
    property TipoConta: String  read FTIPO_CONTA write FTIPO_CONTA;
    [TColumn('SALDO_INICIAL','Saldo Inicial',128,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property SaldoInicial: Extended  read FSALDO_INICIAL write FSALDO_INICIAL;
    [TColumn('DATA_SALDO','Data Saldo',80,[ldGrid, ldLookup, ldCombobox], False)]
    property DataSaldo: TDateTime  read FDATA_SALDO write FDATA_SALDO;
    [TColumn('CONTA_PADRAO','Conta Padrao',96,[ldGrid, ldLookup, ldCombobox], False)]
    property ContaPadrao: String  read FCONTA_PADRAO write FCONTA_PADRAO;

  end;

implementation



end.
