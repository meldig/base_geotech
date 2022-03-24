/*
TA_GEOTECH_LIBELLE : Création de la table TA_GEOTECH_LIBELLE qui contient les libellés des objets liées aux études géotechniques.
*/

-- 1. La table
CREATE TABLE G_GEO.TA_GEOTECH_LIBELLE (
	"OBJECTID" NUMBER(38,0) DEFAULT G_GEO.SEQ_TA_GEOTECH_LIBELLE_OBJECTID.NEXTVAL NOT NULL,
	"LIBELLE_LONG" VARCHAR2(4000),
	"LIBELLE_COURT" VARCHAR2(200)
 );

-- 2. Les commentaires
COMMENT ON TABLE G_GEO.TA_GEOTECH_LIBELLE IS 'Table regroupant les libellés long qualifiant les objets de la base G_GEOTECH.';
COMMENT ON COLUMN G_GEO.TA_GEOTECH_LIBELLE.OBJECTID IS 'Identifiant de chaque famille de libellés.';
COMMENT ON COLUMN G_GEO.TA_GEOTECH_LIBELLE.LIBELLE_LONG IS 'Valeur décrivant les types d''objets répartis par famille.';
COMMENT ON COLUMN G_GEO.TA_GEOTECH_LIBELLE.LIBELLE_COURT IS 'Valeur synthétique décrivant les types d''objets répartis par famille. Cette valeur a la même utilité que celle du champ libelle_long, elle est simplement plus courte.';
-- 3. Les contraintes
-- Contrainte de clé primaire
ALTER TABLE G_GEO.TA_GEOTECH_LIBELLE
ADD CONSTRAINT TA_GEOTECH_LIBELLE_PK
PRIMARY KEY("OBJECTID")
USING INDEX TABLESPACE G_ADT_INDX;

-- Contraintes d'unicité
ALTER TABLE G_GEO.TA_GEOTECH_LIBELLE
ADD CONSTRAINT TA_GEOTECH_LIBELLE_LIBELLE_LONG_UN
UNIQUE("LIBELLE_LONG")
USING INDEX TABLESPACE G_ADT_INDX;

ALTER TABLE G_GEO.TA_GEOTECH_LIBELLE
ADD CONSTRAINT TA_GEOTECH_LIBELLE_LIBELLE_COURT_UN
UNIQUE("LIBELLE_COURT")
USING INDEX TABLESPACE G_ADT_INDX;

-- 4. Les droits de lecture, écriture, suppression
GRANT SELECT ON G_GEO.TA_GEOTECH_LIBELLE TO G_ADMIN_SIG;

/

