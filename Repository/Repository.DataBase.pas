unit Repository.DataBase;

interface

uses
  System.Classes,
  Repository.Drivers.Firebird,
  Repository.Drivers.MSSQL,
  Repository.Contract,
  Data.DB;

type
  IDataBase = interface
    function New: IDataBase;
    function Driver: IDriver;
  end;

  TDataBase = class(TInterfacedObject, IDataBase)
  private
    FDriver: IDriver;
  public
    constructor Create;
    destructor Destroy;
    function New: IDataBase;
    function Driver: IDriver;
end;

implementation

{ TDataBase }

constructor TDataBase.Create;
var
  firebird: TFirebirdDriver;
  mssql: TMSSQLDriver;
begin
  FDriver := mssql.New;
end;

destructor TDataBase.Destroy;
begin
end;

function TDataBase.Driver: IDriver;
begin
  Result := FDriver;
end;

function TDataBase.New: IDataBase;
begin
  Result := TDataBase.Create();
end;

end.
