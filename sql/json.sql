CREATE EXTENSION IF NOT EXISTS postgres_fdw WITH SCHEMA public;

CREATE SERVER minu_testandmete_server_apex FOREIGN DATA WRAPPER postgres_fdw OPTIONS (host 'apex.ttu.ee', dbname 'testandmed', port '5432');

CREATE USER MAPPING FOR t164027 SERVER minu_testandmete_server_apex OPTIONS (user 't164027', password '');

CREATE FOREIGN TABLE Riik_jsonb (riik JSONB ) SERVER minu_testandmete_server_apex;

INSERT INTO Riik (riik_kood, nimetus)
SELECT riik->>'Alpha-3 code' AS riik_kood, riik->>'English short name lower case' AS nimetus
FROM Riik_jsonb;

SELECT * FROM Riik;



CREATE FOREIGN TABLE Isik_jsonb (isik JSONB )SERVER minu_testandmete_server_apex;

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;

INSERT INTO Isik(riik_kood, isikukood, eesnimi, perenimi, meil, sunni_kp, isiku_seisundi_liik_kood, parool, elukoht)
SELECT riik_kood, isikukood, eesnimi, perenimi, meil, sunni_kp::date, isiku_seisundi_liik_kood::smallint, parool, elukoht
FROM (SELECT isik->>'riik' AS riik_kood,
jsonb_array_elements(isik->'isikud')->>'isikukood' AS isikukood,
jsonb_array_elements(isik->'isikud')->>'eesnimi' AS eesnimi,
jsonb_array_elements(isik->'isikud')->>'perekonnanimi' AS perenimi,
jsonb_array_elements(isik->'isikud')->>'email' AS meil,
jsonb_array_elements(isik->'isikud')->>'synni_aeg' AS sunni_kp,
jsonb_array_elements(isik->'isikud')->>'seisund' AS isiku_seisundi_liik_kood,
jsonb_array_elements(isik->'isikud')->>'parool' AS parool,
jsonb_array_elements(isik->'isikud')->>'aadress' AS elukoht
FROM isik_jsonb) AS lahteandmed
WHERE isiku_seisundi_liik_kood::smallint=1;

SELECT * FROM Isik; 














