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
    procedure btnTablesClick(Sender: TObject);
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
  TableCards: TObjectList<TCompTableCard>;
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
//  TableCards.Free();
//  ClearTables;
//  Tables.Free();
end;

procedure TfrmMenu.FormResize(Sender: TObject);
begin
  FlowPanel.AutoSize := False;
  FlowPanel.Height := 0;
  FlowPanel.AutoSize := True;
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
  if not Assigned(TableCards) then
    Exit;

  if TableCards.Count = 0 then
    Exit;

  for tableCard in TableCards do
    tableCard.Table.Fields.Free();

  Tables.Free();
  TableCards.Free();
end;

procedure TfrmMenu.CreateTableCards();
var
  db: TCtrlTables;
  table: TDBTable;
  tableCard: TCompTableCard;
  I: Integer;
begin

  ClearTableCards();
  TableCards := TObjectList<TCompTableCard>.Create();

  ScrollBox.Enabled := False;

  Tables := db.New.Get;
  I := 0;
  for table in tables do
  begin
    ScrollBox.Enabled := True;

    tableCard := TCompTableCard.Create(table);
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
//  if not Assigned(Tables) then
//    Exit;

//  if Tables.Count = 0 then
//    Exit;
//  for table in Tables do
//  begin
//    table.Fields.Free;
//  end;
end;

end.
