-- phpMyAdmin SQL Dump
-- version 4.0.10.12
-- http://www.phpmyadmin.net
--
-- Servidor: 127.2.2.2:3306
-- Tiempo de generación: 03-06-2016 a las 11:04:08
-- Versión del servidor: 5.5.45
-- Versión de PHP: 5.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `deportes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE IF NOT EXISTS `categorias` (
  `IDCATEGORIA` int(11) NOT NULL,
  `NOMBRE` varchar(25) NOT NULL,
  PRIMARY KEY (`IDCATEGORIA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`IDCATEGORIA`, `NOMBRE`) VALUES
(0, 'sudaderas'),
(1, 'chandals'),
(2, 'botas de futbol'),
(3, 'botines'),
(4, 'mochilas y carteras');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallespedido`
--

CREATE TABLE IF NOT EXISTS `detallespedido` (
  `IDPRODUCTO` int(11),
  `IDPEDIDO` int(11),
  `CANTIDAD` int(11) NOT NULL,
  `IMPORTE` double NOT NULL,
  KEY `DETALLES1` (`IDPRODUCTO`),
  KEY `DETALLES2` (`IDPEDIDO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detallespedido`
--

INSERT INTO `detallespedido` (`IDPRODUCTO`, `IDPEDIDO`, `CANTIDAD`, `IMPORTE`) VALUES
(15, 2, 6, 15),
(6, 2, 5, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE IF NOT EXISTS `facturas` (
  `IDFACTURA` int(11) NOT NULL,
  `FECHA` date NOT NULL,
  `TOTAL` float NOT NULL,
  `IDPEDIDO` int(11) NOT NULL,
  PRIMARY KEY (`IDFACTURA`),
  KEY `facturas_ibfk_1` (`IDPEDIDO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE IF NOT EXISTS `pedidos` (
  `IDPEDIDO` int(11) NOT NULL AUTO_INCREMENT,
  `FECHA_ALTA` date NOT NULL,
  `IDUSUARIO` int(11),
  PRIMARY KEY (`IDPEDIDO`),
  KEY `IDUSUARIO` (`IDUSUARIO`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`IDPEDIDO`, `FECHA_ALTA`, `IDUSUARIO`) VALUES
(2, '2016-06-03', 19);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE IF NOT EXISTS `productos` (
  `IDPRODUCTO` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(25) NOT NULL,
  `PRECIO` decimal(6,2) NOT NULL,
  `STOCK` int(11) NOT NULL,
  `FOTO` varchar(25) NOT NULL,
  `IDCATEGORIA` int(11),
  `DESCRIPCION` varchar(25) NOT NULL,
  PRIMARY KEY (`IDPRODUCTO`),
  KEY `productos_ibfk_1` (`IDCATEGORIA`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`IDPRODUCTO`, `NOMBRE`, `PRECIO`, `STOCK`, `FOTO`, `IDCATEGORIA`, `DESCRIPCION`) VALUES
(1, 'azul', '15.00', 33, '01_27_359.jpg', 0, ''),
(3, 'guay', '24.00', 49, '01_27_353.jpg', 3, ''),
(6, 'gris', '20.00', 34, '01_27_35.jpg', 0, ''),
(7, 'morada', '18.00', 43, '01_27_356.jpg', 0, ''),
(8, 'rosa', '30.00', 40, '01_27_68.jpg', 1, ''),
(9, 'naranja', '25.00', 44, '01_27_67.jpg', 1, ''),
(10, 'negro', '22.00', 49, '01_27_61.jpg', 3, ''),
(11, 'airmax', '45.00', 50, '01_27_355.jpg', 3, ''),
(12, 'fucsia', '38.00', 47, '01_27_72.jpg', 2, ''),
(13, 'verde', '56.00', 47, '01_27_73.jpg', 2, ''),
(14, 'azul', '33.00', 49, '01_27_71.jpg', 2, ''),
(15, 'puma', '15.00', 41, '01_27_80.jpg', 4, ''),
(16, 'nike', '9.00', 47, '01_27_77.jpg', 4, ''),
(17, 'roxy', '32.00', 50, '01_27_82.jpg', 4, ''),
(19, 'bonito', '40.00', 48, '01_27_66.jpg', 1, ''),
(20, 'hhh', '50.00', 50, '01_27_63.jpg', 0, 'fghgsgz');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `IDUSUARIO` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(25) NOT NULL,
  `APELLIDO` varchar(25) NOT NULL,
  `ROL` int(11) NOT NULL,
  `TIPO` varchar(20) NOT NULL,
  `USUARIO` varchar(25) NOT NULL,
  `PASSWORD` varchar(90) NOT NULL,
  PRIMARY KEY (`IDUSUARIO`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`IDUSUARIO`, `NOMBRE`, `APELLIDO`, `ROL`, `TIPO`, `USUARIO`, `PASSWORD`) VALUES
(17, 'noelia', 'carrasco', 2, 'Administrador', 'noelia', '81dc9bdb52d04dc20036dbd8313ed055'),
(18, 'jose', 'jose', 1, 'Cliente', 'jose', '202cb962ac59075b964b07152d234b70'),
(19, 'manuel', 'manuel', 1, 'Cliente', 'manuel', '202cb962ac59075b964b07152d234b70'),
(20, 'hhh', 'hhh', 1, 'Cliente', 'hhh', '202cb962ac59075b964b07152d234b70');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detallespedido`
--
ALTER TABLE `detallespedido`
  ADD CONSTRAINT `DETALLES1` FOREIGN KEY (`IDPRODUCTO`) REFERENCES `productos` (`IDPRODUCTO`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `DETALLES2` FOREIGN KEY (`IDPEDIDO`) REFERENCES `pedidos` (`IDPEDIDO`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`IDCATEGORIA`) REFERENCES `categorias` (`IDCATEGORIA`) ON DELETE SET NULL ON UPDATE CASCADE;
  
  ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`IDUSUARIO`) REFERENCES `usuarios` (`IDUSUARIO`) ON DELETE SET NULL ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
