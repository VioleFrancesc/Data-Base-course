use emarket;

-- Productos
-- Obtener el listado de todos los productos ordenados descendentemente por precio unitario.
 
 SELECT ProductoID as pid, ProductoNombre as pn, PrecioUnitario as pu FROM productos 
 ORDER BY PrecioUnitario DESC;
 
-- Obtener el listado de top 5 de productos cuyo precio unitario es el más caro.

SELECT ProductoNombre as PN, PrecioUnitario as PU from productos
order by PrecioUnitario desc 
limit 5;

-- Obtener un top 10 de los productos con más unidades en stock.

select ProductoNombre as PN, UnidadesStock as US from productos
order by UnidadesStock desc
limit 10;

-- FacturaDetalle
-- Obtener un listado de FacturaID, ProductoID, Cantidad.

select FacturaID as FID, ProductoID as PID, cantidad as CANT from facturadetalle;

-- Ordenar el listado anterior por cantidad descendentemente.

select FacturaID as FID, ProductoID as PID, cantidad as CANT from facturadetalle
order by cantidad desc;

-- Filtrar el listado solo para aquellos productos donde la cantidad se encuentre entre 50 y 100.

select FacturaID as FID, ProductoID as PID, cantidad as CANT from facturadetalle
where cantidad between 50 and 100;

/* En otro listado nuevo, obtener un listado con los siguientes nombres de columnas: NroFactura (FacturaID), Producto (ProductoID),
 Total (PrecioUnitario*Cantidad).*/

select FacturaID as NroFactura, ProductoID as Producto, 
(PrecioUnitario*Cantidad) as Total 
from facturadetalle;


-- ¡Extras!
-- Obtener un listado de todos los clientes que viven en “Brazil" o “Mexico”, o que tengan un título que empiece con “Sales”. 

Select ClienteID, contacto as cliente, pais, titulo from clientes
where pais = "Brazil" or pais = "Mexico" or Titulo like "Sales %";

-- Obtener un listado de todos los clientes que pertenecen a una compañía que empiece con la letra "A".

select ClienteID, contacto as nombre, compania from clientes 
where compania like 'a%';

/* Obtener un listado con los datos: Ciudad, Contacto y renombrarlo como Apellido y Nombre, Titulo y 
renombrarlo como Puesto, de todos los clientes que sean de la ciudad "Madrid". */

select Ciudad, contacto as NombreyApellido, titulo as Puesto from clientes
where ciudad = 'Madrid';

-- Obtener un listado de todas las facturas con ID entre 10000 y 10500

select * from facturas
where facturaID between 10000 and 10500
order by facturaID asc;

-- Obtener un listado de todas las facturas con ID entre 10000 y 10500 o de los clientes con ID que empiecen con la letra “B”.

select * from facturas
where facturaID between 10000 and 10500 or clienteID like 'B%'
order by facturaID asc;


-- ¿Existen facturas que la ciudad de envío sea “Vancouver” o que utilicen el correo 3?

select FacturaID, ciudadenvio, EnvioVia as Correo from facturas
where CiudadEnvio = 'Vancouver' or EnvioVia = 3
order by CiudadEnvio;

-- ¿Cuál es el ID del empleado de apellido “Buchanan”?

select EmpleadoID as ID, nombre, apellido from empleados
where apellido = 'Buchanan';

-- ¿Existen facturas con EmpleadoID del empleado del ejercicio anterior? (No relacionar, sino verificar que existan facturas)

select count(facturaID) as CantFacturas from facturas 
where EmpleadoID = 5;