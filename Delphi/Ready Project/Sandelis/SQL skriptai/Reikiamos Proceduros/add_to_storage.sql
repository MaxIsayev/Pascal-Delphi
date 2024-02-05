ALTER PROCEDURE "DBA"."add_to_storage"(Prekes_kodas integer,
Tiekejo_kodas integer,
MV_kodas integer,
Pakavimo_kodas integer,
MV_pakavime double,
Pakavimu_kiekis integer,
MV_kaina double)
begin

INSERT INTO "Склад" ("Prekes kodas",
"Tiekejo kodas",
"MV kodas",
"Pakavimo kodas",
"MV pakavime",
"Pakavimu kiekis",
"MV kaina")
		VALUES (Prekes_kodas,
Tiekejo_kodas ,
MV_kodas ,
Pakavimo_kodas ,
MV_pakavime ,
Pakavimu_kiekis ,
MV_kaina)

end