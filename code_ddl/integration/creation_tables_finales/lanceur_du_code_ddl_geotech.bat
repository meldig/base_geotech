@echo off
echo Bienvenu dans la creation des tables, vues et declencheurs de GeoTech !

:: 1. Configurer le système d'encodage des caractères en UTF-8
SET NLS_LANG=AMERICAN_AMERICA.AL32UTF8

:: 2. Déclaration et valorisation des variables
SET /p chemin_code_sequence="Veuillez saisir le chemin d'acces du dossier contenant le code DDL des SEQUENCES du schema : "
SET /p chemin_code_fonction="Veuillez saisir le chemin d'acces du dossier contenant le code DDL des FONCTIONS du schema : "
SET /p chemin_code_table="Veuillez saisir le chemin d'acces du dossier contenant le code DDL des TABLES du schema : "
::SET /p chemin_code_trigger="Veuillez saisir le chemin d'acces du dossier contenant le code DDL des DECLENCHEURS du schema : "
::SET /p chemin_code_vue="Veuillez saisir le chemin d'acces du dossier contenant le code DDL des VUES du schema : "
SET /p chemin_code_droits="Veuillez saisir le chemin d'acces du dossier contenant les droits de lecture et ecriture du schema : "
SET /p chemin_code_temp="Veuillez saisir le chemin d'acces du dossier integration\creation_tables_finales : "
::SET /p USER="Veuillez saisir l'utilisateur Oracle : "
::SET /p MDP="Veuillez saisir le MDP : "
::SET /p INSTANCE="Veuillez saisir l'instance Oracle : "

copy /b %chemin_code_fonction%\creation_get_code_insee_contain_point.sql + ^
%chemin_code_sequence%\creation_seq_ta_geotech_famille_objectid.sql + ^
%chemin_code_table%\creation_ta_geotech_famille.sql + ^
%chemin_code_sequence%\creation_seq_ta_geotech_libelle_objectid.sql + ^
%chemin_code_table%\creation_ta_geotech_libelle.sql + ^
%chemin_code_table%\creation_ta_geotech_famille_libelle.sql + ^
%chemin_code_sequence%\creation_seq_ta_geotech_site_objectid.sql + ^
%chemin_code_table%\creation_ta_geotech_site.sql + ^
%chemin_code_sequence%\creation_seq_ta_geotech_etude_objectid.sql + ^
%chemin_code_table%\creation_ta_geotech_etude.sql + ^
%chemin_code_table%\creation_ta_geotech_relation_site_etude.sql + ^
%chemin_code_sequence%\creation_seq_ta_geotech_bureau_etude_objectid.sql + ^
%chemin_code_table%\creation_ta_geotech_bureau_etude.sql + ^
%chemin_code_table%\creation_ta_geotech_repertoire.sql + ^ ^
%chemin_code_table%\creation_ta_geotech_fichier.sql + ^
%chemin_code_droits%\droits_lecture_edition_suppression_objets_geotech.sql ^
%chemin_code_temp%\temp_code_ddl_schema.sql

:: 3. lancement de SQL plus.
::CD C:/ora12c/R1/BIN

:: 4. Execution de sqlplus. pour lancer les requetes SQL.
::sqlplus.exe %USER%/%MDP%@%INSTANCE% @%chemin_code_temp%\temp_code_ddl_schema.sql

:: 5. MISE EN PAUSE
PAUSE