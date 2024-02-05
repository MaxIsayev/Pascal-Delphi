ALTER TRIGGER "detect_update"  AFTER
    INSERT,
    UPDATE,
    DELETE
  ON "DBA"."Склад"
BEGIN
  CASE
    WHEN INSERTING THEN
      INSERT INTO "DBA"."Event_log" ("Laikas", "Pranesimas")
		VALUES (NOW(), 'Iterpimas' );
    WHEN UPDATING THEN
      INSERT INTO "DBA"."Event_log" ("Laikas", "Pranesimas")
		VALUES (NOW(), 'Keitimas' );  
    WHEN DELETING THEN
      INSERT INTO "DBA"."Event_log" ("Laikas", "Pranesimas")
		VALUES (NOW(), 'Salinimas' );
  END CASE;
END