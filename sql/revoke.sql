Domeenide kustutamine
DROP DOMAIN IF EXISTS d_reg_aeg CASCADE;
DROP DOMAIN IF EXISTS d_nimetus CASCADE;

Tabelite ja arvujada generaatorite kustutamine

DROP TABLE IF EXISTS Treeningu_kategooria_tuup CASCADE;
DROP TABLE IF EXISTS Treeningu_kategooria CASCADE;
DROP TABLE IF EXISTS Treeningu_seisundi_liik CASCADE;
DROP TABLE IF EXISTS Tootaja_seisundi_liik CASCADE;
DROP TABLE IF EXISTS Kliendi_seisundi_liik CASCADE;
DROP TABLE IF EXISTS Isiku_seisundi_liik CASCADE;
DROP TABLE IF EXISTS Riik CASCADE;
DROP TABLE IF EXISTS Amet CASCADE;
DROP TABLE IF EXISTS Isik CASCADE;
DROP TABLE IF EXISTS Klient CASCADE;
DROP TABLE IF EXISTS Tootaja CASCADE;
DROP TABLE IF EXISTS Treening CASCADE;
DROP TABLE IF EXISTS Treeningu_tuup CASCADE;
DROP TABLE IF EXISTS Treeningu_kategooria_omamine CASCADE;	

DROP FOREIGN TABLE IF EXISTS Riik_jsonb CASCADE;
DROP FOREIGN TABLE IF EXISTS Isik_jsonb CASCADE;

DROP USER MAPPING FOR t164027 SERVER minu_testandmete_server_apex;
DROP SERVER IF EXISTS minu_testandmete_server_apex CASCADE;
DROP EXTENSION IF EXISTS postgres_fdw CASCADE;

DROP VIEW IF EXISTS aktiivsed_mitteaktiivsed_treeningud CASCADE;
DROP VIEW IF EXISTS treeningute_kategooria_omamine CASCADE;
DROP VIEW IF EXISTS koik_treeningud CASCADE;
DROP VIEW IF EXISTS treeningute_koondaruanne CASCADE;
DROP VIEW IF EXISTS treeningute_detailid CASCADE;


DROP INDEX IF EXISTS IXFK_Isik_Isiku_seisundi_liik;
DROP INDEX IF EXISTS IXFK_Isik_Riik;
DROP INDEX IF EXISTS IXFK_Klient_kliendi_seisundi_liik; 
DROP INDEX IF EXISTS IXFK_Tootaja_seisundi_liik;
DROP INDEX IF EXISTS IXFK_Tootaja_amet;
DROP INDEX IF EXISTS IXFK_Tootaja_mentor;
DROP INDEX IF EXISTS IXFK_Treening_Tootaja;
DROP INDEX IF EXISTS IXFK_Treening_tuup;
DROP INDEX IF EXISTS IXFK_Treening_seisundi_liik;
DROP INDEX IF EXISTS IXFK_Treeningu_kategooria_omamine_treening;
DROP INDEX IF EXISTS IXFK_Isik_perenimi;
DROP INDEX IF EXISTS IXFK_Isik_eesnimi;
DROP INDEX IF EXISTS IXFK_Treeningu_kategooria_omamine_Treeningu_kategooria_kood;

DROP INDEX IF EXISTS AK_Isik_meil;


DROP FUNCTION IF EXISTS f_on_juhataja(p_kasutajanimi text, p_parool text);

DROP FUNCTION IF EXISTS f_lisa_treening(
p_treeningu_kood Treening.treeningu_kood%TYPE, 
p_tuup_kood Treening.treeningu_tuup_kood%TYPE, 
p_nimetus Treening.nimetus%TYPE, 
p_registreerija_id Treening.reg_id%TYPE, 
p_kestus Treening.kestus%TYPE) CASCADE;

DROP FUNCTION IF EXISTS f_aktiveeri_treening(p_treeningu_kood treening.treeningu_kood%TYPE) CASCADE;
DROP FUNCTION IF EXISTS f_unusta_treening(p_treeningu_kood treening.treeningu_kood%TYPE) CASCADE;
DROP FUNCTION IF EXISTS f_lopeta_treening(p_treeningu_kood treening.treeningu_kood%TYPE) CASCADE;
DROP FUNCTION IF EXISTS f_muuda_treening(
p_treeningu_kood_vana Treening.treeningu_kood%TYPE, 
p_treeningu_kood_uus Treening.treeningu_kood%TYPE,
p_nimetus Treening.nimetus%TYPE, 
p_kestus Treening.kestus%TYPE)CASCADE;


DROP FUNCTION IF EXISTS f_kustuta_treening() CASCADE;
DROP FUNCTION IF EXISTS f_muuda_treeningu_seisundi_liik() CASCADE;

DROP TRIGGER IF EXISTS trig_treening_kustuta_treening ON Treening CASCADE;
DROP TRIGGER IF EXISTS trig_treening_muuda_treeningu_seisundi_liik ON Treening CASCADE;



	


