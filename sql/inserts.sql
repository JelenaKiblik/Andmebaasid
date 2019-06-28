INSERT INTO amet(amet_kood, nimetus, kirjeldus) VALUES (1, 'Juhataja', 'Vastutav isik töökoha eest');
INSERT INTO amet(amet_kood, nimetus, kirjeldus) VALUES (2, 'Treeningute haldur', 'Vastutav isik treeningute eest');
INSERT INTO amet(amet_kood, nimetus, kirjeldus) VALUES (3, 'Treener', 'Treener on sportlasi kutseliselt ettevalmistav ja õpetav inimene');

INSERT INTO isiku_seisundi_liik(isiku_seisundi_liik_kood, nimetus) VALUES (1, 'Elus');
INSERT INTO isiku_seisundi_liik(isiku_seisundi_liik_kood, nimetus) VALUES (2, 'Surnud');

INSERT INTO kliendi_seisundi_liik(kliendi_seisundi_liik_kood, nimetus) VALUES (1, 'Aktiivne');
INSERT INTO kliendi_seisundi_liik(kliendi_seisundi_liik_kood, nimetus) VALUES (2, 'Mustas nimekirjas');

INSERT INTO tootaja_seisundi_liik(tootaja_seisundi_liik_kood, nimetus) VALUES (1, 'Katseajal');
INSERT INTO tootaja_seisundi_liik(tootaja_seisundi_liik_kood, nimetus) VALUES (2, 'Tool');
INSERT INTO tootaja_seisundi_liik(tootaja_seisundi_liik_kood, nimetus) VALUES (3, 'Puhkusel');
INSERT INTO tootaja_seisundi_liik(tootaja_seisundi_liik_kood, nimetus) VALUES (4, 'Haiguslehel');
INSERT INTO tootaja_seisundi_liik(tootaja_seisundi_liik_kood, nimetus) VALUES (5, 'Töösuhe peatatud');
INSERT INTO tootaja_seisundi_liik(tootaja_seisundi_liik_kood, nimetus) VALUES (6, 'Töösuhe lõpetatud omal soovil');
INSERT INTO tootaja_seisundi_liik(tootaja_seisundi_liik_kood, nimetus) VALUES (7, 'Vallandatud');

INSERT INTO treeningu_seisundi_liik(treeningu_seisundi_liik_kood, nimetus) VALUES (1, 'Ootel');
INSERT INTO treeningu_seisundi_liik(treeningu_seisundi_liik_kood, nimetus) VALUES (2, 'Mitteaktiivne');
INSERT INTO treeningu_seisundi_liik(treeningu_seisundi_liik_kood, nimetus) VALUES (3, 'Aktiivne');
INSERT INTO treeningu_seisundi_liik(treeningu_seisundi_liik_kood, nimetus) VALUES (4, 'Lopetatud');

INSERT INTO klient(klient_id, kliendi_seisundi_liik_kood, on_nous_tylitamisega) VALUES (1, 1, true);
INSERT INTO klient(klient_id, kliendi_seisundi_liik_kood, on_nous_tylitamisega) VALUES (2, 1, false);
INSERT INTO klient(klient_id, kliendi_seisundi_liik_kood, on_nous_tylitamisega) VALUES (3, 1, false);
INSERT INTO klient(klient_id, kliendi_seisundi_liik_kood, on_nous_tylitamisega) VALUES (4, 2, false);

INSERT INTO tootaja(isik_id, amet_kood, tootaja_seisundi_liik_kood, mentor) VALUES (1, 1, 7, NULL);
INSERT INTO tootaja(isik_id, amet_kood, tootaja_seisundi_liik_kood, mentor) VALUES (2, 2, 7, NULL);
INSERT INTO tootaja(isik_id, amet_kood, tootaja_seisundi_liik_kood, mentor) VALUES (3, 3, 2, NULL);
INSERT INTO tootaja(isik_id, amet_kood, tootaja_seisundi_liik_kood, mentor) VALUES (4, 3, 2, NULL);
INSERT INTO tootaja(isik_id, amet_kood, tootaja_seisundi_liik_kood, mentor) VALUES (5, 3, 2, NULL);
INSERT INTO tootaja(isik_id, amet_kood, tootaja_seisundi_liik_kood, mentor) VALUES (6, 3, 1, 4);
INSERT INTO tootaja(isik_id, amet_kood, tootaja_seisundi_liik_kood, mentor) VALUES (7, 3, 1, 5);
INSERT INTO tootaja(isik_id, amet_kood, tootaja_seisundi_liik_kood, mentor) VALUES (8, 1, 2, NULL);

INSERT INTO treeningu_tuup(treeningu_tuup_kood, nimetus) VALUES (1, 'Jooksmine');
INSERT INTO treeningu_tuup(treeningu_tuup_kood, nimetus) VALUES (2, 'Joutreening');
INSERT INTO treeningu_tuup(treeningu_tuup_kood, nimetus) VALUES (3, 'Kaughüpe');
INSERT INTO treeningu_tuup(treeningu_tuup_kood, nimetus) VALUES (4, 'Kettaheide');
INSERT INTO treeningu_tuup(treeningu_tuup_kood, nimetus) VALUES (5, 'Kõrgushüpe');
INSERT INTO treeningu_tuup(treeningu_tuup_kood, nimetus) VALUES (6, 'Maraton');
INSERT INTO treeningu_tuup(treeningu_tuup_kood, nimetus) VALUES (7, 'Odavise');
INSERT INTO treeningu_tuup(treeningu_tuup_kood, nimetus) VALUES (8, 'Sprint');
INSERT INTO treeningu_tuup(treeningu_tuup_kood, nimetus) VALUES (9, 'Tõkkejooks');
INSERT INTO treeningu_tuup(treeningu_tuup_kood, nimetus) VALUES (10, 'Vastupidavus');

INSERT INTO treening(treeningu_kood, treeningu_tuup_kood, nimetus, reg_id, treeningu_seisundi_liik_kood, reg_aeg, kestus) VALUES (1, 1, 'Jooksmine', 1, 2, '2018-04-10', 90);
INSERT INTO treening(treeningu_kood, treeningu_tuup_kood, nimetus, reg_id, treeningu_seisundi_liik_kood, reg_aeg, kestus) VALUES (2, 2, 'Vastupidavus', 1, 2, '2018-04-10', 60);
INSERT INTO treening(treeningu_kood, treeningu_tuup_kood, nimetus, reg_id, treeningu_seisundi_liik_kood, reg_aeg, kestus) VALUES (3, 2, 'Joutreening', 1, 1, '2018-04-10', 60);
INSERT INTO treening(treeningu_kood, treeningu_tuup_kood, nimetus, reg_id, treeningu_seisundi_liik_kood, reg_aeg, kestus) VALUES (4, 2, 'Kaughüpe', 1, 2, '2018-04-10', 60);
INSERT INTO treening(treeningu_kood, treeningu_tuup_kood, nimetus, reg_id, treeningu_seisundi_liik_kood, reg_aeg, kestus) VALUES (5, 2, 'Maraton', 1, 1, '2018-04-10', 60);
INSERT INTO treening(treeningu_kood, treeningu_tuup_kood, nimetus, reg_id, treeningu_seisundi_liik_kood, reg_aeg, kestus) VALUES (6, 2, 'Sprint', 1, 1, '2017-03-13', 60);
INSERT INTO treening(treeningu_kood, treeningu_tuup_kood, nimetus, reg_id, treeningu_seisundi_liik_kood, reg_aeg, kestus) VALUES (7, 2, 'Tõkkejooks', 8, 2, '2019-01-09', 90);

INSERT INTO treeningu_kategooria_tuup(treeningu_kategooria_tuup_kood, nimetus) VALUES (1, 'Raskusaste');
INSERT INTO treeningu_kategooria_tuup(treeningu_kategooria_tuup_kood, nimetus) VALUES (2, 'Hooaeg');
INSERT INTO treeningu_kategooria_tuup(treeningu_kategooria_tuup_kood, nimetus) VALUES (3, 'Treeningvahendid');

INSERT INTO treeningu_kategooria(treeningu_kategooria_kood, nimetus, treeningu_kategooria_tuup_kood) VALUES (1, 'Algajatele', 1);
INSERT INTO treeningu_kategooria(treeningu_kategooria_kood, nimetus, treeningu_kategooria_tuup_kood) VALUES (2, 'Algajatele ja edasijõudnutele', 1);
INSERT INTO treeningu_kategooria(treeningu_kategooria_kood, nimetus, treeningu_kategooria_tuup_kood) VALUES (3, 'Edasijoudnutele', 1);
INSERT INTO treeningu_kategooria(treeningu_kategooria_kood, nimetus, treeningu_kategooria_tuup_kood) VALUES (4, 'Suvine spordiala', 2);
INSERT INTO treeningu_kategooria(treeningu_kategooria_kood, nimetus, treeningu_kategooria_tuup_kood) VALUES (5, 'Talvine spordiala', 2);
INSERT INTO treeningu_kategooria(treeningu_kategooria_kood, nimetus, treeningu_kategooria_tuup_kood) VALUES (6, 'Iga hooajane spordiala', 2);
INSERT INTO treeningu_kategooria(treeningu_kategooria_kood, nimetus, treeningu_kategooria_tuup_kood) VALUES (7, 'Tõkked', 3);
INSERT INTO treeningu_kategooria(treeningu_kategooria_kood, nimetus, treeningu_kategooria_tuup_kood) VALUES (8, 'Kettad', 3);
INSERT INTO treeningu_kategooria(treeningu_kategooria_kood, nimetus, treeningu_kategooria_tuup_kood) VALUES (9, 'Odad', 3);

INSERT INTO treeningu_kategooria_omamine(treeningu_kategooria_omamine_id, treeningu_kood, treeningu_kategooria_kood) VALUES (1, 1, 1);
INSERT INTO treeningu_kategooria_omamine(treeningu_kategooria_omamine_id, treeningu_kood, treeningu_kategooria_kood) VALUES (2, 1, 2);
INSERT INTO treeningu_kategooria_omamine(treeningu_kategooria_omamine_id, treeningu_kood, treeningu_kategooria_kood) VALUES (3, 2, 1);
INSERT INTO treeningu_kategooria_omamine(treeningu_kategooria_omamine_id, treeningu_kood, treeningu_kategooria_kood) VALUES (4, 2, 2);

INSERT INTO isik(isik_id, isikukood, riik_kood, meil, parool, isiku_seisundi_liik_kood, sunni_kp, reg_aeg, eesnimi, perenimi, elukoht) 
VALUES (18, 37602130475, 'EST', 'kalkun@mail.ee', 'parool1', 2, '1950-11-02', '09.09.2018 13:10:25', 'Kalle', 'Kalkun', 'Tallinn');

INSERT INTO isik(isik_id, isikukood, riik_kood, meil, parool, isiku_seisundi_liik_kood, sunni_kp, reg_aeg, eesnimi, perenimi, elukoht) 
VALUES (19, 47605231345, 'EST', 'kelluke@mail.ee', 'parool2', 2, '1949-08-08', '09.09.2018 14:20:46', 'Mai', 'Kelluke', 'Tartu');




