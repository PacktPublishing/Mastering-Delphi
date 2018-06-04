unit Unit1;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWCompLabel,
  IWCompMemo, IWCompEdit, Vcl.Controls, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWCompButton;

type
  TIWForm1 = class(TIWAppForm)
    IWButton1: TIWButton;
    IWButton2: TIWButton;
    IWEdit1: TIWEdit;
    IWMemo1: TIWMemo;
    IWLabel1: TIWLabel;
    procedure IWAppFormCreate(Sender: TObject);
    procedure IWButton1Click(Sender: TObject);
    procedure IWButton2Click(Sender: TObject);
  public
  end;

var
  X, Y: Integer;

implementation

{$R *.dfm}


procedure TIWForm1.IWAppFormCreate(Sender: TObject);
begin
  Randomize;
  Y := 0;
  X := Random(100);
end;

procedure TIWForm1.IWButton1Click(Sender: TObject);
begin
  Y := StrToInt(IWEdit1.Text);
  if Y > X then
    IWMemo1.Lines.Add('Y > X')
  else if Y < X then
    IWMemo1.Lines.Add('Y < X')
  else
    IWMemo1.Lines.Add('The guessed number is ' + IntToStr(X) + ' and You found it!');
end;

procedure TIWForm1.IWButton2Click(Sender: TObject);
begin
  X := Random(100);
  WebApplication.ShowMessage('The New Game is started.');
  IWMemo1.Clear;
end;

initialization
  TIWForm1.SetAsMainForm;

end.
