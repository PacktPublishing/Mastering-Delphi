unit uDemoTwo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Menus, Data.Win.ADODB;

type
  TForm2 = class(TForm)
    MainMenu1: TMainMenu;
    ADOQuery1: TADOQuery;
    ADOConnection1: TADOConnection;
    File1: TMenuItem;
    Panel1: TPanel;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    DBNavigator1: TDBNavigator;
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Edit1Change(Sender: TObject);
begin
  if Edit1.Text = '' then
  begin
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('SELECT * FROM tblOne');
    ADOQuery1.Open;
  end
  else
  begin
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('SELECT * FROM tblOne');
    ADOQuery1.SQL.Add('WHERE FirstName LIKE "' + Edit1.Text +'%"');
    ADOQuery1.Open;
  end;

end;

end.
