program ClassFactory;

uses
  Vcl.Forms,
  View.Menu in 'View\View.Menu.pas' {ViewMenu},
  Repository.Contract in 'Repository\Repository.Contract.pas',
  Repository.Drivers.Firebird in 'Repository\Drivers\Repository.Drivers.Firebird.pas' {FirebirdDriver: TDataModule},
  Repository.DataBase in 'Repository\Repository.DataBase.pas',
  Model.DB.Entities in 'Model\Model.DB.Entities.pas',
  Repository.Drivers.MSSQL in 'Repository\Drivers\Repository.Drivers.MSSQL.pas' {MSSQLDriver: TDataModule},
  Controller.DB.Tables in 'Controller\Controller.DB.Tables.pas',
  View.Components.TableCard in 'View\Components\View.Components.TableCard.pas' {CompTableCard: TFrame},
  View.Table in 'View\View.Table.pas' {ViewTable},
  Utils in 'Utils\Utils.pas',
  Controller.Model.Factory in 'Controller\Controller.Model.Factory.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TViewMenu, ViewMenu);
  Application.Run;
end.
