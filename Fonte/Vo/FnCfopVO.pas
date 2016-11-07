{*******************************************************************************
Title: iTEC-SOFTWARE                                                            
Description:  VO  relational the table [FN_CFOP] 
                                                                                
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
unit FnCfopVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('FN_CFOP')]
  TFnCfopVO = class(TVO)
  private
    FID: String;
    FCODIGO: String;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: String  read FID write FID;
    [TColumn('CODIGO','Codigo',128,[ldGrid, ldLookup, ldCombobox], False)]
    property Codigo: String  read FCODIGO write FCODIGO;

  end;

implementation



end.
