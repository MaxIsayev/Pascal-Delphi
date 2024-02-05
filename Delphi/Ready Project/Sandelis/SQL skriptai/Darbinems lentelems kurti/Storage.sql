CREATE TABLE "DBA"."Склад" (
	"Prekes kodas" INTEGER NOT NULL,
	"Tiekejo kodas" INTEGER NOT NULL,
	"MV kodas" INTEGER NOT NULL,
	"Pakavimo kodas" INTEGER,
	"MV pakavime" DOUBLE,
	"Pakavimu kiekis" INTEGER NOT NULL,
	"MV kaina" DOUBLE NOT NULL
);

INSERT INTO "DBA"."Склад" ("Prekes kodas"
,"Tiekejo kodas"
,"MV kodas"
,"Pakavimo kodas"
,"MV pakavime"
,"Pakavimu kiekis"
,"MV kaina")
VALUES(
3,2,2,3,6.0,888,6.0
);

INSERT INTO "DBA"."Склад"("Prekes kodas"
,"Tiekejo kodas"
,"MV kodas"
,"Pakavimo kodas"
,"MV pakavime"
,"Pakavimu kiekis"
,"MV kaina")
VALUES(
4,1,4,1,1.0,99,1.0
)
