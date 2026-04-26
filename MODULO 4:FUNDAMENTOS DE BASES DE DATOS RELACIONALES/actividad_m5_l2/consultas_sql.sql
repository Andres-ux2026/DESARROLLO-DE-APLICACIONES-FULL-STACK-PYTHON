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
)

INSERT INTO clientes (nombre, ciudad) VALUES
('Bastián Muñoz', 'Valparaíso'),
('Francisca Soto', 'Santiago'),
('Matías Lagos', 'Concepción'),
('Antonia Vera', 'Temuco'),
('Diego Retamal', 'La Serena');

INSERT INTO pedidos (cliente_id,total, fecha) VALUES
(1, 25000, '2024-04-01'), 
(1, 12000, '2024-04-15'), 
(3, 18500, '2024-04-05'),
(3, 9900,  '2024-04-20'),
(4, 55000, '2024-04-10'),
(5, 32000, '2024-04-12'),
(5, 15000, '2024-04-18'),
(2, 7500,  '2024-04-22'),
(4, 21500, '2024-04-25');


-- 1. Consultas a una sola tabla
--Escribe consultas SQL que realicen lo siguiente:
-- Obtener todos los registros de la tabla clientes.

select * from clientes;

-- Obtener el nombre y ciudad de todos los clientes que vivan en "Valparaíso".

select nombre,ciudad from clientes
where ciudad ='Valparaíso';

-- Obtener el cliente con id = 3

select nombre from clientes
where id = 3; 

-- Usar COUNT() para contar cuántos clientes hay en total.

select count (*) from clientes;

-- Obtener todas las ciudades distintas en las que hay clientes (DISTINCT).

select distinct ciudad 
from clientes;


-- Agrupar clientes por ciudad y contar cuántos hay en cada una.

select ciudad,count(ciudad) from clientes 
group by ciudad;

--2. Consultas entre varias tablas
--Consulta con SQL:
-- Obtener todos los pedidos, incluyendo el nombre del cliente.

select
 pedidos.id,
 clientes.nombre,
 pedidos.total,
 pedidos.fecha
from pedidos
join clientes on pedidos.cliente_id = clientes.id;




-- Obtener los pedidos hechos por clientes de "Santiago".

select
 pedidos.id,
 clientes.nombre,
 clientes.ciudad,
 pedidos.total,
 pedidos.fecha 
from pedidos
join clientes on pedidos.cliente_id = clientes.id
where ciudad like 'Santiago';
  


--Obtener el total de pedidos por cliente (usando GROUP BY).

select 
 clientes.nombre,
count(*)
from pedidos
join clientes on pedidos.cliente_id = clientes.id
group by clientes.nombre;


-- Usar un LEFT JOIN para listar todos los clientes y sus pedidos, incluyendo aquellos que no han hechopedidos.

INSERT INTO clientes (nombre, ciudad) VALUES
('Andres Moraga', 'Puerto Montt');

select
 clientes.nombre,
 clientes.ciudad,
 pedidos.id,
 pedidos.total,
 pedidos.fecha 
from clientes
left join pedidos on pedidos.cliente_id = clientes.id;


-- Crear una consulta anidada que muestre los clientes cuyo total de pedidos supera los $100.000.

update pedidos
set total = 170000
where id = 1;

select * from pedidos;

select 
clientes.nombre,
pedidos.total
from pedidos
join clientes on pedidos.cliente_id = clientes.id
where pedidos.total > 150000;
