unit uDocument;

interface

uses
  Classes, SysUtils;

type
  TDocRec = Record
    ATime: TDateTime;
    Title: ShortString;
  End;

  {TDocument}

  TDocument = Class
    private
      F: File of TDocRec;
      FFileName: String;
    public
      constructor Create(FileName: String);
      destructor Destroy; override;
      procedure Add(ATitle: String);
      procedure ReadAll(var DocList: TStringList);
      function Find(Keyword: String; var ResulList: TStringList): Boolean;
  End;


implementation

{ TDocument }

procedure TDocument.Add(ATitle: String);
var
  Doc: TDocRec;
begin
  AssignFile(F, FFileName);
  if FileExists(FFileName) then
  begin
    FileMode := 2;
    Reset(F);
    Seek(F, FileSize(F));
  end
  else
    ReWrite(F);

  Doc.ATime := Now;
  Doc.Title := ATitle;
  Write(F, Doc);
  CloseFile(F);
end;

constructor TDocument.Create(FileName: String);
begin
  FFileName := FileName;
end;

destructor TDocument.Destroy;
begin
  inherited Destroy;
end;

function TDocument.Find(Keyword: String; var ResulList: TStringList): Boolean;
var
  Doc: TDocRec;
begin
  ResulList.Clear;
  Result := False;
  AssignFile(F, FFileName);
  if FileExists(FFileName) then
  begin
    Reset(F);
    while not Eof(F) do
    begin
      Read(F, Doc);
      if Pos(LowerCase(Keyword), LowerCase(Doc.Title)) > 0 then
      begin
        ResulList.Add(DateTimeToStr(Doc.ATime) + ' : ' + Doc.Title);
        Result := True;
      end;
    end;
  end;
  CloseFile(F);
end;

procedure TDocument.ReadAll(var DocList: TStringList);
var
  Doc: TDocRec;
begin
  DocList.Clear;
  AssignFile(F, FFileName);
  if FileExists(FFileName) then
  begin
    Reset(F);
    while not Eof(F) do
    begin
      Read(F, Doc);
      DocList.Add(DateTimeToStr(Doc.ATime) + ' : ' + Doc.Title);
    end;
    CloseFile(F);
  end;
end;

end.
