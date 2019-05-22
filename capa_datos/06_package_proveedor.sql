CREATE OR REPLACE PACKAGE PKG_PROVEEDOR AS
    PROCEDURE c_proveedor
        ( nombre_in    IN  PROVEEDOR.NOMBRE%TYPE 
        , razon_in     IN  PROVEEDOR.RAZON%TYPE
        , rut_in       IN  PROVEEDOR.RUT%TYPE
        , fono_in      IN  PROVEEDOR.FONO%TYPE
        , mail_in      IN  PROVEEDOR.MAIL%TYPE
        , respuesta    OUT INTEGER
        );
END PKG_PROVEEDOR;
/
CREATE OR REPLACE PACKAGE BODY PKG_PROVEEDOR AS
    v_cod_error_p     NUMBER(10);
    v_men_error_p     VARCHAR2(250);
--------- Create Producto ------------------
    PROCEDURE c_proveedor
        ( nombre_in    IN  PROVEEDOR.NOMBRE%TYPE 
        , razon_in     IN  PROVEEDOR.RAZON%TYPE
        , rut_in       IN  PROVEEDOR.RUT%TYPE
        , fono_in      IN  PROVEEDOR.FONO%TYPE
        , mail_in      IN  PROVEEDOR.MAIL%TYPE
        , respuesta    OUT INTEGER
        ) IS
    BEGIN
        INSERT INTO PROVEEDOR 
            VALUES
            ( SEQ_PROVEEDOR.nextval
            , nombre_in
            , razon_in
            , rut_in
            , fono_in
            , mail_in
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
    END c_proveedor;
END PKG_PROVEEDOR;