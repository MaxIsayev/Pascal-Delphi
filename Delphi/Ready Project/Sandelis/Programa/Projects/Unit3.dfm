object Form3: TForm3
  Left = 940
  Top = 106
  Width = 337
  Height = 409
  Caption = 'Tiekeju katalogas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 56
    Top = 16
    Width = 233
    Height = 225
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 56
    Top = 264
    Width = 230
    Height = 33
    DataSource = DataSource1
    TabOrder = 1
  end
  object Table1: TTable
    Active = True
    DatabaseName = 'ASA 9.0 Client Sample'
    TableName = 'DBA.'#1057#1087#1088#1072#1074#1086#1095#1085#1080#1082'_'#1087#1086#1089#1090#1072#1074#1097#1080#1082#1086#1074
    Left = 16
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 16
    Top = 56
  end
end
