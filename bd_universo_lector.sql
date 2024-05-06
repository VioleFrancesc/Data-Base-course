DROP DATABASE IF EXISTS universo_lector;

-- crea base de datos universo lector 
CREATE DATABASE IF NOT EXISTS universo_lector;
USE universo_lector;

DROP TABLE IF EXISTS socio; 

-- crea tabla socios
CREATE TABLE socio (
codigo INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
dni INT,
apellido VARCHAR(100),
nombres VARCHAR(100),
direccion VARCHAR(200),
localidad VARCHAR(100)
);

DROP TABLE IF EXISTS editorial;
 
 -- crea tabla editorial
CREATE TABLE editorial (
codigo INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
razon_social VARCHAR(100),
telefono INT
);

DROP TABLE IF EXISTS prestamo;
 
 -- crea tabla prestamo
CREATE TABLE prestamo (
codigo INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
codigo_socio INT,
fecha DATETIME,
fecha_devolucion DATE,
fecha_tope DATE,

FOREIGN KEY (codigo_socio) REFERENCES socio (codigo)
);

DROP TABLE IF EXISTS autor;
 
 -- crea tabla autor
CREATE TABLE autor (
codigo INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
apellido VARCHAR(40),
nombre VARCHAR(40)
);

DROP TABLE IF EXISTS libro; 

-- crea tabla libro
CREATE TABLE libro (
codigo INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
isbn VARCHAR(13),
titulo VARCHAR(200),
anio_escritura DATE,
codigo_autor INT,
anio_edicion DATE,
codigo_editorial INT,

FOREIGN KEY (codigo_autor) REFERENCES autor (codigo),
FOREIGN KEY (codigo_editorial) REFERENCES editorial (codigo)
);

DROP TABLE IF EXISTS volumen;
 
 -- crea tabla volumen
CREATE TABLE volumen (
codigo INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
codigo_libro INT,
deteriorado BOOL,

FOREIGN KEY (codigo_libro) REFERENCES libro (codigo)
);

-- crea tabla relacion prestamo volumen
DROP TABLE IF EXISTS prestamo_volumen;

CREATE TABLE IF NOT EXISTS prestamo_volumen (
codigo INT NOT NULL PRIMARY KEY AUTO_INCREMENT NOT NULL,
codigo_prestamo INT NOT NULL, 
codigo_volumen INT NOT NULL,
FOREIGN KEY (codigo_prestamo) REFERENCES prestamo (codigo),
FOREIGN KEY (codigo_volumen) REFERENCES volumen (codigo)
);

insert into 
universo_lector.autor(codigo, apellido, nombre)
values
(01, "Jenkins Reid", "Taylor"),
(02,"Oyhanarte", "Rosario"),
(03, "Sosa Escudero", "Walter"),
(04, "Meyer", "Marissa");

insert into 
universo_lector.editorial(codigo, razon_sociaL, telefono)
values
(01, "Siglo 21", "0112596347"), 
(02, "Vergara", "0258242359"),
(03, "VRYA", "0298365896"),
(04, "UMBRIEL", "154896325");

insert into 
universo_lector.libro(codigo, isbn, titulo, anio_escritura, codigo_autor, anio_edicion, codigo_editorial)
values
(01, "1315142524", "Los siete Maridos de Evelyn Hugo", 2020-05-23, 01, 2024-05-23, 04),
(02, "256984873", "Rosie's Blossoms", 2019-06-21, 02, 2021-03-29, 02),
(03, "256998778", "Heartless", 2015-06-25, 04, 2017-08-30, 03),
(04, "257412963", "Big Data", 2019-01-01, 03, 2021-12-14, 01);

insert into 
universo_lector.prestamo(codigo, codigo_socio, fecha, fecha_devolucion, fecha_tope)
values
(01, 05, 2024-02-03, 2024-02-05, 2024-02-20);

insert into
universo_lector.socio(codigo, dni, nombres, apellido, direccion, localidad)
values 
(01, 3000000, "PATRICIA", "JOHNSON", "28 MySQL Boulevard", "QLD"),	
(02, 2988800,	"LINDA", "WILLIAMS", "23 Workhaven", "Lane"),
(03, 2500000,	"BARBARA", "JONES", "1411 Lillydale Drive",	"QLD"),
(04, 32980002,	"LOIS",	"BUTLER", "1688 Okara Way Nothwest", "Border Prov"),
(05, 2313909, "ROBIN", "HAYES", "262 A Corua (La Corua)", "Parkway Dhaka");
insert into 
universo_lector.volumen(codigo, codigo_libro, deteriorado)
values 
(03, "4", 0);

DELETE FROM socio WHERE codigo= 3;
