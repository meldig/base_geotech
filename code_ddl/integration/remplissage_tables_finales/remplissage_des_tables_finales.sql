/*
Remplissage des tables finales
*/

-- Insertion des familles
MERGE INTO G_GEO.TA_GEOTECH_FAMILLE a
USING(
    SELECT
        'Type d''études géotechniques' AS valeur
    FROM DUAL
)t
ON (UPPER(a.valeur) = UPPER(t.valeur))
WHEN NOT MATCHED THEN
INSERT(a.valeur)
VALUES(t.valeur);

-- Insertion des libellés longs
MERGE INTO G_GEO.TA_GEOTECH_LIBELLE a
USING(
    SELECT 
        'Etude géotechnique préalable G1 - Phase étude de site' AS libelle_long,
        'G1 ES' AS LIBELLE_COURT
    FROM DUAL
    UNION ALL
    SELECT 
        'Etude géotechnique préalable G1 - Phase principes généraux de construction' AS libelle_long,
        'G1 PGC' AS LIBELLE_COURT
    FROM DUAL
    UNION ALL
    SELECT 
        'Etude géotechnique préalable G1 - Phase étude de site et principes généraux de construction' AS libelle_long,
        'G1 ES+PGC' AS LIBELLE_COURT
    FROM DUAL
    UNION ALL
    SELECT 
        'Etude géotechnique de conception G2 - Phase avant-projet' AS libelle_long,
        'G2 AVP' AS LIBELLE_COURT
    FROM DUAL
    UNION ALL
    SELECT 
        'Etude géotechnique de conception G2 - Phase projet' AS libelle_long,
        'G2 PRO' AS LIBELLE_COURT
    FROM DUAL
    UNION ALL
    SELECT 
        'Etude et suivi géotechnique d''exécution G3 - Phase réalisation du projet' AS libelle_long,
        'G3' AS LIBELLE_COURT
    FROM DUAL
    UNION ALL
    SELECT 
        'Supervision géotechnique d''exécution G4 - Phase réalisation du projet' AS libelle_long,
        'G4' AS LIBELLE_COURT
    FROM DUAL
    UNION ALL
    SELECT 
        'Diagnostic géotechnique G5' AS libelle_long,
        'G5' AS LIBELLE_COURT
    FROM DUAL
    UNION ALL
    SELECT 
        'Etude géotechnique préliminaire G11 (ancienne norme)' AS libelle_long,
        'G11' AS LIBELLE_COURT
    FROM DUAL
    UNION ALL
    SELECT 
        'Etude géotechnique d''avant-projet G12 (ancienne norme)' AS libelle_long,
        'G12' AS LIBELLE_COURT
    FROM DUAL
    UNION ALL
    SELECT 
        'Compte-rendu d''exécution (rapport factuel) de sondages et essais' AS libelle_long,
        'G0' AS LIBELLE_COURT
    FROM DUAL
    UNION ALL
    SELECT 
        'Etude et prospections pour la recherche et la reconnaissance des carrières souterrainnes ou catiches' AS libelle_long,
        'CARRIERES SOUT' AS LIBELLE_COURT
    FROM DUAL
    UNION ALL
    SELECT 
        'Etude de la pollution des sols et des nappes' AS libelle_long,
        'POLLUTION' AS LIBELLE_COURT
    FROM DUAL
    UNION ALL
    SELECT 
        'Compte-rendu de pose de piézomètres pour le suivi des niveaux d''eau' AS libelle_long,
        'PIEZOS' AS LIBELLE_COURT
    FROM DUAL
    UNION ALL
    SELECT 
        'Etude de caractérisation de zone humide' AS libelle_long,
        'ZONES HUMIDES' AS LIBELLE_COURT
    FROM DUAL    
)t
ON (
    UPPER(a.libelle_long) = UPPER(t.libelle_long)
    AND UPPER(a.libelle_court) = UPPER(t.libelle_court)
    )
WHEN NOT MATCHED THEN
INSERT(a.libelle_long, a.libelle_court)
VALUES(t.libelle_long, t.libelle_court);

-- Insertion des relations familles / libellés longs
MERGE INTO G_GEO.TA_GEOTECH_FAMILLE_LIBELLE a
USING(
    SELECT
        a.objectid AS fid_famille,
        b.objectid AS fid_libelle
    FROM
        G_GEO.TA_GEOTECH_FAMILLE a,
        G_GEO.TA_GEOTECH_LIBELLE b
    WHERE
        UPPER(a.valeur) = UPPER('Type d''études géotechniques')
        AND UPPER(b.libelle_long) IN(
                                UPPER('Etude géotechnique préalable G1 - Phase étude de site'),
                                UPPER('Etude géotechnique préalable G1 - Phase principes généraux de construction'),
                                UPPER('Etude géotechnique préalable G1 - Phase étude de site et principes généraux de construction'),
                                UPPER('Etude géotechnique de conception G2 - Phase avant-projet'),
                                UPPER('Etude géotechnique de conception G2 - Phase projet'),
                                UPPER('Etude et suivi géotechnique d''exécution G3 - Phase réalisation du projet'),
                                UPPER('Supervision géotechnique d''exécution G4 - Phase réalisation du projet'),
                                UPPER('Diagnostic géotechnique G5'),
                                UPPER('Etude géotechnique préliminaire G11 (ancienne norme)'),
                                UPPER('Etude géotechnique d''avant-projet G12 (ancienne norme)'),
                                UPPER('Compte-rendu d''exécution (rapport factuel) de sondages et essais'),
                                UPPER('Etude et prospections pour la recherche et la reconnaissance des carrières souterrainnes ou catiches'),
                                UPPER('Etude de la pollution des sols et des nappes'),
                                UPPER('Compte-rendu de pose de piézomètres pour le suivi des niveaux d''eau'),
                                UPPER('Etude de caractérisation de zone humide')
                            )
)t
ON (a.fid_famille = t.fid_famille AND a.fid_libelle = t.fid_libelle)
WHEN NOT MATCHED THEN
INSERT(a.fid_famille, a.fid_libelle)
VALUES(t.fid_famille, t.fid_libelle);

-- Insertion des sites
MERGE INTO G_GEO.TA_GEOTECH_SITE a
USING(
    SELECT
        MDSYS.SDO_GEOMETRY(2001, 2154, MDSYS.SDO_POINT_TYPE(712887.53, 7067824.13, NULL), NULL, NULL) AS geom,
        '115 rue DELESPAUL' AS adresse,
        'Restructuration du bâtiment SOPURA' AS description
    FROM DUAL
    UNION ALL
    SELECT
        MDSYS.SDO_GEOMETRY(2001, 2154, MDSYS.SDO_POINT_TYPE(713369.01, 7066038.35, NULL), NULL, NULL) AS geom,
        '14 place du général Faidherbe' AS adresse,
        'Justification des fondations existantes du bâtiment HALL B' AS description
    FROM DUAL
    UNION ALL
    SELECT
        MDSYS.SDO_GEOMETRY(2001, 2154, MDSYS.SDO_POINT_TYPE(711691.1, 7068864.8, NULL), NULL, NULL) AS geom,
        '22 avenue Alfred Lefrançois' AS adresse,
        'Construction d''un parking relais en superstructures' AS description
    FROM DUAL
    UNION ALL
    SELECT
        MDSYS.SDO_GEOMETRY(2001, 2154, MDSYS.SDO_POINT_TYPE(707956.2, 7064582.5, NULL), NULL, NULL) AS geom,
        'Avenue de la Marne' AS adresse,
        'parking relais Cerisaie' AS description
    FROM DUAL
    UNION ALL
    SELECT
        MDSYS.SDO_GEOMETRY(2001, 2154, MDSYS.SDO_POINT_TYPE(698259.3, 7061870.7, NULL), NULL, NULL) AS geom,
        'Rue du grand but' AS adresse,
        'Construction d''une ombrière photovoltaïque sur le parking relais' AS description
    FROM DUAL
    UNION ALL
    SELECT
        MDSYS.SDO_GEOMETRY(2001, 2154, MDSYS.SDO_POINT_TYPE(709253.86, 7066681.05, NULL), NULL, NULL) AS geom,
        '34 rue de Lille' AS adresse,
        'Aménagement de la cour Paux' AS description
    FROM DUAL
)t
ON (UPPER(a.adresse) = UPPER(t.adresse)
    AND UPPER(a.description) = UPPER(t.description)
    )
WHEN NOT MATCHED THEN
INSERT(a.geom, a.adresse, a.description)
VALUES(t.geom, t.adresse, t.description);

-- Insertion des études
MERGE INTO G_GEO.TA_GEOTECH_ETUDE a
USING(
    SELECT
        2021 AS annee_creation,
        a.objectid AS fid_type_etude
    FROM
        G_GEO.TA_GEOTECH_LIBELLE a
    WHERE
        UPPER(a.libelle_court) = UPPER('G2 AVP')
    UNION ALL
    SELECT
        2018 AS annee_creation,
        a.objectid AS fid_type_etude
    FROM
        G_GEO.TA_GEOTECH_LIBELLE a
    WHERE
        UPPER(a.libelle_court) = UPPER('G5')
    UNION ALL
    SELECT
        2018 AS annee_creation,
        a.objectid AS fid_type_etude
    FROM
        G_GEO.TA_GEOTECH_LIBELLE a
    WHERE
        UPPER(a.libelle_court) = UPPER('G2 PRO')
    UNION ALL
    SELECT
        2018 AS annee_creation,
        a.objectid AS fid_type_etude
    FROM
        G_GEO.TA_GEOTECH_LIBELLE a
    WHERE
        UPPER(a.libelle_court) = UPPER('G0')
    UNION ALL
    SELECT
        2016 AS annee_creation,
        a.objectid AS fid_type_etude
    FROM
        G_GEO.TA_GEOTECH_LIBELLE a
    WHERE
        UPPER(a.libelle_court) = UPPER('G2 AVP')
    UNION ALL
    SELECT
        2021 AS annee_creation,
        a.objectid AS fid_type_etude
    FROM
        G_GEO.TA_GEOTECH_LIBELLE a
    WHERE
        UPPER(a.libelle_court) = UPPER('G0')
)t
ON (
        UPPER(a.description) = UPPER(t.description) 
        AND a.fid_type_etude = t.fid_type_etude
    )
WHEN NOT MATCHED THEN
INSERT(a.annee_creation, a.fid_type_etude)
VALUES(t.annee_creation, t.fid_type_etude);

-- Insertion des relations sites/études
MERGE INTO G_GEO.TA_GEOTECH_RELATION_SITE_ETUDE a
USING(
    SELECT
        a.objectid AS id_site,
        b.objectid AS id_etude
    FROM
        G_GEO.TA_GEOTECH_SITE a,
        G_GEO.TA_GEOTECH_ETUDE b
        INNER JOIN G_GEO.TA_GEOTECH_LIBELLE c ON c.objectid = b.fid_type_etude
    WHERE
        UPPER(a.adresse) = UPPER('22 avenue Alfred Lefrançois')
        AND b.date_debut = 2021
        AND UPPER(c.libelle_court) = UPPER('G2 AVP')
    UNION ALL
    SELECT
        a.objectid AS id_site,
        b.objectid AS id_etude
    FROM
        G_GEO.TA_GEOTECH_SITE a,
        G_GEO.TA_GEOTECH_ETUDE b
        INNER JOIN G_GEO.TA_GEOTECH_LIBELLE c ON c.objectid = b.fid_type_etude
    WHERE
        UPPER(a.adresse) = UPPER('115 rue DELESPAUL')
        AND b.date_debut = 2018
        AND UPPER(c.libelle_court) = UPPER('G2 AVP')
    UNION ALL
    SELECT
        a.objectid AS id_site,
        b.objectid AS id_etude
    FROM
        G_GEO.TA_GEOTECH_SITE a,
        G_GEO.TA_GEOTECH_ETUDE b
        INNER JOIN G_GEO.TA_GEOTECH_LIBELLE c ON c.objectid = b.fid_type_etude
    WHERE
        UPPER(a.adresse) = UPPER('14 place du général Faidherbe')
        AND b.date_debut = 2018
        AND UPPER(c.libelle_court) = UPPER('G5')
    UNION ALL
    SELECT
        a.objectid AS id_site,
        b.objectid AS id_etude
    FROM
        G_GEO.TA_GEOTECH_SITE a,
        G_GEO.TA_GEOTECH_ETUDE b
        INNER JOIN G_GEO.TA_GEOTECH_LIBELLE c ON c.objectid = b.fid_type_etude
    WHERE
        UPPER(a.adresse) = UPPER('Avenue de la Marne')
        AND 
    UNION ALL
    SELECT
        a.objectid AS id_site,
        b.objectid AS id_etude
    FROM
        G_GEO.TA_GEOTECH_SITE a,
        G_GEO.TA_GEOTECH_ETUDE b
        INNER JOIN G_GEO.TA_GEOTECH_LIBELLE c ON c.objectid = b.fid_type_etude
    WHERE
        UPPER(a.adresse) = UPPER('Quai de la Deûle')
        AND 
    UNION ALL
    SELECT
        a.objectid AS id_site,
        b.objectid AS id_etude
    FROM
        G_GEO.TA_GEOTECH_SITE a,
        G_GEO.TA_GEOTECH_ETUDE b
        INNER JOIN G_GEO.TA_GEOTECH_LIBELLE c ON c.objectid = b.fid_type_etude
    WHERE
        UPPER(a.adresse) = UPPER('Rue du grand but')
        AND 
    UNION ALL
    SELECT
        a.objectid AS id_site,
        b.objectid AS id_etude
    FROM
        G_GEO.TA_GEOTECH_SITE a,
        G_GEO.TA_GEOTECH_ETUDE b
        INNER JOIN G_GEO.TA_GEOTECH_LIBELLE c ON c.objectid = b.fid_type_etude
    WHERE
        UPPER(a.adresse) = UPPER('34 rue de Lille')
        AND 
)t
ON (
    a.fid_site = t.id_site
    AND a.fid_etude = t.id_etude
    )
WHEN NOT MATCHED THEN
INSERT(a.fid_site, a.fid_etude)
VALUES(t.id_site, t.id_etude);

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