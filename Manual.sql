/* /////////////////////Crear bases de datos////////////////////// */

CREATE DATABASE nombre_de_la_base_de_datos;

CREATE DATABASE IF NOT EXISTS mundo;

/* /////////////////////Borrar bases de datos///////////////////// */

DROP DATABASE nombre_de_la_base_de_datos;

DROP DATABASE IF EXISTS nombre_de_la_base_de_datos;

/* ////////////////////Crear tablas////////////////////// */

CREATE TABLE nombre_de_la_tabla (
    columna1 tipo_de_dato1,
    columna2 tipo_de_dato2,
    columna3 tipo_de_dato3,
    ...
);

CREATE TABLE IF NOT EXISTS nombre_de_la_tabla (
    columna1 tipo_de_dato1,
    columna2 tipo_de_dato2,
    columna3 tipo_de_dato3,
    ...
);

USE mundo;

CREATE TABLE IF NOT EXISTS pais (
    id int,
    nombre varchar(20),
    continente varchar(50),
    población int
);

/* ////////////////////Borrar tablas////////////////////// */

DROP TABLE nombre_de_la_tabla;

CREATE TABLE Temp (
id integer,
dato varchar(20)
);

DROP TABLE Temp:

/* /////////////////////Crear llaves primarias///////////////////// */

CREATE TABLE nombre_de_la_tabla (
    columna1 tipo_de_dato1 PRIMARY KEY,
    columna2 tipo_de_dato2,
    columna3 tipo_de_dato3,
    ...
);

CREATE TABLE IF NOT EXISTS pais (
    id int PRIMARY KEY,
    nombre varchar(20),
    continente varchar(50),
    población int
);

ALTER TABLE nombre_de_la_tabla
ADD PRIMARY KEY (columna1);

ALTER TABLE pais

ADD PRIMARY KEY (id);

/* ////////////////////Insertar datos (INSERT)////////////////////// */

INSERT INTO nombre_de_la_tabla (columna1, columna2, columna3, ...)
VALUES (valor1, valor2, valor3, ...);

INSERT INTO pais (id, nombre, continente, poblacion)
VALUES (101, "Colombia", "Sur América", 50000000);

INSERT INTO pais (id, nombre, continente, poblacion)
VALUES (102, "Ecuador", "Sur América", 17000000);

INSERT INTO pais (id, nombre, continente, poblacion)
VALUES (103, "Guatemala", "Centro América", 17000000);

INSERT INTO pais (id, nombre, continente, poblacion)
VALUES (104, "México", "Centro América", 126000000);

INSERT INTO pais (id, nombre, continente, poblacion)
VALUES (105, "Estados Unidos", "Norte América", 331000000);

INSERT INTO pais (id, nombre, continente, poblacion)
VALUES (106, "Canada", "Centro América", 38000000);

/* ////////////////////Modificar datos (UPDATE)////////////////////// */

UPDATE nombre_de_la_tabla
SET columna1 = valor1, columna2 = valor2, ...
WHERE condicion;

UPDATE pais
SET poblacion = 50887423
WHERE id=101;

/* /////////////////////Eliminar datos (DELETE)///////////////////// */

DELETE FROM nombre_de_la_tabla;

TRUNCATE TABLE nombre_de_la_tabla;

DELETE FROM nombre_de_la_tabla
WHERE condicion;

DELETE FROM mi_tabla
WHERE condicion
LIMIT cantidad_registros;

DELETE FROM pais
WHERE id = 106;

/* ////////////////////Consultar datos (SELECT)////////////////////// */

SELECT nombre_de_los_campos
FROM nombre_de_las_tablas
WHERE condición;

SELECT id, nombre, continente, poblacion 
FROM pais;

SELECT * 
FROM pais;

SELECT nombre
FROM pais
WHERE poblacion <= 100000000;

SELECT nombre_de_los_campos
FROM nombre_de_las_tablas
WHERE condición
ORDER BY especificacion_de_ordenacion
LIMIT límite_registros_devueltos

SELECT nombre 
FROM pais
WHERE poblacion <= 100000000
ORDER BY nombre;

SELECT nombre 
FROM pais
ORDER BY nombre DESC;

SELECT nombre 
FROM pais
ORDER BY nombre ASC;

SELECT nombre 
FROM pais
ORDER BY nombre
LIMIT 2;

/* ////////////////////Crear de tablas con SELECT////////////////////// */

CREATE TABLE nueva_tabla
AS
SELECT columna1, columna2, ...
FROM tabla_origen
WHERE condicion;

CREATE TABLE tempPais
AS
SELECT nombre, poblacion
FROM pais
WHERE poblacion <= 100000000;

/* ////////////////////Revisar la estructura de una tabla////////////////////// */

DESCRIBE nombre_de_la_tabla;

DESCRIBE tempPais;

/* ////////////////////Crear llaves foráneas////////////////////// */

CREATE TABLE tabla2 (
    columna1 tipo1,
    columna2 tipo2,
    ...,
    FOREIGN KEY (columna_relacionada)
    REFERENCES tabla1 (columna_referenciada)
);

CREATE TABLE ciudad (
    id int PRIMARY KEY,
    nombre varchar(20),
    id_pais int,
    FOREIGN KEY (id_pais)
    REFERENCES pais (id)
);

create table idioma(
id int primary key,
idioma varchar(50)
);

create table idioma_pais (
id_idioma int,
id_pais int,
es_oficial boolean default false,
primary key (id_idioma, id_pais),
foreign key (id_idioma) references idioma(id),
foreign key (id_pais) references pais(id)
);

/* ///////////////////Alias de campos/////////////////////// */

SELECT columna AS alias FROM tabla;

SELECT nombre AS cliente_nombre, edad AS edad_cliente FROM clientes;

SELECT AVG(precio) AS promedio_precio FROM productos;

SELECT cantidad * precio AS total FROM pedidos;

/* ////////////////////Alias de tablas////////////////////// */

SELECT columna1, columna2, ...
FROM tabla AS alias;

SELECT u.nombre, u.edad
FROM usuarios AS u;

SELECT u.nombre, p.fecha
FROM usuarios AS u
JOIN pedidos AS p ON u.id = p.usuario_id;

SELECT u.nombre
FROM (SELECT * FROM usuarios WHERE edad > 30) AS |;

/* /////////////////////Funciones en campos///////////////////// */

SELECT CONCAT(nombre, ' ', apellido) AS nombre_completo FROM usuarios;

SELECT UPPER(nombre) AS nombre_mayusculas FROM usuarios;

SELECT LOWER(apellido) AS apellido_minusculas FROM usuarios;

SELECT LENGTH(nombre) AS

longitud_nombre FROM usuarios;

SELECT SUBSTRING(nombre, 1, 3) AS subcadena FROM usuarios;

SELECT TRIM(nombre) AS nombre_sin_espacios FROM usuarios;

SELECT ROUND(precio, 2) AS precio_redondeado FROM productos;

SELECT DATE_FORMAT(fecha_nacimiento, '%d-%m-%Y') AS fecha_formato FROM usuarios;

SELECT NOW() AS fecha_actual FROM usuarios;

SELECT IFNULL(nombre, 'N/A') AS nombre_alternativo FROM usuarios;

/* /////////////////////El comando If en campos///////////////////// */

SELECT IF(condición, valor_si_verdadero, valor_si_falso) AS resultado 
FROM tabla;

SELECT nombre, precio, IF(precio > 100, 'Alto', 'Bajo') AS categoria_precio 
FROM productos;

SELECT nombre, salario, bono, 
    IF(salario > 5000, salario + bono, salario) AS salario_total 
FROM empleados;

/* /////////////////////Inner Joins///////////////////// */

SELECT column_name(s)
FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name;

SELECT pais.nombre AS pais, ciudad.nombre AS ciudad
FROM pais
INNER JOIN ciudad
ON pais.id = ciudad.id_pais
WHERE pais.nombre = "México"

/* ////////////////////Left Joins////////////////////// */

SELECT column_name(s)
FROM table1
LEFT JOIN table2
ON table1.column_name = table2.column_name;

SELECT pais.nombre AS pais, ciudad.nombre AS ciudad
FROM pais
LEFT JOIN ciudad
ON pais.id = ciudad.id_pais;

/* ////////////////////Right Join////////////////////// */

SELECT column_name(s)
FROM table1
RIGHT JOIN table2
ON table1.column_name = table2.column_name;

SELECT pais.nombre AS pais, ciudad.nombre AS ciudad
FROM pais
RIGHT JOIN ciudad
ON pais.id = ciudad.id_pais;

/* ////////////////////Subconsultas////////////////////// */


SELECT column_name(s)
FROM table1
WHERE column_name OPERATOR (SELECT column_name(s) FROM table2);

SELECT nombre 
FROM pais 
WHERE poblacion > (SELECT AVG(poblacion) FROM pais);

SELECT min(poblacion) FROM pais;

SELECT C.nombre
FROM ciudad AS C
INNER JOIN pais AS P ON P.id = C.id_pais

SELECT C.nombre
FROM ciudad AS C
INNER JOIN pais AS P ON P.id = C.id_pais
WHERE P.poblacion = (SELECT min(poblacion) FROM país);

SELECT max(multa) AS Maxima_Multa
FROM prestamo;

SELECT P.numero_pres, P.fecha_pres, U.nombre_usu, P.multa
FROM usuario AS U
INNER JOIN prestamo P ON U.codigo_usu=P.codigo_usu
WHERE P.multa=(SELECT max(multa) AS Maxima_Multa FROM prestamo)
ORDER BY P.multa DESC;

/* ////////////////////Uso de índices para mejorar el rendimiento de las consultas////////////////////// */

CREATE INDEX index_name
ON table_name (column1, column2, ...);

CREATE INDEX idx_email
ON users (email);

CREATE INDEX idx_nombre_ciudad
ON ciudad(nombre);

CREATE INDEX idx_apellido_nombre
ON usuario (apellido, nombre);

CREATE UNIQUE INDEX idx_email
ON usuario (email);

CREATE UNIQUE INDEX idx_nombre_pais
ON pais (nombre);

CREATE FULLTEXT INDEX idx_content
ON posts (content);

/* ////////////////////Sintaxis para crear vistas////////////////////// */

CREATE [OR REPLACE] VIEW nombre_vista [lista_columnas]
AS consulta

/* ////////////////////Crear vistas////////////////////// */

CREATE VIEW vistaProductosBarato AS 
SELECT C.Nombre, P.Nombre, IP.es_oficial, I.idioma
FROM pais as P
INNER JOIN ciudad as C ON P.id = C.id_pais
INNER JOIN idioma_pais as IP on P.id = IP.id_pais
INNER JOIN idioma as I on IP.id_idioma = I.id
WHERE IP.es_oficial = true;

SELECT * FROM vistaProductosBarato;

/* ////////////////////Eliminación de la vista////////////////////// */

DROP VIEW nombre_vista;

DROP VIEW vistaProductosBarato;

/* ////////////////////Sintaxis////////////////////// */

CREATE
[DEFINER = { user | CURRENT_USER }]
PROCEDURE sp_name ([proc_parameter[,...]])
[characteristic ...] routine_body
proc_parameter:
[ IN | OUT | INOUT ] param_name type
func_parameter:
param_name type

type:
Any valid MySQL data type

characteristic:
COMMENT 'string'
| LANGUAGE SQL
| [NOT] DETERMINISTIC
| { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }
| SQL SECURITY { DEFINER | INVOKER }

routine_body:
Valid SQL routine statement

/* ////////////////////DELIMITER////////////////////// */

DELIMITER $$

DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS listar_productos$$
CREATE PROCEDURE listar_ciudades_nom_pais(IN nom_pais VARCHAR(50))
BEGIN
SELECT C.nombre
FROM pais as P
INNER JOIN ciudad as C on P.id = C.id_pais
WHERE P.nombre = nom_pais;
END
$$

DELIMITER $$
CREATE PROCEDURE contar_ciudades_nom_pais(IN nom_pais VARCHAR(50),  OUT total INT UNSIGNED)
BEGIN
    SELECT COUNT(*) INTO total
    FROM país AS P
    INNER JOIN ciudad AS C ON P.id = C.id_pais
    WHERE P.nombre = nom_pais;
END
$$

/* ////////////////////Llamadas de procedimientos con CALL////////////////////// */

CALL procedimiento_almacenado([lista_de_parametros])

DELIMITER ;
CALL listar_ciudades_nom_pais (“Colombia”);

DELIMITER ;
CALL contar_ciudades_nom_pais(“Colombia”, @total);
SELECT @total

/* ////////////////////Estructura IF – THEN – ELSE////////////////////// */

IF search_condition THEN 
statement_list

[ELSEIF search_condition THEN 
statement_list] ...

[ELSE 
statement_list]

END IF

DELIMITER $$
CREATE PROCEDURE verificar_idiomas_sin_pais()
BEGIN
    DECLARE num_idiomas_sin_pais INT;
    
    -- Contar el número de idiomas que no se hablan en ningún país
    SELECT COUNT(*) INTO num_idiomas_sin_pais
    FROM idioma
    WHERE id NOT IN (SELECT id_idioma FROM idioma_pais);
    
    -- Verificar si hay o no hay idiomas sin país y mostrar el resultado
    IF num_idiomas_sin_pais > 0 THEN
        SELECT CONCAT('Existen ', num_idiomas_sin_pais, ' idiomas que no se hablan en ningún país.') AS mensaje;
    ELSE
        SELECT 'No hay idiomas que no se hablen en ningún país.' AS mensaje;
    END IF;
END$$
DELIMITER ;

/* ////////////////////Estructura CASE////////////////////// */

CASE
WHEN search_condition THEN statement_list
[WHEN search_condition THEN statement_list] ...
[ELSE statement_list]
END CASE

DELIMITER $$
CREATE PROCEDURE obtener_info_ciudad(IN ciudad_id INT)
BEGIN
    DECLARE ciudad_nombre VARCHAR(20);
    DECLARE pais_nombre VARCHAR(20);
    DECLARE continente_nombre VARCHAR(50);
    DECLARE poblacion INT;
    DECLARE info VARCHAR(100);
    
    -- Obtener información de la ciudad y su país usando la estructura CASE
    SELECT C.nombre, P.nombre, P.continente, P.poblacion
    INTO ciudad_nombre, pais_nombre, continente_nombre, poblacion
    FROM ciudad AS C
    INNER JOIN pais AS P ON C.id_pais = P.id
    WHERE C.id = ciudad_id;
    
    -- Construir el mensaje de información usando la estructura CASE
    SET info = CASE
        WHEN poblacion > 1000000 THEN CONCAT(ciudad_nombre, ' es una gran ciudad en ', continente_nombre, '.')
        WHEN poblacion > 500000 THEN CONCAT(ciudad_nombre, ' es una ciudad de tamaño mediano en ', continente_nombre, '.')
        ELSE CONCAT(ciudad_nombre, ' es una pequeña ciudad en ', continente_nombre, '.')
    END;
    
    -- Mostrar la información
    SELECT CONCAT('La ciudad de ', ciudad_nombre, ' se encuentra en el país de ', pais_nombre, '. ', info) AS información;
END$$
DELIMITER ;

/* ////////////////////Estructura LOOP////////////////////// */

[begin_label:] LOOP
statement_list
END LOOP [end_label]

DELIMITER $$
CREATE PROCEDURE cicloloop(p1 INT, OUT x INT)
BEGIN
label1: LOOP
   SET p1 = p1 + 1;

   IF p1 < 10 THEN
      ITERATE label1;
   END IF;

   LEAVE label1;
END LOOP label1;

SET x = p1;
END;
DELIMITER ;

call cicloloop(1, @fin);
select @fin;

/* ////////////////////Estructura REPEAT////////////////////// */

REPEAT
    -- Código a ejecutar
UNTIL condición;

DELIMITER $$
DROP PROCEDURE IF EXISTS ejemplo_bucle_repeat$$
CREATE PROCEDURE ejemplo_bucle_repeat(IN tope INT, OUT suma INT)
BEGIN
DECLARE contador INT;
SET contador = 1;
SET suma = 0;

REPEAT
   		SET suma = suma + contador;
   		SET contador = contador + 1;
UNTIL contador > tope
END REPEAT;
END
$$
DELIMITER ;

CALL ejemplo_bucle_repeat(10, @resultado);
SELECT @resultado;

/* ////////////////////Estructura WHILE////////////////////// */

[begin_label:] WHILE search_condition DO
statement_list
END WHILE [end_label]

DELIMITER $$
DROP PROCEDURE IF EXISTS ejemplo_bucle_while$$
CREATE PROCEDURE ejemplo_bucle_while(IN tope INT, OUT suma INT)
BEGIN
DECLARE contador INT;
SET contador = 1;
SET suma = 0;

WHILE contador <= tope DO
   SET suma = suma + contador;
   SET contador = contador + 1;
END WHILE;
END
$$
DELIMITER ;

CALL ejemplo_bucle_while(10, @resultado);
SELECT @resultado;

/* ////////////////////Estructura DECLARE – HANDLER////////////////////// */

DECLARE action HANDLER FOR condition_value statement;

DECLARE handler_action HANDLER
FOR condition_value [, condition_value] ...
Statement

handler_action:
CONTINUE
| EXIT
| UNDO

condition_value:
mysql_error_code
| SQLSTATE [VALUE] sqlstate_value
| condition_name
| SQLWARNING
| NOT FOUND
| SQLEXCEPTION

DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET has_error = 1;

DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
ROLLBACK;
SELECT 'An error has occurred, operation rollbacked and the stored procedure was terminated';
END;

DESCRIBE país;

DELIMITER $$
CREATE PROCEDURE insert_pais(IN pais_id INT, IN nombre VARCHAR(20), IN continente VARCHAR(50), IN poblacion INT)
BEGIN
 DECLARE CONTINUE HANDLER FOR 1062
 SELECT CONCAT('Llave primaria duplicada (',pais_id,',',nombre,') found') AS msg;
 
 -- inserta un nuevo registro en la tabla pais
 INSERT INTO pais(id, nombre, continente, poblacion)
 VALUES(pais_id, nombre, continente, poblacion);
 
 -- retorna cuantos paises hay en la tabla pais
 SELECT COUNT(*) FROM pais;
END$$
DELIMITER ;

SELECT * FROM pais;

SELECT COUNT(*) FROM pais;

CALL insert_pais(105, "Argentina", "Sur América", 44938712);

/* ////////////////////Creación y uso de funciones definidas por el usuario////////////////////// */

CREATE FUNCTION function_name ([parameter1 [type1], ...])
RETURNS return_datatype
[LANGUAGE SQL]
[DETERMINISTIC | NOT DETERMINISTIC]
[SQL DATA ACCESS {CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA}]
[COMMENT 'string']
BEGIN
   declaration_section
   executable_section
END;

CREATE FUNCTION obtener_poblacion (pais_nombre VARCHAR(20))
RETURNS INT DETERMINISTIC
READS SQL DATA
BEGIN
  DECLARE poblacion INT;

  SELECT poblacion INTO poblacion
  FROM pais
  WHERE nombre = pais_nombre;

  RETURN poblacion;
END;

SELECT obtener_poblacion('España');

CREATE FUNCTION contar_ciudades (pais_id INT)
RETURNS INT DETERMINISTIC
READS SQL DATA
BEGIN
  DECLARE cantidad INT;

  SELECT COUNT(*) INTO cantidad
  FROM ciudad
  WHERE id_pais = pais_id;

  RETURN cantidad;
END;

SELECT contar_ciudades(1);

CREATE FUNCTION contar_ciudades_y_hora (pais_id INT)
RETURNS VARCHAR(255) NOT DETERMINISTIC
READS SQL DATA
BEGIN
  DECLARE cantidad INT;
  DECLARE resultado VARCHAR(255);

  SELECT COUNT(*) INTO cantidad
  FROM ciudad
  WHERE id_pais = pais_id;

  SET resultado = CONCAT('El país con id ', pais_id, ' tiene ', cantidad, ' ciudades. Hora actual: ', CURRENT_TIMESTAMP);

  RETURN resultado;
END;

SELECT contar_ciudades_y_hora(1);

/* ////////////////////Creación y uso de Triggers para automatizar acciones en la base de datos////////////////////// */

CREATE
[DEFINER = { user | CURRENT_USER }]
TRIGGER trigger_name
trigger_time  {BEFORE|AFTER} trigger_event {UPDATE|INSERT|DELETE}
ON tbl_name FOR EACH ROW
[trigger_order]
<bloque_de_instrucciones>
trigger_time: { BEFORE | AFTER }

trigger_event: { INSERT | UPDATE | DELETE }

trigger_order: { FOLLOWS | PRECEDES } other_trigger_name

BEFORE INSERT clientes_BI_TRIGGER

CREATE DATABASE campus;

CREATE TABLE IF NOT EXISTS `campus`.`campers` (
  `id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido1` VARCHAR(45) NOT NULL,
  `apellido2` VARCHAR(45) NULL,
  `nota` INT NOT NULL,
  PRIMARY KEY (`id`)) ENGINE = InnoDB

DELIMITER $$
DROP TRIGGER IF EXISTS trigger_check_nota_before_insert$$
CREATE TRIGGER trigger_check_nota_before_insert
BEFORE INSERT ON campus.campers 
FOR EACH ROW
BEGIN
IF NEW.nota < 0 THEN
  set NEW.nota = 0;
ELSEIF NEW.nota > 50 THEN
  set NEW.nota = 50;
 END IF;
END$$
DELIMITER ;

DELIMITER $$
DROP TRIGGER IF EXISTS trigger_check_nota_before_update$$
CREATE TRIGGER trigger_check_nota_before_update
BEFORE UPDATE
ON campers FOR EACH ROW
BEGIN
IF NEW.nota < 0 THEN
  set NEW.nota = 0;
ELSEIF NEW.nota > 50 THEN
  set NEW.nota = 50;
 END IF;
END$$
DELIMITER ;

INSERT INTO campers VALUES (1, 'Pepe', 'López', 'López', -1);
INSERT INTO campers VALUES (2, 'María', 'Sánchez', 'Sánchez', 51);
INSERT INTO campers VALUES (3, 'Juan', 'Pérez', 'Pérez', 45);

SELECT * FROM campers;

UPDATE campers SET nota = -4 WHERE id = 3;
UPDATE campers SET nota = 54 WHERE id = 3;
UPDATE campers SET nota = 45 WHERE id = 3;

SELECT * FROM campers WHERE id = 3;

/* ////////////////////Ver información de un trigger////////////////////// */

SHOW CREATE TRIGGER nombre_del_trigger;

SHOW TRIGGERS;

SHOW CREATE TRIGGER trigger_check_nota_before_insert;

SHOW TRIGGERS;

/* ////////////////////Eliminar un trigger////////////////////// */

DROP TRIGGER [IF EXISTS] nombre_trigger

/* ////////////////////Usuarios y privilegios////////////////////// */

SELECT user, host FROM mysql.user;

set password for ''@'localhost' = password(’nuevapasswd’);

/* ////////////////////La sentencia CREATE////////////////////// */

CREATE USER 'nombre_usuario'@'localhost' IDENTIFIED BY 'contraseña';

USE mundo;
CREATE USER 'campus'@'localhost' IDENTIFIED BY 'Campus2023;';
SELECT user, host FROM mysql.user;

/* ////////////////////La sentencia GRANT////////////////////// */

GRANT privilegios ON objeto TO usuario IDENTIFIED BY 'contraseña';

GRANT UPDATE, INSERT, SELECT on mundo.* to campus@localhost;

GRANT UPDATE, INSERT, SELECT ON mundo.pais TO campus@localhost;

/* ////////////////////Especificaciones de lugares origen de la conexión////////////////////// */

GRANT UPDATE, INSERT, SELECT ON mundo.pais TO campus@%.campusland.com;

CREATE USER 'user2'@'%.campusland.com' IDENTIFIED BY 'Campus2023;';

GRANT UPDATE, INSERT, SELECT ON campus.* TO 'user2'@'%.campusland.com';

flush privileges

/* ////////////////////Especificación de bases de datos y tablas////////////////////// */

GRANT ALL ON mundo.* TO 'admin'@'localhost';

GRANT ALL ON mundo.pais TO 'user3'@'localhost';

/* ////////////////////Especificación de columnas////////////////////// */

GRANT UPDATE(continente, poblacion) ON mundo.pais TO 'user4'@'localhost';

/* ////////////////////Tipos de privilegios////////////////////// */

GRANT USAGE ON *.* TO 'visitante'@'localhost' IDENTIFIED BY ‘sesame’;

/* ////////////////////Opciones de Encriptación////////////////////// */

GRANT ALL ON *.* TO 'visitante'@'localhost' REQUIRE ssl;

/* ////////////////////Límites de uso////////////////////// */

GRANT USAGE ON *.* TO 'usuario'@'localhost'
    WITH MAX_CONNECTIONS_PER_HOUR <cantidad>
        MAX_QUERIES_PER_HOUR <cantidad>
        MAX_UPDATES_PER_HOUR <cantidad>;

GRANT USAGE ON *.* TO 'campus'@'localhost'
  WITH MAX_CONNECTIONS_PER_HOUR 100
       MAX_QUERIES_PER_HOUR 500
       MAX_UPDATES_PER_HOUR 200;

/* ////////////////////Eliminar privilegios////////////////////// */

REVOKE [tipo_privilegio [, ...]] ON objeto
    FROM usuario [, ...]

REVOKE SELECT, INSERT ON idioma
    FROM user1, user2;

REVOKE ALL ON *.*
    FROM visitante@localhost;    

/* ////////////////////Eliminar Usuarios////////////////////// */

DROP USER [IF EXISTS] usuario [, usuario2, ...];

DROP USER IF EXISTS visitante;
