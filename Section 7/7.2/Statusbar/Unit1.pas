unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, ImgList, StdCtrls, ShellAPI, System.ImageList;

type
  TForm1 = class(TForm)
    StatusBar1: TStatusBar;
    LinkLabel1: TLinkLabel;
    ImageList1: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
    procedure StatusBar1Click(Sender: TObject);
    procedure LinkLabel1LinkClick(Sender: TObject; const Link: string;
      LinkType: TSysLinkType);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  LinkLabel1.Parent := StatusBar1;
end;

procedure TForm1.LinkLabel1LinkClick(Sender: TObject; const Link: string;
  LinkType: TSysLinkType);
begin
  ShellExecute(Handle, 'open', PWideChar(Link), nil, nil, SW_SHOWNORMAL);
end;

procedure TForm1.StatusBar1Click(Sender: TObject);
var
  MyCase: TPoint;
begin
  MyCase := Mouse.CursorPos;
  MyCase := StatusBar1.ScreenToClient(MyCase);
  if (MyCase.X >= StatusBar1.Panels[0].Width + StatusBar1.Panels[1].Width +
    StatusBar1.Panels[2].Width) and
    (MyCase.X <= StatusBar1.Panels[0].Width + StatusBar1.Panels[1].Width +
    StatusBar1.Panels[2].Width + StatusBar1.Panels[3].Width) then
      ShowMessage('You clicked on a fourth panel.');
end;

procedure TForm1.StatusBar1DrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
  const Rect: TRect);
begin
  case Panel.Index of
    1:
      begin
        StatusBar1.Canvas.TextRect(Rect, 1 + ImageList1.Width + Rect.Left,
          Rect.Top, Panel.Text);
        ImageList1.Draw(StatusBar1.Canvas, Rect.Left, Rect.Top, 0);
      end;
    2:
      begin
        LinkLabel1.Left := Rect.Left;
        LinkLabel1.Top := Rect.Top;
      end;
  end;
end;

end.
