USE emarket;

/*Categorías y productos
Queremos tener un listado de todas las categorías.
Cómo las categorías no tienen imágenes, solamente interesa obtener un listado de CategoriaNombre y Descripcion.
Obtener un listado de los productos.
¿Existen productos discontinuados? (Discontinuado = 1).
Para el viernes hay que reunirse con el Proveedor 8. ¿Qué productos son los que nos provee?
Queremos conocer todos los productos cuyo precio unitario se encuentre entre 10 y 22.
Se define que un producto hay que solicitarlo al proveedor si sus unidades en stock son menores al Nivel de Reorden. ¿Hay productos por solicitar?
Se quiere conocer todos los productos del listado anterior, pero que unidades pedidas sea igual a cero.*/

SELECT * FROM CaTeGORIas;

SELECT CaTEGORIaNombre, DescripCion FROM cateGORIas
ORDER BY CATEGoRIaNombre;

SELECT prODUCTOID, ProductONombre, discontInuado FROM prodUCTOs
WHERE disCONTInuado = 1;

SELECT prODUCTONombre, proveedOrid FROM prodUCTOs
WHERE proVEEDOrID = 8; 

SELECT PrODUCTONombre, precioUNitario FROM prodUCTOs 
WHERE PreCIOUNitario BETWEEN 10 AND 22
ORDER BY PRECIoUNitario;

SELECT prODUCTONombre, UnidadeSStock, NivelReOrden FROM prodUCTOs
WHERE UniDADESStock < NivelReOrden
ORDER BY UNIDAdESStock;

SELECT prODUCTONombre, UnidadeSStock, NivelReOrden, UnidadeSPedidas FROM prodUCTOs
WHERE UniDADESStock < NivelReOrden AND UnidaDESPedidas = 0;

/*CLiEntes
Obtener un listado de todos los clientes con Contacto, Compania, Título, País. Ordenar el listado por País.
Queremos conocer a todos los clientes que tengan un título “Owner”.
El operador telefónico que atendió a un cliente no recuerda su nombre. Solo sabe que comienza con “C”. 
¿Lo ayudamos a obtener un listado con todos los contactos que inician con la letra “C”?*/

SELECT Contacto, CoMPANIA, TITULO, Pais FROM clienteS
ORDER BY Pais;

SElECT ClIEnTEID, TITULO FROM CLIEnTes
WHERE TITulo= 'OWNeR';

SELECT CLienteID, cONTACTo FROM CLiEntes
WHERE CONtacto LIKE 'C%';

/*FACTuRAS
ObtenER Un listado de todas las facturas, ordenado por fecha de factura ascendente.
Ahora se requiere un listado de las facturas con el país de envío “USA” y que su correo (EnvioVia) sea distinto de 3.
¿El cliente 'GOURL' realizó algún pedido?
Se quiere visualizar todas las facturas de los empleados 2, 3, 5, 8 y 9.*/

SELECT * FROM facturas
ORDER BY FEcHaFACTURa ASC;

SELECT FaCTURAID, EnviOVIa, PAISENvio FROM fActuras
WHERE PaisENviO = 'usa' AND ENVIOVia != 3
ORDER BY eNVIovia;

SELECT * FROM FAcTURAS
WHERE CLIENtEID = 'GOURL';

SELECT * FROM faCturas 
WHERE EMPLeAdOID IN (2, 3, 5, 8, 9)
ORDER BY EMpLEAdOID;

