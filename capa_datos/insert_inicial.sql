----------- Jerarquia ------------------
INSERT INTO jerarquia VALUES(seq_jerarquia.NEXTVAL, 'Administrador');
INSERT INTO jerarquia VALUES(seq_jerarquia.NEXTVAL, 'Empleado');

----------- Preguntas -------------------
INSERT INTO preg_secreta VALUES(seq_pregunta.NEXTVAL, 'pregunta 1');
INSERT INTO preg_secreta VALUES(seq_pregunta.NEXTVAL, 'pregunta 2');
INSERT INTO preg_secreta VALUES(seq_pregunta.NEXTVAL, 'pregunta 3');
INSERT INTO preg_secreta VALUES(seq_pregunta.NEXTVAL, 'pregunta 4');

COMMIT;

----------- Familias -------------------
INSERT INTO familia VALUES(seq_familia.NEXTVAL, 'Azucar');
INSERT INTO familia VALUES(seq_familia.NEXTVAL, 'Arroz');
INSERT INTO familia VALUES(seq_familia.NEXTVAL, 'Pastas');
INSERT INTO familia VALUES(seq_familia.NEXTVAL, 'Bebida');

----------- Vigencia -------------------
INSERT INTO vigencia_prod VALUES(SEQ_VIGENCIA.nextval, 'Vigente');
INSERT INTO vigencia_prod VALUES(SEQ_VIGENCIA.nextval, 'No Vigente');

----------- Proveedor -------------------
INSERT INTO proveedor VALUES(SEQ_PROVEEDOR.nextval, 'proveedor 1', 'razon 1', 12345678, 987654321, 'mail_1@mail.com');
INSERT INTO proveedor VALUES(SEQ_PROVEEDOR.nextval, 'proveedor 2', 'razon 2', 12345678, 987654321, 'mail_2@mail.com');
INSERT INTO proveedor VALUES(SEQ_PROVEEDOR.nextval, 'proveedor 3', 'razon 3', 12345678, 987654321, 'mail_3@mail.com');
INSERT INTO proveedor VALUES(SEQ_PROVEEDOR.nextval, 'proveedor 4', 'razon 4', 12345678, 987654321, 'mail_4@mail.com');

COMMIT;
----------- Productos -------------------
INSERT INTO producto VALUES
    ( SEQ_PRODUCTO.nextval
    , 'Iansa 1kg'
    , 700
    , (select id_familia from familia where nombre = 'Azucar')
    , (select id_vigencia from vigencia_prod where vigencia = 'Vigente')
    );

INSERT INTO producto VALUES
    ( SEQ_PRODUCTO.nextval
    , 'Zaror 1kg'
    , 800
    , (select id_familia from familia where nombre = 'Arroz')
    , (select id_vigencia from vigencia_prod where vigencia = 'Vigente')
    );

INSERT INTO producto VALUES
    ( SEQ_PRODUCTO.nextval
    , 'Corbatas Carozzi 1kg'
    , 1700
    , (select id_familia from familia where nombre = 'Pastas')
    , (select id_vigencia from vigencia_prod where vigencia = 'Vigente')
    );
    
INSERT INTO producto VALUES
    ( SEQ_PRODUCTO.nextval
    , 'Coca Cola 2L'
    , 1700
    , (select id_familia from familia where nombre = 'Bebida')
    , (select id_vigencia from vigencia_prod where vigencia = 'Vigente')
    );
    
COMMIT;

----------- Stock -------------------
INSERT INTO stock VALUES
    ( SEQ_STOCK.nextval
    , (select id_producto from producto where nombre = 'Iansa 1kg')
    , 20
    , 5
    , null
    , 10110100000000101
    );

INSERT INTO stock VALUES
    ( SEQ_STOCK.nextval
    , (select id_producto from producto where nombre = 'Zaror 1kg')
    , 20
    , 5
    , null
    , 10210200000000102
    );
    
INSERT INTO stock VALUES
    ( SEQ_STOCK.nextval
    , (select id_producto from producto where nombre = 'Corbatas Carozzi 1kg')
    , 20
    , 5
    , null
    , 10310300000000103
    );
    
INSERT INTO stock VALUES
    ( SEQ_STOCK.nextval
    , (select id_producto from producto where nombre = 'Coca Cola 2L')
    , 20
    , 5
    , DATE '2020-04-15'
    , 10410415042020104
    );