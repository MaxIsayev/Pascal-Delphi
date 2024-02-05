Program MovieDatabaseEditor;
uses crt;
type Film = record
       number:  integer;
       name:  string;
       country:  string [10];
       producer:  string [20];
       duration:  string [5];
       genre:  string [15];
       year:  string [5];
     end;
const maxsize = 100;
var  fileofdata: text;
     operation: integer;
     movie: array [1..maxsize] of Film;
     i, rowsnumber, numberofcolumn, numberofrow : integer;
///////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------
Procedure ProgramDescription;
begin
  Writeln ('This program works with movie database (adds new record, modifies and deletes data)');
  Writeln ('It may check new data and be quited)');
  Writeln ('Data  contains field names: Name, Country, Producer, Duration(in minutes), Genre, and Year');
  Writeln ('INFORMATION FOR USER !');
  Writeln (' Size of cells of definite fields(in symbols):');
  Writeln ('Name - 19, Country - 9, Producer - 19, Time(in minues) - 4, Genre - 14, and Year - 4');
  Writeln;
  Writeln ('Data writing rules:');
  Writeln ('1) Name contains any characters');
  Writeln ('2) Contry, Producer and Genre contain letters, SPACE and „-“ ');
  Writeln ('3) Each word of Contry and Producer begins from Capital letter and contains only letters');
  Writeln ('4) Year and Duration(Time) contain only integers');
  Writeln ('5) Duration(Time) is written in minutes');
  Writeln ('6) Year is not less 1900 and not more 2010');
end;
//-----------------------------------------------------------------------------
Procedure OpeationOption (var operat: integer);
begin
   Writeln('OPTION');
   Writeln('If you want to add record press 1');
   Writeln('If you want to delete record press 2');
   Writeln('If you want to modify data  press 3');
   Writeln('If you want to quit program press 4');
   Readln(operat);
end;
//-----------------------------------------------------------------------------
//-----------------------------naujas irasas kuriamas po paskutines eilutes kaip MS Access
Procedure NewRecord (var film1: array [1..maxsize] of Film; var rowsnum: integer);
begin
  Writeln('NEW RECORD');
  rowsnum := rowsnum + 1;
  film1[rowsnum].number := rowsnum - 1;
  Writeln('Enter name of new film, country, producer, duration, genre and year');
  Read(film1[rowsnum].name, film1[rowsnum].country, film1[rowsnum].producer, film1[rowsnum].duration, film1[rowsnum].genre, film1[rowsnum].year );
end;
//------------------------------------------------------------------------------
Procedure NewRecordAlignment (var rowsnum: integer; var film1: array [1..maxsize] of Film);
var  j: integer;
begin
      for j:=1 to 20 - Length(film1[rowsnum].name) do
                                                   film1[rowsnum].name := film1[rowsnum].name + ' ';
      for j:=1 to 10 - Length(film1[rowsnum].country) do
                                                      film1[rowsnum].country := film1[rowsnum].country + ' ';
      for j:=1 to 20 - Length(film1[rowsnum].producer) do
                                                       film1[rowsnum].producer := film1[rowsnum].producer + ' ';

      for j:=1 to 5 - Length(film1[rowsnum].duration) do
                                                      film1[rowsnum].duration := film1[rowsnum].duration + ' ';
      for j:=1 to 15 - Length(film1[rowsnum].genre) do
                                                    film1[rowsnum].genre := film1[rowsnum].genre + ' ';
end;
//--------------------------------------------------------------------------------
Procedure RecordDeleting (var film1: array [1..maxsize] of Film; var rowsnum: integer);
var deletedrownumber, i: integer;
begin
  Writeln('DELETING');
  Writeln('Enter number of row you want to delete');
  Readln (deletedrownumber);
  inc(deletedrownumber);
  dec(rowsnum);
  for i := 1 to deletedrownumber do
      begin
        film1[i].number := i - 1;
      end;
  for i := deletedrownumber to rowsnum do
                                       begin
                                         film1[i].name := film1[i+1].name;
                                         film1[i].country := film1[i+1].country;
                                         film1[i].producer := film1[i+1].producer;
                                         film1[i].duration := film1[i+1].duration;
                                         film1[i].genre := film1[i+1].genre;
                                         film1[i].year := film1[i+1].year;
                                       end;
  
end;
//------------------------------------------------------------------------------
Procedure ModifyingRecord (var film1: array [1..maxsize] of Film; var numberofcolumn, numberofrow : integer);
begin
  Writeln('DATA MODIFYING');
  Writeln ('Enter the address of cell you want to modify (number of record and column (from 2 to 7)) according to source data table');
  Readln(numberofrow, numberofcolumn);
  Writeln('Enter new data of cell');
  inc(numberofrow);
  case numberofcolumn of
       2: Readln(film1[numberofrow].name);
       3: Readln(film1[numberofrow].country);
       4: Readln(film1[numberofrow].producer);
       5: Readln(film1[numberofrow].duration);
       6: Readln(film1[numberofrow].genre);
       7: readln(film1[numberofrow].year);
  end;
end;
//------------------------------------------------------------------------------
Procedure NewCellDataAlignment ( var film1: array [1..maxsize] of Film; numberofcolumn, numberofrow : integer);
var  j: integer;
begin
  case numberofcolumn of
       2: for j := 1 to 20 - Length(film1[numberofrow].name) do
                                                           film1[numberofrow].name := film1[numberofrow].name + ' ';
       3: for j := 1 to 10 - Length(film1[numberofrow].country) do
                                                              film1[numberofrow].country := film1[numberofrow].country + ' ';
       4: for j := 1 to 20 - Length(film1[numberofrow].producer) do
                                                               film1[numberofrow].producer := film1[numberofrow].producer + ' ';
       5: for j := 1 to 5 - Length(film1[numberofrow].duration) do
                                                              film1[numberofrow].duration := film1[numberofrow].duration + ' ';
       6: for j := 1 to 15 - Length(film1[numberofrow].genre) do
                                                            film1[numberofrow].genre := film1[numberofrow].genre + ' ';
  end;
end;
//------------------------------------------------------------------------------
Function NameValidator (var film1: array [1..maxsize] of Film; numberofrow : integer): boolean;
var i, n: integer;
begin
   n := 0;
   // 1) tikriname  vardo  ilgi
   if Length(film1[numberofrow].name)>19 then
      begin
        Writeln('ERROR. the name is larger than 19 symbols including space');
        NameValidator := False;
      end
   else
   //2) tikriname  ar yra raidziu ir kitu simboliu be  Tarpo)
   // jei iskart spaudziame enter neivedami nei tarpo - programa nebus uzdaryta kol neivesime simboli
   begin
     for i:=1 to Length(film1[numberofrow].name) do
         if film1[numberofrow].name[i] <> ' ' then
                                              inc(n);
     if n=0 then
            begin
              NameValidator := False;
              Writeln('ERROR. the name has not been entered');
            end
     else
     NameValidator := True;
   end;
end;
//------------------------------------------------------------------------------
Function CountryNameValidator (var film1: array [1..maxsize] of Film; var numberofrow : integer): boolean;
var i, n: integer;
begin
   //  tikriname  salies  ilgi
    // Problema: jei zodzio ilgis didesnis uz 20 - stringo ilgio, tai nereikalingos raides  perkeliamos i kita lauka
   if Length(film1[numberofrow].country)>9 then
      begin
        Writeln('ERROR. the country name is larger than 9 symbols including space');
        CountryNameValidator := False;
      end
   else
   // tikriname  ar yra raidziu ir kitu simboliu be  Tarpo)
   begin
     n := 0;
     for i:=1 to Length(film1[numberofrow].country) do
         if film1[numberofrow].country[i] <> ' ' then
                                                 inc(n);
     if n=0 then
            begin
              CountryNameValidator := False;
              Writeln('ERROR. the country has not been entered');
            end
     else
     begin
     // tikriname  salies  duomenu tipa (ar nera raidziu ir kitu simboliu (be Defiso arba Tarpo))
       n := 0;
       for i:=1 to Length(film1[numberofrow].country) do
           if not (ord(film1[numberofrow].country[i]) in  [65..90,97..122, 32, 45])then
                                                                                   inc(n);
       if n>0 then
              begin
                 CountryNameValidator := False;
                 Writeln('ERROR. the country contains only letters, SPACE, „-“');
              end
       else
       // tikriname  ar salis  yra parasytas is didziosios raides pradzioje
       if not (ord(film1[numberofrow].country[1]) in [65..90]) then
                                                              begin
                                                                CountryNameValidator := False;
                                                                Writeln('ERROR. the country doesn`t begin from capital letter');
                                                              end
       else
       // tikriname  ar salis yra parasytas is didziosios raides po tarpo (jei - 2 zodziai)
       begin
         n := 0;
         for i:=1 to Length(film1[numberofrow].country) - 1 do
             if (ord(film1[numberofrow].country[i]) = 32) and (ord(film1[numberofrow].country[i+1]) in [97..122]) then
                                                                                                                  inc(n);
         if n>0 then
                begin
                  CountryNameValidator := False;
                  Writeln('ERROR. each country word should begin from capital letter');
                end
         else
         begin
            // tikriname  ar salies zodyje yra tarpas arba defisas
            n := 0;
            for i:=2 to Length(film1[numberofrow].country) - 1 do
                if (ord(film1[numberofrow].country[i-1]) in [65..90, 97..122]) and (ord(film1[numberofrow].country[i]) in [32, 45]) and (ord(film1[numberofrow].country[i+1]) in [97..122])then
                                                                                                                                                                                            inc(n);
            if n>0 then
                   begin
                     CountryNameValidator := False;
                     Writeln('ERROR. There shouldn`t be SPACE and „-“ in each country word ');
                   end
            else
            CountryNameValidator := True;
         end;
       end;
     end;
   end;
end;
//------------------------------------------------------------------------------
Function ProducerValidator (var film1: array [1..maxsize] of Film; var numberofrow : integer): boolean;
var i, n: integer;
begin
   //  tikriname  rezisieriaus  ilgi
   // Problema: jei zodzio ilgis didesnis uz 20 - stringo ilgio, tai nereikalingos raides  perkeliamos i kita lauka
   if Length(film1[numberofrow].producer) > 19 then
      begin
        Writeln('ERROR. the producer name and surname is larger than 19 symbols including space');
        ProducerValidator := False;
      end
   else
   // tikriname  ar yra raidziu ir kitu simboliu be  Tarpo)
   begin
     n := 0;
     for i:=1 to Length(film1[numberofrow].producer) do
         if film1[numberofrow].producer[i] <> ' ' then
                                                  inc(n);
     if n=0 then
            begin
              ProducerValidator := False;
              Writeln('ERROR. the producer has not been entered');
            end
     else
     begin
     // tikriname  rezisieriaus  duomenu tipa (ar nera raidziu ir kitu simboliu (be Defiso arba Tarpo))
       n := 0;
       for i:=1 to Length(film1[numberofrow].producer) do
           if not (ord(film1[numberofrow].producer[i]) in  [65..90,97..122, 32, 45])then
                                                                                   inc(n);
       if n>0 then
              begin
                 ProducerValidator := False;
                 Writeln('ERROR. the producer name and surname contains only letters, SPACE, „-“');
              end
       else
       // tikriname  ar rezisierius  yra parasytas is didziosios raides pradzioje
       if not (ord(film1[numberofrow].producer[1]) in [65..90]) then
                                                               begin
                                                                 ProducerValidator := False;
                                                                 Writeln('ERROR. the producer name and surname must begin from capital letter');
                                                               end
       else
       // tikriname  ar rezisierius yra parasytas is didziosios raides po tarpo (jei - 2 zodziai)
       begin
         n := 0;
         for i:=1 to Length(film1[numberofrow].producer) - 1 do
             if (ord(film1[numberofrow].producer[i]) = 32) and (ord(film1[numberofrow].producer[i+1]) in [97..122]) then
                                                                                                                    inc(n);
         if n>0 then
                begin
                  ProducerValidator := False;
                  Writeln('ERROR. producer name and surname should begin from capital letter');
                end
         else
         begin
            // tikriname  ar rezisieriaus zodyje yra tarpas arba defisas
            n := 0;
            for i:=2 to Length(film1[numberofrow].producer) - 1 do
                if (ord(film1[numberofrow].producer[i-1]) in [65..90, 97..122]) and (ord(film1[numberofrow].producer[i]) in [32, 45]) and (ord(film1[numberofrow].producer[i+1]) in [97..122])then
                                                                                                                                                                                              inc(n);
            if n>0 then
                   begin
                     ProducerValidator := False;
                     Writeln('ERROR. There shouldn`t be SPACE and „-“ in producer name and surname ');
                   end
            else
            ProducerValidator := True;
         end;
       end;
     end;
   end;
end;
//------------------------------------------------------------------------------
Function DurationValidator (var film1: array [1..maxsize] of Film; numberofrow : integer): boolean;
var i, n, number, code: integer;
begin
   n := 0;
   // 1) tikriname  duration  ilgi
   if Length(film1[numberofrow].duration)>4 then
      begin
        Writeln('ERROR. the duration name is larger than 4 symbols');
        DurationValidator := False;
      end
   else
   //2) tikriname  ar yra raidziu ir kitu simboliu be  Tarpo)
   begin
     for i:=1 to Length(film1[numberofrow].duration) do
         if film1[numberofrow].duration[i] <> ' ' then
                                                  inc(n);
     if n=0 then
            begin
              DurationValidator := False;
              Writeln('ERROR. the duration has not been entered');
            end
     else
     begin
         //3) tikriname  ar yra raidziu ir kitu simboliu be  skaiciu
         Val(film1[numberofrow].duration, number, code);
         if code > 0 then
                     begin
                       Writeln('DATE ERROR. The duration contains only digits and should be written in minutes');
                       DurationValidator := False;
                     end
         else
         DurationValidator := True;
     end;
   end;
end;
//------------------------------------------------------------------------------
Function GenreValidator (var film1: array [1..maxsize] of Film; var numberofrow : integer): boolean;
var i, n: integer;
begin
   //  tikriname  zanro  ilgi
   if Length(film1[numberofrow].genre) > 14 then
      begin
        Writeln('ERROR. the genre is larger than 14 symbols including space');
        GenreValidator := False;
      end
   else
   // tikriname  ar yra raidziu ir kitu simboliu be  Tarpo)
   begin
     n := 0;
     for i:=1 to Length(film1[numberofrow].genre) do
         if film1[numberofrow].genre[i] <> ' ' then
                                               inc(n);
     if n=0 then
            begin
              GenreValidator := False;
              Writeln('ERROR. the genre has not been entered');
            end
     else
     begin
     // tikriname  zanro  duomenu tipa (ar nera raidziu ir kitu simboliu (be Defiso arba Tarpo))
       n := 0;
       for i:=1 to Length(film1[numberofrow].genre) do
           if not (ord(film1[numberofrow].genre[i]) in [65..90,97..122, 32, 45] )then
                                                                                 inc(n);
       if n>0 then
              begin
                 GenreValidator := False;
                 Writeln('ERROR. the genre contains only letters, SPACE, „-“');
              end
       else
       GenreValidator := True;
     end;
   end;
end;
//------------------------------------------------------------------------------
Function YearValidator (var film1: array [1..maxsize] of Film; numberofrow : integer): boolean;
var i, n, YearNum, code: integer;
begin
   n := 0;
   // 1) tikriname  meto  ilgi
   if Length(film1[numberofrow].year)>4 then
      begin
        Writeln('ERROR. the year is larger than 4 symbols');
        YearValidator := False;
      end
   else
   //2) tikriname  ar yra raidziu ir kitu simboliu be  Tarpo)
   begin
     for i:=1 to Length(film1[numberofrow].year) do
         if film1[numberofrow].year[i] <> ' ' then
                                              inc(n);
     if n=0 then
            begin
              YearValidator := False;
              Writeln('ERROR. the year has not been entered');
            end
     else
     begin
         //3) tikriname  ar yra raidziu ir kitu simboliu be  skaiciu
         Val(film1[numberofrow].year, YearNum, code);
         if not ((YearNum>=1900)and(YearNum<=2010)and(code=0)) then
            begin
              Writeln('ERROR. The year contains only digits and not less than 1900 not more 2010');
              YearValidator := False;
            end
         else
         YearValidator := True;
     end;
   end;
end;
//------------------------------------------------------------------------------
Procedure RecordValidator (film1: array [1..maxsize] of Film; rowsnum: integer);
var valid: boolean;
begin
   valid := True;
   repeat
     valid := NameValidator(film1, rowsnum);
     if valid = True then
        begin
          valid := CountryNameValidator(film1, rowsnum);
          if valid = True then
                          begin
                            valid := ProducerValidator(film1, rowsnum);
                                  if valid = True then
                                     begin
                                       valid := DurationValidator(film1, rowsnum);
                                       if valid = True then
                                          begin
                                            valid := GenreValidator(film1, rowsnum);
                                            if valid = True then
                                               begin
                                                 valid := YearValidator(film1, rowsnum);
                                               end;
                                          end;
                                     end;
                           end;
           if valid = False then
                                 begin
                                   Writeln('Try again');
                                   NewRecord(film1, rowsnum);
                                 end;
        end;
        
   until valid;
end;
//------------------------------------------------------------------------------
Procedure CellValidator (film1: array [1..maxsize] of Film; numberofcolumn1, numberofrow1 : integer);
var valid: boolean;
begin
   valid := True;
   repeat
     case numberofcolumn1 of
       2: valid := NameValidator(film1, numberofrow1);
       3: valid := CountryNameValidator(film1, numberofrow1);
       4: valid := ProducerValidator(film1, numberofrow1);
       5: valid := DurationValidator(film1, numberofrow1);
       6: valid := GenreValidator(film1, numberofrow1);
       7: valid := YearValidator(film1, numberofrow1);
     end;
     if valid = False then
                      begin
                        Writeln('Try again');
                        ModifyingRecord(film1, numberofcolumn1, numberofrow1);
                      end;
   until valid;
end;
//------------------------------------------------------------------------------
Procedure DrawingTable (rowsnum: integer; film1: array [1..maxsize] of Film);
var i: integer;
begin
  Write('N');
  Write('Name':5);
  Write('Country':23);
  Write('Producer':11);
  Write('Time':16);
  Write('Genre':6);
  Write('Year':14);
  Writeln;
for i:=1 to rowsnum do
                       begin
                         film1[i].number := i;
                         Write(film1[i].number);
                         Write(' ');
                         Write(film1[i].name);
                         Write(film1[i].country);
                         Write(film1[i].producer);
                         Write(film1[i].duration);
                         Write(film1[i].genre);
                         Write(film1[i].year);
                         Writeln;
                       end;
end;
//------------------------------------------------------------------------------
/////////////////////////////////////////////////////////////////////////////////
begin
   ProgramDescription;
   repeat
     OpeationOption (operation);
     if operation=1 then
                    begin
                        NewRecord (movie, rowsnumber);
                        if rowsnumber <= maxsize then
                           begin
                             RecordValidator(movie, rowsnumber);
                             NewRecordAlignment(rowsnumber, movie);
                           end
                        else
                        Writeln('Out of data range - ',maxsize,'rows')
                    end
     else
     if operation=2 then
                    RecordDeleting(movie, rowsnumber)
     else
     if operation=3 then
                    begin
                      ModifyingRecord(movie, numberofcolumn, numberofrow);
                      CellValidator(movie, numberofcolumn, numberofrow);
                      NewCellDataAlignment(movie, numberofcolumn, numberofrow);
                    end
     else
     if operation=4 then
                    Writeln('Work has been finished');
     if operation in [1,2,3] then
                             begin
                               Writeln('New data');
                               DrawingTable (rowsnumber, movie);
                             end;
   until operation=4;
   Readkey;
end.