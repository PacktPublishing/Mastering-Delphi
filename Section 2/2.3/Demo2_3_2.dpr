program Demo2_3_2;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

function Add(A, B: Integer): Extended; overload;
begin
  Result := A + B;
end;

function Add(A, B: Real): Real; overload;
begin
  Result := A + B;
end;

begin
  WriteLn(Add(5.1, 7.2):2:2);
  WriteLn(Add(5, 15):2:2);
  ReadLn;
end.
