-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-07-2021 a las 16:51:16
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `my_app`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restaurants`
--

CREATE TABLE `restaurants` (
  `id_restaurant` int(8) NOT NULL,
  `name` varchar(150) NOT NULL,
  `address` varchar(200) NOT NULL,
  `lat` decimal(10,8) NOT NULL,
  `lng` decimal(11,8) NOT NULL,
  `kind_food` set('bistro','café','japanese','pizzeria','mediterranean','taverna','ramen','fast_food','churrascaria','vegan') NOT NULL,
  `photo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `restaurants`
--

INSERT INTO `restaurants` (`id_restaurant`, `name`, `address`, `lat`, `lng`, `kind_food`, `photo`) VALUES
(1, 'Somni Restaurant', 'Carrer de Provença, 277, 08037 Barcelona\r\n\r\n', '41.39763987', '2.16272744', 'pizzeria,mediterranean,vegan', 'img/somni.jpg'),
(2, 'Restaurante Loto', 'Carrer del Call, 17, 08002 Barcelona\r\n\r\n', '41.38366685', '2.17568788', 'japanese', 'img/loto.jpg'),
(3, 'Santa Fe', 'Carrer de Wellington, 17, 08018 Barcelona\r\n\r\n', '41.39420974', '2.18573007', 'bistro', 'img/santafe.jpg'),
(4, 'RAO Restaurant', 'Carrer de les Sitges, 3, 08001 Barcelona\r\n', '41.38532355', '2.16864976', 'japanese,ramen', 'img/rao.jpg'),
(5, 'Restaurante Pizzeria Don Angelo', 'Carrer de València, 438, 08013 Barcelona\r\n\r\n', '41.40328786', '2.17680368', 'pizzeria', 'img/angelo.jpg'),
(6, 'Bistro Helena', 'Via Laietana, 30, 08003 Barcelona\r\n\r\n', '41.38622511', '2.17826280', 'bistro,mediterranean', 'img/Helena.jpg'),
(7, 'Restaurante Informal', 'Carrer de la Plata, 4, 08002 Barcelona\r\n', '41.38131498', '2.18031538', 'mediterranean', 'img/informal.jpg'),
(8, 'Musiu', 'Carrer de Pau Claris, 112, 08009 Barcelona\r\n\r\n', '41.39262896', '2.16856285', 'japanese', 'img/Musiu.jpg'),
(9, 'Restaurante Hofmann', 'Carrer de la Granada del Penedès, 14, 08006 Barcelona\r\n\r\n', '41.39823182', '2.15275728', 'churrascaria', 'img/hofmann.jpg'),
(10, 'La Gastronomica', '15, Carrer de Vilamarí, 9, 08015 Barcelona\r\n\r\n', '41.37756761', '2.15449284', 'pizzeria,taverna', 'img/gastronomica.jpg');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id_restaurant`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id_restaurant` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
