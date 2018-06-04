program PracticeThree;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Generics.Collections;

type
  TPeopleDictionary = TDictionary<string, integer>;

procedure ReportPeople(aPeople: TPeopleDictionary);
var
  People: String;
begin
  for People in aPeople.Keys do
    begin
      WriteLn(People);
    end;
  WriteLn;
end;

procedure ProcessPeople;
var
  PeopleDictionary: TPeopleDictionary;
begin
  PeopleDictionary := TPeopleDictionary.Create;
  try
    PeopleDictionary.Add('John Ray', 22);
    PeopleDictionary.Add('Taz Tim', 30);
    PeopleDictionary.Add('Justin Higgins', 19);
    ReportPeople(PeopleDictionary);

    PeopleDictionary['John Ray'] := 23;
    ReportPeople(PeopleDictionary);

    WriteLn(PeopleDictionary.Count);
  finally
    PeopleDictionary.Free;
  end;
end;

begin
  ProcessPeople;

  ReadLn;
end.
