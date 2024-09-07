unit Repository.Drivers.MSSQL;

interface

uses
  Repository.Contract,
  System.Generics.Collections,
  Model.DB.Entities,
  System.SysUtils, System.Classes, Data.DB, MemDS, DBAccess, Uni, UniProvider,
  SQLServerUniProvider, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TMSSQLDriver = class(TDataModule, IDriver)
    FDConnection: TFDConnection;
    qryTables: TFDQuery;
    qryTablesID: TIntegerField;
    qryTablesName: TWideStringField;
    qryTablesSchemaName: TWideStringField;
    qryFieldsByTable: TFDQuery;
    qryFieldsByTableName: TWideStringField;
    qryFieldsByTableFieldType: TWideStringField;
    qryFieldsByTableSize: TIntegerField;
    qryFieldsByTableID: TIntegerField;
  private
    function GetFieldByTable(ATable: TDBTable): TObjectList<TDBField>;
    { Private declarations }
  public
    { Public declarations }
    function New: IDriver;
    function Tables: TObjectList<TDBTable>;
    function Procedures: TList<TDBProcedure>;
    function Functions: TList<TDBFunction>;
    function Users: TList<TDBUser>;
    function Indexes: TList<TDBIndex>;
    function Triggers: TList<TDBTrigger>;
  end;

var
  MSSQLDriver: TMSSQLDriver;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TMSSQLDriver }

function TMSSQLDriver.Functions: TList<TDBFunction>;
begin

end;

function TMSSQLDriver.Indexes: TList<TDBIndex>;
begin

end;

function TMSSQLDriver.New: IDriver;
begin
  Result := TMSSQLDriver.Create(nil);
end;

function TMSSQLDriver.Procedures: TList<TDBProcedure>;
begin

end;

function TMSSQLDriver.Tables: TObjectList<TDBTable>;
var
  table: TDBTable;
  I: Integer;
begin
  Result := TObjectList<TDBTable>.Create();

  qryTables.Close();
  qryTables.Open();
  
  while not qryTables.Eof do
  begin
    table := TDBTable.Create();
    
    table.ID := qryTablesID.AsString;
    table.Name := qryTablesName.AsString;
    table.SchemaName := qryTablesSchemaName.AsString;
    table.Fields := GetFieldByTable(table);
    
    Result.Add(table);
    qryTables.Next();
  end;

  Self.Free;
end;

function TMSSQLDriver.GetFieldByTable(ATable: TDBTable): TObjectList<TDBField>;
var
  field: TDBField;
begin
  Result := TObjectList<TDBField>.Create();

  qryFieldsByTable.Close();
  qryFieldsByTable.ParamByName('TableName').AsString := ATable.Name;
  qryFieldsByTable.ParamByName('SchemaName').AsString := ATable.SchemaName;
  qryFieldsByTable.Open();

  while not qryFieldsByTable.Eof do
  begin
    field           := TDBField.Create();

    field.ID        := qryFieldsByTableID.AsString;
    field.Name      := qryFieldsByTableName.AsString;
    field.FieldType := qryFieldsByTableFieldType.AsString;
    field.Size      := qryFieldsByTableSize.AsInteger;

    Result.Add(field);
    qryFieldsByTable.Next();
  end;
end;

function TMSSQLDriver.Triggers: TList<TDBTrigger>;
begin

end;

function TMSSQLDriver.Users: TList<TDBUser>;
begin

end;

end.
