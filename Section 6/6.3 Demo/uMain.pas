unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, IPPeerClient,
  IPPeerServer, System.Tether.Manager, System.Tether.AppProfile,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, System.Actions,
  FMX.ActnList, FMX.StdCtrls, FMX.Edit;

type
  TForm1 = class(TForm)
    DesktopTetherManager: TTetheringManager;
    TetheringAppProfile1: TTetheringAppProfile;
    Memo1: TMemo;
    Button1: TButton;
    ActionList1: TActionList;
    Action1: TAction;
    procedure DesktopTetherManagerRequestManagerPassword(const Sender: TObject;
      const ARemoteIdentifier: string; var Password: string);
    procedure TetheringAppProfile1ResourceReceived(const Sender: TObject;
      const AResource: TRemoteResource);
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Action1Execute(Sender: TObject);
begin
  Memo1.Lines.Clear;
end;

procedure TForm1.DesktopTetherManagerRequestManagerPassword(const Sender: TObject;
  const ARemoteIdentifier: string; var Password: string);
begin
  Password := '1234';
end;

procedure TForm1.TetheringAppProfile1ResourceReceived(const Sender: TObject;
  const AResource: TRemoteResource);
begin
  Memo1.Lines.Add(TimeToStr(Now) + ': ' + AResource.Value.AsString);

end;

end.
