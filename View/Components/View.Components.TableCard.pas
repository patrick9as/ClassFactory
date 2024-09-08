unit View.Components.TableCard;

interface

uses
  View.Table,
  System.Generics.Collections,
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
    { Private declarations }
  public
    { Public declarations }
    constructor Create(const ATable: TDBTable);
    property Table: TDBTable read FTable;
  end;

implementation

{$R *.dfm}

{ TcompTableCard }

constructor TCompTableCard.Create(const ATable: TDBTable);
begin
  inherited Create(nil);

  lblID.Caption := ATable.ID;
  lblSchemaName.Caption := ATable.SchemaName;
  lblName.Caption := ATable.Name;

  FTable := ATable;
end;

procedure TCompTableCard.FrameClick(Sender: TObject);
var
  view: TViewTable;
begin
  view := TViewTable.Create(Self, FTable);
  try
    view.ShowModal();
  finally
    view.Free();
  end;
end;

end.
