Program MinMaxInRandomArray;
const maxsize = 100;
var  a: array [1..maxsize] of integer;
     i:integer;
//---------------------------------------------
//Procedura generuoja masyvui pradines reiksmes
Procedure GenerateValues (var a: array of integer);
var i: integer;
begin

    Randomize;
    //proceduroje dinaminiai masyvai indeksuojami nuo 0 iki 99
    for i:=0 to maxsize-1 do
        a[i]:= 1 + Random(100);
end;
//---------------------------------------------
//Procedura rusiuojanti masyva tam kad nustatyti min ir max reiksmes
Procedure ArrayBubbleSort (var a: array of integer);
var i, j, tmp: integer;
begin
    for i := maxsize - 1 DownTo 0 do
        for j := maxsize - 2 DownTo 0 do
            if (a[j] > a[j+1]) then
                BEGIN
                    tmp := a[j];
                    // keiciam elementu vietas
                    a[j] := a[j+1];
                    a[j+1] := tmp;
                END;
        // end for
    // end for
end;
//---------------------------------------------
begin
	Writeln('This program finds minimum and maximum numbers in random array');
	Writeln('Array generated by program:');
	GenerateValues(a);
	//spausdinam generuota masyva
        //statiniai masyvai indexuojami nuo 1 iki 100
        Writeln('N Values');
	for i := 1 to maxsize do
	    Writeln(i,' ',a[i]);
	//Rusiuojam masyva burbulo metodu
	ArrayBubbleSort(a);
	//rezultatui isvedam pirma ir paskutini masyvo elementa
	//kad nenaudoti min() max() integruotu funkciju  	
	Writeln('Result:');
	Writeln('Minimum value - ',a[1]);
	Writeln('Maximum value - ',a[maxsize]);
end.
