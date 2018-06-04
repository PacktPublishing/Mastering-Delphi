unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  System.Math.Vectors, FMX.MaterialSources, FMX.Controls3D, FMX.Objects3D,
  FMX.Viewport3D, FMX.Ani, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts,
  FMX.Edit, FMX.EditBox, FMX.NumberBox, FMX.SpinBox;

type
  TMainForm = class(TForm)
    Cube1: TCube;
    LightMaterialSource1: TLightMaterialSource;
    Viewport3D1: TViewport3D;
    FloatAnimation1: TFloatAnimation;
    Layout1: TLayout;
    TrackBarX: TTrackBar;
    TrackBarZ: TTrackBar;
    TrackBarY: TTrackBar;
    Layout2: TLayout;
    NumberBoxX: TNumberBox;
    Label1: TLabel;
    Label2: TLabel;
    NumberBoxY: TNumberBox;
    Label3: TLabel;
    NumberBoxZ: TNumberBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    SpinBoxX: TSpinBox;
    SpinBoxY: TSpinBox;
    SpinBoxZ: TSpinBox;
    procedure TrackBarXChange(Sender: TObject);
    procedure TrackBarYChange(Sender: TObject);
    procedure TrackBarZChange(Sender: TObject);
    procedure NumberBoxXChange(Sender: TObject);
    procedure NumberBoxYChange(Sender: TObject);
    procedure NumberBoxZChange(Sender: TObject);
    procedure SpinBoxXChange(Sender: TObject);
    procedure SpinBoxYChange(Sender: TObject);
    procedure SpinBoxZChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}

procedure TMainForm.NumberBoxXChange(Sender: TObject);
begin
  Cube1.Position.X := NumberBoxX.Value;
end;

procedure TMainForm.NumberBoxYChange(Sender: TObject);
begin
  Cube1.Position.Y := NumberBoxY.Value;
end;

procedure TMainForm.NumberBoxZChange(Sender: TObject);
begin
  Cube1.Position.Z := NumberBoxZ.Value;
end;

procedure TMainForm.SpinBoxXChange(Sender: TObject);
begin
  Cube1.RotationAngle.X := SpinBoxX.Value;
end;

procedure TMainForm.SpinBoxYChange(Sender: TObject);
begin
  Cube1.RotationAngle.Y := SpinBoxY.Value;
end;

procedure TMainForm.SpinBoxZChange(Sender: TObject);
begin
  Cube1.RotationAngle.Z := SpinBoxZ.Value;
end;

procedure TMainForm.TrackBarXChange(Sender: TObject);
begin
  Cube1.Scale.X := TrackBarX.Value;
end;

procedure TMainForm.TrackBarYChange(Sender: TObject);
begin
  Cube1.Scale.Y := TrackBarY.Value;
end;

procedure TMainForm.TrackBarZChange(Sender: TObject);
begin
  Cube1.Scale.Z := TrackBarZ.Value;
end;

end.
