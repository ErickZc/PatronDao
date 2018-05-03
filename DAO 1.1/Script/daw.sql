-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-05-2018 a las 06:04:51
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
-- Base de datos: `daw`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregarPersona` (IN `nombrePersona` VARCHAR(50), IN `apellidoPersona` VARCHAR(50))  NO SQL
INSERT INTO personas VALUES (null, nombrePersona, apellidoPersona)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregarUsuario` (IN `nombreUsuario` VARCHAR(50), IN `passwordUsuario` VARCHAR(255))  NO SQL
INSERT INTO usuarios VALUES (null, nombreUsuario, passwordUsuario)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarPersona` (IN `idPersona` INT)  NO SQL
DELETE FROM personas WHERE id_persona = idPersona$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarUsuario` (IN `_id` INT)  NO SQL
delete from usuarios where id_usuario = _id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificarPersona` (IN `idPersona` INT, IN `nombrePersona` VARCHAR(50), IN `apellidoPersona` VARCHAR(50))  NO SQL
UPDATE personas SET nombre = nombrePersona, apellido = apellidoPersona WHERE id_persona = idPersona$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificarUsuario` (IN `_id` INT, IN `_usuario` VARCHAR(50), IN `_password` VARCHAR(50))  NO SQL
update usuarios set usuario = _usuario, password = _password where id_usuario = _id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrarPersonas` ()  NO SQL
SELECT * FROM personas$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrarUsuarios` ()  NO SQL
select * from usuarios$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `verificarDatos` (IN `_usuario` VARCHAR(30), IN `_password` VARCHAR(30))  NO SQL
select * from usuarios where usuario = _usuario AND password = _password$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `verificarUsuario` (IN `nombreUsuario` VARCHAR(50))  NO SQL
SELECT password FROM usuarios WHERE usuario = nombreUsuario LIMIT 1$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `id_persona` int(11) NOT NULL COMMENT 'Identificador de la persona',
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nombres de la persona',
  `apellido` varchar(50) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Apellidos de la persona'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla que contiene un listado de personas';

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`id_persona`, `nombre`, `apellido`) VALUES
(12, 'Karen', 'Ayala'),
(13, 'Gabriela', 'Burgos'),
(14, 'Erick', 'Zc');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL COMMENT 'Identificador del usuario',
  `usuario` varchar(50) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nombre de usuario',
  `password` varchar(255) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Password del usuario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla que contiene a los usuarios del sistema';

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `usuario`, `password`) VALUES
(14, 'ErickZc', '123'),
(15, 'A', 'A');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id_persona`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `id_persona` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la persona', AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del usuario', AUTO_INCREMENT=16;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
