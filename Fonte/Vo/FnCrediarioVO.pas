{*******************************************************************************
Title: iTEC-SOFTWARE                                                            
Description:  VO  relational the table [FN_CREDIARIO] 
                                                                                
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
unit FnCrediarioVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('FN_CREDIARIO')]
  TFnCrediarioVO = class(TVO)
  private
    FID: String;
    FID_COMPRA: String;
    FID_VENDA: String;
    FID_PARCELA_PAI: String;
    FID_PARCIAL: String;
    FID_BANCO: String;
    FID_PLANO_CONTA: String;
    FID_PESSOA: String;
    FID_CENTRO_CUSTO: String;
    FPARCELA: String;
    FDATA_VENCIMENTO: TDateTime;
    FVALOR: Extended;
    FVALOR_PAGO: Extended;
    FDATA_PAGAMENTO: TDateTime;
    FDESCONTO: Extended;
    FJUROS_MULTA: Extended;
    FSTATUS: String;
    FDESCRICAO: String;
    FTIPO_CADASTRO: String;
    FOBS: String;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: String  read FID write FID;
    [TColumn('ID_COMPRA','Id Compra',450,[ldGrid, ldLookup, ldCombobox], False)]
    property IdCompra: String  read FID_COMPRA write FID_COMPRA;
    [TColumn('ID_VENDA','Id Venda',450,[ldGrid, ldLookup, ldCombobox], False)]
    property IdVenda: String  read FID_VENDA write FID_VENDA;
    [TColumn('ID_PARCELA_PAI','Id Parcela Pai',450,[ldGrid, ldLookup, ldCombobox], False)]
    property IdParcelaPai: String  read FID_PARCELA_PAI write FID_PARCELA_PAI;
    [TColumn('ID_PARCIAL','Id Parcial',450,[ldGrid, ldLookup, ldCombobox], False)]
    property IdParcial: String  read FID_PARCIAL write FID_PARCIAL;
    [TColumn('ID_BANCO','Id Banco',450,[ldGrid, ldLookup, ldCombobox], False)]
    property IdBanco: String  read FID_BANCO write FID_BANCO;
    [TColumn('ID_PLANO_CONTA','Id Plano Conta',450,[ldGrid, ldLookup, ldCombobox], False)]
    property IdPlanoConta: String  read FID_PLANO_CONTA write FID_PLANO_CONTA;
    [TColumn('ID_PESSOA','Id Pessoa',450,[ldGrid, ldLookup, ldCombobox], False)]
    property IdPessoa: String  read FID_PESSOA write FID_PESSOA;
    [TColumn('ID_CENTRO_CUSTO','Id Centro Custo',450,[ldGrid, ldLookup, ldCombobox], False)]
    property IdCentroCusto: String  read FID_CENTRO_CUSTO write FID_CENTRO_CUSTO;
    [TColumn('PARCELA','Parcela',160,[ldGrid, ldLookup, ldCombobox], False)]
    property Parcela: String  read FPARCELA write FPARCELA;
    [TColumn('DATA_VENCIMENTO','Data Vencimento',80,[ldGrid, ldLookup, ldCombobox], False)]
    property DataVencimento: TDateTime  read FDATA_VENCIMENTO write FDATA_VENCIMENTO;
    [TColumn('VALOR','Valor',128,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Valor: Extended  read FVALOR write FVALOR;
    [TColumn('VALOR_PAGO','Valor Pago',128,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorPago: Extended  read FVALOR_PAGO write FVALOR_PAGO;
    [TColumn('DATA_PAGAMENTO','Data Pagamento',272,[ldGrid, ldLookup, ldCombobox], False)]
    property DataPagamento: TDateTime  read FDATA_PAGAMENTO write FDATA_PAGAMENTO;
    [TColumn('DESCONTO','Desconto',128,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Desconto: Extended  read FDESCONTO write FDESCONTO;
    [TColumn('JUROS_MULTA','Juros Multa',128,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property JurosMulta: Extended  read FJUROS_MULTA write FJUROS_MULTA;
    [TColumn('STATUS','Status',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Status: String  read FSTATUS write FSTATUS;
    [TColumn('DESCRICAO','Descricao',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Descricao: String  read FDESCRICAO write FDESCRICAO;
    [TColumn('TIPO_CADASTRO','Tipo Cadastro',450,[ldGrid, ldLookup, ldCombobox], False)]
    property TipoCadastro: String  read FTIPO_CADASTRO write FTIPO_CADASTRO;
    [TColumn('OBS','Obs',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Obs: String  read FOBS write FOBS;

  end;

implementation



end.
