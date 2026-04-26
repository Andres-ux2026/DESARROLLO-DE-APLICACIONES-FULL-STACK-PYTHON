

--1. Inserción de datos (INSERT)
--Agrega registros a las tablas:
--• Insertar al menos 3 nuevos clientes.

insert into clientes(nombre,ciudad) values
('Roberto Dueñas','Calama'),
('Carmen Caceres', 'Victoria'),
('Carla Melo','Tal Tal ');

select * from clientes


--• Insertar al menos 5 pedidos asociados a los clientes.

INSERT INTO pedidos (cliente_id, total, fecha) 
VALUES 
(7, 15500.50, '2026-04-20'),
(9, 42000.00, '2026-04-21'), 
(8, 12800.90, '2026-04-22'), 
(8, 5500.00,  '2026-04-23'), 
(7, 31200.00, '2026-04-24');

select * from pedidos
--• Usa DEFAULT o una secuencia (SERIAL) para autogenerar los IDs.

create table clientes (
  id serial primary key,
  nombre varchar (100),
  ciudad varchar (50)
);

create table pedidos (
 id serial primary key,
 cliente_id int,
 total numeric,
 fecha date, 
 foreign key (cliente_id) references clientes(id)


--2. Actualización de datos (UPDATE)
--• Cambiar la ciudad de un cliente con id = 2 a "Viña del Mar".

update clientes 
set ciudad = 'Vina del mar'
where id = 2;

--• Modificar el total de un pedido existente.

update pedidos
set total = 1000000
where id = 5; 


--3. Eliminación de datos (DELETE)
--• Eliminar un pedido por su id.

delete from pedidos 
where id = 2; 


--• Intentar eliminar un cliente que tiene pedidos asociados y documentar el resultado (debe fallar si hay
--restricción de integridad referencial).
delete from clientes  
where id = 2;


--Realiza el siguiente ejercicio en SQL y documenta lo ocurrido:

begin;
update pedidos 
set total = 0,
where id = 1,
rollback;
	
--Repite con:

begin;
delete from pedidos
where id = 2,
commit;


