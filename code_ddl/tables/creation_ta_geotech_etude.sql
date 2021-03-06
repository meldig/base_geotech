/*
TA_GEOTECH_ETUDE : Création de la table TA_GEOTECH_ETUDE regroupant toutes les études faites à partir de sites géotechniques.
*/

-- 1. La table
CREATE TABLE G_GEO.TA_GEOTECH_ETUDE (
	"OBJECTID" NUMBER(38,0) DEFAULT G_GEO.SEQ_TA_GEOTECH_ETUDE_OBJECTID.NEXTVAL NOT NULL,
	"REFERENCE_INTERNE" VARCHAR2(4000),
	"DATE_DEBUT" NUMBER(4,0),
	"DATE_FIN" NUMBER(4,0),
	"DESCRIPTION" VARCHAR2(4000),
	"FID_TYPE_ETUDE" NUMBER(38,0)
 );

-- 2. Les commentaires
COMMENT ON TABLE G_GEO.TA_GEOTECH_ETUDE IS 'Table regroupant toutes les études faites à partir de sites géotechniques.';
COMMENT ON COLUMN G_GEO.TA_GEOTECH_ETUDE.OBJECTID IS 'Clé primaire auto-incrémentée de la table.';
COMMENT ON COLUMN G_GEO.TA_GEOTECH_ETUDE.REFERENCE_INTERNE IS 'Référence interne de chaque étude.';
COMMENT ON COLUMN G_GEO.TA_GEOTECH_ETUDE.DATE_DEBUT IS 'Champ contenant l''année de début de l''étude.';
COMMENT ON COLUMN G_GEO.TA_GEOTECH_ETUDE.DATE_FIN IS 'Champ contenant l''année de fin de l''étude.';
COMMENT ON COLUMN G_GEO.TA_GEOTECH_ETUDE.FID_TYPE_ETUDE IS 'Clé étrangère vers la table TA_GEOTECH_libelle permettant d''associer un type à une étude.';

-- 3. Les contraintes
-- Contrainte de clé primaire
ALTER TABLE G_GEO.TA_GEOTECH_ETUDE
ADD CONSTRAINT TA_GEOTECH_ETUDE_PK
PRIMARY KEY("OBJECTID")
USING INDEX TABLESPACE G_ADT_INDX;

-- Contrainte de clé étrangère
ALTER TABLE G_GEO.TA_GEOTECH_ETUDE
ADD CONSTRAINT TA_GEOTECH_ETUDE_FID_TYPE_ETUDE_FK
FOREIGN KEY("FID_TYPE_ETUDE")
REFERENCES G_GEO.TA_GEOTECH_LIBELLE("OBJECTID");

-- 4. Les index
CREATE INDEX TA_GEOTECH_ETUDE_DATE_DEBUT_IDX ON G_GEO.TA_GEOTECH_ETUDE("DATE_DEBUT")
    TABLESPACE G_ADT_INDX;

CREATE INDEX TA_GEOTECH_ETUDE_DATE_DEBUT_IDX ON G_GEO.TA_GEOTECH_ETUDE("DATE_FIN")
    TABLESPACE G_ADT_INDX;

CREATE INDEX TA_GEOTECH_ETUDE_FID_TYPE_ETUDE_IDX ON G_GEO.TA_GEOTECH_ETUDE("FID_TYPE_ETUDE")
    TABLESPACE G_ADT_INDX;

CREATE INDEX TA_GEOTECH_ETUDE_REFERENCE_INTERNE_IDX ON G_GEO.TA_GEOTECH_ETUDE("REFERENCE_INTERNE")
    TABLESPACE G_ADT_INDX;

-- 5. Les droits de lecture, écriture, suppression
GRANT SELECT ON G_GEO.TA_GEOTECH_ETUDE TO G_ADMIN_SIG;

/

