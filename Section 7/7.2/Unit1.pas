unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.MultiView, FMX.StdCtrls, FMX.Controls.Presentation, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    MultiView1: TMultiView;
    SB1: TSpeedButton;
    SB4: TSpeedButton;
    SB3: TSpeedButton;
    SB2: TSpeedButton;
    Img1: TImage;
    Img4: TImage;
    Img3: TImage;
    Img2: TImage;
    StyleBook1: TStyleBook;
    ListView1: TListView;
    procedure SB1Click(Sender: TObject);
    procedure SB2Click(Sender: TObject);
    procedure SB3Click(Sender: TObject);
    procedure SB4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.SB1Click(Sender: TObject);
begin
  ShowMessage('Action 1');
end;

procedure TForm1.SB4Click(Sender: TObject);
begin
  ShowMessage('Action 4');
end;

procedure TForm1.SB3Click(Sender: TObject);
begin
  ShowMessage('Action 3');
end;

procedure TForm1.SB2Click(Sender: TObject);
begin
  ShowMessage('Action 2');
end;

end.
