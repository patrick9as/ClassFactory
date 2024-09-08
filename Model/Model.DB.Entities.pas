unit Model.DB.Entities;

interface

uses
  Data.DB,
  System.Generics.Collections;

type

  TDBEntity = class
  private
    FID: String;
    FName: String;
  public
    property ID: String read FID write FID;
    property Name: String read FName write FName;
  end;

  TDBField = class(TDBEntity)
  private
    FFieldType: String;
    FSize: Integer;
  public
    property FieldType: String read FFieldType write FFieldType;
    property Size: Integer read FSize write FSize;
  end;

  TDBTable = class(TDBEntity)
  private
    FFields: TObjectList<TDBField>;
    FSchemaName: String;
  public
    property Fields: TObjectList<TDBField> read FFields write FFields;
    property SchemaName: String read FSchemaName write FSchemaName;
  end;

  TDBProcedure = class(TDBEntity)
  private
  public
  end;

  TDBFunction = class(TDBEntity)
  private
  public
  end;

  TDBUser = class(TDBEntity)
  private
  public
  end;

  TDBIndex = class(TDBEntity)
  private
  public
  end;

  TDBTrigger = class(TDBEntity)
  private
  public
  end;

implementation

end.
