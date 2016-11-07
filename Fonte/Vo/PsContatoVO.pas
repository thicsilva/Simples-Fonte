{*******************************************************************************
Title: iTEC-SOFTWARE                                                            
Description:  VO  relational the table [PS_CONTATO] 
                                                                                
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
unit PsContatoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('PS_CONTATO')]
  TPsContatoVO = class(TVO)
  private
    FID: String;
    FID_PESSOA: String;
    FNOME: String;
    FEMAIL: String;
    FFONE: String;
    FCARGO: String;
    FFONE_COMERCIAL: String;
    FFONE_RESIDENCIAL: String;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: String  read FID write FID;
    [TColumn('ID_PESSOA','Id Pessoa',450,[ldGrid, ldLookup, ldCombobox], False)]
    property IdPessoa: String  read FID_PESSOA write FID_PESSOA;
    [TColumn('NOME','Nome',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Nome: String  read FNOME write FNOME;
    [TColumn('EMAIL','Email',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Email: String  read FEMAIL write FEMAIL;
    [TColumn('FONE','Fone',450,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftTelefone, taLeftJustify)]
    property Fone: String  read FFONE write FFONE;
    [TColumn('CARGO','Cargo',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Cargo: String  read FCARGO write FCARGO;
    [TColumn('FONE_COMERCIAL','Fone Comercial',450,[ldGrid, ldLookup, ldCombobox], False)]
    property FoneComercial: String  read FFONE_COMERCIAL write FFONE_COMERCIAL;
    [TColumn('FONE_RESIDENCIAL','Fone Residencial',450,[ldGrid, ldLookup, ldCombobox], False)]
    property FoneResidencial: String  read FFONE_RESIDENCIAL write FFONE_RESIDENCIAL;

  end;

implementation



end.
