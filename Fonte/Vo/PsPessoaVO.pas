{*******************************************************************************
Title: iTEC-SOFTWARE                                                            
Description:  VO  relational the table [PS_PESSOA] 
                                                                                
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
unit PsPessoaVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('PS_PESSOA')]
  TPsPessoaVO = class(TVO)
  private
    FID: String;
    FNOME: String;
    FINCLUSO: TDateTime;
    FTIPO_PESSOA: String;
    FTIPO_CADASTRO: String;
    FCEP: String;
    FENDERECO: String;
    FNUMERO: String;
    FCOMPLEMENTO: String;
    FBAIRRO: String;
    FCIDADE: String;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: String  read FID write FID;
    [TColumn('NOME','Nome',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Nome: String  read FNOME write FNOME;
    [TColumn('INCLUSO','Incluso',272,[ldGrid, ldLookup, ldCombobox], False)]
    property Incluso: TDateTime  read FINCLUSO write FINCLUSO;
    [TColumn('TIPO_PESSOA','Tipo Pessoa',450,[ldGrid, ldLookup, ldCombobox], False)]
    property TipoPessoa: String  read FTIPO_PESSOA write FTIPO_PESSOA;
    [TColumn('TIPO_CADASTRO','Tipo Cadastro',450,[ldGrid, ldLookup, ldCombobox], False)]
    property TipoCadastro: String  read FTIPO_CADASTRO write FTIPO_CADASTRO;
    [TColumn('CEP','Cep',256,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftCep, taLeftJustify)]
    property Cep: String  read FCEP write FCEP;
    [TColumn('ENDERECO','Endereco',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Endereco: String  read FENDERECO write FENDERECO;
    [TColumn('NUMERO','Numero',320,[ldGrid, ldLookup, ldCombobox], False)]
    property Numero: String  read FNUMERO write FNUMERO;
    [TColumn('COMPLEMENTO','Complemento',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Complemento: String  read FCOMPLEMENTO write FCOMPLEMENTO;
    [TColumn('BAIRRO','Bairro',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Bairro: String  read FBAIRRO write FBAIRRO;
    [TColumn('CIDADE','Cidade',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Cidade: String  read FCIDADE write FCIDADE;

  end;

implementation



end.
