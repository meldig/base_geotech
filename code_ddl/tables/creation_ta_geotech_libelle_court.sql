/*
TA_GEOTECH_LIBELLE_COURT : Création de la table TA_GEOTECH_LIBELLE_COURT contenant les identifiant des tables TA_GEOTECH_LIBELLE_COURT et TA_GEOTECH_FAMILLE, permettant de joindre chaque libellé long à sa famille de libellés.
*/

-- 1. La table
CREATE TABLE G_GEO.TA_GEOTECH_LIBELLE_COURT (
	"OBJECTID" NUMBER(38,0) DEFAULT G_GEO.SEQ_TA_GEOTECH_LIBELLE_COURT_OBJECTID.NEXTVAL NOT NULL,
	"VALEUR" VARCHAR2(300)
 );

-- 2. Les commentaires
COMMENT ON TABLE G_GEO.TA_GEOTECH_LIBELLE_COURT IS 'Table regroupant les valeurs qualifiant les objets du schéma de manière synthétique. Cette table étant reliée à TA_GEOTECH_LIBELLE_LONG, cela permet d''associer un libelle long à plusieurs libellés courts et ainsi affiner la classification des objets.';
COMMENT ON COLUMN G_GEO.TA_GEOTECH_LIBELLE_COURT.OBJECTID IS 'Clé primaire auto-incrémentée de la table.';
COMMENT ON COLUMN G_GEO.TA_GEOTECH_LIBELLE_COURT.VALEUR IS 'Valeur qualifiant de manière synthétique un objet.';

-- 3. Les contraintes
-- Contrainte de clé primaire
ALTER TABLE G_GEO.TA_GEOTECH_LIBELLE_COURT
ADD CONSTRAINT TA_GEOTECH_LIBELLE_COURT_PK
PRIMARY KEY("OBJECTID")
USING INDEX TABLESPACE G_ADT_INDX;

-- 4. Les index
CREATE INDEX TA_GEOTECH_LIBELLE_COURT_VALEUR_IDX ON G_GEO.TA_GEOTECH_LIBELLE_COURT("VALEUR")
    TABLESPACE G_ADT_INDX;

-- 5. Les droits de lecture, écriture, suppression
GRANT SELECT ON G_GEO.TA_GEOTECH_LIBELLE_COURT TO G_ADMIN_SIG;

/

