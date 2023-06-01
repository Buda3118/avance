/*
SQLyog Professional v12.5.1 (64 bit)
MySQL - 10.4.27-MariaDB : Database - almacen
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`almacen` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `almacen`;

/*Table structure for table `clasificaciones` */

DROP TABLE IF EXISTS `clasificaciones`;

CREATE TABLE `clasificaciones` (
  `idclasificacion` int(11) NOT NULL AUTO_INCREMENT,
  `clasificacion` varchar(50) NOT NULL,
  `fechaalta` datetime NOT NULL DEFAULT current_timestamp(),
  `fechabaja` datetime DEFAULT NULL,
  `estado` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idclasificacion`),
  UNIQUE KEY `uk_clasificacion_cla` (`clasificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `clasificaciones` */

insert  into `clasificaciones`(`idclasificacion`,`clasificacion`,`fechaalta`,`fechabaja`,`estado`) values 
(1,'Memoria RAM','2023-05-31 02:00:04',NULL,'1'),
(2,'Fuente de poder','2023-05-31 02:00:04',NULL,'1'),
(3,'Mouse','2023-05-31 02:00:04',NULL,'1'),
(4,'Monitor','2023-05-31 02:00:04',NULL,'1');

/*Table structure for table `marcas` */

DROP TABLE IF EXISTS `marcas`;

CREATE TABLE `marcas` (
  `idmarca` int(11) NOT NULL AUTO_INCREMENT,
  `marca` varchar(50) NOT NULL,
  `fechaalta` datetime NOT NULL DEFAULT current_timestamp(),
  `fechabaja` datetime DEFAULT NULL,
  `estado` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idmarca`),
  UNIQUE KEY `uk_marca_mar` (`marca`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `marcas` */

insert  into `marcas`(`idmarca`,`marca`,`fechaalta`,`fechabaja`,`estado`) values 
(1,'Samsung','2023-05-31 02:00:04',NULL,'1'),
(2,'HP','2023-05-31 02:00:04',NULL,'1'),
(3,'Micronics','2023-05-31 02:00:04',NULL,'1');

/*Table structure for table `movimientos` */

DROP TABLE IF EXISTS `movimientos`;

CREATE TABLE `movimientos` (
  `idmovimiento` int(11) NOT NULL AUTO_INCREMENT,
  `idtrabajador` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `tipo` char(1) NOT NULL DEFAULT 'E',
  `descripcion` text DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `stockactual` int(11) NOT NULL,
  PRIMARY KEY (`idmovimiento`),
  KEY `fk_idtrabajador_mov` (`idtrabajador`),
  KEY `fk_idproducto_mov` (`idproducto`),
  CONSTRAINT `fk_idproducto_mov` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`idproducto`),
  CONSTRAINT `fk_idtrabajador_mov` FOREIGN KEY (`idtrabajador`) REFERENCES `trabajadores` (`idtrabajador`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `movimientos` */

insert  into `movimientos`(`idmovimiento`,`idtrabajador`,`idproducto`,`tipo`,`descripcion`,`cantidad`,`fecha`,`stockactual`) values 
(1,1,2,'E','Venta de 5 Fuentes de poder',5,'2023-05-31 02:00:04',10),
(2,3,1,'E','Ingreso de 4 Memorias RAM',4,'2023-05-31 02:00:04',12);

/*Table structure for table `productos` */

DROP TABLE IF EXISTS `productos`;

CREATE TABLE `productos` (
  `idproducto` int(11) NOT NULL AUTO_INCREMENT,
  `idclasificacion` int(11) NOT NULL,
  `idmarca` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `esnuevo` char(1) NOT NULL DEFAULT 'S',
  `numeroserie` varchar(30) DEFAULT NULL,
  `precio` decimal(6,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fechaalta` datetime NOT NULL DEFAULT current_timestamp(),
  `fechabaja` datetime DEFAULT NULL,
  `estado` char(1) NOT NULL DEFAULT '1',
  `imagen` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idproducto`),
  KEY `fk_idclasificacion_pro` (`idclasificacion`),
  KEY `fk_idmarca_pro` (`idmarca`),
  CONSTRAINT `fk_idclasificacion_pro` FOREIGN KEY (`idclasificacion`) REFERENCES `clasificaciones` (`idclasificacion`),
  CONSTRAINT `fk_idmarca_pro` FOREIGN KEY (`idmarca`) REFERENCES `marcas` (`idmarca`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `productos` */

insert  into `productos`(`idproducto`,`idclasificacion`,`idmarca`,`descripcion`,`esnuevo`,`numeroserie`,`precio`,`cantidad`,`fechaalta`,`fechabaja`,`estado`,`imagen`) values 
(1,1,1,'16 Gb. DDR5 5000Mhz','S',NULL,570.00,8,'2023-05-31 02:00:04',NULL,'1',NULL),
(2,2,2,'500 Watts real','S',NULL,170.00,15,'2023-05-31 02:00:04',NULL,'1',NULL);

/*Table structure for table `trabajadores` */

DROP TABLE IF EXISTS `trabajadores`;

CREATE TABLE `trabajadores` (
  `idtrabajador` int(11) NOT NULL AUTO_INCREMENT,
  `apellidos` varchar(30) NOT NULL,
  `nombres` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `claveacceso` varchar(90) NOT NULL,
  `nivelacceso` char(3) NOT NULL DEFAULT 'AST',
  `fechacreacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fechabaja` datetime DEFAULT NULL,
  `estado` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idtrabajador`),
  UNIQUE KEY `uk_email_tra` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `trabajadores` */

insert  into `trabajadores`(`idtrabajador`,`apellidos`,`nombres`,`email`,`claveacceso`,`nivelacceso`,`fechacreacion`,`fechabaja`,`estado`) values 
(1,'Jose','Saavedra','jose@gmail.com','$2y$10$byxrMNLN.wxSz1g8kmuT9uBuqvy2DbzUSc5ffqZXw4NpF6zm67jke','ADM','2023-05-31 02:00:04',NULL,'1'),
(2,'Andres','Arroyo','andres@gmail.com','$2y$10$byxrMNLN.wxSz1g8kmuT9uBuqvy2DbzUSc5ffqZXw4NpF6zm67jke','SPV','2023-05-31 02:00:04',NULL,'1'),
(3,'Liz','Flores','liz@gmail.com','$2y$10$byxrMNLN.wxSz1g8kmuT9uBuqvy2DbzUSc5ffqZXw4NpF6zm67jke','AST','2023-05-31 02:00:04',NULL,'1');

/* Procedure structure for procedure `spu_trabajadores_login` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_trabajadores_login` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_trabajadores_login`(_email VARCHAR(100))
BEGIN
	SELECT idtrabajador, nombres, apellidos, email, claveacceso, nivelacceso
		FROM trabajadores
		WHERE email = _email AND estado = '1';
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
