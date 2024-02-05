CREATE TABLE "DBA"."Справочник_Единиц_измерения" (
	"MV kodas" INTEGER NOT NULL,
	"MV pavadinimas" CHAR(11),	
	PRIMARY KEY( "MV kodas" )
);

INSERT INTO "DBA"."Справочник_Единиц_измерения" ("MV kodas","MV pavadinimas")
VALUES(
	1,'kilogram'
);

INSERT INTO "DBA"."Справочник_Единиц_измерения"("MV kodas","MV pavadinimas")
VALUES(
	2,'litre'
)
INSERT INTO "DBA"."Справочник_Единиц_измерения" ("MV kodas","MV pavadinimas")
VALUES(
	3,'cube meter'
);

INSERT INTO "DBA"."Справочник_Единиц_измерения" ("MV kodas","MV pavadinimas")
VALUES(
	4,'centemetre'
);

INSERT INTO "DBA"."Справочник_Единиц_измерения"("MV kodas","MV pavadinimas")
VALUES(
	5,'tone'
)