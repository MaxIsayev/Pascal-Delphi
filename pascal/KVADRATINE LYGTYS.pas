Program McCHRYAK;
var a, b, c, D: integer;
     x1, x2: real;
begin
Writeln;
Writeln('ivesti kvadratines lygties koeficientus');
Readln(a, b, c);
/// lygtis x^2=0
if (b=0)and(c=0) then
                 Writeln('kvadratine lygtis turi viena sprendima - ', 0)
else
//tiesine lygtis  bx+c=0
if a=0 then
begin
       x1:=(-c)/b;
       Writeln('kvadratine lygtis turi viena sprendima - ', x1);
end
else
//kvadr 2naris    ax^2 + c=0
if b=0 then
begin
     if ((-c)/a)>0 then
            begin
            x1:=sqrt((-c)/a);
            Writeln('kvadratine lygtis turi 2 sprendimus - ', x1, ' ir ','-',x1);
            end
     else
            Writeln('sprendiniu nera')
end
else
//// c=0   ax^2+bx=0
if c=0 then
begin
       x1:=0;
       x2:=(-b)/a;
       Writeln('kvadratine lygtis turi 2 sprendimus - ', x1, ' ir ',x2);
end
else
////kvadratinis trinaris  ax^2+bx+c=0 - sprendimas
begin
    D:=sqr(b)-4*a*c;
    if D>=0 then
    begin
            x1:=((-b)+Sqrt(D))/(2*a);
            x2:=((-b)-Sqrt(D))/(2*a);
               if x1=x2 then
                        Writeln('kvadratine lygtis turi viena sprendima - ', x1)
               else
                        Writeln('kvadratine lygtis turi 2 sprendimus - ', x1, ' ir ',x2 );
    end
    else
    Writeln('sprendiniu nera');
end;
end.