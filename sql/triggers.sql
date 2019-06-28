/*Triggerite funktsioonide laused*/

CREATE OR REPLACE FUNCTION f_kustuta_treening() RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF 
AS $BODY$
BEGIN
	RAISE EXCEPTION 'Ainult ootel olevaid treeningu on võimalik kustutada!';
	RETURN OLD;
END;
$BODY$;
COMMENT ON FUNCTION f_kustuta_treening() IS 'See trigger määrab ära selle, et kustutada saab ainult ootel olevaid treeningu.';


CREATE OR REPLACE FUNCTION f_muuda_treeningu_seisundi_liik()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF 
AS $BODY$
BEGIN
	RAISE EXCEPTION 'Nii pole võimalik muuta treeningu seisundit!';
	RETURN NULL;
END;
$BODY$;
COMMENT ON FUNCTION f_muuda_treeningu_seisundi_liik() IS 'See trigger kontrollib, et toimub korrektne treeningu seisundi liigi muudatus. Kui old.treeningu_seisundi_liik_kood=new.treeningu_seisundi_liik_kood, siis treeningu seisundi kood jääb samaks.';


CREATE TRIGGER trig_treening_kustuta_treening BEFORE DELETE ON Treening FOR EACH ROW WHEN ((old.treeningu_seisundi_liik_kood IS DISTINCT FROM 1)) EXECUTE PROCEDURE f_kustuta_treening();

CREATE TRIGGER trig_treening_muuda_treeningu_seisundi_liik BEFORE UPDATE OF treeningu_seisundi_liik_kood ON Treening FOR EACH ROW WHEN ((NOT ((old.treeningu_seisundi_liik_kood = new.treeningu_seisundi_liik_kood) OR ((old.treeningu_seisundi_liik_kood = 1) AND (new.treeningu_seisundi_liik_kood = 3)) OR ((old.treeningu_seisundi_liik_kood = 3) AND (new.treeningu_seisundi_liik_kood = ANY (ARRAY[2, 4]))) OR ((old.treeningu_seisundi_liik_kood = 2) AND (new.treeningu_seisundi_liik_kood = ANY (ARRAY[3, 4])))))) EXECUTE PROCEDURE f_muuda_treeningu_seisundi_liik();