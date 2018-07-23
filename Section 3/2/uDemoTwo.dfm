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
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FirstName'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LastName'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Year'
        Visible = True
      end>
  end
  object MainMenu1: TMainMenu
    Left = 536
    Top = 192
    object File1: TMenuItem
      Caption = 'File'
    end
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM tblOne')
    Left = 424
    Top = 192
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=Datab' +
      'ase.mdb;Mode=Share Deny None;Persist Security Info=False;Jet OLE' +
      'DB:System database="";Jet OLEDB:Registry Path="";Jet OLEDB:Datab' +
      'ase Password="";Jet OLEDB:Engine Type=5;Jet OLEDB:Database Locki' +
      'ng Mode=1;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Global B' +
      'ulk Transactions=1;Jet OLEDB:New Database Password="";Jet OLEDB:' +
      'Create System Database=False;Jet OLEDB:Encrypt Database=False;Je' +
      't OLEDB:Don'#39't Copy Locale on Compact=False;Jet OLEDB:Compact Wit' +
      'hout Replica Repair=False;Jet OLEDB:SFP=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 168
    Top = 192
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 304
    Top = 192
  end
end
