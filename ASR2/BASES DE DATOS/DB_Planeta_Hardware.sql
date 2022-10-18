SET NAMES utf8mb4;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';
SET @old_autocommit=@@autocommit;

DROP DATABASE IF EXISTS `Planeta_Hardware`;
CREATE DATABASE `Planeta_Hardware`;
USE `Planeta_Hardware` ;

-- -----------------------------------------------------
-- Tabla `Catalogo SECCIONES`
-- -----------------------------------------------------
CREATE  TABLE `secciones` (
  `Codigo_Seccion` VARCHAR(10) NOT NULL ,
  `Nombre_Seccion` VARCHAR(45) ,
  PRIMARY KEY (`Codigo_Seccion`) );

INSERT INTO `secciones` (`Codigo_Seccion`,`Nombre_Seccion`) VALUES 
('info','Informática'), 
('tv','Televisión'), 
('cons','Consolas'), 
('audvid','Audio y vídeo'),
('aud','Audio'),
('vid','Vídeo');

-- -----------------------------------------------------
-- Tabla `TIENDA_SECCION`
-- -----------------------------------------------------
CREATE  TABLE `tienda_seccion` (
  `Localidad` VARCHAR(45) NOT NULL ,
  `Codigo_Seccion` VARCHAR(10) NOT NULL ,
  `DNI_encargado` VARCHAR(10) NOT NULL ,
  PRIMARY KEY (`Localidad`, `Codigo_Seccion`) );

INSERT INTO `tienda_seccion` (`Localidad`,`Codigo_Seccion`,`DNI_encargado`) VALUES
('Bilbao','info','13342553B'),
('Bilbao','tv','44592325F'),
('Bilbao','audvid','42423654G'),
('Oviedo','info','77143626W'),
('Oviedo','tv','45454545A'),
('Oviedo','cons','21174411F'),
('Valladolid','info','33333333C'),
('Valladolid','tv','65778321B'),
('Valladolid','cons','99774324W'),
('Valladolid','aud','17873522A'),
('Valladolid','vid','22412266A'),
('Santander','info','11133244H'),
('Santander','audvid','33615229F'),
('Santander','cons','12121233C');

-- -----------------------------------------------------
-- Tabla `TIENDAS`
-- -----------------------------------------------------
CREATE  TABLE `tiendas` (
  `Localidad` VARCHAR(45) NOT NULL ,
  `Direccion` VARCHAR(100) ,
  `M2` INT ,
  `Mapa` BLOB ,
  `Foto` BLOB ,
  PRIMARY KEY (`Localidad`) );

INSERT INTO `tiendas` (`Localidad`,`Direccion`,`M2`,`Mapa`,`Foto`) VALUES
('Bilbao','Paseo Zabalburu, 22','4400','',''),
('Oviedo','Polígono Las Teresitas, 123','3250','',''),
('Valladolid','Barrio Zaratán, 34','2100','',''),
('Santander','Avenida del Alisal, 45','2800','','');


-- -----------------------------------------------------
-- Tabla `EMPLEADOS`
-- -----------------------------------------------------
CREATE  TABLE `empleados` (
  `DNI` VARCHAR(10) NOT NULL ,
  `Apellidos_Empleado` VARCHAR(100) ,
  `Nombre_Empleado` VARCHAR(45) ,
  `Domicilio_Empleados` VARCHAR(100) ,
  `Fecha_alta_Empleados` DATE ,
  `Tipo_Contrato` VARCHAR(45) ,
  `Duracion_Contrato` VARCHAR(45) ,
  `Localidad` VARCHAR(45) NOT NULL ,
  `Codigo_Seccion` VARCHAR(10) NOT NULL ,
  PRIMARY KEY (`DNI`) );

INSERT INTO `empleados` 
(`DNI`,`Apellidos_Empleado`,`Nombre_Empleado`,`Domicilio_Empleados`,`Fecha_alta_Empleados`,`Tipo_Contrato`,`Duracion_Contrato`,`Localidad`,`Codigo_Seccion`)
 VALUES
('11111111A','Martínez Alcalde','Carmen','C/ Ruiz Tagle, 24, CP 34567','2010-10-23','Fijo','Indefinido','Oviedo','info'),
('22222222B','Alcántara, Ruiz','Alberto','C/ Neguri, bajo, CP 33984','2009-11-17','Eventual','24 meses','Bilbao','info'),
('33333333C','Ruiz Alberdi','Román','Paseo de la Habana, 125, CP 89675','2011-02-05','Por obra o servicio','Fin de obra o servicio','Valladolid','info'),
('44444444A','Sánchez Gómez','Ángeles','C/ León Felipe, 88, CP 67556','2012-05-13','Fijo','Indefinido','Valladolid','tv'),
('55555555B','Barquín De Diego Lopez','Isabel','Avda. Ceballos, 55, CP 33765','2012-03-03','Por obra o servicio','Fin de obra o servicio','Valladolid','vid'),
('45454545A','Izquierdo Gutiérrez','Rosana','C/ Alonso Astúlez, 12, CP 99612','2012-12-01','Eventual','6 meses','Oviedo','info'),
('12113334C','Valverde Díaz','Jose Luis','C/ Arenal, 67, CP 33457','2013-01-02','Eventual','12 meses','Valladolid','cons'),
('65778321B','Ceballos Barón','Isabel','Avenida Libertad, 22, CP 23445','2012-06-23','Eventual','6 meses','Valladolid','info'),
('34343434F','Márquez Carrasco','Javier','C/ Julián Ceballos, 67, CP 66435','2012-01-23','Fijo','Indefinido','Oviedo','tv'),
('44592325F','Pereda Barón','Helena','Paseo Pereda, 778, CP 39001','2010-06-16','Por obra o servicio','Fin de obra o servicio','Bilbao','tv'),
('11133244H','Salces De la Calle','Enrique','C/ Manuel Villavicencio, 785, CP 55783','2012-06-06','Eventual','6 meses','Santander','info'),
('43425632B','Ruiz Cicero','Jose Ángel','Paso de los acebos, 23, CP 55823','2012-03-14','Eventual','6 meses','Valladolid','aud'),
('43366112A','Méndez Álvarez','Marcos','C/ María Blanchard, 5, CP 22918','2012-05-04','Fijo','Indefinido','Bilbao','tv'),
('99774324W','Martínez Alcalde','Carmen','C/ Alonso Astúlez, CP 99612','2012-12-001','Eventual','6 meses','Valladolid','cons'),
('42423654G','Arce Beltrán','Daniel','Avda. de los Sauces, CP 55812','2012-09-19','Fijo','Indefinido','Bilbao','audvid'),
('33615229F','Barcina Cicero','Carolina','C/ Vicente Ferrer, s/n, CP 30082','2011-12-28','Eventual','12 meses','Santander','audvid'),
('17873522A','Esteban Jiménez','Paz','C/ Prado del Rey, CP 16673','2011-06-10','Por obra o servicio','Fin de obra o servicio','Valladolid','aud'),
('13342553B','López Suárez','Ernesto','Paseo de los tilos, CP 23112','2012-06-10','Eventual','12 meses','Bilbao','info'),
('27754228C','González Maestro','Carlos','C/ Fernández Vallejo, 160, CP 39316','2011-09-22','Eventual','6 meses','Oviedo','cons'),
('77143626W','Gutiérrez Arconada','Fernando','Paseo Villadiego, 16, CP 99743','2012-10-12','Eventual','8 meses','Oviedo','info'),
('21174411F','Pando Peña','Ángel','C/ Ruiz de Alda, 14, CP 39008','2012-10-28','Fijo','Indefinido','Oviedo','cons'),
('12121233C','González Barquín','Carmen','C/ León Felipe, 32, CP 56221','2013-01-03','Eventual','6 meses','Santander','cons'),
('22412266A','Alegría Ruiz','José','Paseo de Muriedas, s/n, CP 38865','2012-09-22','Eventual','9 meses','Valladolid','vid'),
('27232555C','Marquínez Calvo','Mónica','Avda. de los Ciruelos, 4, CP 11665','2012-07-15','Fijo','Indefinido','Bilbao','audvid'),
('11155331B','Barahona Calvo','Carlos Jesús','C/ de los naranjos, 112, CP 11009','2011-03-16','Fijo','Indefinido','Santander','audvid'),
('22115669D','Durantez Mier','Amparo','C/ Torres de la Vega, 126, CP 39004','2012-11-22','Fijo','Indefinido','Santander','info'),
('77824455F','Fernández Ruiz','Ana María','Paseo de los cerezos, 92, CP 88323','2011-12-03','Eventual','6 meses','Santander','cons'),
('77343543B','Franco Meruelo','Alvaro','C/ Marqués de la Hermida, 11, CP 99008','2011-03-16','Eventual','3 meses','Santander','info');

-- -----------------------------------------------------
-- Tabla `HACEN`
-- -----------------------------------------------------
CREATE  TABLE `hacen` (
  `DNI` VARCHAR(10) NOT NULL ,
  `Codigo_Turno` VARCHAR(10) NOT NULL ,
  `Fecha_Inicio` DATE ,
  `Fecha_fin` DATE  ,
  PRIMARY KEY (`DNI`, `Codigo_Turno`, `Fecha_Inicio`) );

INSERT INTO `hacen` (`DNI`,`Codigo_Turno`,`Fecha_Inicio`,`Fecha_fin`) VALUES 

('27232555C','Ma','2013-01-01','2013-01-15'),
('27232555C','Me','2013-01-01','2013-01-15'),
('42423654G','Ta','2013-01-01','2013-01-15'),
('42423654G','Ma','2013-01-16','2013-01-31'),
('42423654G','Me','2013-01-16','2013-01-31'),
('27232555C','Ta','2013-01-16','2013-01-31'),

('13342553B','Ma','2013-01-01','2013-01-15'),
('13342553B','Ta','2013-01-01','2013-01-15'),
('22222222B','Me','2013-01-01','2013-01-15'),
('13342553B','Me','2013-01-16','2013-01-31'),
('22222222B','Ma','2013-01-16','2013-01-31'),
('22222222B','Ta','2013-01-16','2013-01-31'),

('43366112A','Ma','2013-01-01','2013-01-15'),
('43366112A','Ta','2013-01-01','2013-01-15'),
('44592325F','Me','2013-01-01','2013-01-15'),
('44592325F','Me','2013-01-16','2013-01-31'),
('43366112A','Ma','2013-01-16','2013-01-31'),
('43366112A','Ta','2013-01-16','2013-01-31'),

('21174411F','Ma','2013-01-01','2013-01-15'),
('21174411F','Me','2013-01-01','2013-01-15'),
('27754228C','Ta','2013-01-01','2013-01-15'),
('27754228C','Ma','2013-01-16','2013-01-31'),
('21174411F','Ta','2013-01-16','2013-01-31'),
('27754228C','Me','2013-01-16','2013-01-31'),

('11111111A','Ma','2013-01-01','2013-01-15'),
('77143626W','Me','2013-01-01','2013-01-15'),
('45454545A','Ta','2013-01-01','2013-01-15'),
('11111111A','Ta','2013-01-16','2013-01-31'),
('45454545A','Ma','2013-01-16','2013-01-31'),
('77143626W','Me','2013-01-16','2013-01-31'),

('34343434F','Ma','2013-01-01','2013-01-15'),
('34343434F','Me','2013-01-01','2013-01-15'),
('34343434F','Ma','2013-01-16','2013-01-31'),
('34343434F','Me','2013-01-16','2013-01-31'),

('11155331B','Ma','2013-01-01','2013-01-15'),
('11155331B','Me','2013-01-01','2013-01-15'),
('33615229F','Ta','2013-01-01','2013-01-15'),
('33615229F','Ma','2013-01-16','2013-01-31'),
('33615229F','Me','2013-01-16','2013-01-31'),
('11155331B','Ta','2013-01-16','2013-01-31'),

('12113334C','Ma','2013-01-01','2013-01-15'),
('12113334C','Me','2013-01-01','2013-01-15'),
('77824455F','Ta','2013-01-01','2013-01-15'),
('77824455F','Ma','2013-01-16','2013-01-31'),
('77824455F','Me','2013-01-16','2013-01-31'),
('12113334C','Ta','2013-01-16','2013-01-31'),

('11133244H','Ma','2013-01-01','2013-01-15'),
('11133244H','Me','2013-01-01','2013-01-15'),
('22115669D','Ta','2013-01-01','2013-01-15'),
('22115669D','Ma','2013-01-16','2013-01-31'),
('22115669D','Me','2013-01-16','2013-01-31'),
('77343543B','Ma','2013-01-16','2013-01-31'),
('77343543B','Ta','2013-01-16','2013-01-31'),

('17873522A','Ma','2013-01-01','2013-01-15'),
('17873522A','Ta','2013-01-01','2013-01-15'),
('43425632B','Me','2013-01-01','2013-01-15'),
('43425632B','Ma','2013-01-16','2013-01-31'),
('17873522A','Me','2013-01-16','2013-01-31'),
('43425632B','Ta','2013-01-16','2013-01-31'),

('12121233C','Ma','2013-01-01','2013-01-15'),
('99774324W','Me','2013-01-01','2013-01-15'),
('99774324W','Ta','2013-01-01','2013-01-15'),
('99774324W','Ma','2013-01-16','2013-01-31'),
('12121233C','Me','2013-01-16','2013-01-31'),
('12121233C','Ta','2013-01-16','2013-01-31'),


('33333333C','Ma','2013-01-01','2013-01-15'),
('33333333C','Me','2013-01-01','2013-01-15'),
('65778321B','Ta','2013-01-01','2013-01-15'),
('65778321B','Ma','2013-01-16','2013-01-31'),
('65778321B','Me','2013-01-16','2013-01-31'),
('33333333C','Ta','2013-01-16','2013-01-31'),


('44444444A','Ma','2013-01-01','2013-01-15'),
('44444444A','Me','2013-01-01','2013-01-15'),
('44444444A','Ma','2013-01-16','2013-01-31'),
('44444444A','Me','2013-01-16','2013-01-31'),

('22412266A','Ma','2013-01-01','2013-01-15'),
('22412266A','Ta','2013-01-01','2013-01-15'),
('55555555B','Me','2013-01-01','2013-01-15'),
('55555555B','Ma','2013-01-16','2013-01-31'),
('22412266A','Ta','2013-01-16','2013-01-31'),
('22412266A','Me','2013-01-16','2013-01-31');

-- -----------------------------------------------------
-- Tabla `TURNOS`
-- -----------------------------------------------------
CREATE  TABLE `turnos` (
  `Codigo_Turno` VARCHAR(10) NOT NULL ,
  `Hora_Inicio` TIME ,
  `Hora_Fin` TIME ,
  `Tipo` ENUM('Mañana','Tarde','Mediodía') ,
  PRIMARY KEY (`Codigo_Turno`) );

INSERT INTO `turnos` (`Codigo_Turno`,`Hora_Inicio`,`Hora_Fin`,`Tipo`) VALUES
('Ma','10:00','14:00','Mañana'),
('Me','14:00','18:00','Mediodía'),
('Ta','18:00','22:00','Tarde');

-- -----------------------------------------------------
-- Tabla `TICKETS`
-- -----------------------------------------------------
CREATE  TABLE `tickets` (
  `Numero_Ticket` INT NOT NULL AUTO_INCREMENT,
  `Fecha_Compra` DATETIME,
  `Numero_Socio` VARCHAR(10) NOT NULL,
  `Localidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Numero_Ticket`) );


INSERT INTO `tickets` (`Numero_Ticket`, `Fecha_Compra`, `Numero_Socio`, `Localidad`) VALUES
(1, '2013-01-02 10:00:00', '0001', 'Bilbao'),
(2, '2013-01-02 10:05:00', '0000_B', 'Bilbao'),
(3, '2013-01-02 11:00:00', '0020', 'Oviedo'),
(4, '2013-01-02 11:00:00', '0003', 'Bilbao'),
(5, '2013-01-02 12:10:00', '0000_O', 'Oviedo'),
(6, '2013-01-02 12:40:00', '0000_V', 'Valladolid'),
(7, '2013-01-02 12:45:00', '0000_S', 'Santander'),
(8, '2013-01-02 13:00:00', '0007', 'Bilbao'),
(9, '2013-01-02 13:45:00', '0015', 'Bilbao'),
(10, '2013-01-02 14:20:00', '0000_B', 'Bilbao'),
(11, '2013-01-02 14:35:00', '0018', 'Oviedo'),
(12, '2013-01-02 15:35:00', '0012', 'Santander'),
(13, '2013-01-02 16:00:00', '0005', 'Valladolid'),
(14, '2013-01-02 16:15:00', '0000_B', 'Bilbao'),
(15, '2013-01-02 17:12:00', '0000_S', 'Santander'),
(16, '2013-01-02 18:15:00', '0016', 'Bilbao'),
(17, '2013-01-02 20:20:00', '0013', 'Valladolid'),
(18, '2013-01-02 20:30:00', '0000_B', 'Bilbao'),
(19, '2013-01-02 21:05:00', '0002', 'Oviedo'),
(20, '2013-01-02 21:45:00', '0000_B', 'Bilbao'),
(21, '2013-01-02 21:55:00', '0000_O', 'Oviedo'),

(22, '2013-01-03 10:05:00', '0000_V', 'Valladolid'),
(23, '2013-01-03 10:05:00', '0006', 'Santander'),
(24, '2013-01-03 10:05:00', '0012', 'Bilbao'),
(25, '2013-01-03 10:15:00', '0000_B', 'Bilbao'),
(26, '2013-01-03 11:15:00', '0000_V', 'Valladolid'),
(27, '2013-01-03 13:15:00', '0016', 'Bilbao'),
(28, '2013-01-03 13:25:00', '0000_S', 'Santander'),
(29, '2013-01-03 15:35:00', '0013', 'Valladolid'),
(30, '2013-01-03 16:45:00', '0007', 'Bilbao'),
(31, '2013-01-03 18:00:00', '0017', 'Valladolid'),
(32, '2013-01-03 19:00:00', '0008', 'Santander'),
(33, '2013-01-03 20:30:00', '0000_V', 'Valladolid'),
(34, '2013-01-03 21:05:00', '0000_O', 'Oviedo'),

(35, '2013-01-04 10:35:00', '0000_O', 'Oviedo'),
(36, '2013-01-04 11:45:00', '0000_V', 'Valladolid'),
(37, '2013-01-04 13:30:00', '0011', 'Oviedo'),
(38, '2013-01-04 14:45:00', '0014', 'Valladolid'),
(39, '2013-01-04 18:05:00', '0020', 'Oviedo'),
(40, '2013-01-04 20:00:00', '0000_O', 'Oviedo'),

(41, '2013-01-05 10:30:00', '0015', 'Bilbao'),
(42, '2013-01-05 11:55:00', '0009', 'Valladolid'),
(43, '2013-01-05 12:05:00', '0000_S', 'Santander'),
(44, '2013-01-05 14:35:00', '0017', 'Valladolid'),
(45, '2013-01-05 17:45:00', '0011', 'Santander'),
(46, '2013-01-05 19:00:00', '0000_S', 'Santander'),
(47, '2013-01-05 20:55:00', '0000_V', 'Valladolid');

-- -----------------------------------------------------
-- Tabla `INCLUYEN`
-- -----------------------------------------------------
CREATE  TABLE `incluyen` (
  `Numero_Ticket` INT NOT NULL ,
  `Codigo_Producto` VARCHAR(10) NOT NULL ,
  `Cantidad` INT ,
  PRIMARY KEY (`Numero_Ticket`, `Codigo_Producto`) );

INSERT INTO `incluyen` (`Numero_Ticket`,`Codigo_Producto`,`Cantidad`) VALUES
(1,'00001104','1'),
(2,'00001115','1'),
(3,'00001130','2'),
(4,'00001114','1'),
(4,'00001121','1'),
(5,'00001107','1'),
(6,'00001124','2'),
(6,'00001108','1'),
(7,'00001121','2'),
(7,'00001108','1'),
(8,'00001108','2'),
(9,'00001117','1'),
(10,'00001109','2'),
(10,'00001118','1'),
(11,'00001110','1'),
(12,'00001104','1'),
(13,'00001116','1'),
(14,'00001117','2'),
(15,'00001129','1'),
(15,'00001121','1'),
(16,'00001105','1'),
(17,'00001125','1'),
(18,'00001102','1'),
(19,'00001116','1'),
(20,'00001109','1'),
(21,'00001110','1'),
(22,'00001120','1'),
(22,'00001106','1'),
(23,'00001111','2'),
(24,'00001105','1'),
(25,'00001117','1'),
(26,'00001128','1'),
(27,'00001105','1'),
(28,'00001129','1'),
(29,'00001101','1'),
(30,'00001109','1'),
(31,'00001122','1'),
(32,'00001122','1'),
(33,'00001106','1'),
(34,'00001101','2'),
(34,'00001130','1'),
(35,'00001104','1'),
(36,'00001125','1'),
(37,'00001128','2'),
(38,'00001124','1'),
(38,'00001131','1'),
(39,'00001117','1'),
(40,'00001100','1'),
(41,'00001119','2'),
(42,'00001121','1'),
(42,'00001111','1'),
(42,'00001103','1'),
(43,'00001131','1'),
(44,'00001116','1'),
(45,'00001111','1'),
(46,'00001125','1'),
(46,'00001111','1'),
(47,'00001125','1'),
(47,'00001110','1');

-- -----------------------------------------------------
-- Tabla `PRODUCTOS`
-- -----------------------------------------------------
CREATE  TABLE `productos` (
  `Codigo_Producto` VARCHAR(10) NOT NULL ,
  `Descripcion` VARCHAR(100) ,
  `Marca` VARCHAR(45) ,
  `Modelo` VARCHAR(45) ,
  `Caracteristicas` VARCHAR(100) ,
  `Precio_referencia` DECIMAL(6,2) ,
  PRIMARY KEY (`Codigo_Producto`) );

INSERT INTO `productos` (`Codigo_Producto`,`Descripcion`,`Marca`,`Modelo`,`Caracteristicas`,`Precio_referencia`) VALUES 
('00001100', 'Tablet', 'Samsung', 'Galaxy note', 'Pantalla 10.1" multitarea, Android 4.0, 1.4 GHz', '490.00'),
('00001101', 'Disco Duro Externo', 'Hitachi', 'Toruo Desk Negro', 'Tamaño 3,5", capacidad 2 TB, USB 3.0, ', '95.00'),
('00001102', 'Impresora', 'Ricoh', 'SP100E', 'Láser Monocromo, 13 ppm', '50.00'),
('00001103', 'Tablet', 'Acer', 'A700 Blanco', 'Pantalla 10.1", Android 4.0, Full HD, 32 GB', '400.00'),
('00001104', 'Netbook', 'Packard Bell', 'DOT S Negro', '1 GB RAM DDR3, Disco duro 320 GB', '240.00'),
('00001105', 'Disco Duro Externo', 'Western Digital', 'My Passport 3.0', 'Tamaño 2,5", capacidad 1 TB, USB 2,0 y 3.0', '90.00'),
('00001106', 'Ordenador portátil', 'Toshiba', 'L850-1J9', 'Procesador Intel Core i7, 4 GB de RAM DDR3, Disco duro 640 GB', '780.00'),
('00001107', 'Ordenador de sobremesa', 'Medion', 'PC8461', 'Procesador Intel Core i7, 8 GB de RAM DDR3, Disco duro 1000 GB', '700.00'),
('00001108', 'Impresora', 'HP', 'Photosmart 7520', 'Multifunción tinta color, 14 ppm, resolución escáner 1200 ppm, resolución impresión 600 ppm', '200.00'),
('00001109', 'Tablet', 'Apple', 'IPad', 'Pantalla retina, tamaño 9.7 ", capacidad 32 GB, IOS, ', '600.00'),
('00001110', 'Ordenador portátil', 'Sony', 'VAio SVE14A2X1E', 'Procesador Core i5, 6 GB RAM DDR3, Disco duro 750 GB', '800.00'),
('00001111', 'Impresora', 'Brother', 'MFC9120CN', 'Multifunción Láser Color, resolución impresión 2400 ppm, velocidad impresión 16 ppm', '500.00'),
('00001112', 'Disco duro', 'Toshiba', 'Partner 3.0', 'Tamaño 2,5"; Capacidad 500 GB,, USB 3.0', '60.00'),

('00001113', 'Televisor', 'Panasonic', 'TX-47ET5', 'Pantalla 47", 3D Full HD, LCD/LED', '800.00'),
('00001114', 'Televisor', 'Phillips', '32PFL6007', 'Pantalla 32", 3D Full HD, LCD/LED', '600.00'),
('00001115', 'Televisor', 'Panasonic', 'TXL60 ET5', 'Pantalla 60", 3D Full HD, LCD/LED', '1699.00'),
('00001116', 'Televisor', 'Samsung', 'UE46ES8000', 'Pantalla 46", LED 3D Full HD, 88 Hz', '1500.00'),
('00001117', 'Televisor', 'LG', '42LM760', 'Pantalla 42"; LED 3D Full HD, 800 Hz', '1000.00'),

('00001118', 'Altavoces', 'JBL', 'Docking Station', 'Radial negro, 30 watios x2, compatible con iPod y iPhone', '150.00'),
('00001119', 'Auriculares', 'B&W', 'New media P3', 'Auticulares HIFI con cable', '190.00'),
('00001120', 'Micro cadena', 'Kenwood', 'M313', '10 watios x2, reproduce MP3, pantalla con retroalimentación', '95.00'),
('00001121', 'Reproductor Blu-ray', 'Sony', 'BDP 185', 'Reproduce DVD transmite de internet al televisor, ', '75.00'),
('00001122', 'Reproductor DVD', 'Pioneer', 'Dv3022', 'Reproduce DVD, CD, DivX, WMA, JPEG', '55.00'),
('00001123', 'Autoradio', 'Jvc', 'KD.R 731 BTE', 'Reproduce de iPhone, Blackberry o Android mediante bluetooth,', '125.00'),
('00001124', 'Altavoces', 'Bose', 'Sound dock portable', 'Sistema musical digital portable', '400.00'),
('00001125', 'DVD portátil', 'Vieta', 'VM-HD209BK', 'DVD portátil con doble pantalla, TFT LCD 9 pulgadas, reproduce DVD, SVCD, JPEG, WMA', '200.00'),

('00001126', 'Consola', 'Sony', 'PlayStation 3', '160 GB', '239.00'),
('00001127', 'Consola portáitl', 'Sony', 'PSP Srteet', 'Consolar portñatil, pantalla LCD TFT 4,3"', '90.00'),
('00001128', 'Consola portáitl', 'Sony', 'PSVita', 'Conectividad WI-FI, pantalla táctil', '190.00'),
('00001129', 'Consola', 'Microsoft', 'Xbox 360', 'Disco duro de 4 GB, lector DVD, conexión wifi', '180.00'),
('00001130', 'Consola', 'Nintendo', 'Wii U', 'Memoria interna 8 GB, wifi, bluetooth', '290.00'),
('00001131', 'Consola portáitl', 'Nintendo', 'DSi XL ', 'Pantalla LCD TFT 4,2", ', '170.00'),
('00001132', 'Consola portáitl', 'Nintendo', '3DS', 'Juego en 3D sin gafas,  wifi', '160.00');

-- -----------------------------------------------------
-- Tabla `Se_almacenan`
-- -----------------------------------------------------
CREATE  TABLE `Se_almacenan` (
  `Codigo_Producto` VARCHAR(10) NOT NULL ,
  `Localidad` VARCHAR(45) ,
  `Codigo_Seccion` VARCHAR(10) ,
  `Unidades` INT ,
  PRIMARY KEY (`Codigo_Producto`,`Localidad`,`Codigo_Seccion`) );


INSERT INTO `Se_almacenan` (`Codigo_Producto`,`Localidad`,`Codigo_Seccion`,`Unidades`) VALUES
('00001100','Bilbao','info',15),
('00001102','Bilbao','info',12),
('00001103','Bilbao','info',17),
('00001104','Bilbao','info',13),
('00001105','Bilbao','info',11),
('00001107','Bilbao','info',19),
('00001108','Bilbao','info',12),
('00001109','Bilbao','info',15),
('00001112','Bilbao','info',7),

('00001113','Bilbao','tv',8),
('00001114','Bilbao','tv',15),
('00001115','Bilbao','tv',7),
('00001117','Bilbao','tv',10),

('00001118','Bilbao','audvid',12),
('00001119','Bilbao','audvid',7),
('00001121','Bilbao','audvid',16),
('00001122','Bilbao','audvid',15),

('00001100','Oviedo','info',12),
('00001101','Oviedo','info',12),
('00001103','Oviedo','info',6),
('00001104','Oviedo','info',7),
('00001105','Oviedo','info',9),
('00001107','Oviedo','info',14),
('00001110','Oviedo','info',12),
('00001112','Oviedo','info',10),

('00001114','Oviedo','tv',14),
('00001115','Oviedo','tv',15),
('00001116','Oviedo','tv',13),
('00001117','Oviedo','tv',6),

('00001126','Oviedo','cons',5),
('00001127','Oviedo','cons',12),
('00001128','Oviedo','cons',7),
('00001130','Oviedo','cons',8),
('00001132','Oviedo','cons',5),

('00001100','Valladolid','info',6),
('00001101','Valladolid','info',15),
('00001102','Valladolid','info',10),
('00001103','Valladolid','info',9),
('00001104','Valladolid','info',2),
('00001105','Valladolid','info',1),
('00001106','Valladolid','info',4),
('00001108','Valladolid','info',6),
('00001109','Valladolid','info',4),
('00001110','Valladolid','info',12),
('00001111','Valladolid','info',10),
('00001112','Valladolid','info',7),

('00001113','Valladolid','tv',7),
('00001114','Valladolid','tv',3),
('00001115','Valladolid','tv',5),
('00001116','Valladolid','tv',9),

('00001118','Valladolid','aud',3),
('00001119','Valladolid','aud',5),
('00001120','Valladolid','aud',6),
('00001124','Valladolid','aud',12),

('00001121','Valladolid','vid',4),
('00001122','Valladolid','vid',5),
('00001125','Valladolid','vid',7),

('00001126','Valladolid','cons',7),
('00001128','Valladolid','cons',5),
('00001129','Valladolid','cons',6),
('00001131','Valladolid','cons',10),
('00001132','Valladolid','cons',8),


('00001100','Santander','info',5),
('00001102','Santander','info',14),
('00001103','Santander','info',7),
('00001104','Santander','info',8),
('00001105','Santander','info',4),
('00001107','Santander','info',5),
('00001108','Santander','info',7),
('00001110','Santander','info',9),
('00001111','Santander','info',10),
('00001112','Santander','info',13),

('00001119','Santander','audvid',8),
('00001120','Santander','audvid',6),
('00001121','Santander','audvid',16),
('00001122','Santander','audvid',9),
('00001124','Santander','audvid',13),
('00001125','Santander','audvid',8),

('00001126','Santander','cons',16),
('00001127','Santander','cons',10),
('00001129','Santander','cons',11),
('00001130','Santander','cons',6),
('00001131','Santander','cons',9);

-- -----------------------------------------------------
-- Tabla `COMPRADORES`
-- -----------------------------------------------------
CREATE  TABLE `compradores` (
  `Numero_Socio` VARCHAR(10) NOT NULL ,
  `Nombre_Socio` VARCHAR(45) ,
  `Apellidos_Socio` VARCHAR(45) ,
  `Direccion_Socio` VARCHAR(100) ,
  `Profesion_Socio` VARCHAR(45) ,
  `Telefono_Socio` VARCHAR(10) ,
  `Fecha_Nacimiento` DATE ,
  `Fecha_alta` DATE ,
  `Forma_Pago_Habitual` VARCHAR(25) ,
  `Localidad_alta` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`Numero_Socio`) );

INSERT INTO `compradores` (`Numero_Socio`,`Nombre_Socio`,`Apellidos_Socio`,`Direccion_Socio`,`Profesion_Socio`,
`Telefono_Socio`,`Fecha_Nacimiento`,`Fecha_alta`,`Forma_Pago_Habitual`,`Localidad_alta`) VALUES 
('0001', 'Fermín', 'Salces Bolado', 'C/ de los Arcos, 123, CP 34111', 'Empleado de banca', 
'778339455', '1963-01-22', '2011-09-13', 'Aplazado', 'Bilbao'),
('0002', 'Patricia', 'Martínez Antón', 'Paseo de las moreras, 43, CP 22568', 'Profesora infantil', 
'445722144', '1971-07-14', '2012-06-22', 'Contado', 'Oviedo'),
('0003', 'Ernesto', 'Ruiz Capillas', 'Avda. de los Castros, 122, CP 35359', 'Abogado', 
'725266267', '1985-11-23', '2011-11-18', 'Contado', 'Bilbao'),
('0004', 'Isabel', 'Flores Sánchez', 'C/ la Molina, 45, CP 23254', 'Médico', 
'884547338', '1982-11-06', '2012-12-23', 'Aplazado', 'Oviedo'),
('0005', 'Angela', 'Bolado de la Vega', 'C/ Ruiz Ceballos, 33, CP 64543', 'Asesora laboral', 
'735572885', '1990-02-21', '2011-09-22', 'Aplazado', 'Valladolid'),
('0006', 'Daniel', 'Rotella Ruiz', 'Avda. de los tilos, 44, CP 55258', 'Arquitecto', 
'252798925', '1977-10-24', '2012-01-14', 'Contado', 'Santander'),
('0007', 'Felipe', 'Gómez Fernández', 'Paseo Costa Verde, s/n, CP 44998', 'Mecánico', 
'229729525', '1979-08-08', '2010-02-24', 'Contado', 'Bilbao'),
('0008', 'Juan', 'Villa Zubizarreta', 'Paseo del niño, 43, CP 34355', 'Diseñador gráfico', 
'993724614', '1967-06-22', '2012-06-27', 'Contado', 'Santander'),
('0009', 'Emilio', 'Noval de Frutos', 'Paseo de las moreras, 43, CP 22568', 'Electrecista', 
'112234647', '1965-03-30', '2011-02-12', 'Contado', 'Valladolid'),
('0010', 'Javier', 'Ezquerra Martínez', 'C/ Fernández Mazo, 333, CP 88465', 'Gerente empresarial',
 '752525777', '1962-04-12', '2012-09-23', 'Contado', 'Valladolid'),
('0011', 'Jesús', 'Peña López', 'C/ Los acebos, 123, CP 55893', 'Camarero',
 '942472775', '1959-05-03', '2010-10-31', 'Aplazado', 'Oviedo'),
('0012', 'Celia', 'Ruiz Capillas', 'C/ Tetúna, 445, CP 99475', 'Enfermera',
 '729752517', '1972-06-13', '2013-01-01', 'Aplazado', 'Santander'),
('0013', 'Sara', 'Pérez Caldera', 'Barrio del monte, s/n, CP 44993', 'Veterinaria',
 '141470909', '1990-07-21', '2012-04-21', 'Aplazado', 'Valladolid'),
('0014', 'Juan Carlos', 'Calderón Ruiz', 'Paseo del mar, 133, CP 22563', 'Monitor deportivo', 
'102487722', '1987-08-18', '2012-11-17', 'Contado', 'Valladolid'),
('0015', 'Darío', 'Cayón Gutiérrez', 'Avda. de los ciruelos, 65, CP 88891', 'Camarero',
 '258927629', '1973-05-31', '2011-10-12', 'Aplazado', 'Bilbao'),
('0016', 'Emilio', 'Salces Peña', 'C/ Ruiz de Salazar, 4, CP 82231', 'Electrecista', 
'971947194', '1988-07-07', '2012-11-09', 'Contado', 'Bilbao'),
('0017', 'Carmen', 'Ruiz Ruiz', 'C/ Maria Blanchard, 5, CP 96653', 'Profesora secundaria',
 '868141844', '1971-12-11', '2012-05-06', 'Aplazado', 'Valladolid'),
('0018', 'Jose Antonio', 'Pérez Molinero', 'C/ Santander, 88, CP 97765', 'Construcción', 
'861461553', '1980-03-22', '2012-07-19', 'Contado', 'Oviedo'),
('0019', 'Alberto', 'Robles Gómez', 'C/ Fernández Mazo, 88, CP 99564', 'Profesor primaria', 
'883464262', '1979-11-21', '2010-09-25', 'Aplazado', 'Santander'),
('0020', 'Mario', 'Meruelo Gómez', 'C/ Fermín Rios, 9, CP 77231', 'Traductor', 
'855436346', '1975-12-08', '2011-12-25', 'Contado', 'Oviedo');

-- -----------------------------------------------------
-- Claves ajenas
-- -----------------------------------------------------

ALTER TABLE `tienda_seccion` 
ADD CONSTRAINT `fk_tienda_seccion_secciones`
    FOREIGN KEY (`Codigo_Seccion` )
    REFERENCES `secciones` (`Codigo_Seccion` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_tienda_seccion_tiendas`
    FOREIGN KEY (`Localidad` )
    REFERENCES `tiendas` (`Localidad` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_tienda_seccion_empleados`
    FOREIGN KEY (`DNI_encargado` )
    REFERENCES `empleados` (`DNI` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


ALTER TABLE `empleados` 
ADD CONSTRAINT `fk_empleados_tienda_seccion`
    FOREIGN KEY (`Localidad`,`Codigo_Seccion` )
    REFERENCES `tienda_seccion` (`localidad`,`Codigo_Seccion` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


ALTER TABLE `hacen` 
ADD CONSTRAINT `fk_hacen_empleados`
    FOREIGN KEY (`DNI` )
    REFERENCES `empleados` (`DNI` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_hacen_turnos`
    FOREIGN KEY (`Codigo_Turno` )
    REFERENCES `turnos` (`Codigo_Turno` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


ALTER TABLE `tickets` 
ADD CONSTRAINT `fk_tickets_compradores`
    FOREIGN KEY (`Numero_Socio` )
    REFERENCES `compradores` (`Numero_Socio` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_tickets_tiendas`
    FOREIGN KEY (`Localidad` )
    REFERENCES `tiendas` (`Localidad` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


ALTER TABLE `incluyen` 
ADD CONSTRAINT `fk_incluyen_productos`
    FOREIGN KEY (`Codigo_Producto` )
    REFERENCES `productos` (`Codigo_Producto` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_incluyen_tickets`
    FOREIGN KEY (`Numero_Ticket` )
    REFERENCES `tickets` (`Numero_Ticket` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


ALTER TABLE `Se_almacenan` 
ADD CONSTRAINT `fk_Se_almacenan_productos`
    FOREIGN KEY (`Codigo_Producto` )
    REFERENCES `productos` (`Codigo_producto` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Se_almacenan_tienda_seccion`
    FOREIGN KEY (`Localidad`,`Codigo_Seccion`)
    REFERENCES `tienda_seccion` (`Localidad`,`Codigo_Seccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


ALTER TABLE `compradores` 
ADD CONSTRAINT `fk_compradores_tiendas`
    FOREIGN KEY (`Localidad_alta` )
    REFERENCES `tiendas` (`Localidad` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;