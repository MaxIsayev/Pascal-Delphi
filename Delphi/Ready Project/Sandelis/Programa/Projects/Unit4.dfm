object Form4: TForm4
  Left = 245
  Top = 553
  Width = 286
  Height = 458
  Caption = 'Pakavimu katalogas'
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
    Left = 8
    Top = 40
    Width = 249
    Height = 265
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 320
    Width = 240
    Height = 33
    DataSource = DataSource1
    TabOrder = 1
  end
  object Table1: TTable
    Active = True
    DatabaseName = 'ASA 9.0 Client Sample'
    TableName = 'DBA.'#1057#1087#1088#1072#1074#1086#1095#1085#1080#1082'_'#1090#1072#1088
    Left = 16
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 48
    Top = 8
  end
end
