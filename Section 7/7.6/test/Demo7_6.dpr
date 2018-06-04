program Demo7_6;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {Form1},
  uRegistration in 'uRegistration.pas' {FrmReg},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('TabletDark');
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFrmReg, FrmReg);
  Application.Run;
end.
