unit View.Components.TableCard;

interface

uses
  View.Components.FieldRow,
  Model.DB.Entities,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TCompTableCard = class(TFrame)
    Label1: TLabel;
    lblID: TLabel;
    Label3: TLabel;
    lblSchemaName: TLabel;
    Label5: TLabel;
    lblName: TLabel;
    procedure FrameClick(Sender: TObject);
  private
    FTable: TDBTable;
    FFieldRowParent: TWinControl;
    procedure CreateFieldRows(const ATable: TDBTable; AFieldRowParent: TWinControl);
    { Private declarations }
  public
    { Public declarations }
    constructor Create(const ATable: TDBTable; AFieldRowParent: TWinControl);
    property Table: TDBTable read FTable;
    property FieldRowParent: TWinControl read FFieldRowParent;
  end;

implementation

{$R *.dfm}

{ TcompTableCard }

constructor TCompTableCard.Create(const ATable: TDBTable; AFieldRowParent: TWinControl);
begin
  inherited Create(nil);

  lblID.Caption := ATable.ID;
  lblSchemaName.Caption := ATable.SchemaName;
  lblName.Caption := ATable.Name;

  FTable := ATable;
  FFieldRowParent := AFieldRowParent;
end;

procedure TCompTableCard.CreateFieldRows(const ATable: TDBTable; AFieldRowParent: TWinControl);
var
  fieldRow: TCompFieldRow;
  field: TDBField;
  I: Integer;
begin
  for field in ATable.Fields do
  begin
    fieldRow := TCompFieldRow.Create(field);
    fieldRow.Name := 'fieldRow' + I.ToString;
    fieldRow.Parent := AFieldRowParent;
    fieldRow.Visible := True;

    Inc(I);
  end;
end;

procedure TCompTableCard.FrameClick(Sender: TObject);
begin
  CreateFieldRows(FTable, FFieldRowParent);
end;

end.
