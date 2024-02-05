//***********************************************************
// Kurso "Informatika" (INFO2214) 2009/10 m.m. pavasario (2) sem.
// 2-as praktinis darbas. Variantas Nr. 219
// Darb� atliko: Maksim Isajev
//***********************************************************
unit txt;

interface
	function OpenFile(strFilename : string) : boolean;
	//Atidaro fail� skaitymui
	//Perduodami parametrai: strFilename - nuskaitomo failo pavadinimas
	//Funkcija grazina:
	//True - jei failas atidarytas
	//False - jei failo nera arba jis yra sara�e, bet ne archyve

    function nextRecord: boolean;
	//Funkcija gra�ina:
	//True - jei sekantis paveikslas yra
	//False - jei sekan�io paveikslo nera

	function getTitle: string;
	//Funkcija gra�ina paveikslo pavadinima

	function getCaption: string;
	//Funkcija gra�ina paveikslo aprasyma

	function getURL_PHOTO: string;
	//Funkcija gra�ina paveikslo (URL_PHOTO) vard�

	function CloseFile: boolean;
	//Funkcija U�daro pries tai atidaryta faila


implementation
   	var
		charFile: file of char;

	//Vidin�s funkcijos bei proced�ros


	function MyReadLine: string; forward;
	//I� simbolinio failo nuskaito simbolin� eilut�
	//Gr��ina:
	//    Nuskaityt� eilut�


	function MyReadLine: string;
		 var xChar: char;
		     Result: string;
		     i: integer;

	begin
          Result := '';
          repeat
          	if not Eof(charFile) then
          		begin
          			Read(charFile, xChar);
          			if (xChar <> #10) and (xChar <> #13) then
          				begin
          				     Result := Result + xChar;
          				end;
                    inc(i);
          		end;
          until (xChar = #10) or (Eof(charFile));
          MyReadLine := Result;
	end;

	//I�orin�s funkcijos bei proced�ros

	function OpenFile(strFilename: string) : boolean;
	begin
		Assign(charFile, strFilename);
		{$I-}
			Reset(charFile);
		{$I+}

		OpenFile := true;
		if (IOResult <> 0) then
		begin
			OpenFile := false;
		end;
	end;


    function nextRecord: boolean;
   	     var xStr: string;
             Result: boolean;
	begin;
	   Result := false;
	   repeat
            if not Eof(charFile) then
          	   begin
          	     xStr := MyReadLine;
          		 Result := 'ID_' = Copy(xStr, 1, 3);
          	   end;
       until Result or (Eof(charFile));
       nextRecord := Result;
	end;


	function getTitle: string;
         var xStr: string;
             Result: boolean;
             position: integer;  //kintamasis reikalingas �skaitant �od�io "TITLE_[position]||" ilg�
	begin
		getTitle := '';
		Result := false;
		position := 1;
		repeat
          		if not Eof(charFile) then
          			begin
          				xStr := MyReadLine;
          				Result := 'TITLE_' = Copy(xStr, 1, 6);
          				if Result then
          					begin
                                while not (Copy(xStr, position, 2) = '||') do
                                        inc(position);
                                getTitle := Copy(xStr, position+2, Length(xStr)-position+1);
          					end;
          			end;
          	until Result or (Eof(charFile));
	end;


	function getCaption: string;
         var xStr: string;
             Result: boolean;
             position: integer;  //kintamasis reikalingas �skaitant �od�io "CAPTION_[position]||" ilg�
	begin
        getCaption := '';
		Result := false;
		position := 1;
		repeat
          		if not Eof(charFile) then
          			begin
          				xStr := MyReadLine;
          				Result := 'CAPTION_' = Copy(xStr, 1, 8);
          				if Result then
          					begin
                                while not (Copy(xStr, position, 2) = '||') do
                                        inc(position);
                                getCaption := Copy(xStr, position+2, Length(xStr)-position+1);
          					end;
          			end;
 	      until Result or (Eof(charFile));
	end;



	function getURL_PHOTO: string;
	     var xStr: string;
             Result: boolean;
             position: integer;  //kintamasis reikalingas �skaitant �od�io "URL_PHOTO_[position]||" ilg�
	begin
		getURL_PHOTO := '';
		Result := false;
		position := 1;
		repeat
          		if not Eof(charFile) then
          			begin
          				xStr := MyReadLine;
          				Result := 'URL_PHOTO_' = Copy(xStr, 1, 10);
          				if Result then
          					begin
                                while not (Copy(xStr, position, 2) = '||') do
                                        inc(position);
                                getURL_PHOTO := Copy(xStr, position+2, Length(xStr)-position+1);
          					end;
          			end;
 	      until Result or (Eof(charFile));
	end;


	function CloseFile: boolean;
	begin
		Close(charFile);
		CloseFile := True;
	end;
end.
