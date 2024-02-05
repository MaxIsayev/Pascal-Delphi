object Form2: TForm2
  Left = 257
  Top = 67
  Width = 961
  Height = 755
  Caption = 'Sandelis'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object T_pakavimu_pavadinimas: TDBText
    Left = 720
    Top = 568
    Width = 153
    Height = 25
    Visible = False
  end
  object Tiekejo_vardas: TDBText
    Left = 720
    Top = 592
    Width = 153
    Height = 25
    Visible = False
  end
  object MV_pavadanimas: TDBText
    Left = 720
    Top = 616
    Width = 153
    Height = 25
    Visible = False
  end
  object MV_pakavime: TDBText
    Left = 720
    Top = 640
    Width = 153
    Height = 25
    Visible = False
  end
  object MV_kaina: TDBText
    Left = 720
    Top = 664
    Width = 153
    Height = 25
    Visible = False
  end
  object Bendra_kaina: TDBText
    Left = 720
    Top = 688
    Width = 153
    Height = 25
    Visible = False
  end
  object Prekes_pavadinimas: TDBText
    Left = 720
    Top = 544
    Width = 153
    Height = 25
    Visible = False
  end
  object Neseni_atlikti_pakeitimai: TDBText
    Left = 656
    Top = 64
    Width = 249
    Height = 17
  end
  object Button1: TButton
    Left = 8
    Top = 368
    Width = 137
    Height = 33
    Caption = 'Redaguoti prekiu katalog'#1072
    Font.Charset = BALTIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 352
    Top = 368
    Width = 145
    Height = 33
    Caption = 'Redaguoti tiekeju kataloga  '
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 152
    Top = 368
    Width = 193
    Height = 33
    Caption = 'Redaguoti matavimo vienetu kataloga '
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 504
    Top = 368
    Width = 153
    Height = 33
    Caption = 'Redaguoti pakavimo kataloga '
    TabOrder = 3
    OnClick = Button4Click
  end
  object Storage_table1: TDBGrid
    Left = 40
    Top = 64
    Width = 393
    Height = 113
    DataSource = StorageDataSource
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Prekes pavadinimas'
        Title.Caption = 'Prek'#1083's pavadinimas'
        Title.Font.Charset = BALTIC_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Arial'
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pakavimo pavadinimas'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tiekejo vardas'
        Title.Caption = 'Tiek'#1083'jo vardas'
        Title.Font.Charset = BALTIC_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Arial'
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MV pavadinimas'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MV pakavime'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pakavimu kiekis'
        Title.Caption = 'Pakavim'#1096' kiekis'
        Title.Font.Charset = BALTIC_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Arial'
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MV kaina'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Bendra kaina'
        Visible = True
      end>
  end
  object Button5: TButton
    Left = 8
    Top = 408
    Width = 89
    Height = 33
    Caption = 'Prideti irasa'
    TabOrder = 5
    OnClick = Button5Click
  end
  object Add_Preke: TDBGrid
    Left = 16
    Top = 456
    Width = 161
    Height = 145
    DataSource = ItemsDataSource
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
    OnDblClick = F_Prekes_click
  end
  object Add_Save: TButton
    Left = 56
    Top = 672
    Width = 89
    Height = 33
    Caption = 'Issaugoti'
    TabOrder = 7
    Visible = False
    OnClick = Add_SaveClick
  end
  object Add_Discard: TButton
    Left = 152
    Top = 672
    Width = 89
    Height = 33
    Caption = 'Nesaugoti'
    TabOrder = 8
    Visible = False
    OnClick = Add_DiscardClick
  end
  object Add_MV_Pakavime: TEdit
    Left = 720
    Top = 456
    Width = 153
    Height = 21
    TabOrder = 9
    Text = 'Prideti_MV_Pakavime'
    Visible = False
  end
  object Add_Tiekejas: TDBGrid
    Left = 360
    Top = 456
    Width = 169
    Height = 153
    DataSource = ProvidersDataSource
    TabOrder = 10
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
    OnDblClick = F_Tiekejas_click
  end
  object Add_MV_pavadinimas: TDBGrid
    Left = 544
    Top = 456
    Width = 169
    Height = 153
    DataSource = MeeasureUnitsDataSource
    TabOrder = 11
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
    OnDblClick = F_MV_click
  end
  object Add_pakavimu_kieki: TEdit
    Left = 720
    Top = 488
    Width = 153
    Height = 21
    TabOrder = 12
    Text = 'Prideti_pakavimu_kieki'
    Visible = False
  end
  object Add_MV_kaina: TEdit
    Left = 720
    Top = 520
    Width = 153
    Height = 21
    TabOrder = 13
    Text = 'Prideti_MV_kaina'
    Visible = False
  end
  object Add_Pakavimas: TDBGrid
    Left = 184
    Top = 456
    Width = 169
    Height = 153
    DataSource = PackingDataSource
    TabOrder = 14
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
    OnDblClick = F_Pakavimas_click
  end
  object Pasalinti_pazymeta_irasa: TButton
    Left = 104
    Top = 408
    Width = 129
    Height = 33
    Caption = 'Pasalinti pazymeta irasa'
    TabOrder = 15
    OnClick = DeleteRecordClick
  end
  object Storage_table: TDBGrid
    Left = 8
    Top = 64
    Width = 633
    Height = 297
    DataSource = StorageDataSource
    TabOrder = 16
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Prekes pavadinimas'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pakavimo pavadinimas'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tiekejo vardas'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MV pavadinimas'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MV pakavime'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pakavimu kiekis'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MV kaina'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Prekes kodas'
        Width = -1
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Pakavimo kodas'
        Width = -1
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Tiekejo kodas'
        Width = -1
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'MV kodas'
        Width = -1
        Visible = False
      end>
  end
  object Pakeisti_irasa: TButton
    Left = 240
    Top = 408
    Width = 113
    Height = 33
    Caption = 'Pakeisti kieki'
    TabOrder = 17
    OnClick = EditClick
  end
  object Edit_save: TButton
    Left = 520
    Top = 672
    Width = 89
    Height = 33
    Caption = 'Issaugoti'
    TabOrder = 18
    Visible = False
    OnClick = Edit_SaveClick
  end
  object Edit_discard: TButton
    Left = 616
    Top = 672
    Width = 89
    Height = 33
    Caption = 'Nesaugoti'
    TabOrder = 19
    Visible = False
    OnClick = Edit_DiscardClick
  end
  object Filter: TButton
    Left = 360
    Top = 408
    Width = 113
    Height = 33
    Caption = 'Filtras'
    TabOrder = 20
    OnClick = Filter_Click
  end
  object App_filter: TButton
    Left = 304
    Top = 672
    Width = 89
    Height = 33
    Caption = 'Pritaikyti filtra'
    TabOrder = 21
    Visible = False
    OnClick = App_Filter_Click
  end
  object Reset_filter: TButton
    Left = 400
    Top = 672
    Width = 89
    Height = 33
    Caption = 'Nefiltruoti'
    TabOrder = 22
    Visible = False
    OnClick = Reset_Filter_Click
  end
  object F_prekes: TEdit
    Left = 16
    Top = 632
    Width = 153
    Height = 21
    TabOrder = 23
    Text = 'Prideti_MV_Pakavime'
    Visible = False
  end
  object F_MV: TEdit
    Left = 544
    Top = 632
    Width = 153
    Height = 21
    TabOrder = 24
    Text = 'Prideti_MV_Pakavime'
    Visible = False
  end
  object F_tiekejas: TEdit
    Left = 352
    Top = 632
    Width = 153
    Height = 21
    TabOrder = 25
    Text = 'Prideti_MV_Pakavime'
    Visible = False
  end
  object F_pakavimas: TEdit
    Left = 184
    Top = 632
    Width = 153
    Height = 21
    TabOrder = 26
    Text = 'Prideti_MV_Pakavime'
    Visible = False
  end
  object Event_log_table: TDBGrid
    Left = 648
    Top = 88
    Width = 289
    Height = 273
    DataSource = EventLogDataSource
    TabOrder = 27
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Ivykio numeris'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Laikas'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pranesimas'
        Visible = True
      end>
  end
  object StorageDataSource: TDataSource
    DataSet = Sandelio_turinys
    Left = 480
    Top = 24
  end
  object Sandelio_turinys: TTable
    Active = True
    DatabaseName = 'ASA 9.0 Client Sample'
    TableName = 'DBA.V_Storage'
    Left = 272
    Top = 24
  end
  object UpdateSQL1: TUpdateSQL
    Left = 72
    Top = 24
  end
  object AddProc: TStoredProc
    DatabaseName = 'ASA 9.0 Client Sample'
    StoredProcName = 'add_to_storage'
    Left = 32
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Prekes_kodas'
        ParamType = ptInputOutput
      end
      item
        DataType = ftInteger
        Name = 'Tiekejo_kodas'
        ParamType = ptInputOutput
      end
      item
        DataType = ftInteger
        Name = 'MV_kodas'
        ParamType = ptInputOutput
      end
      item
        DataType = ftInteger
        Name = 'Pakavimo_kodas'
        ParamType = ptInputOutput
      end
      item
        DataType = ftFloat
        Name = 'MV_pakavime'
        ParamType = ptInputOutput
      end
      item
        DataType = ftInteger
        Name = 'Pakavimu_kiekis'
        ParamType = ptInputOutput
      end
      item
        DataType = ftFloat
        Name = 'MV_kaina'
        ParamType = ptInputOutput
      end>
  end
  object Prekiu_katalogas: TTable
    Active = True
    DatabaseName = 'ASA 9.0 Client Sample'
    TableName = 'DBA.'#1057#1087#1088#1072#1074#1086#1095#1085#1080#1082'_'#1090#1086#1074#1072#1088#1086#1074
    Left = 304
    Top = 24
  end
  object ItemsDataSource: TDataSource
    DataSet = Prekiu_katalogas
    Left = 512
    Top = 24
  end
  object Tiekeju_katalogas: TTable
    Active = True
    DatabaseName = 'ASA 9.0 Client Sample'
    TableName = 'DBA.'#1057#1087#1088#1072#1074#1086#1095#1085#1080#1082'_'#1087#1086#1089#1090#1072#1074#1097#1080#1082#1086#1074
    Left = 336
    Top = 24
  end
  object Matavimo_vienetu_katalogas: TTable
    Active = True
    DatabaseName = 'ASA 9.0 Client Sample'
    TableName = 'DBA.'#1057#1087#1088#1072#1074#1086#1095#1085#1080#1082'_'#1045#1076#1080#1085#1080#1094'_'#1080#1079#1084#1077#1088#1077#1085#1080#1103
    Left = 368
    Top = 24
  end
  object ProvidersDataSource: TDataSource
    DataSet = Tiekeju_katalogas
    Left = 544
    Top = 24
  end
  object MeeasureUnitsDataSource: TDataSource
    DataSet = Matavimo_vienetu_katalogas
    Left = 576
    Top = 24
  end
  object Pakavimo_katalogas: TTable
    Active = True
    DatabaseName = 'ASA 9.0 Client Sample'
    TableName = 'DBA.'#1057#1087#1088#1072#1074#1086#1095#1085#1080#1082'_'#1090#1072#1088
    Left = 400
    Top = 24
  end
  object PackingDataSource: TDataSource
    DataSet = Pakavimo_katalogas
    Left = 608
    Top = 24
  end
  object DeleteProc: TStoredProc
    DatabaseName = 'ASA 9.0 Client Sample'
    StoredProcName = 'delete_from_storage'
    Left = 120
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Prekes_kodas'
        ParamType = ptInputOutput
      end
      item
        DataType = ftInteger
        Name = 'Tiekejo_kodas'
        ParamType = ptInputOutput
      end
      item
        DataType = ftInteger
        Name = 'MV_kodas'
        ParamType = ptInputOutput
      end
      item
        DataType = ftInteger
        Name = 'Pakavimo_kodas'
        ParamType = ptInputOutput
      end
      item
        DataType = ftFloat
        Name = 'MV_pakavime'
        ParamType = ptInputOutput
      end
      item
        DataType = ftInteger
        Name = 'Pakavimu_kiekis'
        ParamType = ptInputOutput
      end
      item
        DataType = ftFloat
        Name = 'MV_kaina'
        ParamType = ptInputOutput
      end>
  end
  object EditProc: TStoredProc
    DatabaseName = 'ASA 9.0 Client Sample'
    StoredProcName = 'edit_storage'
    Left = 160
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Prekes_kodas'
        ParamType = ptInputOutput
      end
      item
        DataType = ftInteger
        Name = 'Tiekejo_kodas'
        ParamType = ptInputOutput
      end
      item
        DataType = ftInteger
        Name = 'MV_kodas'
        ParamType = ptInputOutput
      end
      item
        DataType = ftInteger
        Name = 'Pakavimo_kodas'
        ParamType = ptInputOutput
      end
      item
        DataType = ftFloat
        Name = 'MV_pakavime'
        ParamType = ptInputOutput
      end
      item
        DataType = ftInteger
        Name = 'Pakavimu_kiekis'
        ParamType = ptInputOutput
      end
      item
        DataType = ftFloat
        Name = 'MV_kaina'
        ParamType = ptInputOutput
      end>
  end
  object AddFilter: TStoredProc
    DatabaseName = 'ASA 9.0 Client Sample'
    StoredProcName = 'create_filter'
    Left = 200
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Prekes_kodas'
        ParamType = ptInputOutput
      end
      item
        DataType = ftInteger
        Name = 'Tiekejo_kodas'
        ParamType = ptInputOutput
      end
      item
        DataType = ftInteger
        Name = 'MV_kodas'
        ParamType = ptInputOutput
      end
      item
        DataType = ftInteger
        Name = 'Pakavimo_kodas'
        ParamType = ptInputOutput
      end>
  end
  object ResetFilter: TStoredProc
    DatabaseName = 'ASA 9.0 Client Sample'
    StoredProcName = 'reset_filter'
    Left = 240
    Top = 24
  end
  object EventLogTable: TTable
    Active = True
    DatabaseName = 'ASA 9.0 Client Sample'
    TableName = 'DBA.Event_log'
    Left = 432
    Top = 24
  end
  object EventLogDataSource: TDataSource
    DataSet = EventLogTable
    Left = 640
    Top = 24
  end
end
