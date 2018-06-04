unit HeaderFooterTemplate;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Objects, FMX.MultiView, FMX.Controls.Presentation,
  FMX.Filter.Effects, FMX.Effects, FMX.DialogService.Async;

type
  THeaderFooterForm = class(TForm)
    Header: TToolBar;
    Footer: TToolBar;
    HeaderLabel: TLabel;
    btnMaster: TButton;
    MultiView1: TMultiView;
    Image1: TImage;
    VertScrollBox1: TVertScrollBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    ProgressBar1: TProgressBar;
    Timer1: TTimer;
    ShadowEffect1: TShadowEffect;
    HueAdjustEffect1: THueAdjustEffect;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    BlurEffect1: TBlurEffect;
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HeaderFooterForm: THeaderFooterForm;

implementation

{$R *.fmx}

procedure THeaderFooterForm.Button1Click(Sender: TObject);
begin
  MultiView1.HideMaster;
  ProgressBar1.Value := 0;
  Timer1.Enabled := True;
end;

procedure THeaderFooterForm.Button5Click(Sender: TObject);
begin
  MultiView1.HideMaster;
  HueAdjustEffect1.Enabled := True;
  ProgressBar1.Value := 0;
end;

procedure THeaderFooterForm.SpeedButton1Click(Sender: TObject);
begin
  TDialogServiceAsync.MessageDialog('Clicked Me.',
    System.UITypes.TMsgDlgType.mtInformation, [System.UITypes.TMsgDlgBtn.mbYes,
    System.UITypes.TMsgDlgBtn.mbNo], System.UITypes.TMsgDlgBtn.mbNo, 0,
    procedure(const AResult: TModalResult)
    begin
      case AResult of
        mrYes:
          begin
            TThread.Synchronize(nil,
            procedure
            begin
              Label1.Text := 'Yes button clicked';
            end);
          end;
        mrNo:
          begin
            Label1.Text := 'No button clicked';
          end;
      end;
    end);
end;

procedure THeaderFooterForm.Timer1Timer(Sender: TObject);
begin
  ProgressBar1.Value := ProgressBar1.Value + 5;
  if ProgressBar1.Value = 100 then
    Timer1.Enabled := False;
end;

end.
