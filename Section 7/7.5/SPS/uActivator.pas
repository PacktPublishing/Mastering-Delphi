unit uActivator;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.UITypes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls, Registry, HashObj, MiscObj;

type
  TFormMain = class(TForm)
    ImageBackground: TImage;
    EditHDD: TEdit;
    EditKey: TEdit;
    BtnActivator: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnActivatorClick(Sender: TObject);
  private
    { Private declarations }
    IniFile: TRegIniFile;
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;
  F: TextFile;
  HDDSerialNumber: String;
  S1, S2, S3: String;
  SHA3: TSHA3Hash;

implementation

{$R *.dfm}

function GetDiskSerialNumber: string;
type
  TSrbIoControl = packed record
    HeaderLength: ULONG;
    Signature: Array [0 .. 7] of AnsiChar;
    Timeout: ULONG;
    ControlCode: ULONG;
    ReturnCode: ULONG;
    Length: ULONG;
  end;

  SRB_IO_CONTROL = TSrbIoControl;
  PSrbIoControl = ^TSrbIoControl;

  TIDERegs = packed record
    bFeaturesReg: Byte; // Used for specifying SMART "commands".
    bSectorCountReg: Byte; // IDE sector count register
    bSectorNumberReg: Byte; // IDE sector number register
    bCylLowReg: Byte; // IDE low order cylinder value
    bCylHighReg: Byte; // IDE high order cylinder value
    bDriveHeadReg: Byte; // IDE drive/head register
    bCommandReg: Byte; // Actual IDE command.
    bReserved: Byte; // reserved for future use. Must be zero.
  end;

  IDEREGS = TIDERegs;
  PIDERegs = ^TIDERegs;

  TSendCmdInParams = packed record
    cBufferSize: DWORD; // Buffer size in bytes
    irDriveRegs: TIDERegs; // Structure with drive register values.
    bDriveNumber: Byte; // Physical drive number to send command to (0,1,2,3).
    bReserved: Array [0 .. 2] of Byte; // Reserved for future expansion.
    dwReserved: Array [0 .. 3] of DWORD; // For future use.
    bBuffer: Array [0 .. 0] of Byte; // Input buffer.
  end;

  SENDCMDINPARAMS = TSendCmdInParams;
  PSendCmdInParams = ^TSendCmdInParams;

  TIdSector = packed record
    wGenConfig: Word;
    wNumCyls: Word;
    wReserved: Word;
    wNumHeads: Word;
    wBytesPerTrack: Word;
    wBytesPerSector: Word;
    wSectorsPerTrack: Word;
    wVendorUnique: Array [0 .. 2] of Word;
    sSerialNumber: Array [0 .. 19] of AnsiChar;
    wBufferType: Word;
    wBufferSize: Word;
    wECCSize: Word;
    sFirmwareRev: Array [0 .. 7] of AnsiChar;
    sModelNumber: Array [0 .. 39] of AnsiChar;
    wMoreVendorUnique: Word;
    wDoubleWordIO: Word;
    wCapabilities: Word;
    wReserved1: Word;
    wPIOTiming: Word;
    wDMATiming: Word;
    wBS: Word;
    wNumCurrentCyls: Word;
    wNumCurrentHeads: Word;
    wNumCurrentSectorsPerTrack: Word;
    ulCurrentSectorCapacity: ULONG;
    wMultSectorStuff: Word;
    ulTotalAddressableSectors: ULONG;
    wSingleWordDMA: Word;
    wMultiWordDMA: Word;
    bReserved: Array [0 .. 127] of Byte;
  end;

  PIdSector = ^TIdSector;
const
  IDE_ID_FUNCTION = $EC;
  IDENTIFY_BUFFER_SIZE = 512;
  DFP_RECEIVE_DRIVE_DATA = $0007C088;
  IOCTL_SCSI_MINIPORT = $0004D008;
  IOCTL_SCSI_MINIPORT_IDENTIFY = $001B0501;
  DataSize = sizeof(TSendCmdInParams) - 1 + IDENTIFY_BUFFER_SIZE;
  BufferSize = sizeof(SRB_IO_CONTROL) + DataSize;
  W9xBufferSize = IDENTIFY_BUFFER_SIZE + 16;
var
  hDevice: THandle;
  cbBytesReturned: DWORD;
  pInData: PSendCmdInParams;
  pOutData: Pointer; // PSendCmdInParams;
  Buffer: Array [0 .. BufferSize - 1] of Byte;
  srbControl: TSrbIoControl absolute Buffer;
  procedure ChangeByteOrder(var Data; Size: Integer);
  var
    ptr: PAnsiChar;
    i: Integer;
    c: AnsiChar;
  begin
    ptr := @Data;
    for i := 0 to (Size shr 1) - 1 do
    begin
      c := ptr^;
      ptr^ := (ptr + 1)^;
      (ptr + 1)^ := c;
      Inc(ptr, 2);
    end;
  end;

begin
  Result := '';
  FillChar(Buffer, BufferSize, #0);
  hDevice := CreateFile('\\.\PhysicalDrive0', GENERIC_READ or GENERIC_WRITE,
    FILE_SHARE_READ or FILE_SHARE_WRITE, nil, OPEN_EXISTING, 0, 0);
  if hDevice = INVALID_HANDLE_VALUE then
    Exit;
  try
    pInData := PSendCmdInParams(@Buffer);
    pOutData := PAnsiChar(@pInData^.bBuffer);
    with pInData^ do
    begin
      cBufferSize := IDENTIFY_BUFFER_SIZE;
      bDriveNumber := 0;
      with irDriveRegs do
      begin
        bFeaturesReg := 0;
        bSectorCountReg := 1;
        bSectorNumberReg := 1;
        bCylLowReg := 0;
        bCylHighReg := 0;
        bDriveHeadReg := $A0;
        bCommandReg := IDE_ID_FUNCTION;
      end;
    end;
    if not DeviceIoControl(hDevice, DFP_RECEIVE_DRIVE_DATA, pInData,
      sizeof(TSendCmdInParams) - 1, pOutData, W9xBufferSize,
      cbBytesReturned, nil) then
      Exit;
  finally
    CloseHandle(hDevice);
  end;
  with PIdSector(PAnsiChar(pOutData) + 16)^ do
  begin
    ChangeByteOrder(sSerialNumber, sizeof(sSerialNumber));
    SetString(Result, sSerialNumber, sizeof(sSerialNumber));
  end;
end;

procedure TFormMain.BtnActivatorClick(Sender: TObject);
begin
  If EditKey.Text = '' then
    Exit;

  If EditKey.Text = HDDSerialNumber then
  begin
    SHA3 := TSHA3Hash.Create;
    try
      SHA3.AType := tsha;
      SHA3.outputFormat := base64;
      SHA3.HashSizeBits := 256;
      SHA3.version := 512;
      SHA3.Unicode := yesUni;

      AssignFile(F, 'Activation.sps');
      ReWrite(F);
      Writeln(F, SHA3.Hash(HDDSerialNumber));
      MessageDlg('Successfully activated!', mtInformation,
        [mbYes], 0);

      BtnActivator.Enabled := False;
      EditHDD.Enabled := False;
      EditKey.Enabled := False;
    finally
      SHA3.Free;
      CloseFile(F);
    end;
  end
  else
  begin
    MessageDlg('Wrong key', mtError,
        [mbOk], 0);
  end;
end;

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    IniFile.WriteBool('Btn', 'REG', BtnActivator.Enabled);
    IniFile.WriteBool('EditHDD', 'REG', EditHDD.Enabled);
    IniFile.WriteBool('EditKey', 'REG', EditKey.Enabled);
  finally
    IniFile.Free;
  end;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  HDDSerialNumber := Trim(GetDiskSerialNumber);

  EditHDD.Text := HDDSerialNumber; // showing the key to user

  IniFile := TRegIniFile.Create('Software\Demo7_5');

  BtnActivator.Enabled := IniFile.ReadBool('Btn', 'REG',
    BtnActivator.Enabled);
  EditHDD.Enabled := IniFile.ReadBool('EditHDD', 'REG', EditHDD.Enabled);
  EditKey.Enabled := IniFile.ReadBool('EditKey', 'REG', EditKey.Enabled);

  // Simply creating a new key by copying concataneting
  S1 := Copy(HDDSerialNumber, 1, 3); // S31
  S2 := Copy(HDDSerialNumber, 2, 6); // 31PJ9E
  S3 := Copy(HDDSerialNumber, 9, 13); // 813397

  // And here out result
  // Activation Key :  --- 8133973S311S31131PJ9E2 ---
  HDDSerialNumber := S3 + '3' + S1 + '1' + S1 + '1' + S2 + '2';

  // this code works on debug mode
{$IFDEF DEBUG}
  EditKey.Text := HDDSerialNumber;
{$ENDIF}
end;

end.
