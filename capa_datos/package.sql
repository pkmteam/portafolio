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
        , resultado OUT INTEGER
        );
END PKG_EMPLEADO;

CREATE OR REPLACE PACKAGE BODY PKG_EMPLEADO IS
    v_cod_error     NUMBER(10);
    v_men_error     VARCHAR2(250);
----- FUNCION DE BUSQUEDA DE USUARIO ------------
    FUNCTION search_user
	( usuario_in EMPLEADO.USUARIO%TYPE
	) RETURN BOOLEAN IS
	answer	boolean:=false;
	cursor c_usuario is
	 (select usuario from empleado);
	reg_usuario EMPLEADO.USUARIO%TYPE;
    BEGIN
	open c_usuario;
	fetch c_usuario into reg_usuario;
	loop
	  if reg_usuario = usuario_in then
		answer := true;
	  end if;
	  fetch c_usuario into reg_usuario;
	exit when answer or c_usuario%notfound;
	end loop;
	close c_usuario;
	return answer;
    END search_user;

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
        , resultado OUT INTEGER
        )IS
	user_duplicate	EXCEPTION;
    BEGIN

	IF search_user(usuario) THEN
	   RAISE user_duplicate;
	ELSE
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
        	resultado := 1;
	END IF;
	EXCEPTION
	   WHEN user_duplicate THEN
		resultado := 0;
		v_cod_error := SQLCODE;
		v_men_error := SQLERRM;
		INSERT INTO ERROR_PROCESO
		VALUES (seq_error_id.nextval,
			'pkg_empleado.c_empleado usuario duplicado',
			v_cod_error||' '||v_men_error,
			sysdate());

           WHEN OTHERS THEN
            	resultado := -1;
            	v_cod_error := SQLCODE;
            	v_men_error := SQLERRM;
            	INSERT INTO ERROR_PROCESO
            	VALUES (SEQ_ERROR_ID.NEXTVAL, 
                    	'PKG_EMPLEADO.C_EMPLEADO ERROR NO IDENTIFICADO', 
                    	v_cod_error||' '||v_men_error,
			sysdate());
    END c_empleado;
END PKG_EMPLEADO;
