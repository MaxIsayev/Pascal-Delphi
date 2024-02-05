ALTER PROCEDURE "DBA"."create_filter"(Prekes_kodas integer,
Tiekejo_kodas integer,
MV_kodas integer,
Pakavimo_kodas integer)
/* RESULT( column_name column_type, ... ) */
BEGIN
	/* Type the procedure statements here */

    UPDATE "DBA".Our_Filter SET Our_Filter."Prekes kodas" = Prekes_kodas;
    UPDATE "DBA".Our_Filter SET Our_Filter."Tiekejo kodas" = Tiekejo_kodas;
    UPDATE "DBA".Our_Filter SET Our_Filter."MV kodas" = MV_kodas;
    UPDATE "DBA".Our_Filter SET Our_Filter."Pakavimo kodas" = Pakavimo_kodas;

	UPDATE "DBA".Our_Filter SET Our_Filter."Prekes kodas" = NULL WHERE Our_Filter."Prekes kodas" = -1;
    UPDATE "DBA".Our_Filter SET Our_Filter."Tiekejo kodas" = NULL WHERE Our_Filter."Tiekejo kodas" = -1;
    UPDATE "DBA".Our_Filter SET Our_Filter."MV kodas" = NULL WHERE Our_Filter."MV kodas" = -1;
    UPDATE "DBA".Our_Filter SET Our_Filter."Pakavimo kodas" = NULL WHERE Our_Filter."Pakavimo kodas" = -1	
END