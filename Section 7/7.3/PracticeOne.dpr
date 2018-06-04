program PracticeOne;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

var
  name: string;
  age: integer;
  i: integer;

begin
  writeln('please type your name');
  readln(name);

  writeln('Input your age:      ');
  readln(age);

  if age > 0 then
    writeln('hello world')
  else
    writeln('wait until you born');

  for i := 1 to 10 do
    writeln('action' + i.tostring);
  readln;

end.
