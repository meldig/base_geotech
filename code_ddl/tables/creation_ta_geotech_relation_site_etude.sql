/*
TA_GEOTECH_RELATION_SITE_ETUDE : Création de la table TA_GEOTECH_RELATION_SITE_ETUDE contenant les identifiant des tables TA_GEOTECH_RELATION_SITE_ETUDE et TA_GEOTECH_FAMILLE, permettant de joindre chaque libellé long à sa famille de libellés.
*/

-- 1. La table
CREATE TABLE G_GEO.TA_GEOTECH_RELATION_SITE_ETUDE (
	"OBJECTID" NUMBER(38,0) GENERATED BY DEFAULT AS IDENTITY,
	"FID_SITE" NUMBER(38,0) NOT NULL,
	"FID_ETUDE" NUMBER(38,0) NOT NULL
 );

-- 2. Les commentaires
COMMENT ON TABLE G_GEO.TA_GEOTECH_RELATION_SITE_ETUDE IS 'Table pivot permettant d''associer : un site à une ou plusieurs études - une étude à un ou plusieurs bureaux d''étude.';
COMMENT ON COLUMN G_GEO.TA_GEOTECH_RELATION_SITE_ETUDE.OBJECTID IS 'Clé primaire auto-incrémentée de la table.';
COMMENT ON COLUMN G_GEO.TA_GEOTECH_RELATION_SITE_ETUDE.FID_SITE IS 'Clé étrangère vers la table TA_GEOTECH_SITE permettant d''associer un site à une ou plusieurs études et un ou plusieurs bureau d''étude.';
COMMENT ON COLUMN G_GEO.TA_GEOTECH_RELATION_SITE_ETUDE.FID_ETUDE IS 'Clé étrangère vers la table TA_GEOTECH_ETUDE, permettant d''associer une ou plusieurs études à un site et un ou plusieurs bureaux d''étude.';

-- 3. Les contraintes
-- Contrainte de clé primaire
ALTER TABLE G_GEO.TA_GEOTECH_RELATION_SITE_ETUDE
ADD CONSTRAINT TA_GEOTECH_RELATION_SITE_ETUDE_PK
PRIMARY KEY("OBJECTID")
USING INDEX TABLESPACE G_ADT_INDX;

-- Contraintes de clés étrangères
ALTER TABLE G_GEO.TA_GEOTECH_RELATION_SITE_ETUDE
ADD CONSTRAINT TA_GEOTECH_RELATION_SITE_ETUDE_FID_ETUDE_FK
FOREIGN KEY("FID_ETUDE")
REFERENCES G_GEO.TA_GEOTECH_ETUDE("OBJECTID");

ALTER TABLE G_GEO.TA_GEOTECH_RELATION_SITE_ETUDE
ADD CONSTRAINT TA_GEOTECH_RELATION_SITE_ETUDE_FID_SITE_FK
FOREIGN KEY("FID_SITE")
REFERENCES G_GEO.TA_GEOTECH_SITE("OBJECTID")
ON DELETE CASCADE;

-- 4. Les index
CREATE INDEX TA_GEOTECH_RELATION_SITE_ETUDE_FID_SITE_IDX ON G_GEO.TA_GEOTECH_RELATION_SITE_ETUDE("FID_SITE")
    TABLESPACE G_ADT_INDX;
    
CREATE INDEX TA_GEOTECH_RELATION_SITE_ETUDE_FID_ETUDE_IDX ON G_GEO.TA_GEOTECH_RELATION_SITE_ETUDE("FID_ETUDE")
    TABLESPACE G_ADT_INDX;

-- 5. Les droits de lecture, écriture, suppression
GRANT SELECT ON G_GEO.TA_GEOTECH_RELATION_SITE_ETUDE TO G_ADMIN_SIG;

/

