unit View.Components.FieldRow;

interface

uses
  Model.DB.Entities,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TCompFieldRow = class(TFrame)
    lblID: TLabel;
    Label2: TLabel;
    lblName: TLabel;
    Label4: TLabel;
    lblType: TLabel;
    Label6: TLabel;
    lblSize: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AField: TDBField);
  end;

implementation

{$R *.dfm}

{ TCompFieldRow }

constructor TCompFieldRow.Create(AField: TDBField);
begin
  inherited Create(nil);

  lblID.Caption := AField.ID;
  lblName.Caption := AField.Name;
  lblType.Caption := AField.FieldType;
  lblSize.Caption :=  AField.Size.ToString;
end;

end.
