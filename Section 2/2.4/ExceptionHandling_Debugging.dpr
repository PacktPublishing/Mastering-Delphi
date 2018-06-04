program ExceptionHandling_Debugging;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

var
  // X, Y: Integer;
  S: String;
  C: Char;
  O, D: Byte;

begin
  {
    X := 10;
    Y := 0;

    try

    except
    on E: Exception do  // EDivByZero
    WriteLn(E.Message, ':', E.ClassName);

    end;

    if Y = 0 then
    raise Exception.Create('Some Test')
    else
    Writeln(Y);
  }

  O := 0;
  D := 0;
  S := 'Hello Embarcadero Delphi.';

  for C in S do
  begin
    if CharInSet(C, ['o']) then
    begin
      Inc(O);
    end
    else if CharInSet(C, ['D']) then
    begin
      Inc(D);
    end;

  end;

  WriteLn('D = ', D, ';  O = ', O);

  ReadLn;

end.
