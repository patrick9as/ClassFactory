unit Repository.Drivers.Firebird;

interface

uses
  Repository.Contract,
  Model.DB.Entities,
  System.Generics.Collections,
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TFirebirdDriver = class(TDataModule, IDriver)
  private
    { Private declarations }
    function GetFieldByTable(ATable: TDBTable): TObjectList<TDBField>;
    procedure MapFieldTypes;
    function GetInternalFieldType(const AExternalFieldType: string): TFieldType;
    function GetExternalFieldType(const AInternalFieldType: TFieldType): string;
  public
    { Public declarations }
    function New: IDriver;
    function FieldTypes: TDictionary<TFieldType, String>;
    function Tables: TObjectList<TDBTable>;
    function Procedures: TObjectList<TDBProcedure>;
    function Functions: TObjectList<TDBFunction>;
    function Users: TObjectList<TDBUser>;
    function Indexes: TObjectList<TDBIndex>;
    function Triggers: TObjectList<TDBTrigger>;
  end;

var
  FirebirdDriver: TFirebirdDriver;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TRepositoryDriverFirebird }

function TFirebirdDriver.FieldTypes: TDictionary<TFieldType, String>;
begin

end;

function TFirebirdDriver.Functions: TObjectList<TDBFunction>;
begin

end;

function TFirebirdDriver.GetExternalFieldType(
  const AInternalFieldType: TFieldType): string;
begin

end;

function TFirebirdDriver.GetFieldByTable(
  ATable: TDBTable): TObjectList<TDBField>;
begin

end;

function TFirebirdDriver.GetInternalFieldType(
  const AExternalFieldType: string): TFieldType;
begin

end;

function TFirebirdDriver.Indexes: TObjectList<TDBIndex>;
begin

end;

procedure TFirebirdDriver.MapFieldTypes;
begin

end;

function TFirebirdDriver.New: IDriver;
begin
  Result := TFirebirdDriver.Create(nil);
end;

function TFirebirdDriver.Procedures: TObjectList<TDBProcedure>;
begin

end;

function TFirebirdDriver.Tables: TObjectList<TDBTable>;
begin

end;

function TFirebirdDriver.Triggers: TObjectList<TDBTrigger>;
begin

end;

function TFirebirdDriver.Users: TObjectList<TDBUser>;
begin

end;

end.
