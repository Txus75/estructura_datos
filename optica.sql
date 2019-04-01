-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-03-2019 a las 12:28:19
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `optica`
--
CREATE DATABASE IF NOT EXISTS `optica` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `optica`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client`
--

CREATE TABLE `client` (
  `client_ID` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `cp` varchar(5) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `e-mail` varchar(20) NOT NULL,
  `registration_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `recommendation` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELACIONES PARA LA TABLA `client`:
--

--
-- Volcado de datos para la tabla `client`
--

INSERT INTO `client` (`client_ID`, `name`, `cp`, `phone`, `e-mail`, `registration_date`, `recommendation`) VALUES
(1, 'Clark Kent', '01234', '555-4567', 'clark.kent@dailyplan', '2019-03-29 10:35:41', NULL),
(2, 'Peter Parker', '00234', '555-9988', 'peter.p@bugle.com', '2019-03-29 10:35:41', 1),
(3, 'Bruce Wayne', '08880', '555-4682', 'b.wayne@gotham.com', '2019-03-29 10:37:41', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employee`
--

CREATE TABLE `employee` (
  `employee_ID` int(11) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELACIONES PARA LA TABLA `employee`:
--

--
-- Volcado de datos para la tabla `employee`
--

INSERT INTO `employee` (`employee_ID`, `firstname`, `lastname`) VALUES
(1, 'Alfred', 'Pennyworth'),
(2, 'Edwin', 'Jarvis');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glasses_model`
--

CREATE TABLE `glasses_model` (
  `glasses_ID` int(11) NOT NULL,
  `model` varchar(100) NOT NULL,
  `graduation_rigth` varchar(12) NOT NULL,
  `graduation_left` varchar(12) NOT NULL,
  `frame` enum('Flotante','Pasta','Metálica','') NOT NULL,
  `frame_color` varchar(20) NOT NULL,
  `glass_color` varchar(20) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `provider_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELACIONES PARA LA TABLA `glasses_model`:
--   `provider_ID`
--       `provider` -> `provider_ID`
--

--
-- Volcado de datos para la tabla `glasses_model`
--

INSERT INTO `glasses_model` (`glasses_ID`, `model`, `graduation_rigth`, `graduation_left`, `frame`, `frame_color`, `glass_color`, `price`, `provider_ID`) VALUES
(1, 'Rayos X', '0.5', '0.5', 'Pasta', 'negro', 'rojo', '12.00', 1),
(2, 'SHIELD', '1.2', '1.5', 'Metálica', 'cromo', 'verde', '34.99', 1),
(3, 'Periodista', '5', '3.4', 'Metálica', 'Negro', 'Transparente', '8.99', 2),
(4, 'Sport', '0.1', '0.1', 'Flotante', 'Azul', 'Azul', '22.49', 1),
(5, 'Ejecutivo', '2.1', '3.2', 'Flotante', 'Negro', 'Espejo', '99.99', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provider`
--

CREATE TABLE `provider` (
  `provider_ID` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `address` varchar(100) NOT NULL,
  `number` varchar(3) NOT NULL,
  `floor` varchar(3) NOT NULL,
  `door` varchar(3) NOT NULL,
  `city` varchar(20) NOT NULL,
  `cp` varchar(5) NOT NULL,
  `country` varchar(20) NOT NULL,
  `telephone` varchar(12) NOT NULL,
  `fax` varchar(12) NOT NULL,
  `nif` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELACIONES PARA LA TABLA `provider`:
--

--
-- Volcado de datos para la tabla `provider`
--

INSERT INTO `provider` (`provider_ID`, `name`, `address`, `number`, `floor`, `door`, `city`, `cp`, `country`, `telephone`, `fax`, `nif`) VALUES
(1, 'Marvel', '50th Street', '135', '7', 'A', 'Nueva York', '12345', 'EE.UU.', '555-5678', '34343434', '11111111111'),
(2, 'DC', 'Broadway', '170', '1', 'B', 'California', '1700', 'EE.UU.', '555-9812', '12121212', '22222222222');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sale`
--

CREATE TABLE `sale` (
  `sale_ID` int(11) NOT NULL,
  `glasses_ID` int(11) NOT NULL,
  `client_ID` int(11) NOT NULL,
  `employee_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELACIONES PARA LA TABLA `sale`:
--   `client_ID`
--       `client` -> `client_ID`
--   `glasses_ID`
--       `glasses_model` -> `glasses_ID`
--   `employee_ID`
--       `employee` -> `employee_ID`
--

--
-- Volcado de datos para la tabla `sale`
--

INSERT INTO `sale` (`sale_ID`, `glasses_ID`, `client_ID`, `employee_ID`) VALUES
(1, 3, 1, 1),
(2, 5, 3, 1),
(3, 2, 2, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`client_ID`);

--
-- Indices de la tabla `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_ID`);

--
-- Indices de la tabla `glasses_model`
--
ALTER TABLE `glasses_model`
  ADD PRIMARY KEY (`glasses_ID`),
  ADD KEY `provider_ID` (`provider_ID`),
  ADD KEY `provider_ID_2` (`provider_ID`);

--
-- Indices de la tabla `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`provider_ID`);

--
-- Indices de la tabla `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`sale_ID`),
  ADD KEY `glasses_ID` (`glasses_ID`),
  ADD KEY `client_ID` (`client_ID`),
  ADD KEY `employee_ID` (`employee_ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `client`
--
ALTER TABLE `client`
  MODIFY `client_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `glasses_model`
--
ALTER TABLE `glasses_model`
  MODIFY `glasses_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `provider`
--
ALTER TABLE `provider`
  MODIFY `provider_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `sale`
--
ALTER TABLE `sale`
  MODIFY `sale_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `glasses_model`
--
ALTER TABLE `glasses_model`
  ADD CONSTRAINT `glasses_model_ibfk_1` FOREIGN KEY (`provider_ID`) REFERENCES `provider` (`provider_ID`);

--
-- Filtros para la tabla `sale`
--
ALTER TABLE `sale`
  ADD CONSTRAINT `sale_ibfk_1` FOREIGN KEY (`client_ID`) REFERENCES `client` (`client_ID`),
  ADD CONSTRAINT `sale_ibfk_2` FOREIGN KEY (`glasses_ID`) REFERENCES `glasses_model` (`glasses_ID`),
  ADD CONSTRAINT `sale_ibfk_3` FOREIGN KEY (`employee_ID`) REFERENCES `employee` (`employee_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
