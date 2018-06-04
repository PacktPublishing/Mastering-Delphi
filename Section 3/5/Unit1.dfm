object FormMain: TFormMain
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Working with Chart - Delphi'
  ClientHeight = 336
  ClientWidth = 857
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 256
  TextHeight = 13
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 44
    Width = 254
    Height = 253
    Align = alLeft
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ProductName'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Year'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Price'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Visible = True
      end>
  end
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 857
    Height = 41
    Align = alTop
    BevelKind = bkSoft
    TabOrder = 1
    ExplicitWidth = 847
    object btnSave: TButton
      AlignWithMargins = True
      Left = 762
      Top = 4
      Width = 87
      Height = 29
      Align = alRight
      Caption = '&Save'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnSaveClick
      ExplicitLeft = 752
    end
    object DBNavigator1: TDBNavigator
      Left = 1
      Top = 1
      Width = 392
      Height = 35
      Margins.Right = 0
      DataSource = DataSource1
      Align = alLeft
      TabOrder = 1
    end
    object Button1: TButton
      AlignWithMargins = True
      Left = 669
      Top = 4
      Width = 87
      Height = 29
      Align = alRight
      Caption = '&Print'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = Button1Click
      ExplicitLeft = 659
    end
  end
  object Chart1: TChart
    Left = 260
    Top = 41
    Width = 597
    Height = 259
    Title.Text.Strings = (
      'Demo 5')
    Zoom.Animated = True
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 248
    ExplicitTop = 47
    ExplicitWidth = 400
    ExplicitHeight = 250
    DefaultCanvas = 'TGDIPlusCanvas'
    PrintMargins = (
      15
      28
      15
      28)
    ColorPaletteIndex = 13
    object Series1: TBarSeries
      Active = False
      ColorEachPoint = True
      DataSource = DBCrossTabSource1
      BarStyle = bsRoundRectangle
      Emboss.Visible = True
      TickLines.Visible = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
    end
  end
  object RzDialogButtons1: TRzDialogButtons
    Left = 0
    Top = 300
    Width = 857
    HotTrack = True
    TabOrder = 3
    ExplicitLeft = 336
    ExplicitTop = 168
    ExplicitWidth = 185
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\JavaGuru\D' +
      'ocuments\Embarcadero\Studio\Projects\Section 3\5\data.mdb;Persis' +
      't Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 112
    Top = 216
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 168
    Top = 272
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Table1'
      'ORDER BY Year')
    Left = 24
    Top = 216
  end
  object SavePictureDialog1: TSavePictureDialog
    Filter = 'Bitmaps (*.bmp)|*.bmp'
    Title = 'Delphi Mastering - Demo 5'
    Left = 72
    Top = 120
  end
  object DBCrossTabSource1: TDBCrossTabSource
    Active = True
    GroupField = 'Year'
    Series = Series1
    ValueField = 'Price'
    DataSet = ADOQuery1
    Left = 376
    Top = 96
  end
end
