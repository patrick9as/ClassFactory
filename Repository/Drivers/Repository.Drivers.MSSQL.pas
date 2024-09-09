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
    procedure DataModuleDestroy(Sender: TObject);
  private
    FFieldTypes: TDictionary<TFieldType, String>;
    function GetFieldByTable(ATable: TDBTable): TObjectList<TDBField>;
    procedure MapFieldTypes;
    function GetInternalFieldType(const AExternalFieldType: string): TFieldType;
    function GetExternalFieldType(const AInternalFieldType: TFieldType): string;
  public
    constructor Create(AOwner: TComponent);
    function New: IDriver;
    function FieldTypes: TDictionary<TFieldType, String>;
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

constructor TMSSQLDriver.Create(AOwner: TComponent);
begin
  inherited;

  MapFieldTypes();
end;

procedure TMSSQLDriver.DataModuleDestroy(Sender: TObject);
begin
  FFieldTypes.Free();
end;

function TMSSQLDriver.FieldTypes: TDictionary<TFieldType, String>;
begin
  Result := FFieldTypes;
end;

function TMSSQLDriver.Functions: TList<TDBFunction>;
begin

end;

function TMSSQLDriver.Indexes: TList<TDBIndex>;
begin

end;

procedure TMSSQLDriver.MapFieldTypes;
begin
  FFieldTypes := TDictionary<TFieldType, String>.Create();

  // Tipos Numéricos Exatos
  FFieldTypes.Add(ftLargeint, 'BIGINT');
  FFieldTypes.Add(ftInteger, 'INT');
  FFieldTypes.Add(ftSmallint, 'SMALLINT');
  FFieldTypes.Add(ftWord, 'TINYINT');
  FFieldTypes.Add(ftBoolean, 'BIT');
  FFieldTypes.Add(ftFloat, 'FLOAT');
  FFieldTypes.Add(ftCurrency, 'MONEY');
  FFieldTypes.Add(ftBCD, 'DECIMAL');

  // Tipos de Data e Hora
  FFieldTypes.Add(ftDate, 'DATE');
  FFieldTypes.Add(ftTime, 'TIME');
  FFieldTypes.Add(ftDateTime, 'DATETIME');
  FFieldTypes.Add(ftTimeStamp, 'DATETIME2');
  FFieldTypes.Add(ftOraTimeStamp, 'DATETIMEOFFSET');

  // Tipos de Cadeia de Caracteres (Texto)
  FFieldTypes.Add(ftString, 'VARCHAR');
  FFieldTypes.Add(ftWideString, 'NVARCHAR');
  FFieldTypes.Add(ftFixedChar, 'CHAR');
  FFieldTypes.Add(ftFixedWideChar, 'NCHAR');
  FFieldTypes.Add(ftMemo, 'TEXT');
  FFieldTypes.Add(ftWideMemo, 'NTEXT');

  // Tipos Binários
  FFieldTypes.Add(ftBlob, 'VARBINARY');
  FFieldTypes.Add(ftGraphic, 'IMAGE');
  FFieldTypes.Add(ftBytes, 'BINARY');

  // Tipos Especializados
  FFieldTypes.Add(ftGuid, 'UNIQUEIDENTIFIER');
  FFieldTypes.Add(ftVariant, 'XML');
  FFieldTypes.Add(ftFMTBcd, 'DECIMAL');

  // Outros tipos, como espaciais
  FFieldTypes.Add(ftUnknown, 'GEOMETRY');
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

function TMSSQLDriver.GetExternalFieldType(
  const AInternalFieldType: TFieldType): string;
begin
  if not FFieldTypes.TryGetValue(AInternalFieldType, Result) then
    Result := '';
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

function TMSSQLDriver.GetInternalFieldType(
  const AExternalFieldType: string): TFieldType;
var
  FieldType: TFieldType;
  ExternalType: string;
begin
  // Valor padrão caso não seja encontrado (use ftUnknown, por exemplo)
  Result := ftUnknown;

  // Percorre todas as chaves (TFieldType) do dicionário
  for FieldType in FFieldTypes.Keys do
  begin
    // Para cada chave, obtém o valor associado (string)
    ExternalType := FFieldTypes[FieldType];

    // Compara a string externa com a string passada como parâmetro
    if SameText(LowerCase(ExternalType), LowerCase(AExternalFieldType)) then
    begin
      // Se encontrar, define o resultado e encerra a busca
      Result := FieldType;
      Exit;
    end;
  end;
end;

function TMSSQLDriver.Triggers: TList<TDBTrigger>;
begin

end;

function TMSSQLDriver.Users: TList<TDBUser>;
begin

end;

end.
