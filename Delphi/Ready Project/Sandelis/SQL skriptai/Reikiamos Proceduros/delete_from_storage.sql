ALTER PROCEDURE "DBA"."delete_from_storage"(Prekes_kodas integer,
Tiekejo_kodas integer,
MV_kodas integer,
Pakavimo_kodas integer,
MV_pakavime double,
Pakavimu_kiekis integer,
MV_kaina double
)
/* RESULT( column_name column_type, ... ) */
BEGIN
	/* Type the procedure statements here */
    DELETE FROM "DBA"."Склад" 
    WHERE "Prekes kodas" = Prekes_kodas 
        AND "Tiekejo kodas" = Tiekejo_kodas 
        AND "MV kodas" = MV_kodas 
        AND "Pakavimo kodas" = Pakavimo_kodas 
        /*AND "MV pakavime" = MV_pakavime 
        AND "Pakavimu kiekis" = Pakavimu_kiekis 
        AND "MV kaina" = MV_kaina 
        */
END