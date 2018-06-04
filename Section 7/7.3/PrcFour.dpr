program PrcFour;

uses
  System.StartUpCopy,
  FMX.Forms,
  PracticeFour in 'PracticeFour.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
