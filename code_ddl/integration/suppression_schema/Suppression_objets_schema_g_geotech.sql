/*
Code de suppression de tous les objets du schéma
*/

-- Suppression des tables
DROP TABLE G_GEO.TA_GEOTECH_FAMILLE_LIBELLE CASCADE CONSTRAINTS;
DROP TABLE G_GEO.TA_GEOTECH_FAMILLE CASCADE CONSTRAINTS;
DROP TABLE G_GEO.TA_GEOTECH_LIBELLE CASCADE CONSTRAINTS;
DROP TABLE G_GEO.TA_GEOTECH_RELATION_SITE_ETUDE CASCADE CONSTRAINTS;
DROP TABLE G_GEO.TA_GEOTECH_ETUDE CASCADE CONSTRAINTS;
DROP TABLE G_GEO.TA_GEOTECH_BUREAU_ETUDE CASCADE CONSTRAINTS;
DROP TABLE G_GEO.TA_GEOTECH_REPERTOIRE CASCADE CONSTRAINTS;
DROP TABLE G_GEO.TA_GEOTECH_FICHIER CASCADE CONSTRAINTS;
DROP TABLE G_GEO.TA_GEOTECH_SITE CASCADE CONSTRAINTS;

-- Suppression des métadonnées spatiales
DELETE FROM USER_SDO_GEOM_METADATA 
WHERE TABLE_NAME = 'TA_GEOTECH_SITE';
COMMIT;

-- Suppression des séquences
DROP SEQUENCE G_GEO.SEQ_TA_GEOTECH_FAMILLE_OBJECTID;
DROP SEQUENCE G_GEO.SEQ_TA_GEOTECH_LIBELLE_OBJECTID;
DROP SEQUENCE G_GEO.SEQ_TA_GEOTECH_ETUDE_OBJECTID;
DROP SEQUENCE G_GEO.SEQ_TA_GEOTECH_BUREAU_ETUDE_OBJECTID;
DROP SEQUENCE G_GEO.SEQ_TA_GEOTECH_SITE_OBJECTID;

-- Suppression des fonctions
DROP FUNCTION GET_CODE_INSEE_CONTAIN_POINT;