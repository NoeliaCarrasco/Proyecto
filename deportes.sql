-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-05-2016 a las 12:13:21
-- Versión del servidor: 10.1.10-MariaDB
-- Versión de PHP: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `deportes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `IDCATEGORIA` int(11) NOT NULL,
  `NOMBRE` varchar(25) NOT NULL
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

CREATE TABLE `detallespedido` (
  `IDPRODUCTO` int(11) NOT NULL,
  `IDPEDIDO` int(11) NOT NULL,
  `CANTIDAD` int(11) NOT NULL,
  `IMPORTE` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detallespedido`
--

INSERT INTO `detallespedido` (`IDPRODUCTO`, `IDPEDIDO`, `CANTIDAD`, `IMPORTE`) VALUES
(15, 33, 1, 11),
(13, 34, 1, 56),
(9, 34, 1, 25),
(8, 35, 2, 30),
(6, 36, 1, 20),
(7, 36, 1, 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `IDFACTURA` int(11) NOT NULL,
  `FECHA` date NOT NULL,
  `TOTAL` float NOT NULL,
  `IDPEDIDO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `IDPEDIDO` int(11) NOT NULL,
  `FECHA_ALTA` date NOT NULL,
  `IDUSUARIO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`IDPEDIDO`, `FECHA_ALTA`, `IDUSUARIO`) VALUES
(33, '2016-04-29', 17),
(34, '2016-04-29', 17),
(35, '2016-04-29', 17),
(36, '2016-05-03', 17);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `IDPRODUCTO` int(11) NOT NULL,
  `NOMBRE` varchar(25) NOT NULL,
  `PRECIO` decimal(6,2) NOT NULL,
  `STOCK` int(11) NOT NULL,
  `FOTO` varchar(25) NOT NULL,
  `IDCATEGORIA` int(11) NOT NULL,
  `DESCRIPCION` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`IDPRODUCTO`, `NOMBRE`, `PRECIO`, `STOCK`, `FOTO`, `IDCATEGORIA`, `DESCRIPCION`) VALUES
(1, 'azul', '15.00', 42, '01_27_359.jpg', 0, ''),
(3, 'guay', '24.00', 50, '01_27_353.jpg', 3, ''),
(6, 'gris', '20.00', 41, '01_27_35.jpg', 0, ''),
(7, 'morada', '18.00', 43, '01_27_356.jpg', 0, ''),
(8, 'rosa', '30.00', 42, '01_27_68.jpg', 1, ''),
(9, 'naranja', '25.00', 48, '01_27_67.jpg', 1, ''),
(10, 'negro', '22.00', 50, '01_27_61.jpg', 3, ''),
(11, 'airmax', '45.00', 50, '01_27_355.jpg', 3, ''),
(12, 'fucsia', '38.00', 49, '01_27_72.jpg', 2, ''),
(13, 'verde', '56.00', 48, '01_27_73.jpg', 2, ''),
(14, 'azul', '33.00', 50, '01_27_71.jpg', 2, ''),
(15, 'puma', '11.00', 49, '01_27_80.jpg', 4, ''),
(16, 'nike', '9.00', 50, '01_27_77.jpg', 4, ''),
(17, 'roxy', '32.00', 50, '01_27_82.jpg', 4, ''),
(18, 'bonito', '27.00', 49, '01_27_66.jpg', 1, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `IDUSUARIO` int(11) NOT NULL,
  `NOMBRE` varchar(25) NOT NULL,
  `APELLIDO` varchar(25) NOT NULL,
  `ROL` int(11) NOT NULL,
  `TIPO` varchar(20) NOT NULL,
  `USUARIO` varchar(25) NOT NULL,
  `PASSWORD` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`IDUSUARIO`, `NOMBRE`, `APELLIDO`, `ROL`, `TIPO`, `USUARIO`, `PASSWORD`) VALUES
(9, 'manuel', 'manuel1', 1, 'Cliente', 'manuel', '202cb962ac59075b964b07152d234b70'),
(16, 'jose', 'jose', 1, 'Cliente', 'jose', 'd41d8cd98f00b204e9800998ecf8427e'),
(17, 'noelia', 'carrasco', 2, 'Administrador', 'noelia', '81dc9bdb52d04dc20036dbd8313ed055');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`IDCATEGORIA`);

--
-- Indices de la tabla `detallespedido`
--
ALTER TABLE `detallespedido`
  ADD KEY `DETALLES1` (`IDPRODUCTO`),
  ADD KEY `DETALLES2` (`IDPEDIDO`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`IDFACTURA`),
  ADD KEY `facturas_ibfk_1` (`IDPEDIDO`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`IDPEDIDO`),
  ADD KEY `IDUSUARIO` (`IDUSUARIO`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`IDPRODUCTO`),
  ADD KEY `productos_ibfk_1` (`IDCATEGORIA`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`IDUSUARIO`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `IDPEDIDO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `IDPRODUCTO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `IDUSUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detallespedido`
--
ALTER TABLE `detallespedido`
  ADD CONSTRAINT `DETALLES1` FOREIGN KEY (`IDPRODUCTO`) REFERENCES `productos` (`IDPRODUCTO`),
  ADD CONSTRAINT `DETALLES2` FOREIGN KEY (`IDPEDIDO`) REFERENCES `pedidos` (`IDPEDIDO`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`IDCATEGORIA`) REFERENCES `categorias` (`IDCATEGORIA`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
