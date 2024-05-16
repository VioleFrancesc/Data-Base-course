use emarket;

/*Reportes parte I - Repasamos INNER JOIN
Realizar una consulta de la facturación de e-market. Incluir la siguiente información:
Id de la factura
fecha de la factura
nombre de la empresa de correo
nombre del cliente
categoría del producto vendido 
nombre del producto 
precio unitario 
cantidad (fd)
*/

select f.facturaid as IDFactura, f.fechafactura as Fecha, 
       c.contacto as nombre,
	   cr.compania,
	   cat.categorianombre as Categoria, 
	   p.productonombre as Producto,
	   fd.preciounitario as Precio, fd.cantidad
from facturas as f
  inner join clientes as c
   on f.clienteID = c.clienteID
  inner join correos as cr 
   on cr.correoID = f.enviovia 
  inner join facturadetalle as fd
   on fd.facturaid = f.FacturaID
  inner join productos as p 
   on p.productoid = fd.productoid
  inner join categorias as cat
   on cat.categoriaid = p.categoriaid;
   
   /*Reportes parte II - INNER, LEFT Y RIGHT JOIN
Listar todas las categorías junto con información de sus productos. Incluir todas las categorías aunque no tengan productos.
Listar la información de contacto de los clientes que no hayan comprado nunca en emarket.
Realizar un listado de productos. Para cada uno indicar su nombre, categoría, y la información de contacto de su proveedor. Tener en cuenta que puede haber productos para los cuales no se indicó quién es el proveedor.
Para cada categoría listar el promedio del precio unitario de sus productos.
Para cada cliente, indicar la última factura de compra. Incluir a los clientes que nunca hayan comprado en e-market.
Todas las facturas tienen una empresa de correo asociada (enviovia). Generar un listado con todas las empresas de correo, y la cantidad de facturas correspondientes. Realizar la consulta utilizando RIGHT JOIN.
*/

SELECT c.CategoriaID, c.CategoriaNombre, p.ProductoID, p.ProductoNombre
FROM categorias AS c
LEFT JOIN productos AS p ON c.CategoriaID = p.CategoriaID;

SELECT c.Contacto
FROM clientes AS c
LEFT JOIN facturas AS f ON c.ClienteID = f.ClienteID
WHERE f.ClienteID IS NULL;

SELECT pr.ProductoNombre, c.CategoriaNombre,
    COALESCE(CONCAT( ', ', p.Contacto), 'Proveedor no especificado') AS informacion_proveedor
FROM Productos AS pr
LEFT JOIN Categorias AS c ON pr.CategoriaID = c.CategoriaID
LEFT JOIN Proveedores AS p ON pr.ProveedorID = p.ProveedorID;

SELECT c.CategoriaID, c.CategoriaNombre,
    AVG(p.PrecioUnitario) AS promedio_precio_unitario
FROM Productos AS p
JOIN Categorias AS c ON p.CategoriaID = c.CategoriaID
GROUP BY c.CategoriaID, c.CategoriaNombre;

SELECT c.ClienteID, c.Contacto AS NombreCliente,
    COALESCE(MAX(f.FechaFactura), 'Nunca ha comprado') AS UltimaFactura
FROM Clientes AS c
LEFT JOIN Facturas AS f ON c.ClienteID = f.ClienteID
GROUP BY c.ClienteID, c.Contacto;

SELECT c.Compania AS Empresa,
    COUNT(f.FacturaID) AS CantidadFacturas
FROM Correos AS c
RIGHT JOIN Facturas AS f ON c.CorreoID = f.EnvioVia
GROUP BY c.Compania;









