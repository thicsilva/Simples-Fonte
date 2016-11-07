{*******************************************************************************
Title: iTEC-SOFTWARE                                                            
Description:  VO  relational the table [PS_FISICA] 
                                                                                
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
unit PsFisicaVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('PS_FISICA')]
  TPsFisicaVO = class(TVO)
  private
    FID: String;
    FID_PESSOA: String;
    FCPF: String;
    FINDICADO_INSC_ESTADUAL: String;
    FRG: String;
    FEMAIL: String;
    FTELEFONE: String;
    FCELULAR: String;
    FNASCIMENTO: TDateTime;
    FOBS: String;
    FIDEN_ESTRANGEIRO: String;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: String  read FID write FID;
    [TColumn('ID_PESSOA','Id Pessoa',450,[ldGrid, ldLookup, ldCombobox], False)]
    property IdPessoa: String  read FID_PESSOA write FID_PESSOA;
    [TColumn('CPF','Cpf',448,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftCpf, taLeftJustify)]
    property Cpf: String  read FCPF write FCPF;
    [TColumn('INDICADO_INSC_ESTADUAL','Indicado Insc Estadual',450,[ldGrid, ldLookup, ldCombobox], False)]
    property IndicadoInscEstadual: String  read FINDICADO_INSC_ESTADUAL write FINDICADO_INSC_ESTADUAL;
    [TColumn('RG','Rg',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Rg: String  read FRG write FRG;
    [TColumn('EMAIL','Email',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Email: String  read FEMAIL write FEMAIL;
    [TColumn('TELEFONE','Telefone',450,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftTelefone, taLeftJustify)]
    property Telefone: String  read FTELEFONE write FTELEFONE;
    [TColumn('CELULAR','Celular',450,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftTelefone, taLeftJustify)]
    property Celular: String  read FCELULAR write FCELULAR;
    [TColumn('NASCIMENTO','Nascimento',80,[ldGrid, ldLookup, ldCombobox], False)]
    property Nascimento: TDateTime  read FNASCIMENTO write FNASCIMENTO;
    [TColumn('OBS','Obs',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Obs: String  read FOBS write FOBS;
    [TColumn('IDEN_ESTRANGEIRO','Iden Estrangeiro',450,[ldGrid, ldLookup, ldCombobox], False)]
    property IdenEstrangeiro: String  read FIDEN_ESTRANGEIRO write FIDEN_ESTRANGEIRO;

  end;

implementation



end.
