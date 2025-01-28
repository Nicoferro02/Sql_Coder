CREATE DATABASE  IF NOT EXISTS `distribuidora_electrica` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `distribuidora_electrica`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: distribuidora_electrica
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Electricidad'),(2,'Iluminación'),(3,'Herramientas');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_clientes` int NOT NULL AUTO_INCREMENT,
  `id_vendedores` int DEFAULT NULL,
  `nombre` varchar(20) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT 'cliente_x@gmail.com',
  PRIMARY KEY (`id_clientes`),
  UNIQUE KEY `telefono` (`telefono`),
  KEY `fk_vendedores_clientes` (`id_vendedores`),
  CONSTRAINT `fk_vendedores_clientes` FOREIGN KEY (`id_vendedores`) REFERENCES `vendedores` (`id_vendedores`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,1,'María López','123456789','maria@gmail.com'),(2,2,'Pedro Sánchez','987654321','pedro@hotmail.com'),(3,2,'Jorge Vazques','1150320231','jorge@hotmail.com'),(4,1,'Norberto Sanchez','114323465','norber@hotmail.com');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `id_compras` int NOT NULL AUTO_INCREMENT,
  `id_provedor` int DEFAULT NULL,
  `id_empleados` int DEFAULT NULL,
  `fecha_compra` datetime DEFAULT CURRENT_TIMESTAMP,
  `total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_compras`),
  KEY `fk_provedor_compras` (`id_provedor`),
  KEY `fk_empleados_compras` (`id_empleados`),
  CONSTRAINT `fk_empleados_compras` FOREIGN KEY (`id_empleados`) REFERENCES `empleados` (`id_empleados`),
  CONSTRAINT `fk_provedor_compras` FOREIGN KEY (`id_provedor`) REFERENCES `provedor` (`id_provedor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (1,1,2,'2024-12-23 19:17:42',25000.00),(2,2,2,'2024-12-23 19:17:42',70000.00);
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `id_departamento` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  PRIMARY KEY (`id_departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Administracion'),(2,'Encargados'),(3,'Deposito'),(4,'Ventas');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_de_compras`
--

DROP TABLE IF EXISTS `detalle_de_compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_de_compras` (
  `id_detalle_compras` int NOT NULL AUTO_INCREMENT,
  `id_compras` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  PRIMARY KEY (`id_detalle_compras`),
  KEY `fk_compras_detalle_de_compras` (`id_compras`),
  KEY `fk_producto_detalle_de_compras` (`id_producto`),
  CONSTRAINT `fk_compras_detalle_de_compras` FOREIGN KEY (`id_compras`) REFERENCES `compras` (`id_compras`),
  CONSTRAINT `fk_producto_detalle_de_compras` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_de_compras`
--

LOCK TABLES `detalle_de_compras` WRITE;
/*!40000 ALTER TABLE `detalle_de_compras` DISABLE KEYS */;
INSERT INTO `detalle_de_compras` VALUES (1,1,1,50),(2,2,2,20);
/*!40000 ALTER TABLE `detalle_de_compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_de_pedidos`
--

DROP TABLE IF EXISTS `detalle_de_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_de_pedidos` (
  `id_detalle_pedidos` int NOT NULL AUTO_INCREMENT,
  `id_pedidos` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  PRIMARY KEY (`id_detalle_pedidos`),
  KEY `fk_pedidos_detalle_de_pedidos` (`id_pedidos`),
  KEY `fk_producto_detalle_de_pedidos` (`id_producto`),
  CONSTRAINT `fk_pedidos_detalle_de_pedidos` FOREIGN KEY (`id_pedidos`) REFERENCES `pedidos` (`id_pedidos`),
  CONSTRAINT `fk_producto_detalle_de_pedidos` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_de_pedidos`
--

LOCK TABLES `detalle_de_pedidos` WRITE;
/*!40000 ALTER TABLE `detalle_de_pedidos` DISABLE KEYS */;
INSERT INTO `detalle_de_pedidos` VALUES (1,1,1,1),(2,1,2,2),(3,1,3,1);
/*!40000 ALTER TABLE `detalle_de_pedidos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `actualizar_stock_pedido` AFTER INSERT ON `detalle_de_pedidos` FOR EACH ROW BEGIN
    UPDATE Distribuidora_Electrica.producto
    SET stock = stock - NEW.cantidad
    WHERE id_producto = NEW.id_producto;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `direcciones`
--

DROP TABLE IF EXISTS `direcciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direcciones` (
  `id_direcciones` int NOT NULL AUTO_INCREMENT,
  `id_clientes` int DEFAULT NULL,
  `id_empleados` int DEFAULT NULL,
  `ciudad` varchar(200) DEFAULT NULL,
  `calle` varchar(200) DEFAULT NULL,
  `numero` int DEFAULT NULL,
  `codigo_postal` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id_direcciones`),
  KEY `fk_clientes_direcciones` (`id_clientes`),
  KEY `fk_empleados_direcciones` (`id_empleados`),
  CONSTRAINT `fk_clientes_direcciones` FOREIGN KEY (`id_clientes`) REFERENCES `clientes` (`id_clientes`),
  CONSTRAINT `fk_empleados_direcciones` FOREIGN KEY (`id_empleados`) REFERENCES `empleados` (`id_empleados`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direcciones`
--

LOCK TABLES `direcciones` WRITE;
/*!40000 ALTER TABLE `direcciones` DISABLE KEYS */;
INSERT INTO `direcciones` VALUES (1,1,NULL,'Buenos Aires','Av. Siempreviva',123,'1001'),(2,2,NULL,'Rosario','Calle Falsa',456,'2000');
/*!40000 ALTER TABLE `direcciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id_empleados` int NOT NULL AUTO_INCREMENT,
  `id_departamento` int DEFAULT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `Salario` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_empleados`),
  KEY `fk_departamento` (`id_departamento`),
  CONSTRAINT `fk_departamento` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id_departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,3,'Nicolas Ferro','2022-06-07',830000.00),(2,2,'Sebastian','2001-04-15',3250000.00),(3,3,'Javier Navarro','2020-06-12',1045200.00),(4,1,'Karina','2013-02-23',1453400.00),(5,3,'Franco','2022-06-07',830000.00),(6,2,'Leandro','1993-03-21',4556112.00),(7,1,'Bernardo','1990-01-18',6356532.00),(8,4,'German Nieto','2003-09-16',3250000.00),(9,4,'Juan Pablo','2001-02-11',1832000.00);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodos_de_pago`
--

DROP TABLE IF EXISTS `metodos_de_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodos_de_pago` (
  `id_metodo_de_pago` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`id_metodo_de_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodos_de_pago`
--

LOCK TABLES `metodos_de_pago` WRITE;
/*!40000 ALTER TABLE `metodos_de_pago` DISABLE KEYS */;
INSERT INTO `metodos_de_pago` VALUES (1,'Efectivo','Pago en efectivo al recibir el pedido'),(2,'Transferencia','Pago mediante transferencia bancaria');
/*!40000 ALTER TABLE `metodos_de_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id_pedidos` int NOT NULL AUTO_INCREMENT,
  `id_clientes` int DEFAULT NULL,
  `id_empleados` int DEFAULT NULL,
  `fecha_pedido` datetime DEFAULT CURRENT_TIMESTAMP,
  `total` decimal(10,2) DEFAULT NULL,
  `id_metodo_de_pago` int DEFAULT NULL,
  `id_transporte` int DEFAULT NULL,
  PRIMARY KEY (`id_pedidos`),
  KEY `fk_clientes_pedidos` (`id_clientes`),
  KEY `fk_empleados_pedidos` (`id_empleados`),
  KEY `fk_metodo_de_pago_pedidos` (`id_metodo_de_pago`),
  KEY `fk_transporte_pedidos` (`id_transporte`),
  CONSTRAINT `fk_clientes_pedidos` FOREIGN KEY (`id_clientes`) REFERENCES `clientes` (`id_clientes`),
  CONSTRAINT `fk_empleados_pedidos` FOREIGN KEY (`id_empleados`) REFERENCES `empleados` (`id_empleados`),
  CONSTRAINT `fk_metodo_de_pago_pedidos` FOREIGN KEY (`id_metodo_de_pago`) REFERENCES `metodos_de_pago` (`id_metodo_de_pago`),
  CONSTRAINT `fk_transporte_pedidos` FOREIGN KEY (`id_transporte`) REFERENCES `transporte` (`id_transporte`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,1,2,'2024-12-23 19:20:00',1000.00,1,2);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `id_categoria` int DEFAULT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `descripcion` text,
  `precio` decimal(10,2) DEFAULT NULL,
  `stock` int NOT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `fk_categoria_producto` (`id_categoria`),
  CONSTRAINT `fk_categoria_producto` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,1,'Lámpara LED','Lámpara A60 9w',500.00,149),(2,2,'Spot','Spot de embutir Redondo',3500.00,48),(3,2,'Farol','Farol Hexagonal negro',5200.00,14),(4,1,'Llave Térmica','2x25',2400.00,60),(5,1,'Disyuntor','2x40',3200.00,45),(6,3,'Pico Loro','Cremallera 300mm',3500.00,8),(7,3,'Llave Ajustable','10mm',800.00,50);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `asegurar_stock` BEFORE UPDATE ON `producto` FOR EACH ROW BEGIN
    IF NEW.stock < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El stock no puede ser negativo';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `provedor`
--

DROP TABLE IF EXISTS `provedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provedor` (
  `id_provedor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_provedor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provedor`
--

LOCK TABLES `provedor` WRITE;
/*!40000 ALTER TABLE `provedor` DISABLE KEYS */;
INSERT INTO `provedor` VALUES (1,'Mota','123123123','mota@gmail.com'),(2,'Distribuidora Central','987987987','ventas@central.com'),(3,'San Justo Iluminacion','46822312','sanjusto@gmail.com');
/*!40000 ALTER TABLE `provedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provedor_producto`
--

DROP TABLE IF EXISTS `provedor_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provedor_producto` (
  `id_provedor_producto` int NOT NULL AUTO_INCREMENT,
  `id_provedor` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  PRIMARY KEY (`id_provedor_producto`),
  KEY `fk_provedor_provedor_producto` (`id_provedor`),
  KEY `fk_producto_provedor_producto` (`id_producto`),
  CONSTRAINT `fk_producto_provedor_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`),
  CONSTRAINT `fk_provedor_provedor_producto` FOREIGN KEY (`id_provedor`) REFERENCES `provedor` (`id_provedor`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provedor_producto`
--

LOCK TABLES `provedor_producto` WRITE;
/*!40000 ALTER TABLE `provedor_producto` DISABLE KEYS */;
INSERT INTO `provedor_producto` VALUES (1,1,6),(2,1,7),(3,2,1),(4,2,4),(5,2,5),(6,3,2),(7,3,3);
/*!40000 ALTER TABLE `provedor_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transporte`
--

DROP TABLE IF EXISTS `transporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transporte` (
  `id_transporte` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `envios_provincias` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_transporte`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transporte`
--

LOCK TABLES `transporte` WRITE;
/*!40000 ALTER TABLE `transporte` DISABLE KEYS */;
INSERT INTO `transporte` VALUES (1,'Transporte ABC','Buenos Aires, Córdoba, Santa Fe'),(2,'Logística Express','Mendoza, Salta, Tucumán');
/*!40000 ALTER TABLE `transporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedores`
--

DROP TABLE IF EXISTS `vendedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedores` (
  `id_vendedores` int NOT NULL AUTO_INCREMENT,
  `id_empleados` int DEFAULT NULL,
  `comision` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_vendedores`),
  KEY `fk_empleados_vendedores` (`id_empleados`),
  CONSTRAINT `fk_empleados_vendedores` FOREIGN KEY (`id_empleados`) REFERENCES `empleados` (`id_empleados`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedores`
--

LOCK TABLES `vendedores` WRITE;
/*!40000 ALTER TABLE `vendedores` DISABLE KEYS */;
INSERT INTO `vendedores` VALUES (1,8,0.05),(2,9,0.04);
/*!40000 ALTER TABLE `vendedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_inventario`
--

DROP TABLE IF EXISTS `vista_inventario`;
/*!50001 DROP VIEW IF EXISTS `vista_inventario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_inventario` AS SELECT 
 1 AS `id_producto`,
 1 AS `nombre`,
 1 AS `descripcion`,
 1 AS `precio`,
 1 AS `stock`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_pedidos_clientes`
--

DROP TABLE IF EXISTS `vista_pedidos_clientes`;
/*!50001 DROP VIEW IF EXISTS `vista_pedidos_clientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_pedidos_clientes` AS SELECT 
 1 AS `id_pedidos`,
 1 AS `nombre_cliente`,
 1 AS `telefono`,
 1 AS `email`,
 1 AS `id_vendedores`,
 1 AS `comision`,
 1 AS `total`,
 1 AS `id_metodo_de_pago`,
 1 AS `id_transporte`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'distribuidora_electrica'
--

--
-- Dumping routines for database 'distribuidora_electrica'
--
/*!50003 DROP FUNCTION IF EXISTS `calcular_descuento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calcular_descuento`(total DECIMAL(10,2), porcentaje DECIMAL(5,2)) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    RETURN total - (total * (porcentaje / 100));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `obtener_stock_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `obtener_stock_producto`(p_id_producto INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE stock_actual INT;
    SELECT stock INTO stock_actual
    FROM producto
    WHERE id_producto = p_id_producto;
    RETURN stock_actual;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegistrarPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarPedido`(
    IN p_id_cliente INT,
    IN p_id_empleado INT,
    IN p_total DECIMAL(10,2),
    IN p_id_metodo_pago INT,
    IN p_id_transporte INT,
    IN p_productos_ids VARCHAR(255),  
    IN p_cantidades VARCHAR(255)     
)
BEGIN
    DECLARE v_id_pedido INT;
    DECLARE v_producto_id INT;
    DECLARE v_cantidad INT;
    DECLARE v_index INT DEFAULT 1;
    DECLARE v_total_productos INT;

    
    INSERT INTO pedidos (id_clientes, id_empleados, total, id_metodo_de_pago, id_transporte)
    VALUES (p_id_cliente, p_id_empleado, p_total, p_id_metodo_pago, p_id_transporte);

    
    SET v_id_pedido = LAST_INSERT_ID();

    
    SET v_total_productos = LENGTH(p_productos_ids) - LENGTH(REPLACE(p_productos_ids, ',', '')) + 1;

    
    WHILE v_index <= v_total_productos DO
        
        SET v_producto_id = CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(p_productos_ids, ',', v_index), ',', -1) AS UNSIGNED);

        
        SET v_cantidad = CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(p_cantidades, ',', v_index), ',', -1) AS UNSIGNED);

        
        INSERT INTO detalle_de_pedidos (id_pedidos, id_producto, cantidad)
        VALUES (v_id_pedido, v_producto_id, v_cantidad);

        
        SET v_index = v_index + 1;
    END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vista_inventario`
--

/*!50001 DROP VIEW IF EXISTS `vista_inventario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_inventario` AS select `producto`.`id_producto` AS `id_producto`,`producto`.`nombre` AS `nombre`,`producto`.`descripcion` AS `descripcion`,`producto`.`precio` AS `precio`,`producto`.`stock` AS `stock` from `producto` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_pedidos_clientes`
--

/*!50001 DROP VIEW IF EXISTS `vista_pedidos_clientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_pedidos_clientes` AS select `p`.`id_pedidos` AS `id_pedidos`,`c`.`nombre` AS `nombre_cliente`,`c`.`telefono` AS `telefono`,`c`.`email` AS `email`,`v`.`id_vendedores` AS `id_vendedores`,`v`.`comision` AS `comision`,`p`.`total` AS `total`,`p`.`id_metodo_de_pago` AS `id_metodo_de_pago`,`p`.`id_transporte` AS `id_transporte` from ((`pedidos` `p` join `clientes` `c` on((`p`.`id_clientes` = `c`.`id_clientes`))) join `vendedores` `v` on((`c`.`id_vendedores` = `v`.`id_vendedores`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-27 21:44:59
