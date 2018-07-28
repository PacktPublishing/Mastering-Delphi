unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.Edit, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.MultiView,
  FMX.Controls.Presentation,
  System.IniFiles, System.IOUtils, FMX.DialogService;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    MultiView1: TMultiView;
    ListView1: TListView;
    Layout1: TLayout;
    Button1: TButton;
    Image1: TImage;
    Edit1: TEdit;
    Switch1: TSwitch;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure FormSaveState(Sender: TObject);
  private
    { Private declarations }
    FSettingsFilePath: String;
    SwitchEnabled: Boolean;
    EditText: String;
    procedure SaveSettings;
    procedure LoadSettings;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses Unit2;

procedure TForm1.Button1Click(Sender: TObject);
begin
  TDialogService.ShowMessage('Settings Window');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
{$IF DEFINED(MSWINDOWS)}
  FSettingsFilePath := ExtractFilePath(ParamStr(0));
{$ELSE}
  FSettingsFilePath := TPath.GetDocumentsPath + PathDelim;
{$ENDIF}
  LoadSettings;

  ListView1.Items.Add.Text := 'Item1';
  ListView1.Items.Add.Text := 'Item2';
end;

procedure TForm1.FormSaveState(Sender: TObject);
begin
  SaveSettings;
end;

procedure TForm1.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
var
  S: String;
begin
  S := ListView1.Items[ListView1.ItemIndex].Text;
  if S = 'Item1' then
    Form2.Show;
end;

procedure TForm1.LoadSettings;
var
  IniFile: TMemIniFile;
begin
  IniFile := TMemIniFile.Create(FSettingsFilePath + 'Settings.ini');
  try
    SwitchEnabled := IniFile.ReadBool('Settings', 'SwitchEnabled', False);
    EditText := IniFile.ReadString('Settings', 'EditText', '');

    Switch1.IsChecked := SwitchEnabled;
    Edit1.Text := EditText;
  finally
    IniFile.Free;
  end;
end;

procedure TForm1.SaveSettings;
var
  IniFile: TMemIniFile;
begin
  IniFile := TMemIniFile.Create(FSettingsFilePath + 'Settings.ini');
  try
    SwitchEnabled := Switch1.IsChecked;
    EditText := Edit1.Text;

    IniFile.WriteString('Settings', 'EditText', EditText);
    IniFile.WriteBool('Settings', 'SwitchEnabled', SwitchEnabled);

    IniFile.UpdateFile;

  finally
    IniFile.Free;
  end;

end;

end.
