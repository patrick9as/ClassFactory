unit View.Table;

interface

uses
  Utils,
  Controller.Model.Factory,
  Model.DB.Entities,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls;

type
  TViewTable = class(TForm)
    dbgFields: TDBGrid;
    dtsFields: TDataSource;
    cdsFields: TClientDataSet;
    cdsFieldsID: TStringField;
    cdsFieldsName: TStringField;
    cdsFieldsSize: TIntegerField;
    cdsFieldsFieldType: TStringField;
    edtSchemaName: TEdit;
    edtID: TEdit;
    edtName: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnGenerateModel: TButton;
    memModel: TMemo;
    cbxFieldType: TComboBox;
    edtFieldSize: TEdit;
    edtFieldName: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure btnGenerateModelClick(Sender: TObject);
    procedure dtsFieldsDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FTable: TDBTable;
    procedure FeedCdsFields();
    procedure FeedCbxFieldType;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; ATable: TDBTable);
  end;

var
  ViewTable: TViewTable;

implementation

{$R *.dfm}

{ TViewTable }

procedure TViewTable.btnGenerateModelClick(Sender: TObject);
var
  ctrl: TCtrlModelFactory;
begin
  memModel.Text := TCtrlModelFactory.Create.Generate(FTable);
end;

constructor TViewTable.Create(AOwner: TComponent; ATable: TDBTable);
begin
  inherited Create(AOwner);
  FTable := ATable;

  edtSchemaName.Text := FTable.SchemaName;
  edtID.Text := FTable.ID;
  edtName.Text := FTable.Name;

  FeedCdsFields();
  FeedCbxFieldType();
end;

procedure TViewTable.dtsFieldsDataChange(Sender: TObject; Field: TField);
var
  I: Integer;
begin
  edtFieldName.Text := cdsFieldsName.AsString;
  edtFieldSize.Text := cdsFieldsSize.AsString;

  for I := 0 to cbxFieldType.Items.Count -1 do
    if LowerCase(cbxFieldType.Items[I]) = LowerCase(cdsFieldsFieldType.AsString) then
    begin
      cbxFieldType.ItemIndex := I;
      break;
    end;
end;

procedure TViewTable.FeedCdsFields;
var
  field: TDBField;
begin
  cdsFields.CreateDataSet();

  cdsFields.Close();
  cdsFields.Open();

  for field in FTable.Fields do
  begin
    cdsFields.Append();
    cdsFieldsID.AsString := field.ID;
    cdsFieldsName.AsString := field.Name;
    cdsFieldsSize.AsInteger := field.Size;
    cdsFieldsFieldType.AsString := field.FieldType;
    cdsFields.Post();
  end;

  cdsFields.First();
end;

procedure TViewTable.FormShow(Sender: TObject);
begin
  dtsFieldsDataChange(nil,nil);
end;

procedure TViewTable.FeedCbxFieldType();
var
  ctrl: TCtrlModelFactory;
  FieldTypes: TStringList;
  fieldType: String;
begin
  FieldTypes := TCtrlModelFactory.Create.ListFieldTypes;
  try
    for fieldType in FieldTypes do
    begin
      cbxFieldType.Items.Add(fieldType)
    end;
  finally
    FieldTypes.Free();
  end;
end;

end.
