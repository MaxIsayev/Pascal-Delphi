ALTER VIEW "DBA"."V_Storage"( /* view_column_name, ... */ )
AS
SELECT "����������_�������"."Prekes pavadinimas",
	"����������_���"."Pakavimo pavadinimas",
	"����������_�����������"."Tiekejo vardas",
	"����������_������_���������"."MV pavadinimas",
	"�����"."MV pakavime",
	"�����"."Pakavimu kiekis",
	"�����"."MV kaina"	
, "�����"."Prekes kodas"
, "�����"."Pakavimo kodas"
, "�����"."Tiekejo kodas" 
, "�����"."MV kodas"
FROM "DBA"."�����",
"DBA"."����������_�������", 
"DBA"."����������_���", 
"DBA"."����������_�����������",
"DBA"."����������_������_���������" 
, "DBA".Our_Filter
WHERE "�����"."Prekes kodas" = "����������_�������"."Prekes kodas" 
	AND "�����"."Pakavimo kodas" = "����������_���"."Pakavimo kodas"
        AND "�����"."Tiekejo kodas" = "����������_�����������"."Tiekejo kodas"    
	AND "�����"."MV kodas" = "����������_������_���������"."MV kodas"
	AND "�����"."Prekes kodas" = coalesce(Our_Filter."Prekes kodas", "�����"."Prekes kodas")
AND "�����"."Tiekejo kodas" = coalesce(Our_Filter."Tiekejo kodas", "�����"."Tiekejo kodas")
AND "�����"."MV kodas" = coalesce(Our_Filter."MV kodas", "�����"."MV kodas")
AND "�����"."Pakavimo kodas" = coalesce(Our_Filter."Pakavimo kodas", "�����"."Pakavimo kodas")
	/*AND "�����"."Pakavimo kodas" = Our_Filter."Pakavimo kodas"
        AND "�����"."Tiekejo kodas" = Our_Filter."Tiekejo kodas"    
	AND "�����"."MV kodas" = Our_Filter."MV kodas"*/
ORDER BY
	"����������_�������"."Prekes pavadinimas",
	"����������_���"."Pakavimo pavadinimas",
	"����������_�����������"."Tiekejo vardas",
	"����������_������_���������"."MV pavadinimas"