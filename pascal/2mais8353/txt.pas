//***********************************************************
// Kurso "Informatika" (INFO2214) 2009/10 m.m. pavasario (2) sem.
// 2-as praktinis darbas. Variantas Nr. 219
// Darbà atliko: Maksim Isajev
//***********************************************************
unit txt;

interface
	function OpenFile(strFilename : string) : boolean;
	//Atidaro failà skaitymui
	//Perduodami parametrai: strFilename - nuskaitomo failo pavadinimas
	//Funkcija grazina:
	//True - jei failas atidarytas
	//False - jei failo nera arba jis yra saraðe, bet ne archyve

    function nextRecord: boolean;
	//Funkcija graþina:
	//True - jei sekantis paveikslas yra
	//False - jei sekanèio paveikslo nera

	function getTitle: string;
	//Funkcija graþina paveikslo pavadinima

	function getCaption: string;
	//Funkcija graþina paveikslo aprasyma

	function getURL_PHOTO: string;
	//Funkcija graþina paveikslo (URL_PHOTO) vardà

	function CloseFile: boolean;
	//Funkcija Uþdaro pries tai atidaryta faila


implementation
   	var
		charFile: file of char;

	//Vidinës funkcijos bei procedûros


	function MyReadLine: string; forward;
	//Ið simbolinio failo nuskaito simbolinæ eilutæ
	//Gràþina:
	//    Nuskaitytà eilutæ


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

	//Iðorinës funkcijos bei procedûros

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
             position: integer;  //kintamasis reikalingas áskaitant þodþio "TITLE_[position]||" ilgá
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
             position: integer;  //kintamasis reikalingas áskaitant þodþio "CAPTION_[position]||" ilgá
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
             position: integer;  //kintamasis reikalingas áskaitant þodþio "URL_PHOTO_[position]||" ilgá
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
