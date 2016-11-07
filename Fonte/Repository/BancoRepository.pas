unit BancoRepository;

interface

uses BasicRepository, System.Generics.Collections, System.SysUtils, FnBancoVO;

type
  TBancoRepository = class(TBasicRepository)

  class function index(Search: String): TList<TFnBancoVO>;
  class function store(Banco: TFnBancoVO): Boolean;
  class function update(Banco,BancoOld: TFnBancoVO): Boolean;
  class function destroyer(Banco: TFnBancoVO): Boolean;
  class function getById(IdBanco: String): TFnBancoVO;

  end;

implementation

{ TBancoRepository }

class function TBancoRepository.index(Search: String): TList<TFnBancoVO>;
var
  Filtro: String;
begin
  Filtro:= ' BANCO LIKE ' + QuotedStr(Search+'%');
  Result:= Consultar<TFnBancoVO>(False,Filtro);
end;

class function TBancoRepository.store(Banco: TFnBancoVO): Boolean;
begin
  Banco.Id:= storeFirebird(Banco);
  Result:= Trim(Banco.Id) <> EmptyStr;
end;

class function TBancoRepository.update(Banco, BancoOld: TFnBancoVO): Boolean;
begin
  Result:= Alterar(Banco,BancoOld);
end;

class function TBancoRepository.destroyer(Banco: TFnBancoVO): Boolean;
begin
  Result:= Excluir(Banco);
end;

class function TBancoRepository.getById(IdBanco: String): TFnBancoVO;
begin
  Result:= ConsultarUmObjeto<TFnBancoVO>('ID = ' + QuotedStr(IdBanco),False);
end;

end.
