create table departamentos(
id serial primary key,
nombre varchar(100) not null
);

create table empleados (
id serial primary key,
nombre varchar(100)not null,
correo varchar(100),
departamento_id integer,
foreign key (departamento_id) references departamentos(id)
);

 --Qué es una clave primaria y por qué se usa en id
 
 --R:Es el identificador único de cada registro en una tabla.no  puede haber dos iguales y no puede estar vacía.
-- se una por unicidad , velocidad e integridad

--• Qué significa NOT NULL
--R:Es una restricción (constraint) que le indica a la base de datos que esa columna obligatoriamente debe tener un valor.

--• Qué relación existe entre empleados y departamentos
-- R:relación de Uno a Muchos (1:N).

--2. Modificar tablas existentes
--Agrega nuevas columnas a las tablas creadas:
--• A empleados: un campo fecha_ingreso DATE

alter table empleados 
add fecha_ingreso date;

--• A departamentos: un campo ubicacion VARCHAR(100)

alter table departamentos
add ubicacion varchar(100);


--Luego:
--• Modifica el campo correo de empleados para que no permita nulos (SET NOT NULL)

alter table empleados
alter column correo set not null;


--• Intenta modificar una clave primaria y documenta qué ocurre

alter table empleados
alter column id drop not null;

--3. Eliminar y truncar tablas
--• Escribe una sentencia para eliminar la tabla empleados (teniendo en cuenta su relación con
--departamentos).

drop table empleados;
--• Crea una tabla temporal de prueba, inserta un par de registros, y luego ejecuta un TRUNCATE sobre ella.

create table prueba(
id serial primary key,
nombre varchar(100) not null
);

INSERT INTO prueba (nombre) VALUES 
('Primer Registro'),
('Segundo Registro'),
('Tercer Registro');

select * from prueba;

truncate table prueba;

--• Comenta la diferencia entre DELETE y TRUNCATE.

--TRUNCATE: es una forma rápida de vaciar una tabla.(vacia toda la tabla pero no la estructura) 
-- DELETE:  se usa para eliminar filas específicas. 
