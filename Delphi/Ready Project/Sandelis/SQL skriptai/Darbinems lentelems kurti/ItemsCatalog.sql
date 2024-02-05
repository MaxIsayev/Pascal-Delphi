CREATE TABLE "DBA"."Справочник_товаров" (
	"Prekes kodas" INTEGER NOT NULL,
	"Prekes pavadinimas" CHAR(11),	
	PRIMARY KEY( "Prekes kodas" )
);

INSERT INTO "DBA"."Справочник_товаров" ("Prekes kodas","Prekes pavadinimas")
VALUES(
	1,'Sugar'
);

INSERT INTO "DBA"."Справочник_товаров"("Prekes kodas","Prekes pavadinimas")
VALUES(
	2,'Milk'
)
INSERT INTO "DBA"."Справочник_товаров" ("Prekes kodas","Prekes pavadinimas")
VALUES(
	3,'Meat'
);

INSERT INTO "DBA"."Справочник_товаров" ("Prekes kodas","Prekes pavadinimas")
VALUES(
	4,'Potatoe'
);

INSERT INTO "DBA"."Справочник_товаров" ("Prekes kodas","Prekes pavadinimas")
VALUES(
	5,'plank'
);
