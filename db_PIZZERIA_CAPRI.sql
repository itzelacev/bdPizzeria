-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: db_PIZZERIA_CAPRI
-- ------------------------------------------------------
-- Server version	5.7.28-0ubuntu0.18.04.4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ARTICULO`
--

DROP TABLE IF EXISTS `ARTICULO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ARTICULO` (
  `id_articulo` int(6) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  `precio_unitario` int(6) NOT NULL,
  PRIMARY KEY (`id_articulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ARTICULO`
--

LOCK TABLES `ARTICULO` WRITE;
/*!40000 ALTER TABLE `ARTICULO` DISABLE KEYS */;
/*!40000 ALTER TABLE `ARTICULO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ARTICULO_SUCURSAL`
--

DROP TABLE IF EXISTS `ARTICULO_SUCURSAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ARTICULO_SUCURSAL` (
  `id_articulo_sucursal` int(6) NOT NULL AUTO_INCREMENT,
  `existencias` int(4) NOT NULL,
  `id_sucursal` int(6) NOT NULL,
  `id_articulo` int(6) NOT NULL,
  PRIMARY KEY (`id_articulo_sucursal`),
  KEY `fk_articulo_sucursal` (`id_articulo`),
  KEY `fk_sucursal_articulo` (`id_sucursal`),
  CONSTRAINT `fk_articulo_sucursal` FOREIGN KEY (`id_articulo`) REFERENCES `ARTICULO` (`id_articulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sucursal_articulo` FOREIGN KEY (`id_sucursal`) REFERENCES `SUCURSAL` (`id_sucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ARTICULO_SUCURSAL`
--

LOCK TABLES `ARTICULO_SUCURSAL` WRITE;
/*!40000 ALTER TABLE `ARTICULO_SUCURSAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `ARTICULO_SUCURSAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENTE`
--

DROP TABLE IF EXISTS `CLIENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENTE` (
  `id_cliente` int(6) NOT NULL AUTO_INCREMENT,
  `limite_credito` int(6) NOT NULL,
  `saldo` int(6) NOT NULL,
  `descuento` int(4) NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENTE`
--

LOCK TABLES `CLIENTE` WRITE;
/*!40000 ALTER TABLE `CLIENTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DIRECCIONES`
--

DROP TABLE IF EXISTS `DIRECCIONES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DIRECCIONES` (
  `id_direcciones` int(6) NOT NULL AUTO_INCREMENT,
  `calle` varchar(20) NOT NULL,
  `numero` varchar(4) NOT NULL,
  `estado` varchar(25) NOT NULL,
  `id_cliente` int(6) NOT NULL,
  PRIMARY KEY (`id_direcciones`),
  KEY `fk_direcciones_cliente` (`id_cliente`),
  CONSTRAINT `fk_direcciones_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `CLIENTE` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DIRECCIONES`
--

LOCK TABLES `DIRECCIONES` WRITE;
/*!40000 ALTER TABLE `DIRECCIONES` DISABLE KEYS */;
/*!40000 ALTER TABLE `DIRECCIONES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PEDIDO`
--

DROP TABLE IF EXISTS `PEDIDO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PEDIDO` (
  `id_pedido` int(6) NOT NULL AUTO_INCREMENT,
  `direccion` varchar(30) NOT NULL,
  `fecha` varchar(11) NOT NULL,
  `monto_total` int(8) NOT NULL,
  `id_cliente` int(6) NOT NULL,
  `id_sucursal` int(6) NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `fk_pedido_cliente` (`id_cliente`),
  KEY `fk_pedido_sucursal` (`id_sucursal`),
  CONSTRAINT `fk_pedido_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `CLIENTE` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_sucursal` FOREIGN KEY (`id_sucursal`) REFERENCES `SUCURSAL` (`id_sucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PEDIDO`
--

LOCK TABLES `PEDIDO` WRITE;
/*!40000 ALTER TABLE `PEDIDO` DISABLE KEYS */;
/*!40000 ALTER TABLE `PEDIDO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PEDIDO_ARTICULO`
--

DROP TABLE IF EXISTS `PEDIDO_ARTICULO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PEDIDO_ARTICULO` (
  `id_articulo_pedido` int(6) NOT NULL AUTO_INCREMENT,
  `cantidad` int(4) NOT NULL,
  `precio_unitario` int(5) NOT NULL,
  `id_articulo` int(6) NOT NULL,
  `id_pedido` int(6) NOT NULL,
  PRIMARY KEY (`id_articulo_pedido`),
  KEY `fk_pedido_articulo` (`id_pedido`),
  KEY `fk_articulo_pedido` (`id_articulo`),
  CONSTRAINT `fk_articulo_pedido` FOREIGN KEY (`id_articulo`) REFERENCES `ARTICULO` (`id_articulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_articulo` FOREIGN KEY (`id_pedido`) REFERENCES `PEDIDO` (`id_pedido`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PEDIDO_ARTICULO`
--

LOCK TABLES `PEDIDO_ARTICULO` WRITE;
/*!40000 ALTER TABLE `PEDIDO_ARTICULO` DISABLE KEYS */;
/*!40000 ALTER TABLE `PEDIDO_ARTICULO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SUCURSAL`
--

DROP TABLE IF EXISTS `SUCURSAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SUCURSAL` (
  `id_sucursal` int(6) NOT NULL AUTO_INCREMENT,
  `telefono` varchar(11) NOT NULL,
  PRIMARY KEY (`id_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SUCURSAL`
--

LOCK TABLES `SUCURSAL` WRITE;
/*!40000 ALTER TABLE `SUCURSAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `SUCURSAL` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-09 21:09:39
