{*******************************************************************************
Title: iTEC-SOFTWARE                                                            
Description:  VO  relational the table [VIEW_INVENTARIO_ESTOQUE] 
                                                                                
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
unit ViewInventarioEstoqueVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('VIEW_INVENTARIO_ESTOQUE')]
  TViewInventarioEstoqueVO = class(TVO)
  private
    FID: String;
    FNOME: String;
    FID_CATEGORIA: String;
    FID_MEDIDA: String;
    FID_PESSOA: String;
    FCODIGO: String;
    FVALOR_CUSTO: Extended;
    FESTOQUE: Extended;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: String  read FID write FID;
    [TColumn('NOME','Nome',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Nome: String  read FNOME write FNOME;
    [TColumn('ID_CATEGORIA','Id Categoria',450,[ldGrid, ldLookup, ldCombobox], False)]
    property IdCategoria: String  read FID_CATEGORIA write FID_CATEGORIA;
    [TColumn('ID_MEDIDA','Id Medida',450,[ldGrid, ldLookup, ldCombobox], False)]
    property IdMedida: String  read FID_MEDIDA write FID_MEDIDA;
    [TColumn('ID_PESSOA','Id Pessoa',450,[ldGrid, ldLookup, ldCombobox], False)]
    property IdPessoa: String  read FID_PESSOA write FID_PESSOA;
    [TColumn('CODIGO','Codigo',320,[ldGrid, ldLookup, ldCombobox], False)]
    property Codigo: String  read FCODIGO write FCODIGO;
    [TColumn('VALOR_CUSTO','Valor Custo',128,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorCusto: Extended  read FVALOR_CUSTO write FVALOR_CUSTO;
    [TColumn('ESTOQUE','Estoque',128,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Estoque: Extended  read FESTOQUE write FESTOQUE;

  end;

implementation



end.
