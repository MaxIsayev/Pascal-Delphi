unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls, DB, DBTables, Grids, DBGrids, Unit1,
  Unit3,  Unit4,  Unit5;

type
  TForm2 = class(TForm)
    StorageDataSource: TDataSource;
    Sandelio_turinys: TTable;
    Button1: TButton;  //Кнопка редактировать справочник товаров
    Button2: TButton;  //Кнопка редактировать справочник тар
    Button3: TButton;  //Кнопка редактировать справочник единиц изерения
    Button4: TButton;
    Storage_table1: TDBGrid;
    UpdateSQL1: TUpdateSQL;
    AddProc: TStoredProc;
    Button5: TButton;
    Prekiu_katalogas: TTable;
    ItemsDataSource: TDataSource;
    Add_Preke: TDBGrid;
    Add_Save: TButton;
    Add_Discard: TButton;
    Add_MV_Pakavime: TEdit;
    Tiekeju_katalogas: TTable;
    Matavimo_vienetu_katalogas: TTable;
    ProvidersDataSource: TDataSource;
    MeeasureUnitsDataSource: TDataSource;
    Add_Tiekejas: TDBGrid;
    Add_MV_pavadinimas: TDBGrid;
    Add_pakavimu_kieki: TEdit;
    Add_MV_kaina: TEdit;
    Add_Pakavimas: TDBGrid;
    Pakavimo_katalogas: TTable;
    PackingDataSource: TDataSource;
    Pasalinti_pazymeta_irasa: TButton;
    DeleteProc: TStoredProc;
    Storage_table: TDBGrid;
    Pakeisti_irasa: TButton;
    T_pakavimu_pavadinimas: TDBText;
    Tiekejo_vardas: TDBText;
    MV_pavadanimas: TDBText;
    MV_pakavime: TDBText;
    MV_kaina: TDBText;
    Bendra_kaina: TDBText;
    Prekes_pavadinimas: TDBText;
    Edit_save: TButton;
    Edit_discard: TButton;
    EditProc: TStoredProc;
    Filter: TButton;
    App_filter: TButton;
    Reset_filter: TButton;
    AddFilter: TStoredProc;
    ResetFilter: TStoredProc;
    F_prekes: TEdit;
    F_MV: TEdit;
    F_tiekejas: TEdit;
    F_pakavimas: TEdit;
    EventLogTable: TTable;
    EventLogDataSource: TDataSource;
    Event_log_table: TDBGrid;
    Neseni_atlikti_pakeitimai: TDBText;  //Кнопка редактировать справочник поставщиков

    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Add_SaveClick(Sender: TObject);
    procedure Add_DiscardClick(Sender: TObject);
    procedure DeleteRecordClick(Sender: TObject);
    procedure DeleteRecordClick1(Sender: TObject);
    procedure EditClick(Sender: TObject);
    procedure Edit_SaveClick(Sender: TObject);
    procedure Edit_DiscardClick(Sender: TObject);

    procedure App_Filter_Click(Sender: TObject);
    procedure Reset_Filter_Click(Sender: TObject);
    procedure Filter_Click(Sender: TObject);

    procedure F_Prekes_click(Sender: TObject);
    procedure F_Pakavimas_click(Sender: TObject);
    procedure F_Tiekejas_click(Sender: TObject);
    procedure F_MV_click(Sender: TObject);  

  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

    procedure Tform2.Button1Click(Sender: TObject);
      begin
        Form1.Show;
      end;

    procedure Tform2.Button2Click(Sender: TObject);
      begin
        Form3.Show;
      end;

    procedure Tform2.Button3Click(Sender: TObject);
      begin
        Form4.Show;
      end;

    procedure Tform2.Button4Click(Sender: TObject);
      begin
        Form5.Show;
     end;

    procedure Tform2.Button5Click(Sender: TObject);
      begin
        Form2.Add_Preke.Visible:=true;
        Form2.Add_Pakavimas.Visible:=true;
        Form2.Add_Tiekejas.Visible:=true;
        Form2.Add_MV_pavadinimas.Visible:=true;
        Form2.Add_MV_Pakavime.Visible:=true;
        Form2.Add_pakavimu_kieki.Visible:=true;
        Form2.Add_MV_kaina.Visible:=true;
        Form2.Add_Save.Visible:=true;
        Form2.Add_Discard.Visible:=true;
   end;

     procedure Tform2.Add_SaveClick(Sender: TObject);
      var n: integer;
          f: real;
      begin

         n:=Form2.Add_Preke.DataSource.DataSet.Fields[0].AsInteger;
         Form2.AddProc.Params[0].AsInteger :=n;

         //  вносим тару, поставщика, единицу измерения
         n:=Form2.Add_Pakavimas.DataSource.DataSet.Fields[0].AsInteger;
         Form2.AddProc.Params[3].AsInteger := n;

         n:=Form2.Add_Tiekejas.DataSource.DataSet.Fields[0].AsInteger;
         Form2.AddProc.Params[1].AsInteger := n;

         n:=Form2.Add_MV_pavadinimas.DataSource.DataSet.Fields[0].AsInteger;
         Form2.AddProc.Params[2].AsInteger := n;

         //  вносим количествo ед измерения в таре, количество тар, цену
         //  float
         f:=StrToFloat(Add_MV_Pakavime.Text);
         Form2.AddProc.Params[4].AsFloat :=f;
         // integer
         n:=StrToInt(Add_pakavimu_kieki.Text);
         Form2.AddProc.Params[5].AsInteger :=n;
         //  float
         f:=StrToFloat(Add_MV_kaina.Text);
         Form2.AddProc.Params[6].AsFloat :=f;
         //
         

         Form2.AddProc.Prepare;
         Form2.AddProc.ExecProc;

         //обновление таблиц
         Form2.Sandelio_turinys.Active := False;
         Form2.Sandelio_turinys.Active := True;

         Form2.EventLogTable.Active := False;
         Form2.EventLogTable.Active := True;


         //делаем невидимыми
         Form2.Add_Preke.Visible:=false;
         Form2.Add_Pakavimas.Visible:=false;
         Form2.Add_Tiekejas.Visible:=false;
         Form2.Add_MV_pavadinimas.Visible:=false;
         Form2.Add_MV_Pakavime.Visible:=false;
         Form2.Add_pakavimu_kieki.Visible:=false;
         Form2.Add_MV_kaina.Visible:=false;
         Form2.Add_Save.Visible:=false;
         Form2.Add_Discard.Visible:=false;
    end;

      procedure Tform2.Add_DiscardClick(Sender: TObject);
      begin
         Form2.Add_Preke.Visible:=false;
         Form2.Add_Pakavimas.Visible:=false;
         Form2.Add_Tiekejas.Visible:=false;
         Form2.Add_MV_pavadinimas.Visible:=false;
         Form2.Add_MV_Pakavime.Visible:=false;
         Form2.Add_pakavimu_kieki.Visible:=false;
         Form2.Add_MV_kaina.Visible:=false;
         Form2.Add_Save.Visible:=false;
         Form2.Add_Discard.Visible:=false;
    end;

    procedure Tform2.DeleteRecordClick(Sender: TObject);
    var i, n, rowNumber: integer;
        f: real;
        Prekes, Pakavimas, Tiekejas, MV: string;
    begin
         rowNumber:=TStringGrid(Storage_table).Row ;

         //  вносим товар, тару, поставщика, единицу измерения
         //  найти в справочнике соответствие между
         //    названием товара в складе - кодом товара в справочнике
         //  при нахождении - код товара вписапть в параметр

         Form2.DeleteProc.Params[0].AsInteger :=Form2.Storage_table.DataSource.DataSet.Fields[7].AsInteger;
         Form2.DeleteProc.Params[1].AsInteger := Form2.Storage_table.DataSource.DataSet.Fields[9].AsInteger;
         Form2.DeleteProc.Params[2].AsInteger := Form2.Storage_table.DataSource.DataSet.Fields[10].AsInteger;
         Form2.DeleteProc.Params[3].AsInteger := Form2.Storage_table.DataSource.DataSet.Fields[8].AsInteger;
         Form2.DeleteProc.Params[4].AsFloat := Form2.Storage_table.DataSource.DataSet.Fields[4].AsFloat;
         Form2.DeleteProc.Params[5].AsInteger := Form2.Storage_table.DataSource.DataSet.Fields[5].AsInteger;
         Form2.DeleteProc.Params[6].AsFloat := Form2.Storage_table.DataSource.DataSet.Fields[6].AsFloat;
         
         {MV:=Form2.Storage_table.DataSource.DataSet.Fields[3].AsString;
         Form2.DeleteProc.Params[3].AsString := MV;

         //  вносим количествo ед измерения в таре, количество тар, цену
         //  float
         f:= Form2.Storage_table.DataSource.DataSet.Fields[4].AsFloat;
         Form2.DeleteProc.Params[4].AsFloat :=f;
         // integer
         n:= Form2.Storage_table.DataSource.DataSet.Fields[5].AsInteger;
         Form2.DeleteProc.Params[5].AsInteger :=n;
         //  float
         f:= Form2.Storage_table.DataSource.DataSet.Fields[6].AsFloat;
         Form2.DeleteProc.Params[6].AsFloat := f;
         //
         f:= Form2.Storage_table.DataSource.DataSet.Fields[7].AsFloat;
         Form2.DeleteProc.Params[7].AsFloat := f;  }

         Form2.DeleteProc.Prepare;
         Form2.DeleteProc.ExecProc;

        //обновление таблицы
         Form2.Sandelio_turinys.Active := False;
         Form2.Sandelio_turinys.Active := True;

         Form2.EventLogTable.Active := False;
         Form2.EventLogTable.Active := True;
         
         ShowMessage('Pasalinta eilute '+ IntToStr(rowNumber));
    end;


    procedure Tform2.DeleteRecordClick1(Sender: TObject);
    var i, n, rowNumber: integer;
        f: real;
        Prekes, Pakavimas, Tiekejas, MV: string;
    begin
         rowNumber:=TStringGrid(Storage_table).Row ;

         //  вносим товар, тару, поставщика, единицу измерения
         //  найти в справочнике соответствие между
         //    названием товара в складе - кодом товара в справочнике
         //  при нахождении - код товара вписапть в параметр
         {Prekes:=Form2.Storage_table.DataSource.DataSet.Fields[0].AsString;
         Form2.DeleteProc.Params[0].AsString :=Prekes;   }

         Pakavimas:=Form2.Storage_table.DataSource.DataSet.Fields[1].AsString;
         Form2.DeleteProc.Params[1].AsString := Pakavimas;

         Tiekejas:=Form2.Storage_table.DataSource.DataSet.Fields[2].AsString;
         Form2.DeleteProc.Params[2].AsString := Tiekejas;

         MV:=Form2.Storage_table.DataSource.DataSet.Fields[3].AsString;
         Form2.DeleteProc.Params[3].AsString := MV;

         {//  вносим количествo ед измерения в таре, количество тар, цену
         //  float
         f:= Form2.Storage_table.DataSource.DataSet.Fields[4].AsFloat;
         Form2.DeleteProc.Params[4].AsFloat :=f;
         // integer
         n:= Form2.Storage_table.DataSource.DataSet.Fields[5].AsInteger;
         Form2.DeleteProc.Params[5].AsInteger :=n;
         //  float
         f:= Form2.Storage_table.DataSource.DataSet.Fields[6].AsFloat;
         Form2.DeleteProc.Params[6].AsFloat := f;
         //
         f:= Form2.Storage_table.DataSource.DataSet.Fields[7].AsFloat;
         Form2.DeleteProc.Params[7].AsFloat := f;  }

         Form2.DeleteProc.Prepare;
         Form2.DeleteProc.ExecProc;

        //обновление таблицы
         Form2.Sandelio_turinys.Active := False;
         Form2.Sandelio_turinys.Active := True;


         ShowMessage('Pasalinta eilute '+ IntToStr(rowNumber));
    end;

    procedure Tform2.EditClick(Sender: TObject);
    begin
      Form2.Prekes_pavadinimas.Caption := Form2.Storage_table.DataSource.DataSet.Fields[0].AsString;
      Form2.T_pakavimu_pavadinimas.Caption := Form2.Storage_table.DataSource.DataSet.Fields[1].AsString;
      Form2.Tiekejo_vardas.Caption := Form2.Storage_table.DataSource.DataSet.Fields[2].AsString;
      Form2.MV_pavadanimas.Caption := Form2.Storage_table.DataSource.DataSet.Fields[3].AsString;
      Form2.MV_pakavime.Caption := Form2.Storage_table.DataSource.DataSet.Fields[4].AsString;
      Form2.MV_kaina.Caption := Form2.Storage_table.DataSource.DataSet.Fields[6].AsString;
      Form2.Bendra_kaina.Caption := Form2.Storage_table.DataSource.DataSet.Fields[7].AsString;

       Form2.Prekes_pavadinimas.Visible := true;
      Form2.T_pakavimu_pavadinimas.Visible := true;
      Form2.Tiekejo_vardas.Visible := true;
      Form2.MV_pavadanimas.Visible := true;
      Form2.MV_pakavime.Visible := true;
      Form2.MV_kaina.Visible := true;
      Form2.Bendra_kaina.Visible := true;

      Form2.Add_pakavimu_kieki.Visible := true;
      Form2.Edit_save.Visible := true;
      Form2.Edit_discard.Visible := true;
    end;

    procedure Tform2.Edit_SaveClick(Sender: TObject);
      var rowNumber: integer;
    begin

          rowNumber:=TStringGrid(Storage_table).Row ;

         //  вносим товар, тару, поставщика, единицу измерения
         //  найти в справочнике соответствие между
         //    названием товара в складе - кодом товара в справочнике
         //  при нахождении - код товара вписапть в параметр

         Form2.EditProc.Params[0].AsInteger :=Form2.Storage_table.DataSource.DataSet.Fields[7].AsInteger;
         Form2.EditProc.Params[1].AsInteger := Form2.Storage_table.DataSource.DataSet.Fields[9].AsInteger;
         Form2.EditProc.Params[2].AsInteger := Form2.Storage_table.DataSource.DataSet.Fields[10].AsInteger;
         Form2.EditProc.Params[3].AsInteger := Form2.Storage_table.DataSource.DataSet.Fields[8].AsInteger;
         Form2.EditProc.Params[4].AsFloat := Form2.Storage_table.DataSource.DataSet.Fields[4].AsFloat;
         Form2.EditProc.Params[5].AsInteger := StrToInt(Add_pakavimu_kieki.Text);
         Form2.EditProc.Params[6].AsFloat := Form2.Storage_table.DataSource.DataSet.Fields[6].AsFloat;
         
         {MV:=Form2.Storage_table.DataSource.DataSet.Fields[3].AsString;
         Form2.DeleteProc.Params[3].AsString := MV;

         //  вносим количествo ед измерения в таре, количество тар, цену
         //  float
         f:= Form2.Storage_table.DataSource.DataSet.Fields[4].AsFloat;
         Form2.DeleteProc.Params[4].AsFloat :=f;
         // integer
         n:= Form2.Storage_table.DataSource.DataSet.Fields[5].AsInteger;
         Form2.DeleteProc.Params[5].AsInteger :=n;
         //  float
         f:= Form2.Storage_table.DataSource.DataSet.Fields[6].AsFloat;
         Form2.DeleteProc.Params[6].AsFloat := f;
         //
         f:= Form2.Storage_table.DataSource.DataSet.Fields[7].AsFloat;
         Form2.DeleteProc.Params[7].AsFloat := f;  }

         Form2.EditProc.Prepare;
         Form2.EditProc.ExecProc;

        //обновление таблицы
         Form2.Sandelio_turinys.Active := False;
         Form2.Sandelio_turinys.Active := True;

         Form2.EventLogTable.Active := False;
         Form2.EventLogTable.Active := True;
         
         ShowMessage('Redaguta eilute '+ IntToStr(rowNumber));
        // start save editing
      Form2.Prekes_pavadinimas.Visible := false;
      Form2.T_pakavimu_pavadinimas.Visible := false;
      Form2.Tiekejo_vardas.Visible := false;
      Form2.MV_pavadanimas.Visible := false;
      Form2.MV_pakavime.Visible := false;
      Form2.MV_kaina.Visible := false;
      Form2.Bendra_kaina.Visible := false;

      Form2.Add_pakavimu_kieki.Visible := false;
      Form2.Edit_save.Visible := false;
      Form2.Edit_discard.Visible := false;
    end;

    procedure Tform2.Edit_DiscardClick(Sender: TObject);
    begin
        // start discard editing
      Form2.Prekes_pavadinimas.Visible := false;
      Form2.T_pakavimu_pavadinimas.Visible := false;
      Form2.Tiekejo_vardas.Visible := false;
      Form2.MV_pavadanimas.Visible := false;
      Form2.MV_pakavime.Visible := false;
      Form2.MV_kaina.Visible := false;
      Form2.Bendra_kaina.Visible := false;

      Form2.Add_pakavimu_kieki.Visible := false;
      Form2.Edit_save.Visible := false;
      Form2.Edit_discard.Visible := false;
    end;

    procedure Tform2.Filter_Click(Sender: TObject);
    begin
      //  begin filter
       Form2.Add_Preke.Visible:=true;
        Form2.Add_Pakavimas.Visible:=true;
        Form2.Add_Tiekejas.Visible:=true;
        Form2.Add_MV_pavadinimas.Visible:=true;
        Form2.App_filter.Visible:=true;
        Form2.Reset_filter.Visible:=true;

        Form2.F_prekes.Visible:=true;
        Form2.F_pakavimas.Visible:=true;
        Form2.F_tiekejas.Visible:=true;
        Form2.F_MV.Visible:=true;

        Form2.F_prekes.Text := IntToStr(Form2.Add_Preke.DataSource.DataSet.Fields[0].AsInteger);
        Form2.F_pakavimas.Text := IntToStr(Form2.Add_Pakavimas.DataSource.DataSet.Fields[0].AsInteger);
        Form2.F_tiekejas.Text := IntToStr(Form2.Add_Tiekejas.DataSource.DataSet.Fields[0].AsInteger);
        Form2.F_MV.Text := IntToStr(Form2.Add_MV_pavadinimas.DataSource.DataSet.Fields[0].AsInteger);

    end;

    procedure Tform2.App_Filter_Click(Sender: TObject);
    begin
      // apply

      if length(Form2.F_prekes.Text) = 0 then
        Form2.AddFilter.Params[0].AsInteger := -1
      else //StrToInt(Form2.F_prekes.Text);
        Form2.AddFilter.Params[0].AsInteger := StrToInt(Form2.F_prekes.Text);

      if length(F_pakavimas.Text) = 0 then
        Form2.AddFilter.Params[3].AsInteger := -1
      else //StrToInt(Form2.F_prekes.Text);
        Form2.AddFilter.Params[3].AsInteger := StrToInt(Form2.F_pakavimas.Text);

      if length(Form2.F_tiekejas.Text) = 0 then
        Form2.AddFilter.Params[1].AsInteger := -1
      else //StrToInt(Form2.F_prekes.Text);
        Form2.AddFilter.Params[1].AsInteger := StrToInt(Form2.F_tiekejas.Text);

      if length(Form2.F_MV.Text) = 0 then
        Form2.AddFilter.Params[2].AsInteger := -1
      else //StrToInt(Form2.F_prekes.Text);
        Form2.AddFilter.Params[2].AsInteger := StrToInt(Form2.F_MV.Text);

       Form2.AddFilter.Prepare;
        Form2.AddFilter.ExecProc;

        //обновление таблицы
        Form2.Sandelio_turinys.Active := False;
        Form2.Sandelio_turinys.Active := True; 

        Form2.Add_Preke.Visible:=false;
        Form2.Add_Pakavimas.Visible:=false;
        Form2.Add_Tiekejas.Visible:=false;
        Form2.Add_MV_pavadinimas.Visible:=false;
        Form2.App_filter.Visible:=false;
        Form2.Reset_filter.Visible:=false;
        Form2.F_prekes.Visible:=false;
        Form2.F_tiekejas.Visible:=false;
        Form2.F_MV.Visible:=false;
        Form2.F_pakavimas.Visible:=false;

    end;

    procedure Tform2.Reset_Filter_Click(Sender: TObject);
    begin
      //  discard
        Form2.ResetFilter.Prepare;
        Form2.ResetFilter.ExecProc;

        //обновление таблицы
        Form2.Sandelio_turinys.Active := False;
        Form2.Sandelio_turinys.Active := True;

        Form2.Add_Preke.Visible:=false;
        Form2.Add_Pakavimas.Visible:=false;
        Form2.Add_Tiekejas.Visible:=false;
        Form2.Add_MV_pavadinimas.Visible:=false;
        Form2.App_filter.Visible:=false;
        Form2.Reset_filter.Visible:=false;
        Form2.F_prekes.Visible:=false;
        Form2.F_tiekejas.Visible:=false;
        Form2.F_MV.Visible:=false;
        Form2.F_pakavimas.Visible:=false;
    end;

     procedure Tform2.F_Prekes_click(Sender: TObject);
     begin
     //**
     //Form2.F_prekes.Text := Form2.Add_Preke.DataSource.DataSet.Fields[0].AsInteger;

     Form2.F_prekes.Text := IntToStr(Form2.Add_Preke.DataSource.DataSet.Fields[0].AsInteger);

     end;

  procedure Tform2.F_Pakavimas_click(Sender: TObject);
     begin
     //**
     Form2.F_pakavimas.Text := IntToStr(Form2.Add_Pakavimas.DataSource.DataSet.Fields[0].AsInteger);

     end;

    procedure Tform2.F_Tiekejas_click(Sender: TObject);
      begin
     //**
     Form2.F_tiekejas.Text := IntToStr(Form2.Add_Tiekejas.DataSource.DataSet.Fields[0].AsInteger);

     end;

   procedure Tform2.F_MV_click(Sender: TObject);
     begin
     //**
     Form2.F_MV.Text := IntToStr(Form2.Add_MV_pavadinimas.DataSource.DataSet.Fields[0].AsInteger);


     end;

end.
