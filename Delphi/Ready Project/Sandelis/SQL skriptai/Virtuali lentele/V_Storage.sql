ALTER VIEW "DBA"."V_Storage"( /* view_column_name, ... */ )
AS
SELECT "Справочник_товаров"."Prekes pavadinimas",
	"Справочник_тар"."Pakavimo pavadinimas",
	"Справочник_поставщиков"."Tiekejo vardas",
	"Справочник_Единиц_измерения"."MV pavadinimas",
	"Склад"."MV pakavime",
	"Склад"."Pakavimu kiekis",
	"Склад"."MV kaina"	
, "Склад"."Prekes kodas"
, "Склад"."Pakavimo kodas"
, "Склад"."Tiekejo kodas" 
, "Склад"."MV kodas"
FROM "DBA"."Склад",
"DBA"."Справочник_товаров", 
"DBA"."Справочник_тар", 
"DBA"."Справочник_поставщиков",
"DBA"."Справочник_Единиц_измерения" 
, "DBA".Our_Filter
WHERE "Склад"."Prekes kodas" = "Справочник_товаров"."Prekes kodas" 
	AND "Склад"."Pakavimo kodas" = "Справочник_тар"."Pakavimo kodas"
        AND "Склад"."Tiekejo kodas" = "Справочник_поставщиков"."Tiekejo kodas"    
	AND "Склад"."MV kodas" = "Справочник_Единиц_измерения"."MV kodas"
	AND "Склад"."Prekes kodas" = coalesce(Our_Filter."Prekes kodas", "Склад"."Prekes kodas")
AND "Склад"."Tiekejo kodas" = coalesce(Our_Filter."Tiekejo kodas", "Склад"."Tiekejo kodas")
AND "Склад"."MV kodas" = coalesce(Our_Filter."MV kodas", "Склад"."MV kodas")
AND "Склад"."Pakavimo kodas" = coalesce(Our_Filter."Pakavimo kodas", "Склад"."Pakavimo kodas")
	/*AND "Склад"."Pakavimo kodas" = Our_Filter."Pakavimo kodas"
        AND "Склад"."Tiekejo kodas" = Our_Filter."Tiekejo kodas"    
	AND "Склад"."MV kodas" = Our_Filter."MV kodas"*/
ORDER BY
	"Справочник_товаров"."Prekes pavadinimas",
	"Справочник_тар"."Pakavimo pavadinimas",
	"Справочник_поставщиков"."Tiekejo vardas",
	"Справочник_Единиц_измерения"."MV pavadinimas"