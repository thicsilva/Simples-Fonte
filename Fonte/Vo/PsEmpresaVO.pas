{*******************************************************************************
Title: iTEC-SOFTWARE                                                            
Description:  VO  relational the table [PS_EMPRESA] 
                                                                                
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
unit PsEmpresaVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('PS_EMPRESA')]
  TPsEmpresaVO = class(TVO)
  private
    FID: String;
    FID_PESSOA: String;
    FID_CNAE: String;
    FLOGO: String;
    FNOME_FANTASIA: String;
    FNATUREZA_OPERACAO: String;
    FESPECIAL_TRIBUTACAO: String;
    FIMPORTA_PRODUTO: String;
    FSERIAL: String;
    FINICIO: TDateTime;
    FTERMINO: TDateTime;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: String  read FID write FID;
    [TColumn('ID_PESSOA','Id Pessoa',450,[ldGrid, ldLookup, ldCombobox], False)]
    property IdPessoa: String  read FID_PESSOA write FID_PESSOA;
    [TColumn('ID_CNAE','Id Cnae',450,[ldGrid, ldLookup, ldCombobox], False)]
    property IdCnae: String  read FID_CNAE write FID_CNAE;
    [TColumn('LOGO','Logo',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Logo: String  read FLOGO write FLOGO;
    [TColumn('NOME_FANTASIA','Nome Fantasia',450,[ldGrid, ldLookup, ldCombobox], False)]
    property NomeFantasia: String  read FNOME_FANTASIA write FNOME_FANTASIA;
    [TColumn('NATUREZA_OPERACAO','Natureza Operacao',450,[ldGrid, ldLookup, ldCombobox], False)]
    property NaturezaOperacao: String  read FNATUREZA_OPERACAO write FNATUREZA_OPERACAO;
    [TColumn('ESPECIAL_TRIBUTACAO','Especial Tributacao',450,[ldGrid, ldLookup, ldCombobox], False)]
    property EspecialTributacao: String  read FESPECIAL_TRIBUTACAO write FESPECIAL_TRIBUTACAO;
    [TColumn('IMPORTA_PRODUTO','Importa Produto',96,[ldGrid, ldLookup, ldCombobox], False)]
    property ImportaProduto: String  read FIMPORTA_PRODUTO write FIMPORTA_PRODUTO;
    [TColumn('SERIAL','Serial',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Serial: String  read FSERIAL write FSERIAL;
    [TColumn('INICIO','Inicio',80,[ldGrid, ldLookup, ldCombobox], False)]
    property Inicio: TDateTime  read FINICIO write FINICIO;
    [TColumn('TERMINO','Termino',80,[ldGrid, ldLookup, ldCombobox], False)]
    property Termino: TDateTime  read FTERMINO write FTERMINO;

  end;

implementation



end.
