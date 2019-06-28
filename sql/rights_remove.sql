1)Üleliigsete õiguste äravõtmine

REVOKE CONNECT, TEMP ON DATABASE t164027 FROM PUBLIC;
REVOKE CREATE, USAGE ON SCHEMA public FROM PUBLIC;
REVOKE USAGE ON LANGUAGE plpgsql FROM PUBLIC;

REVOKE EXECUTE ON FUNCTION
f_lisa_treening(p_treeningu_kood Treening.treeningu_kood%TYPE, 
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
f_on_juhataja(p_kasutajanimi text, p_parool text),
f_kustuta_treening(),
f_muuda_treeningu_seisundi_liik()
FROM PUBLIC;

REVOKE EXECUTE ON ALL FUNCTIONS IN SCHEMA public FROM PUBLIC;



2)Õiguste äravõtmine
Enne kasutaja kustutamist tuleb ära võtta sellele antud õigused.

REVOKE CONNECT ON DATABASE t164027 FROM t164027_juhataja;

REVOKE USAGE ON SCHEMA public FROM t164027_juhataja;

REVOKE SELECT, INSERT, UPDATE ON TABLE Treening FROM t164027_juhataja;

REVOKE SELECT, INSERT, UPDATE ON TABLE Klient FROM t164027_juhataja;
REVOKE SELECT, INSERT, UPDATE ON TABLE Treening FROM t164027_juhataja;
REVOKE SELECT, INSERT, UPDATE ON TABLE Treening FROM t164027_juhataja;
REVOKE SELECT, INSERT, UPDATE ON TABLE Treening FROM t164027_juhataja;
REVOKE SELECT, INSERT, UPDATE ON TABLE Treening FROM t164027_juhataja;
REVOKE SELECT, INSERT, UPDATE ON TABLE Treening FROM t164027_juhataja;
REVOKE SELECT, INSERT, UPDATE ON TABLE Treening FROM t164027_juhataja;
REVOKE SELECT, INSERT, UPDATE ON TABLE Treening FROM t164027_juhataja;
REVOKE SELECT, INSERT, UPDATE ON TABLE Treening FROM t164027_juhataja;

REVOKE SELECT ON
aktiivsed_mitteaktiivsed_treeningud, 
treeningute_kategooria_omamine, 
koik_treeningud, 
treeningute_koondaruanne, 
treeningute_detailid,
treeningute_kategooriad
FROM t164027_juhataja;

REVOKE EXECUTE ON FUNCTION
f_lisa_treening(p_treeningu_kood Treening.treeningu_kood%TYPE, p_tuup_kood Treening.treeningu_tuup_kood%TYPE, p_nimetus Treening.nimetus%TYPE, p_registreerija_id Treening.reg_id%TYPE, p_kestus Treening.kestus%TYPE),
f_unusta_treening(p_treeningu_kood Treening.treeningu_kood%TYPE),
f_aktiveeri_treening(p_treeningu_kood Treening.treeningu_kood%TYPE),
f_lopeta_treening(p_treeningu_kood Treening.treeningu_kood%TYPE),
f_muuda_treening(p_treeningu_kood_vana Treening.treeningu_kood%TYPE, p_treeningu_kood_uus Treening.treeningu_kood%TYPE, p_nimetus Treening.nimetus%TYPE, p_kestus Treening.kestus%TYPE),
f_on_juhataja(p_kasutajanimi text, p_parool text)
FROM t164027_juhataja;

