CREATE TABLE "DBA"."Справочник_тар" (
	"Pakavimo kodas" INTEGER NOT NULL,
	"Pakavimo pavadinimas" CHAR(11),	
	PRIMARY KEY( "Pakavimo kodas" )
);

INSERT INTO "DBA"."Справочник_тар" ("Pakavimo kodas","Pakavimo pavadinimas")
VALUES(
	1,'Pack'
);

INSERT INTO "DBA"."Справочник_тар"("Pakavimo kodas","Pakavimo pavadinimas")
VALUES(
	2,'bag'
)
INSERT INTO "DBA"."Справочник_тар" ("Pakavimo kodas","Pakavimo pavadinimas")
VALUES(
	3,'bottle'
);

INSERT INTO "DBA"."Справочник_тар" ("Pakavimo kodas","Pakavimo pavadinimas")
VALUES(
	4,'tray'
);

