/*
Création de la vue V_GEOTECH_VISUALISATION_SITE_ETUDE permettant de visualiser toutes les informations de chaque étude géotechnique
*/

-- 1. Création de la vue
CREATE OR REPLACE FORCE VIEW "G_GEO"."V_GEOTECH_VISUALISATION_SITE_ETUDE" (OBJECTID, ID_SITE, DESCRIPTION_ETUDE, ADRESSE_SITE, INSEE_SITE, X_EPSG2154, Y_EPSG2154, REFERENCE_INTERNE_ETUDE, TYPE_ETUDE_LONG, TYPE_ETUDE_COURT, DATE_DEBUT_ETUDE, DATE_FIN_ETUDE, NOM_BUREAU_ETUDE, GEOM,
    CONSTRAINT "V_GEOTECH_VISUALISATION_SITE_ETUDE_PK" PRIMARY KEY ("ID_SITE") DISABLE) AS 
SELECT
    rownum AS objectid,
    a.objectid AS id_site,
    a.description AS description_etude,
    a.adresse AS adresse_site,
    a.code_insee AS insee_site,
    a.x_epsg2154,
    a.y_epsg2154,
    c.reference_interne AS reference_interne_etude,
    d.libelle_long AS type_etude_long,
    d.libelle_court AS type_etude_court,
    c.date_debut AS date_debut_etude,
    c.date_fin AS date_fin_etude,
    e.nom AS nom_bureau_etude,
    a.geom
FROM
    G_GEO.TA_GEOTECH_SITE a
    RIGHT JOIN G_GEO.TA_GEOTECH_RELATION_SITE_ETUDE b ON b.fid_site = a.objectid
    INNER JOIN G_GEO.TA_GEOTECH_ETUDE c ON c.objectid = b.fid_etude
    INNER JOIN G_GEO.TA_GEOTECH_LIBELLE d ON d.objectid = c.fid_type_etude
    INNER JOIN G_GEO.TA_GEOTECH_BUREAU_ETUDE e ON e.fid_etude = c.objectid;
    
-- 2. Création des commentaires
COMMENT ON TABLE "G_GEO"."V_GEOTECH_VISUALISATION_SITE_ETUDE"  IS 'Vue proposant les sites, études et bureaux d''étude du projet GEOTECH.';
COMMENT ON COLUMN "G_GEO"."V_GEOTECH_VISUALISATION_SITE_ETUDE"."OBJECTID" IS 'Identifiant de chaque entité de la vue.';
COMMENT ON COLUMN "G_GEO"."V_GEOTECH_VISUALISATION_SITE_ETUDE"."ID_SITE" IS 'Identifiant de chaque site.';
COMMENT ON COLUMN "G_GEO"."V_GEOTECH_VISUALISATION_SITE_ETUDE"."DESCRIPTION_ETUDE" IS 'Description des études auxquelles chaque site est lié.';
COMMENT ON COLUMN "G_GEO"."V_GEOTECH_VISUALISATION_SITE_ETUDE"."ADRESSE_SITE" IS 'Adresse de chaque site.';
COMMENT ON COLUMN "G_GEO"."V_GEOTECH_VISUALISATION_SITE_ETUDE"."INSEE_SITE" IS 'Code INSEE de la commune d''appartenance de chaque site.';
COMMENT ON COLUMN "G_GEO"."V_GEOTECH_VISUALISATION_SITE_ETUDE"."X_EPSG2154" IS 'Coordonnées en X de chaque site en Lambert93/RGF-93.';
COMMENT ON COLUMN "G_GEO"."V_GEOTECH_VISUALISATION_SITE_ETUDE"."Y_EPSG2154" IS 'Coordonnées en Y de chaque site en Lambert93/RGF-93.';
COMMENT ON COLUMN "G_GEO"."V_GEOTECH_VISUALISATION_SITE_ETUDE"."REFERENCE_INTERNE_ETUDE" IS 'Référence interne de chaque étude.';
COMMENT ON COLUMN "G_GEO"."V_GEOTECH_VISUALISATION_SITE_ETUDE"."TYPE_ETUDE_LONG" IS 'Type d''étude (libellé long).';
COMMENT ON COLUMN "G_GEO"."V_GEOTECH_VISUALISATION_SITE_ETUDE"."TYPE_ETUDE_COURT" IS 'Type d''étude (libellé court).';
COMMENT ON COLUMN "G_GEO"."V_GEOTECH_VISUALISATION_SITE_ETUDE"."DATE_DEBUT_ETUDE" IS 'Année de début de l''étude.';
COMMENT ON COLUMN "G_GEO"."V_GEOTECH_VISUALISATION_SITE_ETUDE"."DATE_FIN_ETUDE" IS 'Année de fin de l''étude.';
COMMENT ON COLUMN "G_GEO"."V_GEOTECH_VISUALISATION_SITE_ETUDE"."NOM_BUREAU_ETUDE" IS 'Nom du bureau d''étude ayant réalisé l''étude.';
COMMENT ON COLUMN "G_GEO"."V_GEOTECH_VISUALISATION_SITE_ETUDE"."GEOM" IS 'Géométrie des sites de type ponctuel.';

-- 3. Création des métadonnées spatiales
INSERT INTO USER_SDO_GEOM_METADATA(
    TABLE_NAME, 
    COLUMN_NAME, 
    DIMINFO, 
    SRID
)
VALUES(
    'V_GEOTECH_VISUALISATION_SITE_ETUDE',
    'GEOM',
    SDO_DIM_ARRAY(SDO_DIM_ELEMENT('X', 684540, 719822.2, 0.005),SDO_DIM_ELEMENT('Y', 7044212, 7078072, 0.005)), 
    2154
);
COMMIT;

-- 4. Création des droits
GRANT SELECT ON G_GEO.V_GEOTECH_VISUALISATION_SITE_ETUDE TO G_ADMIN_SIG;

/

