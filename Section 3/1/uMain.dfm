object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'VCL Database DEMO'
  ClientHeight = 392
  ClientWidth = 650
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 47
    Width = 650
    Height = 345
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 644
    Height = 41
    Align = alTop
    BevelKind = bkSoft
    Color = 15128749
    ParentBackground = False
    TabOrder = 1
    ExplicitLeft = 8
    ExplicitTop = 8
    object DBNavigator1: TDBNavigator
      AlignWithMargins = True
      Left = 4
      Top = 6
      Width = 285
      Height = 27
      Margins.Top = 5
      DataSource = DataSource1
      Align = alLeft
      TabOrder = 0
    end
    object Edit1: TEdit
      AlignWithMargins = True
      Left = 416
      Top = 4
      Width = 220
      Height = 29
      Align = alRight
      BevelKind = bkSoft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TextHint = 'Search by Name'
      OnChange = Edit1Change
      ExplicitHeight = 27
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 280
    Top = 224
  end
  object MainMenu1: TMainMenu
    Left = 464
    Top = 160
    object N1: TMenuItem
      Caption = '&File'
      object Open1: TMenuItem
        Caption = 'Open'
        ShortCut = 16463
      end
    end
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\JavaGuru\D' +
      'ocuments\Embarcadero\Studio\Projects\Section 3\Win32\Debug\Datab' +
      'ase.mdb;Persist Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 112
    Top = 184
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM tblOne')
    Left = 416
    Top = 224
  end
end
