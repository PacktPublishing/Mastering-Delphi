unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, IPPeerClient,
  REST.Backend.PushTypes, System.JSON, REST.Backend.KinveyPushDevice,
  System.PushNotification, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo,
  Data.Bind.Components, Data.Bind.ObjectScope, REST.Backend.BindSource,
  REST.Backend.PushDevice, REST.Backend.KinveyProvider;

type
  TForm1 = class(TForm)
    KinveyProvider1: TKinveyProvider;
    PushEvents1: TPushEvents;
    Memo1: TMemo;
    procedure PushEvents1DeviceRegistered(Sender: TObject);
    procedure PushEvents1DeviceTokenReceived(Sender: TObject);
    procedure PushEvents1DeviceTokenRequestFailed(Sender: TObject;
      const AErrorMessage: string);
    procedure PushEvents1PushReceived(Sender: TObject; const AData: TPushData);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.PushEvents1DeviceRegistered(Sender: TObject);
begin
  Memo1.Lines.Add('Device Registered');
  Memo1.Lines.Add('');
end;

procedure TForm1.PushEvents1DeviceTokenReceived(Sender: TObject);
begin
  Memo1.Lines.Add('Device Token Received');
  Memo1.Lines.Add('');
end;

procedure TForm1.PushEvents1DeviceTokenRequestFailed(Sender: TObject;
  const AErrorMessage: string);
begin
  Memo1.Lines.Add('Device Token Request Failed');
  Memo1.Lines.Add('');
end;

procedure TForm1.PushEvents1PushReceived(Sender: TObject;
  const AData: TPushData);
begin
  Memo1.Lines.Add('Message: ' + AData.Message);
  Memo1.Lines.Add('');
end;

end.
