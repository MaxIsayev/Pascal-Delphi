ALTER PROCEDURE "DBA"."reset_filter"()
/* RESULT( column_name column_type, ... ) */
BEGIN
	/* Type the procedure statements here */
    UPDATE "DBA"."Our_Filter" SET Our_Filter."Prekes kodas" = NULL
		, Our_Filter."Tiekejo kodas" = NULL
		, Our_Filter."MV kodas" = NULL
		, Our_Filter."Pakavimo kodas" = NULL
END