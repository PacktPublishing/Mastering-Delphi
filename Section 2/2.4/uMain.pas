unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uDocument;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Memo1: TMemo;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Doc: Array of TDocument;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Doc[ComboBox1.ItemIndex].Add(Edit1.Text);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  List: TStringList;
begin
  List := TStringList.Create;
  Doc[ComboBox1.ItemIndex].ReadAll(List);
  Memo1.Lines.Clear;
  Memo1.Lines.Add(ComboBox1.Text + ' Document');
  Memo1.Lines.Add('');
  Memo1.Lines.Add(List.Text);
  List.Free;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  SearchStr: String;
  ResultList: TStringList;
begin
  ResultList := TStringList.Create;
  if InputQuery('Search Document', 'Please input keyword', SearchStr) then
    if Doc[ComboBox1.ItemIndex].Find(SearchStr, ResultList) then
    begin
      Memo1.Lines.Clear;
      Memo1.Lines.Add(ComboBox1.Text + ' Document');
      Memo1.Lines.Add('');
      Memo1.Lines.Add(ResultList.Text);
    end
    else
      Memo1.Lines.Text := SearchStr + ' not fount in ' + ComboBox1.Text + ' Document';
  ResultList.Free;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Memo1.Clear;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
  I: Integer;
begin
  for I := 0 to High(Doc) do
      Doc[I].Free;

  Doc := Nil;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  SetLength(Doc, ComboBox1.Items.Count);
  for I := 0 to High(Doc) do
    Doc[I] := TDocument.Create(ComboBox1.Items[I] + '.docs');
end;
//
//initialization
//  {$I main.lrs}

end.
