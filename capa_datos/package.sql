CREATE OR REPLACE PACKAGE PKG_EMPLEADO IS
    TYPE cur_empleado IS REF CURSOR;
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
        , preg_in   IN  PREG_SECRETA.PREGUNTA%TYPE
        , jerar_in  IN  JERARQUIA.NOMBRE%TYPE
        , resultado OUT INTEGER
        );
    PROCEDURE r_empleado
        ( v_usuario  IN  EMPLEADO.USUARIO%TYPE
        , r_empleado OUT cur_empleado
        );
END PKG_EMPLEADO;
/
CREATE OR REPLACE PACKAGE BODY PKG_EMPLEADO AS
    v_cod_error     NUMBER(10);
    v_men_error     VARCHAR2(250);
----- FUNCION DE BUSQUEDA DE EMPLEADO ------------
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
----- PROCEDIMIENTO INGRESO DE EMPLEADO ------------
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
        , preg_in   IN  PREG_SECRETA.PREGUNTA%TYPE
        , jerar_in  IN  JERARQUIA.NOMBRE%TYPE
        , resultado OUT INTEGER
        )IS
	user_duplicate	EXCEPTION;
    BEGIN

	IF search_user(usuario) THEN
	   RAISE user_duplicate;
	ELSE
           INSERT INTO EMPLEADO 
            	VALUES
            	( seq_empleado.NEXTVAL
            	, p_nombre
            	, s_nombre
            	, a_paterno
            	, a_materno
            	, fono
            	, mail
            	, usuario
            	, pass
            	, resp_sec
            	, (select id_preg_sec from preg_secreta where pregunta = preg_in)
            	, (select id_jerarquia from jerarquia where nombre = jerar_in)
            	);
        	resultado := 1;
	END IF;
	EXCEPTION
	   WHEN user_duplicate THEN
		resultado := 0;
		v_cod_error := SQLCODE;
		v_men_error := SQLERRM;
		INSERT INTO ERROR_PROCESO
            VALUES 
            ( seq_error.NEXTVAL
            , 'pkg_empleado.c_empleado usuario duplicado'
            , v_cod_error||' '||v_men_error
            , sysdate()
            );

       WHEN OTHERS THEN
        resultado := -1;
        v_cod_error := SQLCODE;
        v_men_error := SQLERRM;
        INSERT INTO ERROR_PROCESO
            VALUES 
            ( seq_error.NEXTVAL
            , 'PKG_EMPLEADO.C_EMPLEADO ERROR NO IDENTIFICADO'
            , v_cod_error||' '||v_men_error
            , sysdate()
            );
    END c_empleado;
    
    PROCEDURE r_empleado
        ( v_usuario  IN  EMPLEADO.USUARIO%TYPE
        , r_empleado OUT cur_empleado
        ) AS
    BEGIN
        IF search_user(v_usuario) THEN
            OPEN r_empleado FOR
            SELECT p_nombre
                 , s_nombre
                 , a_paterno
                 , a_materno
                 , fono      
                 , mail      
                 , usuario   
                 --, pass      
                 --, resp_sec  
                 , (SELECT pregunta FROM preg_secreta WHERE id_preg_sec = empleado.preg_sec)   
                 , (SELECT nombre FROM jerarquia WHERE id_jerarquia = empleado.jerarquia)  
            FROM EMPLEADO 
            WHERE usuario = v_usuario;
        END IF;
    END r_empleado;
    
END PKG_EMPLEADO;
