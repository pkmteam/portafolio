CREATE OR REPLACE PACKAGE PKG_EMPLEADO IS
    PROCEDURE c_empleado
        ( p_nombre  IN  EMPLEADO.P_NOMBRE%TYPE
        , s_nombre  IN  EMPLEADO.s_NOMBRE%TYPE
        , a_paterno IN  EMPLEADO.A_PATERNO%TYPE
        , a_materno IN  EMPLEADO.A_MATERNO%TYPE
        , fono      IN  EMPLEADO.FONO%TYPE
        , mail      IN  EMPLEADO.MAIL%TYPE
        , usuario   IN  EMPLEADO.USUARIO%TYPE
        , pass      IN  EMPLEADO.PASS%TYPE
        , resp_sec  IN  EMPLEADO.RESP_SEC%TYPE
        , preg_sec  IN  PREG_SECRETA.PREGUNTA%TYPE
        , jerarquia IN  JERARQUIA.NOMBRE%TYPE
        , resultado IN  INTEGER
        );
END PKG_EMPLEADO;

CREATE OR REPLACE PACKAGE BODY PKG_EMPLEADO IS
    PROCEDURE c_empleado
        ( p_nombre  IN  EMPLEADO.P_NOMBRE%TYPE
        , s_nombre  IN  EMPLEADO.s_NOMBRE%TYPE
        , a_paterno IN  EMPLEADO.A_PATERNO%TYPE
        , a_materno IN  EMPLEADO.A_MATERNO%TYPE
        , fono      IN  EMPLEADO.FONO%TYPE
        , mail      IN  EMPLEADO.MAIL%TYPE
        , usuario   IN  EMPLEADO.USUARIO%TYPE
        , pass      IN  EMPLEADO.PASS%TYPE
        , resp_sec  IN  EMPLEADO.RESP_SEC%TYPE
        , preg_sec  IN  PREG_SECRETA.PREGUNTA%TYPE
        , jerarquia IN  JERARQUIA.NOMBRE%TYPE
        --, resultado IN  INTEGER
        )IS
    BEGIN

        INSERT INTO EMPLEADO 
            VALUES
            ( seq_empleado_id.nextval
            , p_nombre
            , s_nombre
            , a_paterno
            , a_materno
            , fono
            , mail
            , usuario
            , pass
            , resp_sec
            , (select id_preg_sec from preg_secreta where pregunta = preg_sec)
            , (select id_jerarquia from jerarquia where nombre = jerarquia)
            );
        
    END c_empleado;
END PKG_EMPLEADO;