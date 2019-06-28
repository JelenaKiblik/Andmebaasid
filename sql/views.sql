CREATE VIEW aktiivsed_mitteaktiivsed_treeningud WITH (security_barrier) 
AS SELECT Treening.treeningu_kood, Treening.nimetus AS treeningu_nimetus, Treening.kestus, Treeningu_seisundi_liik.nimetus AS hetke_seisund 
FROM Treeningu_seisundi_liik INNER JOIN Treening ON Treeningu_seisundi_liik.treeningu_seisundi_liik_kood = Treening.treeningu_seisundi_liik_kood
WHERE Treening.treeningu_seisundi_liik_kood In (2,3);

COMMENT ON VIEW aktiivsed_mitteaktiivsed_treeningud IS 'Naitab aktiivsed ja mitteaktiivseid treeninguid (kood, nimetus, kestus ja seisundi liik)';


CREATE OR REPLACE VIEW treeningute_kategooria_omamine WITH (security_barrier) 
AS SELECT Treeningu_kategooria_omamine.treeningu_kood, Treeningu_kategooria.nimetus || ' (' || Treeningu_kategooria_tuup.nimetus || ')' AS kategooria
FROM Treeningu_kategooria_tuup INNER JOIN (Treeningu_kategooria INNER JOIN Treeningu_kategooria_omamine ON Treeningu_kategooria.treeningu_kategooria_kood = Treeningu_kategooria_omamine.treeningu_kategooria_kood) ON Treeningu_kategooria_tuup.treeningu_kategooria_tuup_kood = Treeningu_kategooria.treeningu_kategooria_tuup_kood;

COMMENT ON VIEW treeningute_kategooria_omamine IS 'Naitab treeningude kategooriad (kood ja treeningu kategooria)';


CREATE OR REPLACE VIEW koik_treeningud WITH (security_barrier) 
AS SELECT Treening.treeningu_kood, Treening.nimetus AS treeningu_nimetus, Treening.kestus, Treeningu_seisundi_liik.nimetus AS hetke_seisund
FROM Treeningu_seisundi_liik INNER JOIN Treening ON Treeningu_seisundi_liik.treeningu_seisundi_liik_kood = Treening.treeningu_seisundi_liik_kood;

COMMENT ON VIEW koik_treeningud IS 'Naitab koike treeninguid (kood, nimetus, kestus ja treeningu hetke seisundi';
 
 
CREATE OR REPLACE VIEW treeningute_koondaruanne WITH (security_barrier) 
AS SELECT Treeningu_seisundi_liik.treeningu_seisundi_liik_kood, upper(Treeningu_seisundi_liik.nimetus) AS seisundi_nimetus, Count(Treening.treeningu_kood) AS arv
FROM Treeningu_seisundi_liik LEFT JOIN Treening ON Treeningu_seisundi_liik.treeningu_seisundi_liik_kood = Treening.treeningu_seisundi_liik_kood
GROUP BY Treeningu_seisundi_liik.treeningu_seisundi_liik_kood, upper(Treeningu_seisundi_liik.nimetus)
ORDER BY Count(Treening.treeningu_kood) DESC, upper(Treeningu_seisundi_liik.nimetus);

COMMENT ON VIEW treeningute_koondaruanne IS 'Naitab treeningute koondaruanne nende seisundi liigi pohjal (seisundi kood, seisundi nimetus ja arv, mis naitab, kui palju on niisugusi treeningusi';


CREATE OR REPLACE VIEW treeningute_detailid WITH (security_barrier) 
AS SELECT Treening.treeningu_kood, Treening.nimetus AS treeningu_nimetus, Treening.kestus, Treeningu_seisundi_liik.nimetus AS hetke_seisund, Isik.meil AS registreerija_email, COALESCE(eesnimi, perenimi) AS registreerija_nimi, Treening.reg_aeg
FROM Treeningu_seisundi_liik INNER JOIN (Isik INNER JOIN Treening ON Isik.isik_id=Treening.reg_id) ON Treeningu_seisundi_liik.treeningu_seisundi_liik_kood = Treening.treeningu_seisundi_liik_kood;

COMMENT ON VIEW treeningute_detailid IS 'Naitab koike treeningusi detailid (kood, nimetus, kestus, hetke seisund, registreerija email, registreerija tais nimi, registratsiooni aeg)';


CREATE OR REPLACE VIEW treeningute_kategooriad WITH (security_barrier) 
AS SELECT Treening.treeningu_kood, string_agg((((Treeningu_kategooria_tuup.nimetus || ': ') || LOWER(Treeningu_kategooria.nimetus))), '; ') AS Treeningu_kategooriad 
FROM (((Treening LEFT JOIN Treeningu_kategooria_omamine ON ((Treening.treeningu_kood = Treeningu_kategooria_omamine.treeningu_kood))) 
LEFT JOIN Treeningu_kategooria ON ((Treeningu_kategooria_omamine.Treeningu_kategooria_kood = Treeningu_kategooria.Treeningu_kategooria_kood))) 
LEFT JOIN Treeningu_kategooria_tuup ON ((Treeningu_kategooria_tuup.Treeningu_kategooria_tuup_kood = Treeningu_kategooria.Treeningu_kategooria_tuup_kood))) 
GROUP BY Treening.treeningu_kood   
ORDER BY Treening.treeningu_kood ASC;

COMMENT ON VIEW treeningute_kategooriad IS 'See vaade näitab, millistesse kategooriatesse mingi treening kuulub.';

GRANT SELECT ON TABLE aktiivsed_mitteaktiivsed_treeningud TO t164416_juhataja;
GRANT SELECT ON TABLE treeningute_kategooria_omamine TO t164416_juhataja;
GRANT SELECT ON TABLE koik_treeningud TO t164416_juhataja;
GRANT SELECT ON TABLE treeningute_koondaruanne TO t164416_juhataja;
GRANT SELECT ON TABLE treeningute_detailid TO t164416_juhataja;