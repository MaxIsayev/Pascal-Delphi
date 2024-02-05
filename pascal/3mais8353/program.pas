//***********************************************************
// Kurso "Informatika" (INFO2214) 2009/10 m.m. pavasario (2) sem.
// 3-as praktinis darbas. Variantas Nr. 319
// Darbà atliko: Maksim Isajev
//***********************************************************

program mainProgram;

uses txtUnit;

var
	PtrOfTxt: txtPtr;
begin
	New(PtrOfTxt, fConstructor('photos.txt'));

	if not PtrOfTxt^.OpenFile('photos.txt') then
	begin
		WriteLn(stderr, 'Failed to open file "photos.txt"!');
		Dispose(PtrOfTxt, fDestructor);
		Exit;
	end;

	while (PtrOfTxt^.nextRecord) do
	begin
	    WriteLn('Title: ', PtrOfTxt^.getTitle);
        WriteLn('Caption: ', PtrOfTxt^.getCaption);
		WriteLn('Url photo: ', PtrOfTxt^.getURL_PHOTO);
		WriteLn;
	end;

	Dispose(PtrOfTxt, fDestructor);
end.
