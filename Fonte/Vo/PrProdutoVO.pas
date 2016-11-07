{*******************************************************************************
Title: iTEC-SOFTWARE                                                            
Description:  VO  relational the table [PR_PRODUTO] 
                                                                                
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
unit PrProdutoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('PR_PRODUTO')]
  TPrProdutoVO = class(TVO)
  private
    FID: String;
    FNOME: String;
    FCODIGO: String;
    FCODIGO_BARRAS: String;
    FVALOR_VENDA: Extended;
    FVALOR_CUSTO: Extended;
    FMINIMO_ESTOQUE: Extended;
    FMAXIMO_ESTOQUE: Extended;
    FDISPONIVEL_ESTOQUE: Extended;
    FPESO_LIQUIDO: Extended;
    FPESO_BRUTO: Extended;
    FTIPO_CADASTRO: String;
    FUPDATE_ESTOQUE: Integer;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: String  read FID write FID;
    [TColumn('NOME','Nome',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Nome: String  read FNOME write FNOME;
    [TColumn('CODIGO','Codigo',320,[ldGrid, ldLookup, ldCombobox], False)]
    property Codigo: String  read FCODIGO write FCODIGO;
    [TColumn('CODIGO_BARRAS','Codigo Barras',450,[ldGrid, ldLookup, ldCombobox], False)]
    property CodigoBarras: String  read FCODIGO_BARRAS write FCODIGO_BARRAS;
    [TColumn('VALOR_VENDA','Valor Venda',128,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorVenda: Extended  read FVALOR_VENDA write FVALOR_VENDA;
    [TColumn('VALOR_CUSTO','Valor Custo',128,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorCusto: Extended  read FVALOR_CUSTO write FVALOR_CUSTO;
    [TColumn('MINIMO_ESTOQUE','Minimo Estoque',128,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property MinimoEstoque: Extended  read FMINIMO_ESTOQUE write FMINIMO_ESTOQUE;
    [TColumn('MAXIMO_ESTOQUE','Maximo Estoque',128,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property MaximoEstoque: Extended  read FMAXIMO_ESTOQUE write FMAXIMO_ESTOQUE;
    [TColumn('DISPONIVEL_ESTOQUE','Disponivel Estoque',128,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property DisponivelEstoque: Extended  read FDISPONIVEL_ESTOQUE write FDISPONIVEL_ESTOQUE;
    [TColumn('PESO_LIQUIDO','Peso Liquido',128,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PesoLiquido: Extended  read FPESO_LIQUIDO write FPESO_LIQUIDO;
    [TColumn('PESO_BRUTO','Peso Bruto',128,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PesoBruto: Extended  read FPESO_BRUTO write FPESO_BRUTO;
    [TColumn('TIPO_CADASTRO','Tipo Cadastro',450,[ldGrid, ldLookup, ldCombobox], False)]
    property TipoCadastro: String  read FTIPO_CADASTRO write FTIPO_CADASTRO;
    [TColumn('UPDATE_ESTOQUE','Update Estoque',80,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property UpdateEstoque: Integer  read FUPDATE_ESTOQUE write FUPDATE_ESTOQUE;

  end;

implementation



end.
