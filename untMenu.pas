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
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfrmMenu = class(TForm)
    btnTables: TButton;
    pnlTables: TPanel;
    ScrollBox: TScrollBox;
    FlowPanel: TFlowPanel;
    btnPreviousPage: TButton;
    btnNextPage: TButton;
    edtPageNumber: TEdit;
    lblTablesCount: TLabel;
    edtPagesCount: TEdit;
    Label1: TLabel;
    btnFirstPage: TButton;
    btnLastPage: TButton;
    ProgressBar: TProgressBar;
    procedure btnTablesClick(Sender: TObject);
    procedure ScrollBoxMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure FormResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPreviousPageClick(Sender: TObject);
    procedure btnNextPageClick(Sender: TObject);
    procedure btnFirstPageClick(Sender: TObject);
    procedure btnLastPageClick(Sender: TObject);
  private
    { Private declarations }
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
var
  db: TCtrlTables;
begin
  if Assigned(Tables) then
  begin
    for var table in Tables do
    begin
      table.Fields.Free();
    end;
    Tables.Free();
  end;

  Tables := db.New.Get;
  edtPageNumber.Text := '1';
  CreateTableCards();
end;

procedure TfrmMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TThread.Queue(nil,
  procedure

  begin
    if Assigned(Tables) then
    begin
      for var table: TDBTable in Tables do
      begin
        table.Fields.Free();
      end;
      Tables.Free();
    end;

    ScrollBox.Visible := False;
    if Assigned(TableCards) then
      TableCards.Free();
  end);
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

procedure TfrmMenu.btnPreviousPageClick(Sender: TObject);
begin
  edtPageNumber.Text := IntToStr(StrToInt(edtPageNumber.Text) - 1);
  CreateTableCards();
end;

procedure TfrmMenu.btnFirstPageClick(Sender: TObject);
begin
  edtPageNumber.Text := '1';
  CreateTableCards();
end;

procedure TfrmMenu.btnLastPageClick(Sender: TObject);
begin
  edtPageNumber.Text := edtPagesCount.Text;
  CreateTableCards();
end;

procedure TfrmMenu.btnNextPageClick(Sender: TObject);
begin
  edtPageNumber.Text := IntToStr(StrToInt(edtPageNumber.Text) + 1);
  CreateTableCards();
end;

procedure TfrmMenu.CreateTableCards();
var
  tableCard: TCompTableCard;
begin
  ProgressBar.Position := 0;

  TThread.Queue(nil,
  procedure
  begin
    pnlTables.Visible := False;

    if Assigned(TableCards) then
      TableCards.Free();
    TableCards := TObjectList<TCompTableCard>.Create();

    ScrollBox.Enabled := False;

    lblTablesCount.Caption := Tables.Count.ToString + ' tables';

    var TotalPages: Integer;
    TotalPages := Ceil(Tables.Count / 50);
    edtPagesCount.Text := TotalPages.ToString;

    var ItemsPerPage: Integer;
    ItemsPerPage := 30;

    var PageNumber: Integer;
    PageNumber := StrToInt(edtPageNumber.Text);

    var StartIndex, EndIndex: Integer;
    StartIndex := (PageNumber -1) * ItemsPerPage;
    EndIndex := StartIndex + ItemsPerPage - 1;

    if EndIndex >= Tables.Count then
      EndIndex := Tables.Count - 1;


    ProgressBar.Position := 0;
    ProgressBar.Min := 0;
    ProgressBar.Max := EndIndex - StartIndex;

    for var I := StartIndex to EndIndex do
    begin
    
      ScrollBox.Enabled := True;

      tableCard := TCompTableCard.Create(Tables[I]);
      tableCard.Name := 'tableCard' + I.ToString;
      tableCard.Parent := Self.FlowPanel;
      tableCard.Show();
      TableCards.Add(tableCard);

      ProgressBar.Position := ProgressBar.Position + 1;
    end;

    pnlTables.Visible := True;
    pnlTables.Enabled := True;
    FormResize(Self);
  end);
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
