unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.ListBox, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit;

type
  TFormMain = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    ListBox1: TListBox;
    StyleBook1: TStyleBook;
    StyleBook2: TStyleBook;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.fmx}
{$R *.Windows.fmx MSWINDOWS}
{$R *.NmXhdpiPh.fmx ANDROID}

procedure TFormMain.Button1Click(Sender: TObject);
begin
  ListBox1.Items.Add(Edit1.Text);
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
{$IFDEF MSWINDOWS}
  FormMain.StyleBook := StyleBook1;
{$ELSE}
  FormMain.StyleBook := StyleBook2;
{$ENDIF}
end;

end.
