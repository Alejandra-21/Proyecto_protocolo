-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 07-03-2020 a las 23:31:36
-- Versión del servidor: 10.4.10-MariaDB
-- Versión de PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `protocolo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `academia`
--

DROP TABLE IF EXISTS `academia`;
CREATE TABLE IF NOT EXISTS `academia` (
  `calve` int(10) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `presidente` int(10) NOT NULL,
  PRIMARY KEY (`calve`),
  KEY `presidente_idx` (`presidente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

DROP TABLE IF EXISTS `alumno`;
CREATE TABLE IF NOT EXISTS `alumno` (
  `boleta` int(10) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `no_registro` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`boleta`),
  KEY `no_registro_idx` (`no_registro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`boleta`, `nombre`, `correo`, `password`, `no_registro`) VALUES
(2015630243, 'LAZARO RUBI ALEJANDRA', 'alzaro187@gmail.com', 'gustavo', 'TTB002'),
(2015630402, 'RESENDIZ HERNANDEZ DANIEL', 'tecnogenesisfilis@gmail.com', 'aledan21', 'TTB002'),
(2015630403, 'RESENDIZ RAMIREZ VICTOR ALDAIR', 'alazaro187@gmail.com', '1234', 'TTB001'),
(2015630520, 'VENEGAS GODINEZ CARLOS ALBERTO', 'alzaro187@gmail.com', '1234', 'TTB003');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evalua`
--

DROP TABLE IF EXISTS `evalua`;
CREATE TABLE IF NOT EXISTS `evalua` (
  `idEvalua` int(11) NOT NULL,
  `no_registro` varchar(15) NOT NULL,
  `idProfesor` int(10) NOT NULL,
  `ruta_pdf_eval` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`idEvalua`),
  KEY `no_registro_idx` (`no_registro`),
  KEY `idProfesor_idx` (`idProfesor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `palabras_clave`
--

DROP TABLE IF EXISTS `palabras_clave`;
CREATE TABLE IF NOT EXISTS `palabras_clave` (
  `no_registro` varchar(15) NOT NULL,
  `p1` varchar(45) NOT NULL,
  `p2` varchar(45) NOT NULL,
  `p3` varchar(45) NOT NULL,
  PRIMARY KEY (`no_registro`),
  KEY `no_registro_ind` (`no_registro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

DROP TABLE IF EXISTS `profesor`;
CREATE TABLE IF NOT EXISTS `profesor` (
  `idProfesor` int(10) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`idProfesor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `profesor`
--

INSERT INTO `profesor` (`idProfesor`, `nombre`, `usuario`, `password`) VALUES
(1, 'LOPEZ CARRERA BENJAMIN', 'LCB1_', 'LCB1_'),
(2, 'VAZQUEZ ARREGUIN ROBERTO', 'VAR2_', 'VAR2_'),
(3, 'TELLEZ REYES MARIA DEL SOCORRO', 'TRMS3_', 'TRMS3_'),
(4, 'SUAREZ CASTANON MIGUEL SANTIAGO', 'SCMS4_', 'SCMS4_'),
(5, 'CHAVEZ LIMA EDUARDO', 'CLE5_', 'CLE5_'),
(6, 'DORANTES VILLA CLAUDIA JISELA', 'DVCJ6_', 'DVCJ6_'),
(7, 'PEREZ VERA MONSERRAT GABRIELA', 'PVMG7_', 'PVMG7_'),
(8, 'RUEDA MELENDEZ MARCO ANTONIO', 'RMMA8_', 'RMMA8_'),
(9, 'GUZMAN AGUILAR FLORENCIO', 'GAF9_', 'GAF9_'),
(10, 'MUNOZ SALAZAR LAURA', 'MSL10_', 'MSL10_');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prof_academia`
--

DROP TABLE IF EXISTS `prof_academia`;
CREATE TABLE IF NOT EXISTS `prof_academia` (
  `clave_academia` int(10) NOT NULL,
  `idProfesor` int(10) NOT NULL,
  PRIMARY KEY (`clave_academia`,`idProfesor`),
  KEY `idProfesor_idx` (`idProfesor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `protocolo1`
--

DROP TABLE IF EXISTS `protocolo1`;
CREATE TABLE IF NOT EXISTS `protocolo1` (
  `no_registro` varchar(15) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `ruta_pdf` varchar(255) NOT NULL,
  PRIMARY KEY (`no_registro`),
  KEY `no_registro` (`no_registro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `protocolo1`
--

INSERT INTO `protocolo1` (`no_registro`, `nombre`, `ruta_pdf`) VALUES
('TTB001', 'PROTOTIPO DE SISTEMA DE AUTOMOVILES', ''),
('TTB002', 'SISTEMA DE REDES MARITIMAS', ''),
('TTB003', 'SISTEMA DE MONITOREO PARA INVENTARIOS', '');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `academia`
--
ALTER TABLE `academia`
  ADD CONSTRAINT `presidente` FOREIGN KEY (`presidente`) REFERENCES `profesor` (`idProfesor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD CONSTRAINT `no_registro_a` FOREIGN KEY (`no_registro`) REFERENCES `protocolo1` (`no_registro`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `evalua`
--
ALTER TABLE `evalua`
  ADD CONSTRAINT `idProfesor_e` FOREIGN KEY (`idProfesor`) REFERENCES `profesor` (`idProfesor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `no_registro_e` FOREIGN KEY (`no_registro`) REFERENCES `protocolo1` (`no_registro`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `palabras_clave`
--
ALTER TABLE `palabras_clave`
  ADD CONSTRAINT `no_registro_p` FOREIGN KEY (`no_registro`) REFERENCES `protocolo1` (`no_registro`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `prof_academia`
--
ALTER TABLE `prof_academia`
  ADD CONSTRAINT `clave_academia_pa` FOREIGN KEY (`clave_academia`) REFERENCES `academia` (`calve`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idProfesor_pa` FOREIGN KEY (`idProfesor`) REFERENCES `profesor` (`idProfesor`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
