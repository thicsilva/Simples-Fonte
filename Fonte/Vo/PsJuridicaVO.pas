{*******************************************************************************
Title: iTEC-SOFTWARE                                                            
Description:  VO  relational the table [PS_JURIDICA] 
                                                                                
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
unit PsJuridicaVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('PS_JURIDICA')]
  TPsJuridicaVO = class(TVO)
  private
    FID: String;
    FID_PESSOA: String;
    FCNPJ: String;
    FRAZAO_SOCIAL: String;
    FINDICADO_INSC_ESTADUAL: String;
    FINSC_ESTADUAL: String;
    FINSENTO_INSC_ESTADUAL: String;
    FINSC_MUNICIPAL: String;
    FINSC_SUFRAMA: String;
    FSIMPLES: String;
    FEMAIL: String;
    FTELEFONE: String;
    FCELULAR: String;
    FDATA_FUNDACAO: TDateTime;
    FOBS: String;
    FIDEN_ESTRANGEIRO: String;
    FFRETE: Extended;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: String  read FID write FID;
    [TColumn('ID_PESSOA','Id Pessoa',450,[ldGrid, ldLookup, ldCombobox], False)]
    property IdPessoa: String  read FID_PESSOA write FID_PESSOA;
    [TColumn('CNPJ','Cnpj',450,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftCnpj, taLeftJustify)]
    property Cnpj: String  read FCNPJ write FCNPJ;
    [TColumn('RAZAO_SOCIAL','Razao Social',450,[ldGrid, ldLookup, ldCombobox], False)]
    property RazaoSocial: String  read FRAZAO_SOCIAL write FRAZAO_SOCIAL;
    [TColumn('INDICADO_INSC_ESTADUAL','Indicado Insc Estadual',450,[ldGrid, ldLookup, ldCombobox], False)]
    property IndicadoInscEstadual: String  read FINDICADO_INSC_ESTADUAL write FINDICADO_INSC_ESTADUAL;
    [TColumn('INSC_ESTADUAL','Insc Estadual',450,[ldGrid, ldLookup, ldCombobox], False)]
    property InscEstadual: String  read FINSC_ESTADUAL write FINSC_ESTADUAL;
    [TColumn('INSENTO_INSC_ESTADUAL','Insento Insc Estadual',96,[ldGrid, ldLookup, ldCombobox], False)]
    property InsentoInscEstadual: String  read FINSENTO_INSC_ESTADUAL write FINSENTO_INSC_ESTADUAL;
    [TColumn('INSC_MUNICIPAL','Insc Municipal',450,[ldGrid, ldLookup, ldCombobox], False)]
    property InscMunicipal: String  read FINSC_MUNICIPAL write FINSC_MUNICIPAL;
    [TColumn('INSC_SUFRAMA','Insc Suframa',450,[ldGrid, ldLookup, ldCombobox], False)]
    property InscSuframa: String  read FINSC_SUFRAMA write FINSC_SUFRAMA;
    [TColumn('SIMPLES','Simples',96,[ldGrid, ldLookup, ldCombobox], False)]
    property Simples: String  read FSIMPLES write FSIMPLES;
    [TColumn('EMAIL','Email',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Email: String  read FEMAIL write FEMAIL;
    [TColumn('TELEFONE','Telefone',450,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftTelefone, taLeftJustify)]
    property Telefone: String  read FTELEFONE write FTELEFONE;
    [TColumn('CELULAR','Celular',450,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftTelefone, taLeftJustify)]
    property Celular: String  read FCELULAR write FCELULAR;
    [TColumn('DATA_FUNDACAO','Data Fundacao',80,[ldGrid, ldLookup, ldCombobox], False)]
    property DataFundacao: TDateTime  read FDATA_FUNDACAO write FDATA_FUNDACAO;
    [TColumn('OBS','Obs',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Obs: String  read FOBS write FOBS;
    [TColumn('IDEN_ESTRANGEIRO','Iden Estrangeiro',450,[ldGrid, ldLookup, ldCombobox], False)]
    property IdenEstrangeiro: String  read FIDEN_ESTRANGEIRO write FIDEN_ESTRANGEIRO;
    [TColumn('FRETE','Frete',128,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Frete: Extended  read FFRETE write FFRETE;

  end;

implementation



end.
