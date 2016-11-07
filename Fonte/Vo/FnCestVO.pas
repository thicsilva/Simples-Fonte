{*******************************************************************************
Title: iTEC-SOFTWARE                                                            
Description:  VO  relational the table [FN_CEST] 
                                                                                
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
unit FnCestVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('FN_CEST')]
  TFnCestVO = class(TVO)
  private
    FID: String;
    FCEST: String;
    FNCM: String;
    FDESCRICAO: String;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: String  read FID write FID;
    [TColumn('CEST','Cest',224,[ldGrid, ldLookup, ldCombobox], False)]
    property Cest: String  read FCEST write FCEST;
    [TColumn('NCM','Ncm',256,[ldGrid, ldLookup, ldCombobox], False)]
    property Ncm: String  read FNCM write FNCM;
    [TColumn('DESCRICAO','Descricao',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Descricao: String  read FDESCRICAO write FDESCRICAO;

  end;

implementation



end.
