unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Data.Win.ADODB, Vcl.ExtCtrls, Vcl.DBCtrls, VclTee.TeeGDIPlus, VCLTee.TeEngine,
  VCLTee.DBChart, VCLTee.TeeDBCrossTab, VCLTee.Series, VCLTee.TeeProcs,
  VCLTee.Chart, Vcl.StdCtrls, Vcl.ExtDlgs, RzPanel, RzDlgBtn;

type
  TFormMain = class(TForm)
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    btnSave: TButton;
    PanelTop: TPanel;
    SavePictureDialog1: TSavePictureDialog;
    Button1: TButton;
    Chart1: TChart;
    Series1: TBarSeries;
    DBCrossTabSource1: TDBCrossTabSource;
    RzDialogButtons1: TRzDialogButtons;
    procedure btnSaveClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

procedure TFormMain.btnSaveClick(Sender: TObject);
begin
  if SavePictureDialog1.Execute then
    Chart1.SaveToBitmapFile(SavePictureDialog1.FileName + '.bmp');
end;

procedure TFormMain.Button1Click(Sender: TObject);
begin
  Chart1.Print;
end;

end.
