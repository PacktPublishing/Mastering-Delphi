program PracticeTwo;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Generics.Collections;

type
  TNumericList = TList<integer>;

procedure ResList(aNumericList: TNumericList);
var
  I: Integer;
begin
  Write('List: [');
  for I in aNumericList do
    begin
      if I = aNumericList.Last then
      begin
        Write(I, ']');
        Break;
      end;
      Write(I, ', ');
    end;
  WriteLn;
end;

procedure NumericList;
var
  IntList: TNumericList;
  I: Integer;
begin
  IntList := TNumericList.Create;
  try
    for I := 1 to 10 do
      begin
        IntList.Add(I);
      end;
    ResList(IntList);

    IntList.Remove(1);
    ResList(IntList);

    IntList.Insert(1, 10);
    ResList(IntList);

    IntList.Sort;
    ResList(IntList);
  finally
    IntList.Free;
  end;
end;

begin
  NumericList;

  ReadLn;
end.
