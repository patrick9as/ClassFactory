unit Repository.Contract;

interface

uses
  Model.DB.Entities,
  Data.DB,
  System.Generics.Collections;

type
  IConnection = interface
    function New: IConnection;
    function Get: TCustomConnection;
  end;

  IQuery = interface
    function New: IQuery;
    function Connetion: IConnection;
  end;

  IDriver = interface
    function FieldTypes: TDictionary<TFieldType, String>;
    function GetFieldByTable(ATable: TDBTable): TObjectList<TDBField>;
    function New: IDriver;
    procedure MapFieldTypes;
    function GetInternalFieldType(const AExternalFieldType: string): TFieldType;
    function GetExternalFieldType(const AInternalFieldType: TFieldType): string;
    function Tables: TObjectList<TDBTable>;
    function Procedures: TList<TDBProcedure>;
    function Functions: TList<TDBFunction>;
    function Users: TList<TDBUser>;
    function Indexes: TList<TDBIndex>;
    function Triggers: TList<TDBTrigger>;
  end;

implementation

end.
