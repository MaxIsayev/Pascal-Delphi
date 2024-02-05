//***********************************************************
// Kurso "Informatika" (INFO2214) 2009/10 m.m. pavasario (2) sem.
// 3-as praktinis darbas. Variantas Nr. 319
// Darb� atliko: Maksim Isajev
//***********************************************************

unit txtUnit;

interface

	type
		txtPtr = ^txt;
		txt = object
			private

				charFile : file of char;

				function MyReadLine: string;
				//I� simbolinio failo nuskaito simbolin� eilut�
				//Gr��ina:
				//    Nuskaityt� eilut�

			public
				constructor fConstructor;
				//Pasiruo�ia darbo prad�iai

				constructor fConstructor(strFilename : string);
				//Pasiruo�ia darbo prad�iai bei atidaro fail� skaitymui
				//Parametrai:
				//    strFailas -  failo pavadinimas

				destructor fDestructor;
				//Gr��ina � pradin� b�sena bei u�daro fail�, jei jis buvo atidarytas

				function OpenFile(strFilename : string) : boolean;
				//Atidaro fail� skaitymui
				//Perduodami parametrai: strFilename - nuskaitomo failo pavadinimas
				//Funkcija grazina:
				//True - jei failas atidarytas
				//False - jei failo nera arba jis yra sara�e, bet ne archyve

			    function nextRecord: boolean;
				//Funkcija grazina:
				//True - jei sekantis paveikslas yra
				//False - jei sekan�io paveikslo nera

				function getTitle: string;
				//Funkcija grazina paveikslo pavadinima

				function getCaption: string;
				//Funkcija grazina paveikslo aprasyma

				function getURL_PHOTO: string;
				//Funkcija grazina paveikslo (URL_PHOTO) vard�

				function CloseFile: boolean;
				//Funkcija Uzdaro pries tai atidaryta faila
		end;

implementation

	//Privat�s


	function txt.MyReadLine: string;
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

	//Vie�i

	constructor txt.fConstructor;
	begin
		{$IFDEF DEBUG}
			WriteLn('txt::fConstructor');
		{$ENDIF}
	end;

	constructor txt.fConstructor(strFilename : string);
	begin
		{$IFDEF DEBUG}
			WriteLn('txt::fConstructor(', strFilename, ')');
		{$ENDIF}

		//OpenFile(strFilename);
	end;

	destructor txt.fDestructor;
	begin
		{$IFDEF DEBUG}
			WriteLn('txt::fDestructor');
		{$ENDIF}

		CloseFile;
	end;

    function txt.OpenFile(strFilename: string) : boolean;
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


    	function txt.nextRecord: boolean;
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


	function txt.getTitle: string;
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


	function txt.getCaption: string;
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



	function txt.getURL_PHOTO: string;
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


	function txt.CloseFile: boolean;
	begin
		Close(charFile);
		CloseFile := True;
	end;
end.


