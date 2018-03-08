-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-03-2018 a las 04:56:35
-- Versión del servidor: 10.1.25-MariaDB
-- Versión de PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tpreservas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elemento`
--

CREATE TABLE `elemento` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `idtipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `elemento`
--

INSERT INTO `elemento` (`id`, `nombre`, `idtipo`) VALUES
(9, 'disco rigido', 6),
(11, 'placa video', 6),
(12, 'jazmin', 5),
(17, 'mouse', 6),
(18, 'teclado', 6),
(19, 'rosa', 5),
(20, 'margarita', 5),
(21, 'auto', 26),
(22, 'camion', 26),
(24, 'moto', 26),
(25, 'heladera', 33),
(26, 'televisor', 33),
(27, 'lavarropas', 33),
(28, 'casa', 29),
(29, 'departamento', 29),
(30, 'pension', 29);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id` int(11) NOT NULL,
  `dni` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `contraseña` varchar(20) NOT NULL,
  `habilitado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `dni`, `nombre`, `apellido`, `usuario`, `contraseña`, `habilitado`) VALUES
(13, 35409384, 'Pedro', 'Juan', 'juan', 'user', 1),
(20, 36656206, 'Cesar', 'Mecanico', 'mecanico', 'admin', 1),
(21, 123456789, 'Marco', 'Ruben', 'ruben', 'admin', 1),
(23, 23232323, 'Paulo', 'Ferrari', 'ferrari', 'admin', 0),
(24, 45454545, 'Adrian', 'Meca', 'meca', 'admin', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `id` int(11) NOT NULL,
  `idpersona` int(11) NOT NULL,
  `idtipo` int(11) NOT NULL,
  `idelemento` int(11) NOT NULL,
  `detalle` text NOT NULL,
  `fechaYhora` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`id`, `idpersona`, `idtipo`, `idelemento`, `detalle`, `fechaYhora`) VALUES
(28, 21, 33, 26, 'reserva de televisor', '2000-12-12 00:00:00'),
(29, 20, 26, 21, 'reserva de auto', '2020-06-10 18:00:00'),
(30, 20, 6, 11, 'reserva de placa de video', '2019-12-12 15:45:00'),
(31, 23, 5, 12, 'reserva de jazmin', '2018-12-12 18:00:00'),
(32, 23, 29, 28, 'reserva de casa', '2030-11-12 19:05:00'),
(33, 21, 6, 18, 'reserva de teclado', '2018-03-07 12:12:00'),
(34, 1, 5, 19, 'reserva de rosa', '2015-12-10 13:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoelemento`
--

CREATE TABLE `tipoelemento` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `cantmaxreservaspendientes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipoelemento`
--

INSERT INTO `tipoelemento` (`id`, `nombre`, `cantmaxreservaspendientes`) VALUES
(5, 'planta', 15),
(6, 'hardware', 20),
(26, 'automotor', 5),
(29, 'inmueble', 11),
(33, 'electrodomestico', 12);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `elemento`
--
ALTER TABLE `elemento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idtipo` (`idtipo`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipoelemento`
--
ALTER TABLE `tipoelemento`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `elemento`
--
ALTER TABLE `elemento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT de la tabla `reserva`
--
ALTER TABLE `reserva`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT de la tabla `tipoelemento`
--
ALTER TABLE `tipoelemento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
