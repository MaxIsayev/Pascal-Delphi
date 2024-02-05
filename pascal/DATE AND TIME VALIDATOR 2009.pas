Program DateAndTimeValidator;
var a, YearStr,  MonthStr, DayStr, HourStr, MinuteStr: string[50];
    YearNum, MonthNum, DayNum, HourNum, MinuteNum: integer;
    i, c, code: integer;
    b: boolean;
Begin
Writeln('Enter date and time');
Writeln('The format should be as, for example(in quotes):„2008-08-08 18:48“');
Writeln('There should be only 16 characters including SPACE');
Writeln('The year contains only 4 digits and not less 1000 not more 3000');
b:=True;{- klaidos kodas}
Repeat
      Writeln;
      Writeln('Enter date and time');
      Readln(a);
     // 1) tikriname  eilutes  ilgi
      if Length(a)<>16
      then begin
             Writeln('ERROR. the date doesnt contain 16 symbols');
             Writeln('Try again');
             b:=False;
           end
      else begin
             b:=True;
             //2) toliau tikriname  eilutes simbolius ciklu for
             c:=0;{ kad butu pastebetas bent vienas netaisyklingai ivestas simbolis}
             // tikriname  eilutes  duomenu tipa (ar nera raidziu ir kitu simboliu (be Defiso, DVITASKIO arba Tarpo))
             for i:=1 to Length(a) do
                if ((Ord(a[i])<48)or (Ord(a[i])>58))and(Ord(a[i])<>32)and(Ord(a[i])<>45)
                then inc(c);
                
             if c>0 then
                    b:=False;
             if b=False
             then begin
                    Writeln('ERROR. the date contains only integers, SPACE, „-“, „:“');
                    Writeln('Try again');
                  end
             else begin
                    //3) tikriname FORMATA :ar yra taskas ir dvitaskis ir tarpai REIKALINGOJE PADETYJE
                    if (Copy(a,5,1)<>'-')or(Copy(a,8,1)<>'-')or(Copy(a,11,1)<>' ')or(Copy(a,14,1)<>':')
                    then begin
                           b := False;
                           Writeln('FORMAT ERROR. The format should be like this „2008-08-08 18:48“');
                           Writeln('Try again');
                         end
                    else begin
                           //4) tikriname ar teisingas ivestas metas 1000<=metai<=3000
                           YearStr := Copy(a,1,4);
                           Val(YearStr,YearNum,code);
                           if not ((YearNum>=1000)and(YearNum<=3000)and(code=0))
                           then begin
                                  b := False;
                                  Writeln('DATE ERROR. The year contains only 4 digits and not less than 1000 not more 3000');
                                  Writeln('Try again');
                                end
                           else begin
                                 //5) tikriname ar teisingas ivestas menuo    CODE - tikrina ar nera nereikalingo tarpo ir kitu zenklu
                                  MonthStr := Copy(a,6,2);
                                  Val(MonthStr,MonthNum,code);
                                  if ((MonthNum<1) or (MonthNum>12))or (code<>0)
                                  then begin
                                         b := False;
                                         Writeln('DATE ERROR. The month is an integer between 01 and 12');
                                         Writeln('Try again');
                                       end
                                  else begin
                                         //6) tikriname ar teisinga ivesta diena PRIKLAUSOMAI nuo menesio ir metu
                                         DayStr := Copy(a,9,2);
                                         Val(DayStr,DayNum,code);
                                         if (DayNum>31)or(DayNum<1)or (code<>0) {pvz. diena = 40}
                                         then begin
                                                b:=False;
                                                Writeln('ERROR. The day is an integer between 01 and 31');
                                                Writeln('Try again');
                                              end
                                         else if ((MonthNum in [4, 6, 9, 11])and(DayNum>30))or (code<>0){pvz. Diena = 31      Men = 04, 06, 09, 11}
                                              then begin
                                                     b:=False;
                                                     Writeln('ERROR. The day of ',a[6],a[7],' month is an integer between 01 and 30');
                                                     Writeln('Try again');
                                                   end
                                                     /// 6.1) vasario dienu tikrinimas PRIKLAUSOMAI  nuo  metu
                                              else   if ((YearNum mod 4=0)and(MonthNum in [2])and(DayNum>29))or (code<>0) {pvz. Diena = 30, Menuo =02  Metai=2008}
                                                     then begin
                                                            b:=False;
                                                            Writeln('ERROR. The day of 02 month ' ,YearNum, ' year is an integer between 01 and 29');
                                                            Writeln('Try again');
                                                          end
                                                     else   if ((YearNum mod 4<>0)and(MonthNum in [2])and(DayNum>28))or (code<>0)  {pvz. diena = 29, Menuo = 02    Metai=2005}
                                                            then begin
                                                                   b:=False;
                                                                   Writeln('ERROR. The day of 02 month ' ,YearNum, ' year is an integer between 01 and 28');
                                                                   Writeln('Try again');
                                                                 end
                                                            else begin
                                                                   //7) tikriname ar teisingas ivestas laikas
                                                                   HourStr := Copy(a,12,2);
                                                                   Val(HourStr,HourNum,code);
                                                                   if HourNum>23
                                                                   then begin
                                                                          b:=False;
                                                                          Writeln('Incorrect time. The hour mustn`t be larger than 23 ');
                                                                          Writeln('Try again');
                                                                        end
                                                                   else begin
                                                                          MinuteStr := Copy(a,15,2);
                                                                          Val(MinuteStr,MinuteNum,code);
                                                                          if MinuteNum>59
                                                                          then begin
                                                                                 b:=False;
                                                                                 Writeln('Incorrect Time. The minute number mustn`t be larger than 59');
                                                                                 Writeln('Try again');
                                                                               end
                                                                                 //7.1) tikriname  laiko formata  (ar nera nereikalingo tarpo ir kitu zenklu)
                                                                          else   if (Ord(a[12])in [32, 45, 58])or(Ord(a[13])in [32, 45, 58])or(Ord(a[15])in [32, 45, 58])or(Ord(a[16])in [32, 45, 58])
                                                                                 then begin
                                                                                        b:=False;
                                                                                        Writeln('Incorrect time format. It should be written 08:11 or 23:14');
                                                                                        Writeln('Try again');
                                                                                      end;
                                                                         end;
                                                             end;
                                       end;
                                end;


                         end;
               end;
      end;

until b;

if b=True then
          Writeln ('Date and time have been entered successfully');
Writeln;
End.

