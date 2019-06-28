
CREATE OR REPLACE FUNCTION f_lisa_treening(
p_treeningu_kood Treening.treeningu_kood%TYPE, 
p_tuup_kood Treening.treeningu_tuup_kood%TYPE, 
p_nimetus Treening.nimetus%TYPE, 
p_registreerija_id Treening.reg_id%TYPE, 
p_kestus Treening.kestus%TYPE)
RETURNS Treening.treeningu_kood%TYPE AS $$ 
INSERT INTO Treening(treeningu_kood, treeningu_tuup_kood, nimetus, reg_id, kestus) 
VALUES (p_treeningu_kood, p_tuup_kood, p_nimetus, p_registreerija_id, p_kestus) ON CONFLICT DO NOTHING RETURNING treeningu_kood;
$$ LANGUAGE sql SECURITY DEFINER
SET search_path = public, pg_temp;

COMMENT ON FUNCTION f_lisa_treening(p_treeningu_kood Treening.treeningu_kood%TYPE, 
p_tuup_kood Treening.treeningu_tuup_kood%TYPE, 
p_nimetus Treening.nimetus%TYPE, 
p_registreerija_id Treening.reg_id%TYPE, 
p_kestus Treening.kestus%TYPE)
IS 'Selle funktsiooni abil registreeritakse uus treening. See funktsioon realiseerib andmebaasioperatsiooni OP1. 
Parameetri p_treeningu_kood oodatav vaartus on treeningu identifikaator, p_tuup_kood oodatav vaartus on treeningu tuubi identifikaator, 
p_nimetus oodatav vaartus on treeningu nimetus, p_registreerija_id oodatav vaartus on treeningu registreerinud tootaja identifikaator, 
p_treeningu_seisundi_liik oodatav vaartus on treeningu liigi identifikaator, p_kestus oodatav vaartus on treeningu kestus minutites';


CREATE OR REPLACE FUNCTION f_unusta_treening(p_treeningu_kood Treening.treeningu_kood%TYPE)
RETURNS VOID AS $$
DELETE FROM Treening WHERE treeningu_kood = p_treeningu_kood;
$$ LANGUAGE sql SECURITY DEFINER
SET search_path = public, pg_temp;

COMMENT ON FUNCTION f_unusta_treening(p_treeningu_kood Treening.treeningu_kood%TYPE)
IS 'Selle funktsiooni abil unustatake (kustutakse) treening. See funktsioon realiseerib andmebaasioperatsiooni OP2. 
Parameetri p_treeningu_kood oodatav vaartus on treeningu identifikaator.';


CREATE OR REPLACE FUNCTION f_aktiveeri_treening(p_treeningu_kood Treening.treeningu_kood%TYPE)
RETURNS VOID AS $$
UPDATE Treening SET treeningu_seisundi_liik_kood = 3 WHERE treeningu_kood = p_treeningu_kood;
$$ LANGUAGE sql SECURITY DEFINER
SET search_path = public, pg_temp;

COMMENT ON FUNCTION f_aktiveeri_treening(p_treeningu_kood Treening.treeningu_kood%TYPE)
IS 'Selle funktsiooni abil aktiveeritakse treening. See funktsioon realiseerib andmebaasioperatsiooni OP3. 
Parameetri p_treeningu_kood oodatav vaartus on treeningu identifikaator.';


CREATE OR REPLACE FUNCTION f_lopeta_treening(p_treeningu_kood Treening.treeningu_kood%TYPE)
RETURNS VOID AS $$
UPDATE Treening SET treeningu_seisundi_liik_kood = 4 WHERE treeningu_kood = p_treeningu_kood;
$$ LANGUAGE sql SECURITY DEFINER
SET search_path = public, pg_temp;

COMMENT ON FUNCTION f_lopeta_treening(p_treeningu_kood Treening.treeningu_kood%TYPE)
IS 'Selle funktsiooni abil lopetatakse treening. See funktsioon realiseerib andmebaasioperatsiooni OP5. 
Parameetri p_treeningu_kood oodatav vaartus on treeningu identifikaator.';


CREATE OR REPLACE FUNCTION f_muuda_treening(
p_treeningu_kood_vana Treening.treeningu_kood%TYPE, 
p_treeningu_kood_uus Treening.treeningu_kood%TYPE,
p_nimetus Treening.nimetus%TYPE, 
p_kestus Treening.kestus%TYPE)
RETURNS VOID AS $$
UPDATE Treening SET treeningu_kood = p_treeningu_kood_uus, nimetus = p_nimetus, kestus = p_kestus WHERE treeningu_kood = p_treeningu_kood_vana;
$$ LANGUAGE SQL SECURITY DEFINER
SET search_path=public, pg_temp;

COMMENT ON FUNCTION f_muuda_treening (p_treeningu_kood_vana
Treening.treeningu_kood%TYPE, p_treeningu_kood_uus Treening.treeningu_kood%TYPE, p_nimetus
Treening.nimetus%type, p_kestus Treening.kestus%TYPE) IS
'OP6 Protsess, mis muudab treeningu andmeid. Protseduuri oodatavad
sisendid on treeningu vana identifikaator (parameeter p_treeningu_kood_vana),
treeningu uus identifikaator (parameeter p_treeningu_kood_uus),
nimetus (parameeter p_nimetus) ja
kestus (parameeter p_kestus).
Protseduur muudab etteantud treeningu.';