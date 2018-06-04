unit uRegistration;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.UITypes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXPickers, Vcl.ExtCtrls,
  Vcl.WinXPanels, Vcl.StdCtrls, Vcl.Buttons, Vcl.WinXCalendars;

type
  TFrmReg = class(TForm)
    Label1: TLabel;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    BtnOK: TBitBtn;
    CardPanel1: TCardPanel;
    Card1: TCard;
    Card2: TCard;
    LabeledEdit3: TLabeledEdit;
    BtnOk2: TBitBtn;
    EditPass: TLabeledEdit;
    EditEmail: TLabeledEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    CalendarPicker1: TCalendarPicker;
    procedure Label3MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure Label3MouseLeave(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label4MouseLeave(Sender: TObject);
    procedure Label4MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure BtnOk2Click(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure Label4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmReg: TFrmReg;

implementation

{$R *.dfm}

procedure TFrmReg.BtnOk2Click(Sender: TObject);
begin
  if (EditPass.Text = '') or (EditEmail.Text = '') then
    Exit
  else
  begin
    ShowMessage('Logged in!');
    FrmReg.Close;
  end;
end;

procedure TFrmReg.BtnOKClick(Sender: TObject);
begin
  if (LabeledEdit1.Text = '') or (LabeledEdit2.Text = '') or
    (LabeledEdit3.Text = '') then Exit
  else
  begin
    ShowMessage('Registered!');
    FrmReg.Close;
  end;
end;

procedure TFrmReg.Label3Click(Sender: TObject);
begin
  CardPanel1.NextCard;
end;

procedure TFrmReg.Label3MouseLeave(Sender: TObject);
begin
  Label3.Font.Style := Label3.Font.Style - [fsUnderline];
end;

procedure TFrmReg.Label3MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  Label3.Font.Style := Label3.Font.Style + [fsUnderline];
end;

procedure TFrmReg.Label4Click(Sender: TObject);
begin
  CardPanel1.PreviousCard;
end;

procedure TFrmReg.Label4MouseLeave(Sender: TObject);
begin
  Label4.Font.Style := Label4.Font.Style - [fsUnderline];
end;

procedure TFrmReg.Label4MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  Label4.Font.Style := Label4.Font.Style + [fsUnderline];
end;

end.
