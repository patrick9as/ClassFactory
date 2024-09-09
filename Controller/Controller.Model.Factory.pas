unit Controller.Model.Factory;

interface

uses
  Utils,
  Repository.Contract,
  Repository.DataBase,
  System.Classes,
  Data.DB,
  Model.DB.Entities;

type
  TCtrlModelFactory = class
  private
    FDriver: IDriver;
    FTable: TDBTable;
    FPrivateProperties: string;
    FPublicProperties: string;
    procedure LoadProperties();
  public
    constructor Create();
    destructor Free();
    function Generate(const ATable: TDBTable): string;
    function ListFieldTypes: TStringList;
  end;

implementation

{ CtrlModelFactory }

constructor TCtrlModelFactory.Create;
begin
end;

destructor TCtrlModelFactory.Free;
begin
end;

function TCtrlModelFactory.Generate(const ATable: TDBTable): string;
var
  DataBase: TDataBase;
  MyModel: TStringList;
begin
  FDriver := DataBase.New.Driver;

  FTable := ATable;

  MyModel := TStringList.Create();
  try
    LoadProperties();

    with MyModel do
    begin
      Add('unit MyProject.Model.' + ATable.Name + ';');
      Add('');
      Add('interface');
      Add('');
      Add('type');
      Add('  TModel' + ATable.Name + ' = class');
      Add('  private');
      Add(FPrivateProperties);
      Add('  public');
      Add(FPublicProperties);
      Add('  end;');
      Add('');
      Add('implementation');
      Add('');
      Add('end.');

      Result := Text;
    end;
  finally
    MyModel.Free;
  end;
end;

function TCtrlModelFactory.ListFieldTypes: TStringList;
var
  DataBase: TDataBase;
  fieldType: TFieldType;
begin
  Result := TStringList.Create();
  FDriver := DataBase.New.Driver;

  for fieldType := Low(TFieldType) to High(TFieldType) do
  begin
    if FDriver.GetExternalFieldType(fieldType)  <> ''then
    Result.Add(FDriver.GetExternalFieldType(fieldType));
  end;
end;

procedure TCtrlModelFactory.LoadProperties;
var
  field: TDBField;
  privateProp, publicProp: string;
  privateProps, publicProps: TStringList;
begin
  privateProps := TStringList.Create();
  publicProps := TStringList.Create();
  try
    for field in FTable.Fields do
    begin
      privateProp := '    F' + field.Name + ': ' + TUtils.DBFieldTypeToDelphiType(FDriver.GetInternalFieldType(field.FieldType)) + ';';
      publicProp  := '    property ' + field.Name + ': ' + TUtils.DBFieldTypeToDelphiType(FDriver.GetInternalFieldType(field.FieldType)) + ' read F' + field.Name + ' write F' + field.Name + ';';

      privateProps.Add(privateProp);
      publicProps.Add(publicProp);
    end;
  finally
    FPrivateProperties := privateProps.Text;
    FPublicProperties := publicProps.Text;
    privateProps.Free();
    publicProps.Free();
  end;

end;

end.
