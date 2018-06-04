program FMXDemoDB;

uses
  System.StartUpCopy,
  FMX.Forms,
  uDemoOne in 'uDemoOne.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
