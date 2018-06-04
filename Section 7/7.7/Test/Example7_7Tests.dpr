program Example7_7Tests;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,
  TestUnit1 in 'TestUnit1.pas',
  Unit1 in '..\Unit1.pas';

{$R *.RES}

begin
  DUnitTestRunner.RunRegisteredTests;
end.

