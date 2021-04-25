-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-04-2021 a las 21:06:42
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyectophp`
--
CREATE DATABASE IF NOT EXISTS `proyectophp` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `proyectophp`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario`
--

CREATE TABLE `comentario` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `texto` varchar(255) NOT NULL,
  `nota` int(11) NOT NULL,
  `idJuego` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comentario`
--

INSERT INTO `comentario` (`id`, `titulo`, `texto`, `nota`, `idJuego`, `idUsuario`) VALUES
(2, 'Prueba', '<h1>Tremendisimo</h1>', 10, 1, 1),
(5, 'Maravilloso ', 'El mejejor juego que existira jamas me ha encantado.', 9, 3, 1),
(8, 'Maravilloso ', 'El mejejor juego que existira jamas me ha encantado.', 5, 3, 1),
(9, 'Prueba', '<h1>Tremendisimo</h1>', 2, 1, 1),
(10, 'Pewersfsdf', 'asddasdada', 7, 1, 8),
(11, 'asdasd', 'asdasdad', 7, 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generojuegos`
--

CREATE TABLE `generojuegos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `idJuego` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes`
--

CREATE TABLE `imagenes` (
  `id` int(11) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `idJuego` int(11) NOT NULL,
  `principal` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `imagenes`
--

INSERT INTO `imagenes` (`id`, `direccion`, `idJuego`, `principal`) VALUES
(13, 'http://localhost/backendphp/images/p-Juego de prueba-0.jpg', 17, 0),
(14, 'http://localhost/backendphp/images/p-Juego de prueba-1.jpg', 17, 1),
(27, 'http://localhost/backendphp/images/p-Juego de prueba 2-0.jpg', 31, 0),
(28, 'http://localhost/backendphp/images/p-Juego de prueba 2-1.jpg', 31, 1),
(29, 'http://localhost/backendphp/images/p-Juego de prueba 3-0.jpg', 32, 0),
(30, 'http://localhost/backendphp/images/p-Juego de prueba 4-0.jpg', 33, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juego`
--

CREATE TABLE `juego` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `fechaDeLanzamiento` varchar(255) NOT NULL,
  `comprar` varchar(255) NOT NULL,
  `edad` varchar(255) NOT NULL,
  `creador` varchar(255) NOT NULL,
  `genero` varchar(255) NOT NULL,
  `numeroDeJugadores` varchar(255) NOT NULL,
  `fechaDePublicacion` date NOT NULL DEFAULT current_timestamp(),
  `imagen` varchar(255) NOT NULL,
  `nota` int(11) NOT NULL,
  `resumen` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `juego`
--

INSERT INTO `juego` (`id`, `nombre`, `fechaDeLanzamiento`, `comprar`, `edad`, `creador`, `genero`, `numeroDeJugadores`, `fechaDePublicacion`, `imagen`, `nota`, `resumen`) VALUES
(17, 'Juego de prueba', '2021-04-24', 'https://www.google.es/', '12', 'Pedro', 'Lucha', '12', '2021-04-24', '13', 9, 'dsfsdfsdfsdfsd'),
(31, 'Juego de prueba 2', '2021-04-25', 'https://www.google.es/', '12', 'Pedro', 'Lucha', '12', '2021-04-25', '28', 8, 'dsfsdfsdfsdfsd'),
(32, 'Juego de prueba 3', '2021-04-25', 'https://www.google.es/', '12', 'Pedro', 'Lucha', '12', '2021-04-25', '29', 8, 'dsfsdfsdfsdfsd'),
(33, 'Juego de prueba 4', '2021-04-25', 'https://www.google.es/', '12', 'Pedro', 'Lucha', '12', '2021-04-25', '30', 8, 'dsfsdfsdfsdfsd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `usuario` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `email`, `foto`, `usuario`, `password`, `rol`) VALUES
(2, 'manuelpalomino080@gmail.com', 'no_foto', 'Juan12343', '$2y$10$oqluhgCBzyWgiGnrVvYe4uCFah4o1D/09MOenrZFyYr799Z/kaPNW', 'user'),
(3, 'manuelpalomino484@gmail.com', 'no_foto', 'admin', '$2y$10$LDOfAkH9USf7T8eM0Imlre7J1w3Dco5k1r3K.RRwGjIhUW4aIyKH2', 'admin'),
(6, 'manuelpalomino4884@gmail.com', 'no_foto', 'Manuel1234', '$2y$10$HCd4Ixng6Q4TSqifHgJMGe6Pvc1lYrs8UqBSFEQ52lEE.eu/pYeKS', 'user'),
(7, 'aujo@gmail.com', 'no_foto', 'aujo21', '$2y$10$GzQVwRwc8b.9RADvEYSose0wmGs3LlB/adNPMSO3hpxRj3AlSMhQm', 'user'),
(8, 'manuelpalomino040@gmail.com', 'no_foto', 'Juabhewr21', '$2y$10$W.PCAGEQP51V5p5PzQNpW.oUoFKAJkE2CzwMrIe09muO4W5BGkn/2', 'user');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videos`
--

CREATE TABLE `videos` (
  `id` int(11) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `idJuego` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `generojuegos`
--
ALTER TABLE `generojuegos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `imagenes`
--
ALTER TABLE `imagenes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `juego`
--
ALTER TABLE `juego`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comentario`
--
ALTER TABLE `comentario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `generojuegos`
--
ALTER TABLE `generojuegos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `imagenes`
--
ALTER TABLE `imagenes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `juego`
--
ALTER TABLE `juego`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
