object Form1: TForm1
  Left = 551
  Top = 115
  Width = 340
  Height = 398
  Caption = 'Prekiu katalogas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBNavigator1: TDBNavigator
    Left = 40
    Top = 264
    Width = 200
    Height = 25
    DataSource = DataSource1
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 40
    Top = 32
    Width = 273
    Height = 217
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Table1: TTable
    Active = True
    AutoRefresh = True
    DatabaseName = 'ASA 9.0 Client Sample'
    TableName = 'DBA.'#1057#1087#1088#1072#1074#1086#1095#1085#1080#1082'_'#1090#1086#1074#1072#1088#1086#1074
    Left = 8
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 8
    Top = 56
  end
end
