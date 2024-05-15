USE emarket;
/*Consultas queries XL parte I - GROUP BY
Vamos a practicar sobre consultas SELECT, enfocándonos en group by, having y distinct.
Tips:
Cada enunciado se corresponde con una consulta SELECT.
Recordá ir guardando las consultas. SQL.*/

/*Clientes
¿Cuántos clientes existen?
¿Cuántos clientes hay por ciudad?*/

SELECT COUNT(*) AS CAnTIdadClientes FROM cLIENtes;

SELECT CIUDAd, COUNT(*) AS CLiENtesxCiudad FROM cLIENtes
GROUP BY CIuDAd;

/*Facturas
¿Cuál es el total de transporte?
¿Cuál es el total de transporte por EnvioVia (empresa de envío)?
Calcular la cantidad de facturas por cliente. Ordenar descendentemente por cantidad de facturas.
Obtener el Top 5 de clientes de acuerdo a su cantidad de facturas.
¿Cuál es el país de envío menos frecuente de acuerdo a la cantidad de facturas?
Se quiere otorgar un bono al empleado con más ventas. ¿Qué ID de empleado realizó más operaciones de ventas?*/

SELECT ROUND(SUM(Transporte),2) AS TotalTransporte FROM facturas;

SELECT enviovia, COUNT(*) FROM facturas
GROUP BY envioVia;

SELECT clienteID, COUNT(*) AS FacturaxCliente FROM facturas
GROUP BY clienteID
ORDER BY FacturaxCliente DESC;

SELECT clienteID, COUNT(*) AS FacturaxCliente FROM facturas
GROUP BY clienteID
ORDER BY FacturaxCliente DESC
LIMIT 5;

SELECT PaisEnvio, COUNT(*) AS CantidadEnvios FROM facturas
GROUP BY PaisEnvio
ORDER BY CantidadEnvios
LIMIT 1;

select empleadoID, count(*) as CantVentas from facturas
group by empleadoID
order by CantVentas desc
limit 1;

/*Factura detalle
¿Cuál es el producto que aparece en más líneas de la tabla Factura Detalle?
¿Cuál es el total facturado? Considerar que el total facturado es la suma de cantidad por precio unitario.
¿Cuál es el total facturado para los productos ID entre 30 y 50?
¿Cuál es el precio unitario promedio de cada producto?
¿Cuál es el precio unitario máximo?*/

SELECT productoID, COUNT(*) AS Ventas FROM facturadetalle
GROUP BY productoID 
ORDER BY Ventas DESC;

SELECT ROUND(SUM(precioUnitario),2) Totalfacturado FROM facturadetalle;

SELECT productoid, SUM(preciounitario) AS TotalProd FROM facturadetalle
WHERE productoId BETWEEN 30 AND 50
GROUP BY productoId;

SELECT productoid, ROUND(AVG(DISTINCT preciounitario),2) AS Promedio FROM facturadetalle
GROUP BY productoId;

SELECT productoid, PrecioUnitario FROM facturadetalle
HAVING precioUnitario IS NOT NULL
ORDER BY preciounitario DESC
LIMIT 1;