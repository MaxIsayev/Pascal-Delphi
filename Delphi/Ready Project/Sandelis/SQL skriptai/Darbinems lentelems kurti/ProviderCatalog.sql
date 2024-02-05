CREATE TABLE "DBA"."Справочник_поставщиков" (
	"Tiekejo kodas" INTEGER NOT NULL,
	"Tiekejo vardas" CHAR(11),	
	PRIMARY KEY( "Tiekejo kodas" )
);

INSERT INTO "DBA"."Справочник_поставщиков" ("Tiekejo kodas","Tiekejo vardas")
VALUES(
	1,'Mazeikiai'
);

INSERT INTO "DBA"."Справочник_поставщиков"("Tiekejo kodas","Tiekejo vardas")
VALUES(
	2,'Panevezys'
)
INSERT INTO "DBA"."Справочник_поставщиков" ("Tiekejo kodas","Tiekejo vardas")
VALUES(
	3,'Utena'
);

INSERT INTO "DBA"."Справочник_поставщиков" ("Tiekejo kodas","Tiekejo vardas")
VALUES(
	4,'Vilnius'
);

INSERT INTO "DBA"."Справочник_поставщиков"("Tiekejo kodas","Tiekejo vardas")
VALUES(
	5,'Varena'
)