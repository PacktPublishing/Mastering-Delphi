unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.UITypes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, HashObj, MiscObj, Vcl.StdCtrls;

type
  TMainForm = class(TForm)
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  F, ActivatedFile: TextFile;
  HDDSerialNumber: String;
  S, S1, S2, S3: String;
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

procedure TMainForm.FormCreate(Sender: TObject);
begin
  try
    // For Hashing keys
    SHA3 := TSHA3Hash.Create;
    SHA3.AType := tsha;
    SHA3.outputFormat := base64;
    SHA3.HashSizeBits := 256;
    SHA3.version := 512;
    SHA3.Unicode := yesUni;

    // Getting and creating a new value by copying and concatenating the string
    HDDSerialNumber := Trim(GetDiskSerialNumber);
    S1 := Copy(HDDSerialNumber, 1, 3); // S31
    S2 := Copy(HDDSerialNumber, 2, 6); // 31PJ9E
    S3 := Copy(HDDSerialNumber, 9, 13); // 813397
    HDDSerialNumber := S3 + '3' + S1 + '1' + S1 + '1' + S2 + '2';

    // If there is no activation file terminates application
    If not FileExists('Activation.sps') then
    begin
      MessageDlg('There is no activator file', mtError,
        [mbOK], 0);
      Application.Terminate;
    end
    Else // else, opens a file and assignes a new value to S from file
    begin
      AssignFile(F, 'Activation.sps');
      Reset(F);
      Readln(F, S);

      // Checking S to HDDSerialNumber which is Hashed with SHA3.Hash method
      If not(S = SHA3.Hash(HDDSerialNumber)) then
      begin
        MessageDlg('Not Activated', mtError, [mbOK], 0);
        Application.Terminate;
      end
      Else // if equal, creating a new file called Activated.dat
      begin
        AssignFile(ActivatedFile, 'Activated.dat');
        ReWrite(ActivatedFile);
        Writeln(ActivatedFile, HDDSerialNumber);
        CloseFile(ActivatedFile);
      end;
    end;
  finally
    SHA3.Free;
  end;
end;

end.
