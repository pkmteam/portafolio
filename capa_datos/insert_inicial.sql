----------- Jerarquia ------------------
INSERT INTO jerarquia VALUES(seq_jerarquia.NEXTVAL, 'Administrador');
INSERT INTO jerarquia VALUES(seq_jerarquia.NEXTVAL, 'Empleado');

----------- Preguntas -------------------
INSERT INTO preg_secreta VALUES(seq_pregunta.NEXTVAL, 'pregunta 1');
INSERT INTO preg_secreta VALUES(seq_pregunta.NEXTVAL, 'pregunta 2');
INSERT INTO preg_secreta VALUES(seq_pregunta.NEXTVAL, 'pregunta 3');
INSERT INTO preg_secreta VALUES(seq_pregunta.NEXTVAL, 'pregunta 4');

----------- Familias -------------------
INSERT INTO familia VALUES(seq_familia.NEXTVAL, 'familia 1');
INSERT INTO familia VALUES(seq_familia.NEXTVAL, 'familia 2');
INSERT INTO familia VALUES(seq_familia.NEXTVAL, 'familia 3');
INSERT INTO familia VALUES(seq_familia.NEXTVAL, 'familia 4');

COMMIT;