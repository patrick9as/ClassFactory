program ClassFactory;

uses
  Vcl.Forms,
  untMenu in 'untMenu.pas' {frmMenu},
  Repository.Contract in 'Repository\Repository.Contract.pas',
  Repository.Drivers.Firebird in 'Repository\Drivers\Repository.Drivers.Firebird.pas' {FirebirdDriver: TDataModule},
  Repository.DataBase in 'Repository\Repository.DataBase.pas',
  Model.DB.Entities in 'Model\Model.DB.Entities.pas',
  Repository.Drivers.MSSQL in 'Repository\Drivers\Repository.Drivers.MSSQL.pas' {MSSQLDriver: TDataModule},
  Controller.DB.Tables in 'Controller\Controller.DB.Tables.pas',
  View.Components.TableCard in 'View\Components\View.Components.TableCard.pas' {CompTableCard: TFrame},
  View.Components.FieldRow in 'View\Components\View.Components.FieldRow.pas' {CompFieldRow: TFrame};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.Run;
end.
