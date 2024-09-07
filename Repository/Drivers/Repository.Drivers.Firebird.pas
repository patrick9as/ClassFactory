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
  FirebirdDriver: TFirebirdDriver;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TRepositoryDriverFirebird }

function TFirebirdDriver.Functions: TList<TDBFunction>;
begin

end;

function TFirebirdDriver.Indexes: TList<TDBIndex>;
begin

end;

function TFirebirdDriver.New: IDriver;
begin
  Result := TFirebirdDriver.Create(nil);
end;

function TFirebirdDriver.Procedures: TList<TDBProcedure>;
begin

end;

function TFirebirdDriver.Tables: TObjectList<TDBTable>;
begin

end;

function TFirebirdDriver.Triggers: TList<TDBTrigger>;
begin

end;

function TFirebirdDriver.Users: TList<TDBUser>;
begin

end;

end.
