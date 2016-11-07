unit CategoriaProdutoService;

interface

uses BasicService, System.Generics.Collections, System.SysUtils,Firedac.comp.client,
  PrCategoriaVO, CategoriaProdutoRepository, Biblioteca, Bibli;

type
  TCategoriaProdutoService = class(TBasicService)

  class procedure index(DataSet: TFDMemTable; Search: String);
  class function getById(IdCategoria: String): TPrCategoriaVO;
  class function save(Categoria: TPrCategoriaVO): Boolean;
  class function destroyer(IdCategoria: String): Boolean;

  end;

implementation

{ TCategoriaProdutoRepository }

class procedure TCategoriaProdutoService.index(DataSet: TFDMemTable; Search: String);
var
  Categorias: TList<TPrCategoriaVO>;
  I: Integer;
begin
  Categorias:= nil;
  Dataset.Open;
  Dataset.DisableControls;
  Dataset.EmptyDataSet;
  Categorias:= TCategoriaProdutoRepository.index(Search);
  if Assigned(Categorias) then
  begin
    for I:= 0 to Pred(Categorias.Count) do
    begin
      Dataset.Append;
      Dataset.FieldByName('ID').AsString:= Categorias.Items[I].Id;
      Dataset.FieldByName('MARK').AsInteger:= 0;
      Dataset.FieldByName('NOME').AsString:= Categorias.Items[I].Nome;
      Dataset.Post;
      Categorias.Items[I].Free;
    end;
    FreeAndNil(Categorias);
    Dataset.First;
  end;
  Dataset.EnableControls;
end;

class function TCategoriaProdutoService.getById(IdCategoria: String): TPrCategoriaVO;
begin
  Result:= TCategoriaProdutoRepository.getById(IdCategoria);
end;

class function TCategoriaProdutoService.save(Categoria: TPrCategoriaVO): Boolean;
var
  CategoriaOld: TPrCategoriaVO;
begin
  Result:= False;
  try
    try
      BeginTransaction;
      CategoriaOld:= TCategoriaProdutoRepository.getById(Categoria.Id);

      if not Assigned(CategoriaOld) then
        Result:= TCategoriaProdutoRepository.store(Categoria)
      else
      if Categoria.ToJSONString = CategoriaOld.ToJSONString then
      begin
        Result:= True;
        Commit;
        Exit;
      end
      else
        Result:= TCategoriaProdutoRepository.update(Categoria,CategoriaOld);
      Commit;
    except
      Rollback;
    end;
  finally
    FreeAndNil(CategoriaOld);
  end;
end;

class function TCategoriaProdutoService.destroyer(IdCategoria: String): Boolean;
var
  CategoriaObj: TPrCategoriaVO;
begin
  try
    Result:= False;
    try
      BeginTransaction;
      CategoriaObj:= TCategoriaProdutoRepository.getById(IdCategoria);
      TCategoriaProdutoRepository.destroyer(CategoriaObj);
      Commit;
      Result:= True;
    except
      Rollback;
    end;
  finally
    FreeAndNil(CategoriaObj);
  end;
end;

end.
