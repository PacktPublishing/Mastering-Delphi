unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.DialogService,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Layouts, FMX.Edit, FMX.StdCtrls, FMX.Objects, FMX.ListView, FMX.MultiView,
  FMX.Controls.Presentation, System.IniFiles, System.IoUTils;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    MultiView1: TMultiView;
    ListView1: TListView;
    Image1: TImage;
    Button1: TButton;
    Switch1: TSwitch;
    Edit1: TEdit;
    Image2: TImage;
    Layout1: TLayout;
    BtnMaster: TButton;
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

uses
  unit2;

procedure TForm1.Button1Click(Sender: TObject);
begin
  TDialogService.ShowMessage('Settings Windows');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
{$IF DEFINED(MSWINDOWS)}
  FSettingsFilePath := ExtractFilePath(ParamStr(0));
{$ELSE}
  FSettingsFilePath := TPath.GetDocumentsPath + PathDelim;
{$ENDIF}
  LoadSettings;

  ListView1.Items.Add.Text := 'item 1';
  ListView1.Items.Add.Text := 'item 2';
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
  if S = 'item 1' then
    Form2.Show;
end;

procedure TForm1.LoadSettings;
var
  inifile: TMemIniFile;
begin
  inifile := TMemIniFile.Create(FSettingsFilePath + 'Settings.ini');
  SwitchEnabled := inifile.ReadBool('Settings', 'SwitchEnabled', False);
  EditText := inifile.ReadString('Settings', 'EditText', '');

  Switch1.IsChecked := SwitchEnabled;
  Edit1.Text := EditText;

  inifile.Free;
end;

procedure TForm1.SaveSettings;
var
  inifile: TMemIniFile;
begin
  inifile := TMemIniFile.Create(FSettingsFilePath + 'Settings.ini');
  SwitchEnabled := Switch1.IsChecked;
  EditText := Edit1.Text;

  inifile.WriteString('Settings', 'EditText', EditText);
  inifile.WriteBool('Settings', 'SwitchEnabled', SwitchEnabled);
  inifile.UpdateFile;
  inifile.Free;
end;

end.
