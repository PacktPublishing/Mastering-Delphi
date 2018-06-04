unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  OtlParallel,
  OtlTaskControl;

procedure TForm1.Button1Click(Sender: TObject);
var
  Button: TButton;
begin
  Button := Sender as TButton;
  Button.Caption := 'Working';
  Button.Enabled := False;

  Async(procedure begin
    Sleep(5000);
  end).Await(procedure
  begin
    Button.Enabled := True;
    Button.Caption := 'Done';
  end);

end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Button3.Enabled := False;

  Parallel.Async(procedure
  begin
    Sleep(5000);
    Beep;
  end, Parallel.TaskConfig.OnTerminated(
  procedure(const Task: IOmniTaskControl)
  begin
    Button3.Enabled := True;
  end));

end;

end.
