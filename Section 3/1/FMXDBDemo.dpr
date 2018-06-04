program FMXDBDemo;

uses
  System.StartUpCopy,
  FMX.Forms,
  uMainFMX in 'uMainFMX.pas' {FormMain};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
