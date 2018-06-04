program Demo2_1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
  I, A, B, J, N: Integer;
  X: Double;

begin
  Write('N = ');  ReadLn(N);
  I := N div 2 + 1;
  A := I;
  B := N - 1;

  While(I < N) do
  begin
    J := 2;
    A := I;
    B := N - I;
    if((A Mod J = 0) AND (B Mod J = 0)) then
    begin
      A := A Div J;
      B := B Div J;
    end;

    J := 3;
    X := Sqrt(N-1);

    While(J <= X) do
    begin
      if((A Mod J = 0) AND (B Mod J = 0)) then
      begin
        A := A Div J;
        B := B Div J;
        Break;
      end
      else
        Inc(J, 2);
    end;

    If(A + B = N) then
      Break;

    Inc(I);
  end;

  WriteLn(B, ' ', A);

  ReadLn;
end.
