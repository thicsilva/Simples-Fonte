unit VO;

interface

uses
  DBXJSON, DBXJSONReflect, DBXCommon, RTTI, TypInfo, Atributos, SysUtils,
  IOUtils, Generics.Collections, Classes, System.JSON;

type
  TVO = class
  public
    constructor Create; overload; virtual;
    constructor Create(pJsonValue: TJSONValue); overload; virtual;

    function Clone: TVO;
    function MainObject: TVO;
    function ToJSON: TJSONValue; virtual;
    function ToJSONString: string;

    class function ObjectToJSON<O: class>(objeto: O): TJSONValue;
    class function JSONToObject<O: class>(json: TJSONValue): O;
    class function SaveFileJSON<O: class>(pObj: O; const pFilePath: string): Boolean;
    class function LoadFileJSON<O: class>(const pFilePath: string): O;
  end;

  TClassJsonVO = class of TVO;

  TGenericVO<T: class> = class
  private
    class function CreateObject: T;
    class function GetColumn(pName: string): TColumn;
  public
    class function FromDBXReader(pReader: TDBXReader): T;
    class function FieldCaption(pFieldName: string): string;
    class function FieldLength(pFieldName: string): Integer;
  end;

function VOFromDBXReader(pObj: TVO; pReader: TDBXReader): TVO;

implementation

{ TVO }

constructor TVO.Create;
begin
  inherited Create;
end;

constructor TVO.Create(pJsonValue: TJSONValue);
var
  Deserializa: TJSONUnMarshal;
begin
  if pJsonValue is TJSONNull then
    Exception.Create('Erro ao criar objeto com um valor nulo.');

  Deserializa := TJSONUnMarshal.Create;
  try
    Self.Free;
    Self:= Deserializa.Unmarshal(pJsonValue) as TVO;
  finally
    Deserializa.Free;
  end;
end;

function TVO.Clone: TVO;
var
  Contexto: TRttiContext;
  Tipo: TRttiType;
  Field: TRttiField;
  Value: TValue;
  Obj: TVO;
begin
  //-- Cria uma nova instãncia do Objeto.
  Result:= Self.NewInstance as TVO;

  //-- Clona Informações.
  Contexto:= TRttiContext.Create;
  try
    Tipo:= Contexto.GetType(Self.ClassType);
    for Field in Tipo.GetFields do
    begin
      Value:= Field.GetValue(Self);

      if Value.IsObject then
      begin
        if Value.IsInstanceOf(TVO) then
        begin
          Obj:= (Value.AsObject as TVO).Clone;
          Value:= TValue.From(Obj);
          Tipo.GetField(Field.Name).SetValue(Result, Value);
        end;
      end
      else
      begin
        Tipo.GetField(Field.Name).SetValue(Result, Value);
      end;
    end;
  finally
    Contexto.Free;
  end;
end;

function TVO.MainObject: TVO;
var
  Contexto: TRttiContext;
  Tipo: TRttiType;
  Atributo: TCustomAttribute;
  Propriedade: TRttiProperty;
begin
  //-- Clona Informações.
  Result:= Self.Clone;

  //-- Anula os objetos associados.
  Contexto := TRttiContext.Create;
  try
    Tipo:= Contexto.GetType(Result.ClassType);

    //-- Percorre propriedades.
    for Propriedade in Tipo.GetProperties do
    begin
      //-- Percorre atributos.
      for Atributo in Propriedade.GetAttributes do
      begin
        //-- Verifica se o atributo é um atributo de associação para muitos.
        if Atributo is TManyValuedAssociation then
        begin
          Propriedade.SetValue(Result, nil);
        end
        //-- Verifica se o atributo é um atributo de associação para uma classe
        else if Atributo is TAssociation then
        begin
          Propriedade.SetValue(Result, nil);
        end;
      end;
    end;
  finally
    Contexto.Free;
  end;
end;

function TVO.ToJSON: TJSONValue;
var
  Serializa: TJSONMarshal;
begin
  Serializa:= TJSONMarshal.Create(TJSONConverter.Create);
  try
    Exit(Serializa.Marshal(Self));
  finally
    Serializa.Free;
  end;
end;

function TVO.ToJSONString: string;
var
  jValue: TJSONValue;
begin
  jValue:= ToJSON;
  try
    Result:= jValue.ToString;
  finally
    jValue.Free;
  end;
end;

class function TVO.JSONToObject<O>(json: TJSONValue): O;
var
  Deserializa: TJSONUnMarshal;
begin
  if json is TJSONNull then
    Exit(nil);

  Deserializa:= TJSONUnMarshal.Create;
  try
    Exit(O(Deserializa.Unmarshal(json)))
  finally
    Deserializa.Free;
  end;
end;

class function TVO.ObjectToJSON<O>(objeto: O): TJSONValue;
var
  Serializa: TJSONMarshal;
begin
  if Assigned(objeto) then
  begin
    Serializa:= TJSONMarshal.Create(TJSONConverter.Create);
    try
      Exit(Serializa.Marshal(objeto));
    finally
      Serializa.Free;
    end;
  end
  else
    Exit(TJSONNull.Create);
end;

class function TVO.SaveFileJSON<O>(pObj: O; const pFilePath: string): Boolean;
var
  Serializa: TJSONMarshal;
  jObj: TJSONObject;
begin
  Serializa:= TJSONMarshal.Create(TJSONConverter.Create());
  try
    try
      jObj:= Serializa.Marshal(pObj) as TJSONObject;
      try
        TFile.WriteAllText(pFilePath, jObj.ToString);
      finally
        jObj.Free;
      end;

      Result:= True;
    except
      Result:= False;
      raise;
    end;
  finally
    FreeAndNil(Serializa);
  end;
end;

class function TVO.LoadFileJSON<O>(const pFilePath: string): O;
var
  Deserializa: TJSONUnMarshal;
  Obj: TJSONObject;
begin
  Deserializa:= TJSONUnMarshal.Create();
  try
    try
      if not(FileExists(pFilePath)) then
        Exit(nil);

      Obj:= TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(TFile.ReadAllText(pFilePath)), 0) as TJSONObject;
      try
        Result:= O(Deserializa.Unmarshal(Obj));
      finally
        Obj.Free;
      end;
    except
      Exit(nil);
      raise ;
    end;
  finally
    FreeAndNil(Deserializa);
  end;
end;

{ TGenericVO<T> }

class function TGenericVO<T>.CreateObject: T;
var
  Contexto: TRttiContext;
  Tipo: TRttiType;
  Value: TValue;
  Obj: TObject;
begin
  //-- Criando Objeto via RTTI para chamar o envento OnCreate no Objeto.
  Contexto := TRttiContext.Create;
  try
    Tipo:= Contexto.GetType(TClass(T));
    Value:= Tipo.GetMethod('Create').Invoke(Tipo.AsInstance.MetaclassType, []);
    Result:= T(Value.AsObject);
  finally
    Contexto.Free;
  end;
end;

class function TGenericVO<T>.FromDBXReader(pReader: TDBXReader): T;
var
  Obj: T;
  Contexto: TRttiContext;
  Tipo: TRttiType;
  Propriedade: TRttiProperty;
  Propriedades: TArray<TRttiProperty>;
  Atributo: TCustomAttribute;
  Value: TValue;
  I, A: Integer;
  NomeCampo: string;
  DBXValueType: TDBXValueType;
  DBXValue: TDBXValue;
  EncontrouPropriedade: Boolean;
begin
  Obj:= CreateObject;

  Contexto:= TRttiContext.Create;
  try
    Tipo:= Contexto.GetType(TObject(Obj).ClassType);

    Propriedades:= Tipo.GetProperties;

    for I:= 0 to pReader.ColumnCount - 1 do
    begin
      DBXValueType:= pReader.ValueType[I];
      DBXValue:= pReader.Value[I];
      NomeCampo:= UpperCase(DBXValueType.Name);

      with TDBXDataTypes do
      begin
        case DBXValueType.DataType of
          AnsiStringType, WideStringType, BlobType:
            Value:= DBXValue.AsString;

          DateType:
          begin
            if DBXValue.AsDate > 0 then
              Value:= DBXValue.AsDateTime
            else
              Value:= TValue.Empty;
          end;

          DateTimeType, TimeStampType:
          begin
            if DBXValue.AsDateTime > 0 then
              Value:= DBXValue.AsDateTime
            else
              Value:= TValue.Empty;
          end;

          TimeType:
          begin
            if DBXValue.AsTime > 0 then
              Value:= DBXValue.AsTime
            else
              Value:= TValue.Empty;
          end;

          Int32Type:
          begin
            if DBXValue.IsNull then
              Value:= TValue.Empty
            else
              Value:= DBXValue.AsInt32;
          end;

          Int64Type:
          begin
            if DBXValue.IsNull then
              Value:= TValue.Empty
            else
              Value:= DBXValue.AsInt64;
          end;

          DoubleType, BcdType, CurrencyType:
          begin
            if DBXValue.IsNull then
              Value:= TValue.Empty
            else
              Value:= DBXValue.AsDouble;
          end;

          BinaryBlobType, BytesType, VariantType:
            Value:= TValue.FromVariant(DBXValue.AsVariant);

          BooleanType:
            Value:= DBXValue.AsBoolean;

        else
          Value:= TValue.Empty;
        end;
      end;

      EncontrouPropriedade:= False;
      for A:= 0 to Length(Propriedades) - 1 do
      begin
        Propriedade:= Propriedades[A];
        for Atributo in Propriedade.GetAttributes do
        begin
          if Atributo is TColumn then
          begin
            if (Atributo as TColumn).Name = NomeCampo then
            begin
              if not Value.IsEmpty then
              begin
                Propriedade.SetValue(TObject(Obj), Value);
              end;

              EncontrouPropriedade := True;
              Break;
            end;
          end
          else if Atributo is TId then
          begin
            if (Atributo as TId).NameField = NomeCampo then
            begin
              if not Value.IsEmpty then
              begin
                Propriedade.SetValue(TObject(Obj), Value);
              end;

              EncontrouPropriedade := True;
              Break;
            end;
          end;
        end;

        if EncontrouPropriedade then
          Break;
      end;
    end;
  finally
    Contexto.Free;
  end;

  Result := Obj;
end;

class function TGenericVO<T>.GetColumn(pName: string): TColumn;
var
  Obj: T;
  Contexto: TRttiContext;
  Tipo: TRttiType;
  Propriedade: TRttiProperty;
  Atributo: TCustomAttribute;
  Encontrou: Boolean;
begin
  Result:= nil;

  Obj:= CreateObject;
  Contexto:= TRttiContext.Create;
  try
    Tipo:= Contexto.GetType(TObject(Obj).ClassType);

    Encontrou:= False;
    for Propriedade in Tipo.GetProperties do
    begin
      for Atributo in Propriedade.GetAttributes do
      begin
        if Atributo is TColumn then
        begin
          if (Atributo as TColumn).Name = pName then
          begin
            Result:= (Atributo as TColumn).Clone;
            Encontrou:= True;
            Break;
          end;
        end;
      end;

      if Encontrou then
        Break;
    end;
  finally
    TObject(Obj).Free;
    Contexto.Free;
  end;
end;

class function TGenericVO<T>.FieldCaption(pFieldName: string): string;
var
  Atributo: TColumn;
begin
  Atributo:= GetColumn(pFieldName);

  if Assigned(Atributo) then
  begin
    Result:= Atributo.Caption;
    Atributo.Free;
  end
  else
  begin
    Result:= EmptyStr;
  end;
end;

class function TGenericVO<T>.FieldLength(pFieldName: string): Integer;
var
  Atributo: TColumn;
begin
  Atributo:= GetColumn(pFieldName);
  if Assigned(Atributo) then
  begin
    Result:= Atributo.Length;
    Atributo.Free;
  end
  else
  begin
    Result:= 0;
  end;
end;

function VOFromDBXReader(pObj: TVO; pReader: TDBXReader): TVO;
var
  Contexto: TRttiContext;
  Tipo: TRttiType;
  Propriedade: TRttiProperty;
  Propriedades: TArray<TRttiProperty>;
  Atributo: TCustomAttribute;
  Value: TValue;
  I, A: Integer;
  NomeCampo: string;
  DBXValueType: TDBXValueType;
  DBXValue: TDBXValue;
  EncontrouPropriedade: Boolean;
begin
  Result:= pObj;

  Contexto:= TRttiContext.Create;
  try
    Tipo:= Contexto.GetType(Result.ClassType);
    Propriedades:= Tipo.GetProperties;
    for I:= 0 to pReader.ColumnCount - 1 do
    begin
      DBXValueType:= pReader.ValueType[I];
      DBXValue:= pReader.Value[I];
	    NomeCampo:= UPPERCASE(DBXValueType.Name);

      with TDBXDataTypes do
      begin
        case DBXValueType.DataType of
          AnsiStringType, WideStringType, BlobType:
            Value:= DBXValue.AsString;

          DateType:
          begin
            if DBXValue.AsDate > 0 then
              Value:= DBXValue.AsDateTime
            else
              Value:= TValue.Empty;
          end;

          DateTimeType, TimeStampType:
          begin
            if DBXValue.AsDateTime > 0 then
              Value:= DBXValue.AsDateTime
            else
              Value:= TValue.Empty;
          end;

          TimeType:
          begin
            if DBXValue.AsTime > 0 then
              Value:= DBXValue.AsTime
            else
              Value:= TValue.Empty;
          end;

          Int32Type:
          begin
            if DBXValue.IsNull then
              Value:= TValue.Empty
            else
              Value:= DBXValue.AsInt32;
          end;

          Int64Type:
          begin
            if DBXValue.IsNull then
              Value:= TValue.Empty
            else
            Value:= DBXValue.AsInt64;
          end;

          DoubleType, BcdType, CurrencyType:
          begin
            if DBXValue.IsNull then
              Value:= TValue.Empty
            else
              Value:= DBXValue.AsDouble;
          end;

          BinaryBlobType, BytesType, VariantType:
            Value:= TValue.FromVariant(DBXValue.AsVariant);

          BooleanType:
            Value:= DBXValue.AsBoolean;

        else
          Value:= TValue.Empty;
        end;
      end;

      EncontrouPropriedade:= False;
      for A:= 0 to Length(Propriedades) - 1 do
      begin
        Propriedade:= Propriedades[A];
        for Atributo in Propriedade.GetAttributes do
        begin
          if Atributo is TColumn then
          begin
            if (Atributo as TColumn).Name = NomeCampo then
            begin
              if not Value.IsEmpty then
              begin
                Propriedade.SetValue(Result, Value);
              end;

              EncontrouPropriedade:= True;
              Break;
            end;
          end
          else if Atributo is TId then
          begin
            if (Atributo as TId).NameField = NomeCampo then
            begin
              if not Value.IsEmpty then
              begin
                Propriedade.SetValue(Result, Value);
              end;

              EncontrouPropriedade:= True;
              Break;
            end;
          end;
        end;

        if EncontrouPropriedade then
          Break;
      end;
    end;
  finally
    Contexto.Free;
  end;
end;

end.
