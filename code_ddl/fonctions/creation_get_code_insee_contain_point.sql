create or replace FUNCTION GET_CODE_INSEE_CONTAIN_POINT(v_geometry SDO_GEOMETRY) RETURN CHAR
/*
Cette fonction a pour objectif de récupérer le code INSEE de la commune dans laquelle se situe un objet ponctuel.
ATTENTION : cette fonction porte sur la vue des 95 communes.
La variable v_table_name doit contenir le nom de la table contenant les objets ponctuels.
La variable v_geometry doit contenir le nom du champ géométrique de la table interrogée.
*/
    DETERMINISTIC
    As
    v_code_insee CHAR(8);
    BEGIN
        SELECT
            TRIM(b.code_insee)
            INTO v_code_insee
        FROM
            G_REFERENTIEL.MEL_COMMUNE b
        WHERE
            SDO_RELATE(v_geometry, b.geom, 'mask=INSIDE')='TRUE';
        RETURN v_code_insee;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 'error';
    END GET_CODE_INSEE_CONTAIN_POINT;

/

