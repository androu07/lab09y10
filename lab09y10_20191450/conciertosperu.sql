-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: conciertosperu
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `artistas`
--

DROP TABLE IF EXISTS `artistas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artistas` (
  `idArtistas` int NOT NULL,
  `Nombre_Grupo` varchar(45) DEFAULT NULL,
  `Fecha_creacion` date DEFAULT NULL,
  `Tipo_musica` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idArtistas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artistas`
--

LOCK TABLES `artistas` WRITE;
/*!40000 ALTER TABLE `artistas` DISABLE KEYS */;
INSERT INTO `artistas` VALUES (1,'Grupo 5','1992-04-08','cumbia'),(2,'Agua Marina','1985-02-16','cumbia'),(3,'Charanga Habanera','2001-05-28','salsa'),(4,'Daniela Darcourt','2005-10-26','salsa'),(5,'Son Tentacion','1998-07-08','salsa'),(6,'Mana','1996-10-22','rock');
/*!40000 ALTER TABLE `artistas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concierto`
--

DROP TABLE IF EXISTS `concierto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `concierto` (
  `idConcierto` int NOT NULL,
  `Fecha_evento` varchar(45) DEFAULT NULL,
  `proveedores_idProveedores` int NOT NULL,
  `artistas_idArtistas` int NOT NULL,
  PRIMARY KEY (`idConcierto`),
  KEY `fk_Concierto_proveedores_idx` (`proveedores_idProveedores`),
  KEY `fk_Concierto_artistas1_idx` (`artistas_idArtistas`),
  CONSTRAINT `fk_Concierto_artistas1` FOREIGN KEY (`artistas_idArtistas`) REFERENCES `artistas` (`idArtistas`),
  CONSTRAINT `fk_Concierto_proveedores` FOREIGN KEY (`proveedores_idProveedores`) REFERENCES `proveedores` (`idProveedores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concierto`
--

LOCK TABLES `concierto` WRITE;
/*!40000 ALTER TABLE `concierto` DISABLE KEYS */;
INSERT INTO `concierto` VALUES (1,'2023-04-01',5,1),(2,'2023-04-02',6,1),(3,'2022-10-15',5,4),(4,'2015-05-16',2,2);
/*!40000 ALTER TABLE `concierto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `integrantes`
--

DROP TABLE IF EXISTS `integrantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `integrantes` (
  `idIntegrantes` int NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Edad` int DEFAULT NULL,
  `Anhios_exp` int DEFAULT NULL,
  `rol` varchar(40) DEFAULT NULL,
  `artistas_idArtistas` int NOT NULL,
  PRIMARY KEY (`idIntegrantes`),
  KEY `fk_integrantes_artistas1_idx` (`artistas_idArtistas`),
  CONSTRAINT `fk_integrantes_artistas1` FOREIGN KEY (`artistas_idArtistas`) REFERENCES `artistas` (`idArtistas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integrantes`
--

LOCK TABLES `integrantes` WRITE;
/*!40000 ALTER TABLE `integrantes` DISABLE KEYS */;
INSERT INTO `integrantes` VALUES (1,'Christian Yaipen',35,10,'lider',1),(2,'Elmer Yaipen',55,25,'baterista',1),(3,'Daniela Darcourt',35,5,'cantante',4),(4,'Rosa Paredes',25,10,'bailarina',2),(5,'Fer',55,20,'lider',6);
/*!40000 ALTER TABLE `integrantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `idProveedores` int NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Telefono` int DEFAULT NULL,
  `Elemento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idProveedores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Otto Kuns',980347768,'embutidos'),(2,'Coca Cola',980347768,'bebida'),(3,'Papa Jhon',980347768,'pizza'),(4,'Mr Fish',980347768,'sushi'),(5,'Backus',980347768,'bebida'),(6,'Segoviana',980347768,'embutidos');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-18 20:32:43
