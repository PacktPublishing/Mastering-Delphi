unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ScrollBox,
  FMX.Memo, FMX.StdCtrls, FMX.Edit, FMX.Layouts, FMX.Controls.Presentation;

type
  TForm2 = class(TForm)
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    FlowLayout1: TFlowLayout;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    StyleBook1: TStyleBook;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}
{$R *.Windows.fmx MSWINDOWS}
{$R *.NmXhdpiPh.fmx ANDROID}
{$R *.iPhone47in.fmx IOS}
{$R *.Macintosh.fmx MACOS}

procedure TForm2.Button1Click(Sender: TObject);
begin
  Memo1.Lines.Add(Edit1.Text);
  Edit1.Text := '';
  Edit1.SetFocus;
end;

procedure TForm2.Edit1KeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
  if Key = vkReturn then
    Button1Click(Sender);
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  Edit1.SetFocus;
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

end.
