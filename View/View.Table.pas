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
    DBGrid1: TDBGrid;
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
    procedure btnGenerateModelClick(Sender: TObject);
  private
    { Private declarations }
    FTable: TDBTable;
    procedure FeedCdsFields();
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
end;

end.
