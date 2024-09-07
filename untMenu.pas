unit untMenu;

interface

uses
  Math,
  System.Threading,
  View.Components.TableCard,
  Controller.DB.Tables,
  Model.DB.Entities,
  System.Generics.Collections,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmMenu = class(TForm)
    btnTables: TButton;
    ScrollBox: TScrollBox;
    FlowPanel: TFlowPanel;
    ScrollBox1: TScrollBox;
    pnlFields: TFlowPanel;
    memo: TMemo;
    procedure btnTablesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ScrollBoxMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure FormResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure ClearTableCards;
    procedure CreateTableCards();
    procedure ClearTables;
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;
  TableCards: TList<TCompTableCard>;
  Tables: TObjectList<TDBTable>;

implementation

{$R *.dfm}

procedure TfrmMenu.btnTablesClick(Sender: TObject);
begin
  btnTables.Enabled := False;
  CreateTableCards();
  btnTables.Enabled := True;
end;

procedure TfrmMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClearTableCards();
  TableCards.Free();
  ClearTables;
  Tables.Free();
end;

procedure TfrmMenu.FormCreate(Sender: TObject);
begin
  TableCards := TList<TCompTableCard>.Create();
end;

procedure TfrmMenu.FormResize(Sender: TObject);
begin
  FlowPanel.AutoSize := False;
  FlowPanel.Height := 0;
  FlowPanel.AutoSize := True;
  pnlFields.AutoSize := False;
  pnlFields.AutoSize := True;
end;

procedure TfrmMenu.ScrollBoxMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  if TScrollBox(Sender).VertScrollBar.IsScrollBarVisible then
  begin
    TScrollBox(Sender).VertScrollBar.Position := TScrollBox(Sender).VertScrollBar.Position - WheelDelta div 3;
    Handled := True;
  end;
end;

procedure TfrmMenu.ClearTableCards;
var
  tableCard: TCompTableCard;
begin
  if tableCards.Count = 0 then
    Exit;
  for tableCard in TableCards do
  begin
    tableCard.Free;
  end;
  TableCards.Clear;
end;

procedure TfrmMenu.CreateTableCards();
var
  db: TCtrlTables;
  table: TDBTable;
  tableCard: TCompTableCard;
  I: Integer;
begin
  ClearTableCards();

  ScrollBox.Enabled := False;

  Tables := db.New.Get;
  I := 0;
  for table in tables do
  begin
    ScrollBox.Enabled := True;

    tableCard := TCompTableCard.Create(table, pnlFields);
    tableCard.Name := 'tableCard' + I.ToString;
    tableCard.Parent := Self.FlowPanel;
    tableCard.Show();
    TableCards.Add(tableCard);

    Inc(I);
  end;

end;

procedure TfrmMenu.ClearTables;
var
  table: TDBTable;
begin
  if not Assigned(Tables) then
    Exit;

  if Tables.Count = 0 then
    Exit;
  for table in Tables do
  begin
    table.Fields.Free;
  end;
end;

end.
