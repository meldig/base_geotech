/*
TA_GEOTECH_FAMILLE : Création de la table TA_GEOTECH_FAMILLE qui contient les familles des objets liées aux études géotechniques.
*/

-- 1. La table
CREATE TABLE G_GEO.TA_GEOTECH_FAMILLE (
	"OBJECTID" NUMBER(38,0) DEFAULT G_GEO.SEQ_TA_GEOTECH_FAMILLE_OBJECTID.NEXTVAL NOT NULL,
	"VALEUR" VARCHAR2(255 BYTE)
 );

-- 2. Les commentaires
 COMMENT ON TABLE G_GEO.TA_GEOTECH_FAMILLE IS 'Table contenant les familles de libellés permettant de qualifier les objets du schéma G_GEOTECH.';
COMMENT ON COLUMN G_GEO.TA_GEOTECH_FAMILLE.OBJECTID IS 'Identifiant de chaque famille de libellés.';
COMMENT ON COLUMN G_GEO.TA_GEOTECH_FAMILLE.VALEUR IS 'Valeur de chaque famille de libellés.';

-- 3. Les contraintes
-- Contrainte de clé primaire
ALTER TABLE G_GEO.TA_GEOTECH_FAMILLE
ADD CONSTRAINT TA_GEOTECH_FAMILLE_PK
PRIMARY KEY("OBJECTID")
USING INDEX TABLESPACE G_ADT_INDX;

-- Contraintes d'unicité
ALTER TABLE G_GEO.TA_GEOTECH_FAMILLE
ADD CONSTRAINT TA_GEOTECH_FAMILLE_LIBELLE_UN
UNIQUE("VALEUR")
USING INDEX TABLESPACE G_ADT_INDX;

-- 5. Les droits de lecture, écriture, suppression
GRANT SELECT ON G_GEO.TA_GEOTECH_FAMILLE TO G_ADMIN_SIG;

/

