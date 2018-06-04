program Demo2_4;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {Form1},
  uDocument in 'uDocument.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
