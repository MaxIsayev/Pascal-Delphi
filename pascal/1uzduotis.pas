Program WordReverseOrder;
var  stringEntered, stringReversed : string;
	   i:integer;
//---------------------------------------------
//Sita funkcija skaicioja ivesto teksto ilgi
//Naudojama vietoj Pascal integruotos tikslines funkcijos length
Function stringLength(strEntered: string): integer;
var i: integer;	
begin
	i := 0;	
	while (strEntered <> '' ) do begin
	      delete(strEntered,1,1);
	      i:=i+1;
	end;
	stringLength := i;
end; 	   	
//---------------------------------------------
begin
	Writeln('This program shows reverse order of entered text');
	Writeln('Enter text:');
	Readln(stringEntered);	
	stringReversed:='';	
	Writeln('Reversed text:');
	//tekstas atbuline tvarka
	for i := stringLength(stringEntered) downto 1 do
		stringReversed:=concat(stringReversed, stringEntered[i]);
	//rezultatas	
	Writeln(stringReversed);
end.
