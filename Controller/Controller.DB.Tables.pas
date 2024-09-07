unit Controller.DB.Tables;

interface

uses
  System.Generics.Collections,
  Model.DB.Entities,
  Repository.DataBase;

type
  ICtrlTables = interface
    function New: ICtrlTables;
    function Get: TObjectList<TDBTable>;
  end;

  TCtrlTables = class(TInterfacedObject, ICtrlTables)
  private
  public
    function New: ICtrlTables;
    function Get: TObjectList<TDBTable>;
  end;

var
  DataBase: TDataBase;

implementation

{ TCtrlTables }


function TCtrlTables.Get: TObjectList<TDBTable>;
begin
  Result := DataBase.New.Driver.Tables;
end;

function TCtrlTables.New: ICtrlTables;
begin
  Result := TCtrlTables.Create();
end;

end.
