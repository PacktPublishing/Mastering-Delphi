program Demo2_2;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
  N, I, K: Integer;
  Prime: Boolean;  

begin
  Write('N = ');  ReadLn(N);

  for I := 2 to N do
    begin
      Prime := True;
      for K := 2 to Trunc(Sqrt(I)) do
        if I mod K = 0 then
        begin
          Prime := False;
          Break;
        end;

      if Prime then WriteLn(I);
    end;

  ReadLn;
end.
