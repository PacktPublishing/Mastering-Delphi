object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 360
  ClientWidth = 621
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 621
    Height = 41
    Align = alTop
    BevelInner = bvRaised
    BevelKind = bkSoft
    BevelOuter = bvSpace
    Color = clGradientInactiveCaption
    ParentBackground = False
    TabOrder = 0
    object Edit1: TEdit
      AlignWithMargins = True
      Left = 381
      Top = 5
      Width = 231
      Height = 27
      Align = alRight
      BevelKind = bkSoft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TextHint = 'Search by name'
      OnChange = Edit1Change
    end
    object DBNavigator1: TDBNavigator
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 284
      Height = 27
      DataSource = DataSource1
      Align = alLeft
      TabOrder = 1
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 621
    Height = 319
    Align = alClient
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object MainMenu1: TMainMenu
    Left = 464
    Top = 112
    object File1: TMenuItem
      Caption = 'File'
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 424
    Top = 192
  end
  object ADOConnection1: TADOConnection
    Left = 216
    Top = 200
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 304
    Top = 192
  end
end
