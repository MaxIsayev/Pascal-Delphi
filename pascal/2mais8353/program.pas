//***********************************************************
// Kurso "Informatika" (INFO2214) 2009/10 m.m. pavasario (2) sem.
// 2-as praktinis darbas. Variantas Nr. 219
// Darbà atliko: Maksim Isajev
//***********************************************************

program Noname1;

uses txt;

begin
    if not OpenFile('photos.txt') then
	begin
		WriteLn(stderr, 'Failed to open file "photos.txt"!');
		Exit;
	end;
    while nextRecord do
	begin
	    	WriteLn('Title: ', getTitle);
        	WriteLn('Caption: ', getCaption);
		WriteLn('Url photo: ', getURL_PHOTO);
		WriteLn;
	end;
    CloseFile;
end.
