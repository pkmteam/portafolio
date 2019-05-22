CREATE OR REPLACE PACKAGE PKG_PRODUCTO AS
    TYPE cur_producto IS REF CURSOR;
    PROCEDURE c_producto
        ( nombre_in    IN  PRODUCTO.NOMBRE%TYPE 
        , precio_in    IN  PRODUCTO.PRECIO%TYPE
        --, imagen_in    IN  PRODUCTO.IMAGEN%TYPE
        , familia_in   IN  FAMILIA.NOMBRE%TYPE
        , vigencia_in  IN  VIGENCIA_PROD.VIGENCIA%TYPE
        , respuesta    OUT INTEGER
        );
     PROCEDURE r_producto
        ( v_producto  IN  PRODUCTO.NOMBRE%TYPE
        , r_producto  OUT cur_producto
        );
     PROCEDURE u_producto
        ( nombre_in    IN  PRODUCTO.NOMBRE%TYPE 
        , precio_in    IN  PRODUCTO.PRECIO%TYPE
        --, imagen_in    IN  PRODUCTO.IMAGEN%TYPE
        , familia_in   IN  FAMILIA.NOMBRE%TYPE
        , vigencia_in  IN  VIGENCIA_PROD.VIGENCIA%TYPE
        , respuesta    OUT INTEGER
        );
END PKG_PRODUCTO;
/
CREATE OR REPLACE PACKAGE BODY PKG_PRODUCTO AS
    v_cod_error_p     NUMBER(10);
    v_men_error_p     VARCHAR2(250);
--------- Create Producto ------------------
    PROCEDURE c_producto
        ( nombre_in    IN  PRODUCTO.NOMBRE%TYPE 
        , precio_in    IN  PRODUCTO.PRECIO%TYPE
        --, imagen_in    IN  PRODUCTO.IMAGEN%TYPE
        , familia_in   IN  FAMILIA.NOMBRE%TYPE
        , vigencia_in  IN  VIGENCIA_PROD.VIGENCIA%TYPE
        , respuesta    OUT INTEGER
        ) IS
    BEGIN
        INSERT INTO PRODUCTO 
            VALUES
            ( SEQ_PRODUCTO.nextval
            , nombre_in
            , precio_in
            --, null
            , (select id_familia from familia where nombre = familia_in)
            , (select id_vigencia from vigencia_prod where vigencia = vigencia_in)
            );
        respuesta := 1;
    
    EXCEPTION
        WHEN OTHERS THEN
        respuesta := -1;
        v_cod_error_p := SQLCODE;
        v_men_error_p := SQLERRM;
        INSERT INTO ERROR_PROCESO
            VALUES 
            ( seq_error.NEXTVAL
            , 'pkg_producto.c_producto error no identificado'
            , v_cod_error_p||' '||v_men_error_p
            , sysdate()
            );
    END c_producto;
    
--------- Read Producto ------------------
    PROCEDURE r_producto
        ( v_producto  IN  PRODUCTO.NOMBRE%TYPE
        , r_producto  OUT cur_producto
        )IS
    BEGIN
        OPEN r_producto FOR
            SELECT p.nombre
                 , p.precio
                 , (select nombre from familia where id_familia = p.familia)
                 , (select vigencia from vigencia_prod where id_vigencia = p.vigencia)
            FROM producto p
            WHERE p.nombre = v_producto;
    END r_producto;

--------- Update Producto ------------------
    PROCEDURE u_producto
        ( nombre_in    IN  PRODUCTO.NOMBRE%TYPE 
        , precio_in    IN  PRODUCTO.PRECIO%TYPE
        --, imagen_in    IN  PRODUCTO.IMAGEN%TYPE
        , familia_in   IN  FAMILIA.NOMBRE%TYPE
        , vigencia_in  IN  VIGENCIA_PROD.VIGENCIA%TYPE
        , respuesta    OUT INTEGER
        ) IS
    BEGIN
        UPDATE producto SET
            nombre = nombre_in,
            precio = precio_in,
            familia = (select id_familia from familia where nombre = familia_in),
            vigencia = (select id_vigencia from vigencia_prod where vigencia = vigencia_in)
        WHERE nombre = nombre_in;
        respuesta := 1;
    EXCEPTION
        WHEN OTHERS THEN
        respuesta := -1;
        v_cod_error_p := SQLCODE;
        v_men_error_p := SQLERRM;
        INSERT INTO ERROR_PROCESO
            VALUES 
            ( seq_error.NEXTVAL
            , 'pkg_producto.u_producto error no identificado'
            , v_cod_error_p||' '||v_men_error_p
            , sysdate()
            );
    END u_producto;
END PKG_PRODUCTO;