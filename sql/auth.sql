CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;

CREATE OR REPLACE FUNCTION f_on_juhataja(p_kasutajanimi text, p_parool text)
  RETURNS boolean AS $$ DECLARE rslt boolean;
BEGIN
  SELECT INTO rslt (parool = public.crypt(p_parool, parool))
  from isik
         INNER JOIN tootaja ON isik.isik_id = tootaja.isik_id
  WHERE Upper(meil) = Upper(p_kasutajanimi)
    AND Tootaja.amet_kood = 1
    AND Isiku_seisundi_liik_kood = 1
    AND Tootaja.tootaja_seisundi_liik_kood IN (1, 2, 3, 4);
  RETURN coalesce(rslt, FALSE);
END;
$$
LANGUAGE plpgsql
SECURITY DEFINER
STABLE
SET search_path = public, pg_temp;

COMMENT ON FUNCTION f_on_juhataja(p_kasutajanimi text, p_parool text)
IS 'Selle funktsiooni abil autenditakse juhatajat. Parameetri p_kasutajanimi oodatav väärtus on tõstutundetu kasutajanimi ehk meil ja parool oodatav väärtus on tõstutundlik avatekstiline parool. Juhatahal on õigus süsteemi siseneda, vaid siis kui tema seisundiks on tööl, haiguslehel, puhkusel või katseajal.';


ALTER FUNCTION f_on_juhataja OWNER TO t164027;
GRANT ALL PRIVILEGES ON FUNCTION f_on_juhataja TO t164027_juhataja;
GRANT EXECUTE ON FUNCTION f_on_juhataja TO t164027;

REVOKE ALL ON FUNCTION f_on_juhataja FROM PUBLIC ;