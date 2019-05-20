-------------- tablas -------------------
--------- B - C - D ---------------------
CREATE TABLE boleta (
    id_boleta       NUMBER(4) NOT NULL,--pk
    empleado        NUMBER(4) NOT NULL,--fk
    fecha_in        DATE NOT NULL,
    cliente         NUMBER(4) NOT NULL,--fk

    CONSTRAINT boleta_pk PRIMARY KEY (id_boleta)
);

CREATE TABLE clave (
    id_clave        NUMBER(3) NOT NULL,--pk
    clave           VARCHAR(15) NOT NULL,
    uso             DATE,
    proceso         VARCHAR2(50),

    CONSTRAINT clave_pk PRIMARY KEY (id_clave) 
);

CREATE TABLE cliente (
    id_cliente      NUMBER(3) NOT NULL,--pk
    nombre          VARCHAR2(30) NOT NULL,
    apellido        VARCHAR2(30) NOT NULL,
    rut             NUMBER(8) NOT NULL,
    saldo           NUMBER(6),
    fecha           DATE,

    CONSTRAINT cliente_pk PRIMARY KEY (id_cliente)
);

CREATE TABLE detalle_bol (
    id_detalle_bol  NUMBER(4) NOT NULL,--pk
    boleta          NUMBER(4) NOT NULL,--fk
    producto        NUMBER(3) NOT NULL,--fk
    cantidad        NUMBER(3) NOT NULL,
    precio          NUMBER(6) NOT NULL,

    CONSTRAINT detalle_bol_pk PRIMARY KEY (id_detalle_bol)
);

CREATE TABLE detalle_ped (
    id_det_ped      NUMBER(3) NOT NULL,--pk
    pedido          NUMBER(3) NOT NULL,--fk
    producto        NUMBER(4) NOT NULL,--fk
    cantidad        NUMBER(3) NOT NULL,
    precio          NUMBER(6) NOT NULL,
    fecha_ingreso   DATE NOT NULL,
    n_factura       NUMBER(10),

    CONSTRAINT detalle_ped_pk PRIMARY KEY (id_det_ped)
);

--------- E - F --------------------
CREATE TABLE efectivo (
    id_pago_efec    NUMBER(3) NOT NULL,--pk--fk

    CONSTRAINT pago_efec_pk PRIMARY KEY (id_pago_efec)
);

CREATE TABLE empleado (
    id_empleado     NUMBER(4) NOT NULL,--pk
    p_nombre        VARCHAR2(15) NOT NULL,
    s_nombre        VARCHAR2(15),
    a_paterno       VARCHAR2(20) NOT NULL,
    a_materno       VARCHAR2(20),
    fono            NUMBER(10),
    mail            VARCHAR2(30) NOT NULL,
    usuario         VARCHAR2(15) NOT NULL,--un
    pass            VARCHAR2(50) NOT NULL,
    resp_sec        VARCHAR2(50) NOT NULL,
    preg_sec        NUMBER(1) NOT NULL,--fk
    jerarquia       NUMBER(1) NOT NULL,--fk

    CONSTRAINT empleado_pk PRIMARY KEY (id_empleado),
    CONSTRAINT usuario_un UNIQUE (usuario)
);

CREATE TABLE estado (
    id_estado       NUMBER(1) NOT NULL,--pk
    estado          VARCHAR2(10) NOT NULL,

    CONSTRAINT estado_pk PRIMARY KEY (id_estado)
);

CREATE TABLE error_proceso (
    id_error        NUMBER(4) NOT NULL,--pk
    rutina          VARCHAR2(200) NOT NULL,
    mensaje         VARCHAR2(500) NOT NULL,
    fecha           DATE NOT NULL,
    
    CONSTRAINT error_pk PRIMARY KEY (id_error)
);

CREATE TABLE familia (
    id_familia      NUMBER(3) NOT NULL,--pk
    nombre          VARCHAR2(20) NOT NULL,

    CONSTRAINT familia_pk PRIMARY KEY (id_familia)
);

CREATE TABLE fam_prov (
    id_fam_prov     NUMBER(3) NOT NULL,--pk
    proveedor       NUMBER(4) NOT NULL,--fk
    familia         NUMBER(4) NOT NULL,--fk

    CONSTRAINT fam_prov_pk PRIMARY KEY (id_fam_prov)
);

CREATE TABLE fiado (
    id_pago_fiado    NUMBER(3) NOT NULL,--pk--fk

    CONSTRAINT pago_fiado_pk PRIMARY KEY (id_pago_fiado)
);

--------- J - M -------------------
CREATE TABLE jerarquia (
    id_jerarquia    NUMBER(1) NOT NULL,--pk
    nombre          VARCHAR2(20) NOT NULL,

    CONSTRAINT jerarquia_pk PRIMARY KEY (id_jerarquia)
);

CREATE TABLE medio_pago_bol (
    id_pago_bol     NUMBER(4) NOT NULL,--pk
    medio_pago      NUMBER(3) NOT NULL,--fk
    boleta          NUMBER(4) NOT NULL,--fk

    CONSTRAINT medio_pago_bol_pk PRIMARY KEY (id_pago_bol)
);

CREATE TABLE medio_pago (
    id_medio_pago   NUMBER(3) NOT NULL,--pk
    cantidad        NUMBER(6) NOT NULL,
    hora            DATE NOT NULL,

    CONSTRAINT medio_pago_pk PRIMARY KEY (id_medio_pago)
);

------------ P - S ----------------
CREATE TABLE pedido (
    id_pedido       NUMBER(3) NOT NULL,--pk
    empleado        NUMBER(4) NOT NULL,--fk
    fecha_crea      DATE NOT NULL,
    fecha_confir    DATE,
    estado          NUMBER(1) NOT NULL,--fk

    CONSTRAINT pedido_pk PRIMARY KEY (id_pedido)
);

CREATE TABLE preg_secreta (
    id_preg_sec     NUMBER(1) NOT NULL,--pk
    pregunta        VARCHAR(200) NOT NULL,

    CONSTRAINT preg_sec_pk PRIMARY KEY (id_preg_sec)
);

CREATE TABLE proveedor (
    id_proveedor    NUMBER(3) NOT NULL,--pk
    nombre          VARCHAR2(20) NOT NULL,
    razon           VARCHAR2(20) NOT NULL,
    rut             NUMBER(8) NOT NULL,
    fono            NUMBER(10),
    mail            VARCHAR2(20) NOT NULL,

    CONSTRAINT proveedor_pk PRIMARY KEY (id_proveedor)
);

CREATE TABLE producto (
    id_producto     NUMBER(3) NOT NULL,--pk
    nombre          VARCHAR2(20) NOT NULL,
    precio          NUMBER(6) NOT NULL,
    imagen          CLOB NOT NULL,
    familia         NUMBER(3) NOT NULL,--fk
    vigencia        NUMBER(1) NOT NULL,--fk

    CONSTRAINT producto_pk PRIMARY KEY (id_producto)
);

CREATE TABLE stock (
    id_stock        NUMBER(3) NOT NULL,--pk
    producto        NUMBER(3) NOT NULL,--fk
    cantidad        NUMBER(3) NOT NULL,
    cantidad_crit   NUMBER(3) NOT NULL,
    fecha_vence     DATE,
    codigo          NUMBER(17) NOT NULL,

    CONSTRAINT stock_pk PRIMARY KEY (id_stock)
);

-------------- T - V ------------------
CREATE TABLE tarjeta (
    id_pago_tarj    NUMBER(3) NOT NULL, --pk--fk
    tarjeta         NUMBER(1),--fk
    numero          NUMBER(4),

    CONSTRAINT tarjeta_pk PRIMARY KEY (id_pago_tarj)
);

CREATE TABLE tipo_tarjeta (
    id_tipo         NUMBER(1) NOT NULL, --pk
    tipo            VARCHAR2(15) NOT NULL,

    CONSTRAINT tipo_tar_pk PRIMARY KEY (id_tipo)
);
CREATE TABLE transferencia (
    id_pago_trans   NUMBER(3) NOT NULL,--pk--fk

    CONSTRAINT pago_trans_pk PRIMARY KEY (id_pago_trans)
);

CREATE TABLE vigencia_prod (
    id_vigencia       NUMBER(1) NOT NULL,--pk
    vigencia          VARCHAR2(10) NOT NULL,

    CONSTRAINT vigencia_pk PRIMARY KEY (id_vigencia)
);

----------- Relaciones -------------
ALTER TABLE empleado ADD CONSTRAINT emp_preg_fk
    FOREIGN KEY (preg_sec) REFERENCES preg_secreta (id_preg_sec);
ALTER TABLE empleado ADD CONSTRAINT emp_jer_fk
    FOREIGN KEY (jerarquia) REFERENCES jerarquia (id_jerarquia);

ALTER TABLE pedido ADD CONSTRAINT pedido_empleado_fk
    FOREIGN KEY (empleado) REFERENCES empleado (id_empleado);
ALTER TABLE pedido ADD CONSTRAINT pedido_estado_fk
    FOREIGN KEY (estado) REFERENCES estado (id_estado);

ALTER TABLE fam_prov ADD CONSTRAINT fam_prov_prov_fk
    FOREIGN KEY (proveedor) REFERENCES proveedor (id_proveedor);
ALTER TABLE fam_prov ADD CONSTRAINT fam_prov_fam_fk
    FOREIGN KEY (familia) REFERENCES familia (id_familia);

ALTER TABLE producto ADD CONSTRAINT producto_fam_fk
    FOREIGN KEY (familia) REFERENCES familia (id_familia);
ALTER TABLE producto ADD CONSTRAINT producto_vig_fk
    FOREIGN KEY (vigencia) REFERENCES vigencia_prod (id_vigencia);

ALTER TABLE stock ADD CONSTRAINT stock_prod_fk
    FOREIGN KEY (producto) REFERENCES producto (id_producto);

ALTER TABLE detalle_ped ADD CONSTRAINT det_ped_ped_fk
    FOREIGN KEY (pedido) REFERENCES pedido (id_pedido);
ALTER TABLE detalle_ped ADD CONSTRAINT det_ped_prod_fk
    FOREIGN KEY (producto) REFERENCES producto (id_producto);

ALTER TABLE boleta ADD CONSTRAINT bol_emp_fk
    FOREIGN KEY (empleado) REFERENCES empleado (id_empleado);
ALTER TABLE boleta ADD CONSTRAINT bol_cli_fk
    FOREIGN KEY (cliente) REFERENCES cliente (id_cliente);

ALTER TABLE detalle_bol ADD CONSTRAINT det_bol_bol_fk
    FOREIGN KEY (boleta) REFERENCES boleta (id_boleta);
ALTER TABLE detalle_bol ADD CONSTRAINT det_bol_prod_fk
    FOREIGN KEY (producto) REFERENCES producto (id_producto);

ALTER TABLE medio_pago_bol ADD CONSTRAINT pago_bol_med_fk
    FOREIGN KEY (medio_pago) REFERENCES medio_pago (id_medio_pago);
ALTER TABLE medio_pago_bol ADD CONSTRAINT pago_bol_bol_fk
    FOREIGN KEY (boleta) REFERENCES boleta (id_boleta);

ALTER TABLE efectivo ADD CONSTRAINT efec_medio_fk
    FOREIGN KEY (id_pago_efec) REFERENCES medio_pago (id_medio_pago);

ALTER TABLE tarjeta ADD CONSTRAINT tarjeta_medio_fk
    FOREIGN KEY (id_pago_tarj) REFERENCES medio_pago (id_medio_pago);
ALTER TABLE tarjeta ADD CONSTRAINT tipo_tarjeta_fk
    FOREIGN KEY (tarjeta) REFERENCES tipo_tarjeta (id_tipo);

ALTER TABLE transferencia ADD CONSTRAINT trans_medio_fk
    FOREIGN KEY (id_pago_trans) REFERENCES medio_pago (id_medio_pago);

ALTER TABLE fiado ADD CONSTRAINT fiado_medio_fk
    FOREIGN KEY (id_pago_fiado) REFERENCES medio_pago (id_medio_pago);
---------------- Insert -------------------------------
CREATE SEQUENCE seq_empleado_id;
CREATE SEQUENCE seq_jerarquia_id;
CREATE SEQUENCE seq_pregunta_id;

INSERT INTO jerarquia VALUES(seq_jerarquia_id.NEXTVAL, "Administrador");
INSERT INTO preg_secreta VALUES(seq_pregunta_id.NEXTVAL, "pregunta 1");
