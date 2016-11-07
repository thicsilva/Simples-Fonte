{*******************************************************************************
Title: iTEC-SOFTWARE                                                            
Description:  VO  relational the table [FN_OS] 
                                                                                
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
unit FnOsVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('FN_OS')]
  TFnOsVO = class(TVO)
  private
    FID: String;
    FID_PESSOA: String;
    FSTATUS: String;
    FNUMERO_OS: String;
    FDATA_INICIO: TDateTime;
    FDATA_ENTREGA: TDateTime;
    FRESPONSAVEL: String;
    FESQUIPAMENTO: String;
    FN_SERIE: String;
    FMARCA: String;
    FMODELO: String;
    FOBS_RECEBIMENTO: String;
    FPOBLEMA_DEFEITO: String;
    FSERVICO_PRESTADO: String;
    FOBS_INTERNA: String;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: String  read FID write FID;
    [TColumn('ID_PESSOA','Id Pessoa',450,[ldGrid, ldLookup, ldCombobox], False)]
    property IdPessoa: String  read FID_PESSOA write FID_PESSOA;
    [TColumn('STATUS','Status',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Status: String  read FSTATUS write FSTATUS;
    [TColumn('NUMERO_OS','Numero Os',320,[ldGrid, ldLookup, ldCombobox], False)]
    property NumeroOs: String  read FNUMERO_OS write FNUMERO_OS;
    [TColumn('DATA_INICIO','Data Inicio',80,[ldGrid, ldLookup, ldCombobox], False)]
    property DataInicio: TDateTime  read FDATA_INICIO write FDATA_INICIO;
    [TColumn('DATA_ENTREGA','Data Entrega',80,[ldGrid, ldLookup, ldCombobox], False)]
    property DataEntrega: TDateTime  read FDATA_ENTREGA write FDATA_ENTREGA;
    [TColumn('RESPONSAVEL','Responsavel',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Responsavel: String  read FRESPONSAVEL write FRESPONSAVEL;
    [TColumn('ESQUIPAMENTO','Esquipamento',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Esquipamento: String  read FESQUIPAMENTO write FESQUIPAMENTO;
    [TColumn('N_SERIE','N Serie',450,[ldGrid, ldLookup, ldCombobox], False)]
    property NSerie: String  read FN_SERIE write FN_SERIE;
    [TColumn('MARCA','Marca',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Marca: String  read FMARCA write FMARCA;
    [TColumn('MODELO','Modelo',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Modelo: String  read FMODELO write FMODELO;
    [TColumn('OBS_RECEBIMENTO','Obs Recebimento',450,[ldGrid, ldLookup, ldCombobox], False)]
    property ObsRecebimento: String  read FOBS_RECEBIMENTO write FOBS_RECEBIMENTO;
    [TColumn('POBLEMA_DEFEITO','Poblema Defeito',450,[ldGrid, ldLookup, ldCombobox], False)]
    property PoblemaDefeito: String  read FPOBLEMA_DEFEITO write FPOBLEMA_DEFEITO;
    [TColumn('SERVICO_PRESTADO','Servico Prestado',450,[ldGrid, ldLookup, ldCombobox], False)]
    property ServicoPrestado: String  read FSERVICO_PRESTADO write FSERVICO_PRESTADO;
    [TColumn('OBS_INTERNA','Obs Interna',450,[ldGrid, ldLookup, ldCombobox], False)]
    property ObsInterna: String  read FOBS_INTERNA write FOBS_INTERNA;

  end;

implementation



end.
