4.18Õiguste jagamine

GRANT CONNECT ON DATABASE t164027 TO t164027_juhataja;

GRANT USAGE ON SCHEMA public TO t164027_juhataja;

GRANT SELECT, INSERT, UPDATE ON TABLE Treening TO t164027_juhataja;

GRANT SELECT ON aktiivsed_mitteaktiivsed_treeningud TO t164027_juhataja;
GRANT SELECT ON treeningute_kategooria_omamine TO t164027_juhataja;
GRANT SELECT ON koik_treeningud TO t164027_juhataja;
GRANT SELECT ON treeningute_koondaruanne TO t164027_juhataja;
GRANT SELECT ON treeningute_detailid TO t164027_juhataja;
GRANT SELECT ON treeningute_kategooriad TO t164027_juhataja;

GRANT EXECUTE ON FUNCTION
f_lisa_treening(
p_treeningu_kood Treening.treeningu_kood%TYPE, 
p_tuup_kood Treening.treeningu_tuup_kood%TYPE, 
p_nimetus Treening.nimetus%TYPE, 
p_registreerija_id Treening.reg_id%TYPE, 
p_kestus Treening.kestus%TYPE),
f_unusta_treening(p_treeningu_kood Treening.treeningu_kood%TYPE),
f_aktiveeri_treening(p_treeningu_kood Treening.treeningu_kood%TYPE),
f_lopeta_treening(p_treeningu_kood Treening.treeningu_kood%TYPE),
f_muuda_treening(p_treeningu_kood_vana Treening.treeningu_kood%TYPE, 
p_treeningu_kood_uus Treening.treeningu_kood%TYPE, 
p_nimetus Treening.nimetus%TYPE, 
p_kestus Treening.kestus%TYPE),
f_on_juhataja(p_kasutajanimi text, p_parool text)
TO t164027_juhataja;

ALTER DEFAULT PRIVILEGES REVOKE EXECUTE ON FUNCTIONS FROM PUBLIC;

UPDATE isik SET parool = public.crypt(parool,public.gen_salt('bf', 11));

ALTER FUNCTION f_on_juhataja OWNER TO t164027;
GRANT ALL PRIVILEGES ON FUNCTION f_on_juhataja TO t164027_juhataja;
GRANT EXECUTE ON FUNCTION f_on_juhataja TO t164027;

ALTER FUNCTION f_on_juhataja OWNER TO t164027;
GRANT ALL PRIVILEGES ON FUNCTION f_on_juhataja TO t164027_juhataja;

