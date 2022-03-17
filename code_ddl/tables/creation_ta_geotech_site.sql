/*
TA_GEOTECH_SITE : Création de la table TA_GEOTECH_SITE regroupant tous les sites géotechniques.
*/

-- 1. La table
CREATE TABLE G_GEO.TA_GEOTECH_SITE (
    "OBJECTID" NUMBER(38,0) DEFAULT G_GEO.SEQ_TA_GEOTECH_SITE_OBJECTID.NEXTVAL NOT NULL,
    "GEOM" MDSYS.SDO_GEOMETRY,
    "CODE_INSEE" AS (TRIM(GET_CODE_INSEE_CONTAIN_POINT(geom))),
    "X_EPSG2154" AS (ROUND(GEOM.SDO_POINT.X,6)),
    "Y_EPSG2154" AS (ROUND(GEOM.SDO_POINT.Y,6)),
    "DESCRIPTION" VARCHAR2(4000),
    "ADRESSE" VARCHAR2(4000)
 );

-- 2. Les commentaires
COMMENT ON TABLE G_GEO.TA_GEOTECH_SITE IS 'Table  regroupant tous les sites géotechniques.';
COMMENT ON COLUMN G_GEO.TA_GEOTECH_SITE.OBJECTID IS 'Clé primaire auto-incrémentée de la table.';
COMMENT ON COLUMN G_GEO.TA_GEOTECH_SITE.GEOM IS 'Champ géométrique de type ponctuel de chaque site.';
COMMENT ON COLUMN G_GEO.TA_GEOTECH_SITE.CODE_INSEE IS 'Champ calculé, récupérant via une requête spatiale, le code INSEE de la commune d''appartenance de chaque site.';
COMMENT ON COLUMN G_GEO.TA_GEOTECH_SITE.X_EPSG2154 IS 'Champ calculé récupérant les coordonnées en X de chaque site en Lambert93/RGF-93.';
COMMENT ON COLUMN G_GEO.TA_GEOTECH_SITE.Y_EPSG2154 IS 'Champ calculé récupérant les coordonnées en Y de chaque site en Lambert93/RGF-93.';
COMMENT ON COLUMN G_GEO.TA_GEOTECH_SITE.DESCRIPTION IS 'Description des études auxquelles chaque site est lié.';
COMMENT ON COLUMN G_GEO.TA_GEOTECH_SITE.ADRESSE IS 'Adresse de chaque site.';

-- 3. Les métadonnées spatiales
INSERT INTO USER_SDO_GEOM_METADATA(
    TABLE_NAME, 
    COLUMN_NAME, 
    DIMINFO, 
    SRID
)
VALUES(
    'TA_GEOTECH_SITE',
    'GEOM',
    SDO_DIM_ARRAY(SDO_DIM_ELEMENT('X', 594000, 964000, 0.005),SDO_DIM_ELEMENT('Y', 6987000, 7165000, 0.005)), 
    2154
);
COMMIT;

-- 3. Les contraintes
-- Contrainte de clé primaire
ALTER TABLE G_GEO.TA_GEOTECH_SITE
ADD CONSTRAINT TA_GEOTECH_SITE_PK
PRIMARY KEY("OBJECTID")
USING INDEX TABLESPACE G_ADT_INDX;

-- 4. Les index
-- Index spatial
CREATE INDEX TA_GEOTECH_SITE_SIDX
ON G_GEO.TA_GEOTECH_SITE(GEOM)
INDEXTYPE IS MDSYS.SPATIAL_INDEX_V2
PARAMETERS('sdo_indx_dims=2, layer_gtype=POINT, tablespace=G_ADT_INDX, work_tablespace=DATA_TEMP');

-- Autres index
CREATE INDEX TA_GEOTECH_SITE_CODE_INSEE_IDX ON G_GEO.TA_GEOTECH_SITE("CODE_INSEE")
    TABLESPACE G_ADT_INDX;

CREATE INDEX TA_GEOTECH_SITE_X_EPSG2154_IDX ON G_GEO.TA_GEOTECH_SITE("X_EPSG2154")
    TABLESPACE G_ADT_INDX;

CREATE INDEX TA_GEOTECH_SITE_Y_EPSG2154_IDX ON G_GEO.TA_GEOTECH_SITE("Y_EPSG2154")
    TABLESPACE G_ADT_INDX;

CREATE INDEX TA_GEOTECH_SITE_ADRESSE_IDX ON G_GEO.TA_GEOTECH_SITE("ADRESSE")
    TABLESPACE G_ADT_INDX;

CREATE INDEX TA_GEOTECH_SITE_DESCRIPTION_IDX ON G_GEO.TA_GEOTECH_SITE("DESCRIPTION")
    TABLESPACE G_ADT_INDX;

-- 5. Les droits de lecture, écriture, suppression
GRANT SELECT ON G_GEO.TA_GEOTECH_SITE TO G_ADMIN_SIG;

/

