unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.WebBrowser, FMX.Controls.Presentation;

type
  TForm2 = class(TForm)
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    WebBrowser1: TWebBrowser;
    AniIndicator1: TAniIndicator;
    procedure WebBrowser1DidFinishLoad(ASender: TObject);
    procedure WebBrowser1DidStartLoad(ASender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

procedure TForm2.FormCreate(Sender: TObject);
begin
  WebBrowser1.Navigate('https://google.com');
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm2.WebBrowser1DidFinishLoad(ASender: TObject);
begin
  AniIndicator1.Visible := False;
  AniIndicator1.Enabled := False;
  WebBrowser1.Visible := True;
end;

procedure TForm2.WebBrowser1DidStartLoad(ASender: TObject);
begin
  AniIndicator1.Visible := True;
  AniIndicator1.Enabled := True;
  WebBrowser1.Visible := False;
end;

end.
