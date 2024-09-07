unit Controller.DB.Fields;

interface

uses
  System.Generics.Collections,
  Model.DB.Entities,
  Repository.DataBase;

type
  ICtrlFields = interface
    function New: ICtrlFields;
    function Get: TObjectList<TDBField>;
  end;

  TCtrlTables = class(TInterfacedObject, ICtrlFields)
  private
  public
    function New: ICtrlFields;
    function Get: TObjectList<TDBField>;
  end;

var
  DataBase: TDataBase;

implementation

{ TCtrlTables }


function TCtrlTables.Get: TObjectList<TDBField>;
begin
  Result := DataBase.New.Driver.Tables;
end;

function TCtrlTables.New: ICtrlFields;
begin
  Result := TCtrlTables.Create();
end;

end.
