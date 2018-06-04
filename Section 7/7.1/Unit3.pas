unit Unit3;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.ListBox, FMX.Layouts, FMX.Objects, FMX.Controls.Presentation,
  FMX.Ani;

type
  TForm3 = class(TForm)
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.fmx}
{$R *.Windows.fmx MSWINDOWS}
{$R *.Macintosh.fmx MACOS}
{$R *.iPhone47in.fmx IOS}
{$R *.NmXhdpiPh.fmx ANDROID}

procedure TForm3.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

end.
