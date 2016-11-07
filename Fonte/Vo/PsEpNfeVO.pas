{*******************************************************************************
Title: iTEC-SOFTWARE                                                            
Description:  VO  relational the table [PS_EP_NFE] 
                                                                                
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
unit PsEpNfeVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('PS_EP_NFE')]
  TPsEpNfeVO = class(TVO)
  private
    FID: String;
    FID_EMPRESA: String;
    FEMISSAO: String;
    FSALVAR_ARQUIVOS: String;
    FPATH_ARQUIVOS: String;
    FCT_PATH: String;
    FCT_SENHA: String;
    FCT_NUMERO_SERIE: String;
    FWS_UF: String;
    FWS_AMBIENTE_DESTINO: String;
    FCONEXAO_HOST: String;
    FCONEXAO_PORTA: String;
    FCONEXAO_USUARIO: String;
    FCONEXAO_SENHA: String;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: String  read FID write FID;
    [TColumn('ID_EMPRESA','Id Empresa',450,[ldGrid, ldLookup, ldCombobox], False)]
    property IdEmpresa: String  read FID_EMPRESA write FID_EMPRESA;
    [TColumn('EMISSAO','Emissao',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Emissao: String  read FEMISSAO write FEMISSAO;
    [TColumn('SALVAR_ARQUIVOS','Salvar Arquivos',96,[ldGrid, ldLookup, ldCombobox], False)]
    property SalvarArquivos: String  read FSALVAR_ARQUIVOS write FSALVAR_ARQUIVOS;
    [TColumn('PATH_ARQUIVOS','Path Arquivos',450,[ldGrid, ldLookup, ldCombobox], False)]
    property PathArquivos: String  read FPATH_ARQUIVOS write FPATH_ARQUIVOS;
    [TColumn('CT_PATH','Ct Path',450,[ldGrid, ldLookup, ldCombobox], False)]
    property CtPath: String  read FCT_PATH write FCT_PATH;
    [TColumn('CT_SENHA','Ct Senha',96,[ldGrid, ldLookup, ldCombobox], False)]
    property CtSenha: String  read FCT_SENHA write FCT_SENHA;
    [TColumn('CT_NUMERO_SERIE','Ct Numero Serie',450,[ldGrid, ldLookup, ldCombobox], False)]
    property CtNumeroSerie: String  read FCT_NUMERO_SERIE write FCT_NUMERO_SERIE;
    [TColumn('WS_UF','Ws Uf',64,[ldGrid, ldLookup, ldCombobox], False)]
    property WsUf: String  read FWS_UF write FWS_UF;
    [TColumn('WS_AMBIENTE_DESTINO','Ws Ambiente Destino',450,[ldGrid, ldLookup, ldCombobox], False)]
    property WsAmbienteDestino: String  read FWS_AMBIENTE_DESTINO write FWS_AMBIENTE_DESTINO;
    [TColumn('CONEXAO_HOST','Conexao Host',450,[ldGrid, ldLookup, ldCombobox], False)]
    property ConexaoHost: String  read FCONEXAO_HOST write FCONEXAO_HOST;
    [TColumn('CONEXAO_PORTA','Conexao Porta',160,[ldGrid, ldLookup, ldCombobox], False)]
    property ConexaoPorta: String  read FCONEXAO_PORTA write FCONEXAO_PORTA;
    [TColumn('CONEXAO_USUARIO','Conexao Usuario',450,[ldGrid, ldLookup, ldCombobox], False)]
    property ConexaoUsuario: String  read FCONEXAO_USUARIO write FCONEXAO_USUARIO;
    [TColumn('CONEXAO_SENHA','Conexao Senha',450,[ldGrid, ldLookup, ldCombobox], False)]
    property ConexaoSenha: String  read FCONEXAO_SENHA write FCONEXAO_SENHA;

  end;

implementation



end.
