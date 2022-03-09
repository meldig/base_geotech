/*
Remplissage des tables finales
*/

-- Insertion des familles
MERGE INTO G_GEO.TA_GEOTECH_FAMILLE a
USING(
    SELECT
        'Type d''études géotechniques' AS valeur
    FROM DUAL
    UNION ALL
    SELECT
        'Phase d''études géotechniques' AS valeur
    FROM DUAL
)t
ON (UPPER(a.valeur) = UPPER(t.valeur))
WHEN NOT MATCHED THEN
INSERT(a.valeur)
VALUES(t.valeur);

-- Insertion des libellés longs
MERGE INTO G_GEO.TA_GEOTECH_LIBELLE_LONG a
USING(
    SELECT
        'Etude géotechnique préalable' AS valeur
    FROM DUAL
    UNION ALL
    SELECT
        'Etude géotechnique de conception' AS valeur
    FROM DUAL
    UNION ALL
    SELECT
        'Etude et suivi géotechnique d''exécution' AS valeur
    FROM DUAL
    UNION ALL
    SELECT
        'Supervision géotechnique d''exécution' AS valeur
    FROM DUAL
    UNION ALL
    SELECT
        'Diagnostic géotechnique' AS valeur
    FROM DUAL
    UNION ALL
    SELECT
        'Etude géotechnique préliminaire' AS valeur
    FROM DUAL
    UNION ALL
    SELECT
        'Etude géotechnique d''avant-projet' AS valeur
    FROM DUAL
    UNION ALL
    SELECT
        'Compte-rendu d''exécution (rapport factuel) de sondages et essais' AS valeur
    FROM DUAL
    UNION ALL
    SELECT
        'Etude et prospections pour la recherche et la reconnaissance des carrières souterrainnes ou catiches' AS valeur
    FROM DUAL
    UNION ALL
    SELECT
        'Etude de la pollution des sols et des nappes' AS valeur
    FROM DUAL
    UNION ALL
    SELECT
        'Compte-rendu de pose de piézomètres pour le suivi des niveaux d''eau' AS valeur
    FROM DUAL
    UNION ALL
    SELECT
        'Etude de caractérisation de zone humide' AS valeur
    FROM DUAL
    UNION ALL
    SELECT
        'Phase étude de site' AS valeur
    FROM DUAL
    UNION ALL
    SELECT
        'Phase principes généraux de construction' AS valeur
    FROM DUAL
    UNION ALL
    SELECT
        'Phase étude de site et principes généraux de construction' AS valeur
    FROM DUAL
    UNION ALL
    SELECT
        'Phase avant-projet' AS valeur
    FROM DUAL
    UNION ALL
    SELECT
        'Phase projet' AS valeur
    FROM DUAL
    UNION ALL
    SELECT
        'Phase réalisation du projet' AS valeur
    FROM DUAL
    
)t
ON (UPPER(a.valeur) = UPPER(t.valeur))
WHEN NOT MATCHED THEN
INSERT(a.valeur)
VALUES(t.valeur);

-- Insertion des relations familles / libellés longs
MERGE INTO G_GEO.TA_GEOTECH_FAMILLE_LIBELLE_LONG a
USING(
    SELECT
        a.objectid AS fid_famille,
        b.objectid AS fid_libelle_long
    FROM
        G_GEO.TA_GEOTECH_FAMILLE a,
        G_GEO.TA_GEOTECH_LIBELLE_LONG b
    WHERE
        UPPER(a.valeur) = UPPER('Type d''études géotechniques')
        AND UPPER(b.valeur) IN(
                                UPPER('Etude géotechnique préalable'),
                                UPPER('Etude géotechnique de conception'),
                                UPPER('Etude et suivi géotechnique d''exécution'),
                                UPPER('Supervision géotechnique d''exécution'),
                                UPPER('Diagnostic géotechnique'),
                                UPPER('Etude géotechnique préliminaire'),
                                UPPER('Etude géotechnique d''avant-projet'),
                                UPPER('Compte-rendu d''exécution (rapport factuel) de sondages et essais'),
                                UPPER('Etude et prospections pour la recherche et la reconnaissance des carrières souterrainnes ou catiches'),
                                UPPER('Etude de la pollution des sols et des nappes'),
                                UPPER('Compte-rendu de pose de piézomètres pour le suivi des niveaux d''eau'),
                                UPPER('Etude de caractérisation de zone humide')
                            )
    UNION ALL
    SELECT
        a.objectid AS fid_famille,
        b.objectid AS fid_libelle_long
    FROM
        G_GEO.TA_GEOTECH_FAMILLE a,
        G_GEO.TA_GEOTECH_LIBELLE_LONG b
    WHERE
        UPPER(a.valeur) = UPPER('Phase d''études géotechniques')
        AND UPPER(b.valeur) IN(
                                UPPER('Phase étude de site'),
                                UPPER('Phase principes généraux de construction'),
                                UPPER('Phase étude de site et principes généraux de construction'),
                                UPPER('Phase avant-projet'),
                                UPPER('Phase projet'),
                                UPPER('Phase réalisation du projet')
                            )
)t
ON (a.fid_famille = t.fid_famille AND a.fid_libelle_long = t.fid_libelle_long)
WHEN NOT MATCHED THEN
INSERT(a.fid_famille, a.fid_libelle_long)
VALUES(t.fid_famille, t.fid_libelle_long);

-- Insertion des libellés courts
MERGE INTO G_GEO.TA_GEOTECH_LIBELLE_COURT a
USING(
    SELECT
        'G1' AS valeur
    FROM DUAL
    UNION ALL
    SELECT
        'G2' AS valeur
    FROM DUAL
    UNION ALL
    SELECT
        'G3' AS valeur
    FROM DUAL
    UNION ALL
    SELECT
        'G4' AS valeur
    FROM DUAL
    UNION ALL
    SELECT
        'G5' AS valeur
    FROM DUAL
    UNION ALL
    SELECT
        'G11' AS valeur
    FROM DUAL
    UNION ALL
    SELECT
        'G12' AS valeur
    FROM DUAL
    UNION ALL
    SELECT
        'ES' AS valeur
    FROM DUAL
    UNION ALL
    SELECT
        'PGC' AS valeur
    FROM DUAL
    UNION ALL
    SELECT
        'ES+PGC' AS valeur
    FROM DUAL
    UNION ALL
    SELECT
        'AVP' AS valeur
    FROM DUAL
    UNION ALL
    SELECT
        'PRO' AS valeur
    FROM DUAL
    UNION ALL
    SELECT
        'REPRO' AS valeur
    FROM DUAL
        UNION ALL
    SELECT
        'G0' AS valeur
    FROM DUAL
        UNION ALL
    SELECT
        'CARRIERES SOUT' AS valeur
    FROM DUAL
        UNION ALL
    SELECT
        'POLLUTION' AS valeur
    FROM DUAL
        UNION ALL
    SELECT
        'PIEZOS' AS valeur
    FROM DUAL
        UNION ALL
    SELECT
        'ZONES HUMIDES' AS valeur
    FROM DUAL
)t
ON (UPPER(a.valeur) = UPPER(t.valeur))
WHEN NOT MATCHED THEN
INSERT(a.valeur)
VALUES(t.valeur);

-- Insertion des relations libelles longs / libelles courts 
MERGE INTO G_GEO.TA_GEOTECH_RELATION_LIBELLE_LONG_COURT a
USING(
    SELECT
        a.objectid AS fid_libelle_long,
        b.objectid AS fid_libelle_court
    FROM
        G_GEO.TA_GEOTECH_LIBELLE_LONG a,
        G_GEO.TA_GEOTECH_LIBELLE_COURT b
    WHERE
        UPPER(a.valeur) = UPPER('Etude géotechnique préalable')
        AND UPPER(b.valeur) = UPPER('G1')
    UNION ALL
    SELECT
        a.objectid AS fid_libelle_long,
        b.objectid AS fid_libelle_court
    FROM
        G_GEO.TA_GEOTECH_LIBELLE_LONG a,
        G_GEO.TA_GEOTECH_LIBELLE_COURT b
    WHERE
        UPPER(a.valeur) = UPPER('Etude géotechnique de conception')
        AND UPPER(b.valeur) = UPPER('G2')
    UNION ALL
    SELECT
        a.objectid AS fid_libelle_long,
        b.objectid AS fid_libelle_court
    FROM
        G_GEO.TA_GEOTECH_LIBELLE_LONG a,
        G_GEO.TA_GEOTECH_LIBELLE_COURT b
    WHERE
        UPPER(a.valeur) = UPPER('Etude et suivi géotechnique d''exécution')
        AND UPPER(b.valeur) = UPPER('G3')
    UNION ALL
    SELECT
        a.objectid AS fid_libelle_long,
        b.objectid AS fid_libelle_court
    FROM
        G_GEO.TA_GEOTECH_LIBELLE_LONG a,
        G_GEO.TA_GEOTECH_LIBELLE_COURT b
    WHERE
        UPPER(a.valeur) = UPPER('Supervision géotechnique d''exécution')
        AND UPPER(b.valeur) = UPPER('G4')
    UNION ALL
    SELECT
        a.objectid AS fid_libelle_long,
        b.objectid AS fid_libelle_court
    FROM
        G_GEO.TA_GEOTECH_LIBELLE_LONG a,
        G_GEO.TA_GEOTECH_LIBELLE_COURT b
    WHERE
        UPPER(a.valeur) = UPPER('Diagnostic géotechnique')
        AND UPPER(b.valeur) = UPPER('G5')
    UNION ALL
    SELECT
        a.objectid AS fid_libelle_long,
        b.objectid AS fid_libelle_court
    FROM
        G_GEO.TA_GEOTECH_LIBELLE_LONG a,
        G_GEO.TA_GEOTECH_LIBELLE_COURT b
    WHERE
        UPPER(a.valeur) = UPPER('Etude géotechnique préliminaire')
        AND UPPER(b.valeur) = UPPER('G11')
   UNION ALL
    SELECT
        a.objectid AS fid_libelle_long,
        b.objectid AS fid_libelle_court
    FROM
        G_GEO.TA_GEOTECH_LIBELLE_LONG a,
        G_GEO.TA_GEOTECH_LIBELLE_COURT b
    WHERE
        UPPER(a.valeur) = UPPER('Etude géotechnique d''avant-projet')
        AND UPPER(b.valeur) = UPPER('G12')
    UNION ALL
    SELECT
        a.objectid AS fid_libelle_long,
        b.objectid AS fid_libelle_court
    FROM
        G_GEO.TA_GEOTECH_LIBELLE_LONG a,
        G_GEO.TA_GEOTECH_LIBELLE_COURT b
    WHERE
        UPPER(a.valeur) = UPPER('Compte-rendu d''exécution (rapport factuel) de sondages et essais')
        AND UPPER(b.valeur) = UPPER('G0')
    UNION ALL
    SELECT
        a.objectid AS fid_libelle_long,
        b.objectid AS fid_libelle_court
    FROM
        G_GEO.TA_GEOTECH_LIBELLE_LONG a,
        G_GEO.TA_GEOTECH_LIBELLE_COURT b
    WHERE
        UPPER(a.valeur) = UPPER('Etude et prospections pour la recherche et la reconnaissance des carrières souterrainnes ou catiches')
        AND UPPER(b.valeur) = UPPER('CARRIERES SOUT')
    UNION ALL
    SELECT
        a.objectid AS fid_libelle_long,
        b.objectid AS fid_libelle_court
    FROM
        G_GEO.TA_GEOTECH_LIBELLE_LONG a,
        G_GEO.TA_GEOTECH_LIBELLE_COURT b
    WHERE
        UPPER(a.valeur) = UPPER('Etude de la pollution des sols et des nappes')
        AND UPPER(b.valeur) = UPPER('POLLUTION')
    UNION ALL
    SELECT
        a.objectid AS fid_libelle_long,
        b.objectid AS fid_libelle_court
    FROM
        G_GEO.TA_GEOTECH_LIBELLE_LONG a,
        G_GEO.TA_GEOTECH_LIBELLE_COURT b
    WHERE
        UPPER(a.valeur) = UPPER('Compte-rendu de pose de piézomètres pour le suivi des niveaux d''eau')
        AND UPPER(b.valeur) = UPPER('PIEZOS')
    UNION ALL
    SELECT
        a.objectid AS fid_libelle_long,
        b.objectid AS fid_libelle_court
    FROM
        G_GEO.TA_GEOTECH_LIBELLE_LONG a,
        G_GEO.TA_GEOTECH_LIBELLE_COURT b
    WHERE
        UPPER(a.valeur) = UPPER('Etude de caractérisation de zone humide')
        AND UPPER(b.valeur) = UPPER('ZONES HUMIDES')
    UNION ALL
    SELECT
        a.objectid AS fid_libelle_long,
        b.objectid AS fid_libelle_court
    FROM
        G_GEO.TA_GEOTECH_LIBELLE_LONG a,
        G_GEO.TA_GEOTECH_LIBELLE_COURT b
    WHERE
        UPPER(a.valeur) = UPPER('Phase étude de site')
        AND UPPER(b.valeur) = UPPER('ES')
    UNION ALL
    SELECT
        a.objectid AS fid_libelle_long,
        b.objectid AS fid_libelle_court
    FROM
        G_GEO.TA_GEOTECH_LIBELLE_LONG a,
        G_GEO.TA_GEOTECH_LIBELLE_COURT b
    WHERE
        UPPER(a.valeur) = UPPER('Phase principes généraux de construction')
        AND UPPER(b.valeur) = UPPER('PGC')
    UNION ALL
    SELECT
        a.objectid AS fid_libelle_long,
        b.objectid AS fid_libelle_court
    FROM
        G_GEO.TA_GEOTECH_LIBELLE_LONG a,
        G_GEO.TA_GEOTECH_LIBELLE_COURT b
    WHERE
        UPPER(a.valeur) = UPPER('Phase étude de site et principes généraux de construction')
        AND UPPER(b.valeur) = UPPER('ES+PGC')
    UNION ALL
    SELECT
        a.objectid AS fid_libelle_long,
        b.objectid AS fid_libelle_court
    FROM
        G_GEO.TA_GEOTECH_LIBELLE_LONG a,
        G_GEO.TA_GEOTECH_LIBELLE_COURT b
    WHERE
        UPPER(a.valeur) = UPPER('Phase avant-projet')
        AND UPPER(b.valeur) = UPPER('AVP')
    UNION ALL
    SELECT
        a.objectid AS fid_libelle_long,
        b.objectid AS fid_libelle_court
    FROM
        G_GEO.TA_GEOTECH_LIBELLE_LONG a,
        G_GEO.TA_GEOTECH_LIBELLE_COURT b
    WHERE
        UPPER(a.valeur) = UPPER('Phase projet')
        AND UPPER(b.valeur) = UPPER('PRO')
    UNION ALL
    SELECT
        a.objectid AS fid_libelle_long,
        b.objectid AS fid_libelle_court
    FROM
        G_GEO.TA_GEOTECH_LIBELLE_LONG a,
        G_GEO.TA_GEOTECH_LIBELLE_COURT b
    WHERE
        UPPER(a.valeur) = UPPER('Phase réalisation du projet')
        AND UPPER(b.valeur) = UPPER('REPRO')    
)t
ON (a.fid_libelle_long = t.fid_libelle_long AND a.fid_libelle_court = t.fid_libelle_court)
WHEN NOT MATCHED THEN
INSERT(a.fid_libelle_long, a.fid_libelle_court)
VALUES(t.fid_libelle_long, t.fid_libelle_court);

-- Insertion des libelles
MERGE INTO G_GEO.TA_GEOTECH_LIBELLE a
USING(
    SELECT
        objectid AS fid_libelle_long
    FROM
        G_GEO.TA_GEOTECH_LIBELLE_LONG
)t
ON (a.fid_libelle_long = t.fid_libelle_long)
WHEN NOT MATCHED THEN
INSERT(a.fid_libelle_long)
VALUES(t.fid_libelle_long);

ALTER TABLE G_GEO.TA_GEOTECH_LIBELLE DROP CONSTRAINT TA_GEOTECH_LIBELLE_FID_LIBELLE_LONG_FK;
ALTER TABLE G_GEO.TA_GEOTECH_LIBELLE
ADD CONSTRAINT TA_GEOTECH_LIBELLE_FID_LIBELLE_LONG_FK
FOREIGN KEY("FID_LIBELLE_LONG")
REFERENCES G_GEO.TA_GEOTECH_LIBELLE_LONG("OBJECTID");

-- Insertion des sites
MERGE INTO G_GEO.TA_GEOTECH_SITE a
USING(
    SELECT
        MDSYS.SDO_GEOMETRY(2001, 2154, MDSYS.SDO_POINT_TYPE(712887.53, 7067824.13, NULL), NULL, NULL) AS geom,
        '115 rue DELESPAUL' AS adresse
    FROM DUAL
    UNION ALL
    SELECT
        MDSYS.SDO_GEOMETRY(2001, 2154, MDSYS.SDO_POINT_TYPE(713369.01, 7066038.35, NULL), NULL, NULL) AS geom,
        '14 place du général Faidherbe' AS adresse
    FROM DUAL
    UNION ALL
    SELECT
        MDSYS.SDO_GEOMETRY(2001, 2154, MDSYS.SDO_POINT_TYPE(711691.1, 7068864.8, NULL), NULL, NULL) AS geom,
        '22 avenue Alfred Lefrançois' AS adresse
    FROM DUAL
    UNION ALL
    SELECT
        MDSYS.SDO_GEOMETRY(2001, 2154, MDSYS.SDO_POINT_TYPE(707956.2, 7064582.5, NULL), NULL, NULL) AS geom,
        'Avenue de la Marne' AS adresse
    FROM DUAL
    UNION ALL
    SELECT
        MDSYS.SDO_GEOMETRY(2001, 2154, MDSYS.SDO_POINT_TYPE(698259.3, 7061870.7, NULL), NULL, NULL) AS geom,
        'Rue du grand but' AS adresse
    FROM DUAL
    UNION ALL
    SELECT
        MDSYS.SDO_GEOMETRY(2001, 2154, MDSYS.SDO_POINT_TYPE(709253.86, 7066681.05, NULL), NULL, NULL) AS geom,
        '34 rue de Lille' AS adresse
    FROM DUAL
)t
ON (UPPER(a.adresse) = UPPER(t.adresse))
WHEN NOT MATCHED THEN
INSERT(a.geom, a.adresse)
VALUES(t.geom, t.adresse);

-- Insertion des études
MERGE INTO G_GEO.TA_GEOTECH_ETUDE a
USING(
    SELECT
        2021 AS annee_creation,
        'Restructuration du bâtiment SOPURA' AS description,
        a.objectid AS fid_type_etude,
        e.objectid AS fid_phase_etude
    FROM
        G_GEO.TA_GEOTECH_LIBELLE a
        INNER JOIN G_GEO.TA_GEOTECH_LIBELLE_LONG b ON b.objectid = a.fid_libelle_long
        INNER JOIN G_GEO.TA_GEOTECH_RELATION_LIBELLE_LONG_COURT c ON c.fid_libelle_long = b.objectid
        INNER JOIN G_GEO.TA_GEOTECH_LIBELLE_COURT d ON d.objectid = c.fid_libelle_court,
        G_GEO.TA_GEOTECH_LIBELLE e
        INNER JOIN G_GEO.TA_GEOTECH_LIBELLE_LONG f ON f.objectid = e.fid_libelle_long
        INNER JOIN G_GEO.TA_GEOTECH_RELATION_LIBELLE_LONG_COURT g ON g.fid_libelle_long = f.objectid
        INNER JOIN G_GEO.TA_GEOTECH_LIBELLE_COURT h ON h.objectid = g.fid_libelle_court
    WHERE
        d.valeur = 'G2'
        AND h.valeur = 'AVP'
    UNION ALL
    SELECT
        2018 AS annee_creation,
        'Justification des fondations existantes du bâtiment HALL B' AS description,
        a.objectid AS fid_type_etude,
        TO_NUMBER('') AS fid_phase_etude
    FROM
        G_GEO.TA_GEOTECH_LIBELLE a
        INNER JOIN G_GEO.TA_GEOTECH_LIBELLE_LONG b ON b.objectid = a.fid_libelle_long
        INNER JOIN G_GEO.TA_GEOTECH_RELATION_LIBELLE_LONG_COURT c ON c.fid_libelle_long = b.objectid
        INNER JOIN G_GEO.TA_GEOTECH_LIBELLE_COURT d ON d.objectid = c.fid_libelle_court
    WHERE
        d.valeur = 'G5'
    UNION ALL
    SELECT
        2018 AS annee_creation,
        'Construction d''un parking relais en superstructures' AS description,
        a.objectid AS fid_type_etude,
        e.objectid AS fid_phase_etude
    FROM
        G_GEO.TA_GEOTECH_LIBELLE a
        INNER JOIN G_GEO.TA_GEOTECH_LIBELLE_LONG b ON b.objectid = a.fid_libelle_long
        INNER JOIN G_GEO.TA_GEOTECH_RELATION_LIBELLE_LONG_COURT c ON c.fid_libelle_long = b.objectid
        INNER JOIN G_GEO.TA_GEOTECH_LIBELLE_COURT d ON d.objectid = c.fid_libelle_court,
        G_GEO.TA_GEOTECH_LIBELLE e
        INNER JOIN G_GEO.TA_GEOTECH_LIBELLE_LONG f ON f.objectid = e.fid_libelle_long
        INNER JOIN G_GEO.TA_GEOTECH_RELATION_LIBELLE_LONG_COURT g ON g.fid_libelle_long = f.objectid
        INNER JOIN G_GEO.TA_GEOTECH_LIBELLE_COURT h ON h.objectid = g.fid_libelle_court
    WHERE
        d.valeur = 'G2'
        AND h.valeur = 'PRO'
    UNION ALL
    SELECT
        2018 AS annee_creation,
        'parking relais Cerisaie' AS description,
        a.objectid AS fid_type_etude,
        TO_NUMBER('') AS fid_phase_etude
    FROM
        G_GEO.TA_GEOTECH_LIBELLE a
        INNER JOIN G_GEO.TA_GEOTECH_LIBELLE_LONG b ON b.objectid = a.fid_libelle_long
        INNER JOIN G_GEO.TA_GEOTECH_RELATION_LIBELLE_LONG_COURT c ON c.fid_libelle_long = b.objectid
        INNER JOIN G_GEO.TA_GEOTECH_LIBELLE_COURT d ON d.objectid = c.fid_libelle_court
    WHERE
        d.valeur = 'G0'
    UNION ALL
    SELECT
        2016 AS annee_creation,
        'Construction d''une ombrière photovoltaïque sur le parking relais' AS description,
        a.objectid AS fid_type_etude,
        e.objectid AS fid_phase_etude
    FROM
        G_GEO.TA_GEOTECH_LIBELLE a
        INNER JOIN G_GEO.TA_GEOTECH_LIBELLE_LONG b ON b.objectid = a.fid_libelle_long
        INNER JOIN G_GEO.TA_GEOTECH_RELATION_LIBELLE_LONG_COURT c ON c.fid_libelle_long = b.objectid
        INNER JOIN G_GEO.TA_GEOTECH_LIBELLE_COURT d ON d.objectid = c.fid_libelle_court,
        G_GEO.TA_GEOTECH_LIBELLE e
        INNER JOIN G_GEO.TA_GEOTECH_LIBELLE_LONG f ON f.objectid = e.fid_libelle_long
        INNER JOIN G_GEO.TA_GEOTECH_RELATION_LIBELLE_LONG_COURT g ON g.fid_libelle_long = f.objectid
        INNER JOIN G_GEO.TA_GEOTECH_LIBELLE_COURT h ON h.objectid = g.fid_libelle_court
    WHERE
        d.valeur = 'G2'
        AND h.valeur = 'AVP'
    UNION ALL
    SELECT
        2021 AS annee_creation,
        'Aménagement de la cour Paux' AS description,
        a.objectid AS fid_type_etude,
        TO_NUMBER('') AS fid_phase_etude
    FROM
        G_GEO.TA_GEOTECH_LIBELLE a
        INNER JOIN G_GEO.TA_GEOTECH_LIBELLE_LONG b ON b.objectid = a.fid_libelle_long
        INNER JOIN G_GEO.TA_GEOTECH_RELATION_LIBELLE_LONG_COURT c ON c.fid_libelle_long = b.objectid
        INNER JOIN G_GEO.TA_GEOTECH_LIBELLE_COURT d ON d.objectid = c.fid_libelle_court
    WHERE
        d.valeur = 'G0'
)t
ON (
        UPPER(a.description) = UPPER(t.description) 
        AND a.fid_type_etude = t.fid_type_etude
        AND a.fid_phase_etude = t.fid_phase_etude
    )
WHEN NOT MATCHED THEN
INSERT(a.annee_creation, a.description, a.fid_type_etude, a.fid_phase_etude)
VALUES(t.annee_creation, t.description, t.fid_type_etude, t.fid_phase_etude);

-- Insertion des bureaux d'étude
MERGE INTO G_GEO.TA_GEOTECH_BUREAU_ETUDE a
USING(
    SELECT
        'FONDASOL' AS nom,
        a.objectid AS fid_etude
    FROM
        G_GEO.TA_GEOTECH_ETUDE a
)t
ON (
    UPPER(a.nom) = UPPER(t.nom)
    AND a.fid_etude = t.fid_etude)
WHEN NOT MATCHED THEN
INSERT(a.nom, a.fid_etude)
VALUES(t.nom, t.fid_etude);

COMMIT;