Program InternetPageAnalyzer;
const maxsize = 1000;
type strings = array [1..maxsize] of string;
     article = record
       name: string;
       date: string [12];
       /// PROGRAMINIS TRIUKAS - kad visa izanga tilptu i sias 3 dalis
       introduction: string;
       introduction2: string;
       introduction3: string;

     end;
var  news: array [1..maxsize] of article;
     //  kintamieji sourcestr, sourcestr2, sourcestr3   reikalingi tais atvejais
     //  jei NOTEPADe texto eiluteje yra daugiau nei 255 simboliu (pascal ABC didziausias eilutes simbolio numeris - 255)
     sourcestr, sourcestr2, sourcestr3: strings;
     i,  linesnumber, recordsfound : integer;
/////////////////////////////////////////////////////////////////////////////////////////////////////
///---------------------------------------------------------------------------------------------
Procedure FileReading(var s, s2, s3: strings; var linesnum: integer);
var pagesourcefile: text;
begin
  assign(pagesourcefile, 'F:\structure1.txt');
  reset(pagesourcefile);
  linesnum := 0;
  repeat
    inc(linesnum);
    readln(pagesourcefile, s[linesnum], s2[linesnum], s3[linesnum]);
  until Eof(pagesourcefile);
  close(pagesourcefile);
end;
//-------------------------------------------------------------------------------------------------------------
//                                                    pascal ABC atvirieji masyvai neegzistuoja
Procedure NameAndDateCreating (s: strings; var news1: array [1..maxsize] of  article; var linesnum, recordsfound1: integer);
var pagesourcefile: text;
    i, charpos, articlenumber, code, stringlength, pageheadline, beginningpos1, beginningpos2: integer;
    wordexists: boolean;
begin
  recordsfound1 := 0;
  // 1) randame puslapio antraste - '<h2 id="pagehead">Naujienos</h2>'
  for i := 1 to linesnum do
      begin
        charpos := 1;
        while (not(Copy(s[i], charpos, 32) = '<h2 id="pagehead">Naujienos</h2>')) and (charpos <= 223) do
              begin
                inc(charpos);
                if Copy(s[i], charpos, 32) = '<h2 id="pagehead">Naujienos</h2>' then
                                                                                begin
                                                                                  wordexists := True;
                                                                                  pageheadline := i;
                                                                                end;

              end;
      end;
  if wordexists = True then
     // 2) ieskome naujienos komanda  - <a href="****/">
     for i:= pageheadline + 2 to linesnum do
         begin
           wordexists := False;
           charpos := 1;
           while (Copy(s[i], charpos, 9) <> '<a href="') and (charpos <= 246) do
                 begin
                   inc(charpos);
                       if (Copy(s[i], charpos, 9) = '<a href="') and (Copy(s[i], charpos+13,3) = '/">') and (Copy(s[i], charpos+16,11) <> 'Plačiau…') then
                          begin
                            wordexists := True;
                            // straipsnio pavadinimo pradzios indeksas
                            beginningpos1 := charpos+16;
                          end;
                 end;
           if wordexists = True then
              begin
                wordexists := False;
                charpos := 1;
                while (Copy(s[i], charpos, 19) <> '<span class="date">') and (charpos <= 236) do
                      begin
                        inc(charpos);
                        if Copy(s[i], charpos, 19) = '<span class="date">' then
                           begin
                              wordexists := True;
                              // straipsnio datos pradzios indeksas
                              beginningpos2 := charpos+19;
                           end;
                      end;
              end;
           if wordexists = True then
              begin
                inc(recordsfound1);
                // priskiriame straipsnio pavadinima
                stringlength := 0;
                while s[i][beginningpos1+stringlength] <> '<' do
                      inc(stringlength);
                news1[recordsfound1].name := Copy(s[i], beginningpos1, stringlength);
                // priskiriame straipsnio data
                stringlength := 0;
                while s[i][beginningpos2+stringlength] <> '<' do
                      inc(stringlength);
                news1[recordsfound1].date := Copy(s[i], beginningpos2, stringlength);
              end;

         end;
end;
//-----------------------------------------------------------------------------------------------------------
//                                                             pascal ABC atvireji masyvai neegzistuoja
Procedure IntroductionCreating (s, s2, s3: strings; var news1: array [1..maxsize] of  article; var linesnum, recordsfound1: integer);
var pagesourcefile: text;
    i, charpos, pageheadline: integer;
    wordexists: boolean;
begin
  recordsfound1 := 0;
   // 1) randame puslapio antraste - '<h2 id="pagehead">Naujienos</h2>'
  wordexists := False;
  for i := 1 to linesnum do
      begin
        charpos := 1;
        while (Copy(s[i], charpos, 32) <> '<h2 id="pagehead">Naujienos</h2>') and (charpos <= 223) do
              begin
                inc(charpos);
                if Copy(s[i], charpos, 32) = '<h2 id="pagehead">Naujienos</h2>' then
                                                                                begin
                                                                                  wordexists := True;
                                                                                  pageheadline := i;
                                                                                end;
              end;
      end;
  if wordexists = True then
     begin
       wordexists := False;
       for i:= pageheadline + 3 to pageheadline + 10 do
           begin
             charpos := 1;
             // 2) ieskome pirma pastraipa
             if Trim(s[i]) = '<p>'  then
                begin
                  inc(recordsfound1);
                  wordexists := True;
                  news1[recordsfound1].introduction := Trim(s[i+1]) + Trim(s[i+2]);
                end;
           end;
     end;
  if wordexists = True then
     for i:= pageheadline + 11 to linesnum do
         begin
           charpos := 1;
           // 2) ieskome eilutes komandu pabaiga  - 'width="150" />'
           while (Copy(s[i], charpos, 14) <> 'width="150" />') and (charpos <= 241) do
              begin
                inc(charpos);
                if Copy(s[i], charpos, 14) = 'width="150" />'  then
                   begin
                     inc(recordsfound1);
                     Delete(s[i], 1, charpos + 14);
                     news1[recordsfound1].introduction := Trim(s[i]);
                     news1[recordsfound1].introduction2 := Trim(s2[i]);
                     news1[recordsfound1].introduction3 := Trim(s3[i]);
                   end;
              end;
         end;
end;
//------------------------------------------------------------------------------
Procedure Typing (s2, s3: strings; news1: array [1..maxsize] of  article; recordsfound1: integer);
var i: integer;
    outputfile: text;
begin
  assign(outputfile, 'F:\Output data file.txt');
  Rewrite(outputfile);
  for i := 1 to recordsfound1 do
        begin
          Writeln(outputfile, i);
          Writeln(outputfile, news1[i].name);
          Writeln(outputfile, news1[i].date);
          Write(outputfile, news1[i].introduction);
          Write(outputfile, ' ');
          Write(outputfile, news1[i].introduction2);
          Write(outputfile, ' ');
          Write(outputfile, news1[i].introduction3);
          Writeln(outputfile, ' ');
        end;
  close(outputfile);
end;
//------------------------------------------------------------------------------------------------------------------------------
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
begin
  //pirmiausia skaitome pradines eilutes
  FileReading(sourcestr, sourcestr2, sourcestr3, linesnumber);
  // nukerpame pradiniu eiluciu duomenis reikalungus irasams kurti ir kuriame irasus
  NameAndDateCreating(sourcestr, news, linesnumber, recordsfound);
  IntroductionCreating(sourcestr, sourcestr2, sourcestr3, news, linesnumber, recordsfound);
  Typing(sourcestr2, sourcestr3, news, recordsfound);
end.
