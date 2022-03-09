@echo off
echo Bienvenu dans la creation des tables, vues et declencheurs de GeoTech !

:: 1. Configurer le système d'encodage des caractères en UTF-8
SET NLS_LANG=AMERICAN_AMERICA.AL32UTF8

:: 2. Déclaration et valorisation des variables
SET /p chemin_code_sequence="Veuillez saisir le chemin d'acces du dossier contenant le code DDL des SEQUENCES du schema : "
SET /p chemin_code_fonction="Veuillez saisir le chemin d'acces du dossier contenant le code DDL des FONCTIONS du schema : "
SET /p chemin_code_table="Veuillez saisir le chemin d'acces du dossier contenant le code DDL des TABLES du schema : "
SET /p chemin_code_trigger="Veuillez saisir le chemin d'acces du dossier contenant le code DDL des DECLENCHEURS du schema : "
SET /p chemin_code_vue="Veuillez saisir le chemin d'acces du dossier contenant le code DDL des VUES du schema : "
SET /p chemin_code_droits="Veuillez saisir le chemin d'acces du dossier contenant les droits de lecture et ecriture du schema : "
SET /p chemin_code_temp="Veuillez saisir le chemin d'acces du dossier integration\creation_tables_finales : "
::SET /p USER="Veuillez saisir l'utilisateur Oracle : "
::SET /p MDP="Veuillez saisir le MDP : "
::SET /p INSTANCE="Veuillez saisir l'instance Oracle : "

copy /b %chemin_code_fonction%\creation_GET_CODE_INSEE_CONTAIN_POINT.sql + ^
%chemin_code_sequence%\creation_SEQ_TA_GEOTECH_FAMILLE_OBJECTID.sql + ^
%chemin_code_table%\creation_TA_GEOTECH_FAMILLE.sql + ^
%chemin_code_sequence%\creation_SEQ_TA_GEOTECH_LIBELLE_LONG_OBJECTID.sql + ^
%chemin_code_table%\creation_TA_GEOTECH_LIBELLE_LONG.sql + ^
%chemin_code_table%\creation_TA_GEOTECH_FAMILLE_LIBELLE_LONG.sql + ^
%chemin_code_sequence%\creation_SEQ_TA_GEOTECH_LIBELLE_COURT_OBJECTID.sql + ^
%chemin_code_table%\creation_TA_GEOTECH_LIBELLE_COURT.sql + ^
%chemin_code_table%\creation_TA_GEOTECH_RELATION_LIBELLE_LONG_COURT.sql + ^
%chemin_code_table%\creation_TA_GEOTECH_LIBELLE.sql + ^
%chemin_code_sequence%\creation_SEQ_TA_GEOTECH_SITE_OBJECTID.sql + ^
%chemin_code_table%\creation_TA_GEOTECH_SITE.sql + ^
%chemin_code_sequence%\creation_SEQ_TA_GEOTECH_ETUDE_OBJECTID.sql + ^
%chemin_code_table%\creation_TA_GEOTECH_ETUDE.sql + ^
%chemin_code_table%\creation_TA_GEOTECH_RELATION_SITE_ETUDE.sql + ^
%chemin_code_sequence%\creation_SEQ_TA_GEOTECH_BUREAU_ETUDE_OBJECTID.sql + ^
%chemin_code_table%\creation_TA_GEOTECH_BUREAU_ETUDE.sql + ^
%chemin_code_table%\creation_TA_GEOTECH_REPERTOIRE.sql + ^ ^
%chemin_code_table%\creation_TA_GEOTECH_FICHIER.sql + ^
%chemin_code_droits%\droits_lecture_edition_suppression_objets_geotech.sql ^
%chemin_code_temp%\temp_code_ddl_schema.sql

:: 3. lancement de SQL plus.
::CD C:/ora12c/R1/BIN

:: 4. Execution de sqlplus. pour lancer les requetes SQL.
::sqlplus.exe %USER%/%MDP%@%INSTANCE% @%chemin_code_temp%\temp_code_ddl_schema.sql

:: 5. MISE EN PAUSE
PAUSE