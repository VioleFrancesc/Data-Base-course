use emarket;

-- Consultas queries XL parte II - JOIN

#Generar un listado de todas las facturas del empleado 'Buchanan'. 

Select * from facturas as f
join empleados as e on e.EmpleadoID = f.EmpleadoID
where e.apellido = 'Buchanan';

#Generar un listado con todos los campos de las facturas del correo 'Speedy Express'.

select * from facturas as f
join correos as c on c.CorreoID = f.EnvioVia
where c.Compania = 'Speedy Express';

#Generar un listado de todas las facturas con el nombre y apellido de los empleados.

select f.facturaID, e.nombre, e.apellido from empleados as e
join facturas as f on e.EmpleadoID=f.EmpleadoID;

#Mostrar un listado de las facturas de todos los clientes “Owner” y país de envío “USA”.

select c.clienteID, c.contacto, c.titulo, f.FacturaId, f.PaisEnvio from clientes as c
join facturas as f on c.clienteID = f.clienteID
where c.titulo like 'Owner' and f.PaisEnvio = 'USA';

#Mostrar todos los campos de las facturas del empleado cuyo apellido sea “Leverling” o que incluyan el producto id = “42”.

select f.FacturaID, e.apellido, fd.ProductoID from facturas as f
join empleados as e on e.EmpleadoID=f.EmpleadoID
join facturadetalle as fd on f.facturaid=fd.FacturaID
where e.Apellido = 'leverling' or fd.ProductoID = 42;

#Mostrar todos los campos de las facturas del empleado cuyo apellido sea “Leverling” o que incluya los producto id = “80” o ”42”.

select f.FacturaID, e.EmpleadoID, e.Apellido, fd.ProductoID from facturas as f
join empleados as e on f.EmpleadoID = e.EmpleadoID
join facturadetalle as fd on fd.FacturaID = f.FacturaID
where e.Apellido = 'leverling' or fd.ProductoID =42 or fd.ProductoID= 80
order by fd.ProductoID;

#Generar un listado con los cinco mejores clientes, según sus importes de compras total (PrecioUnitario * Cantidad).

select c.ClienteID, c.Contacto as Nombre, round(sum(fd.PrecioUnitario*fd.Cantidad),2) as Totalcompras from facturadetalle as fd
join facturas as f on f.FacturaID = fd.FacturaID 
join clientes as c on c.ClienteID = f.ClienteID
group by c.ClienteID
order by totalcompras desc
limit 5;

# Generar un listado de facturas, con los campos id, nombre y apellido del cliente, fecha de factura, país de envío, Total, 
# ordenado de manera descendente por fecha de factura y limitado a 10 filas.

select distinct C.ClienteID, c.Contacto as NombreyApellido, f.FacturaID, f.FechaFactura, f.PaisEnvio, SUM(fd.PrecioUnitario*Cantidad) as Total
 from facturas as f
join clientes as c on f.ClienteID = c.ClienteID
join facturadetalle as fd on fd.FacturaID = f.FacturaID
group by f.FacturaID
order by FechaFactura
limit 10;