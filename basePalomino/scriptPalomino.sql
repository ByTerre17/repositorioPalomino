-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-05-2021 a las 22:24:15
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
-- Base de datos: `basepalomino`
--
CREATE DATABASE IF NOT EXISTS `basepalomino` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `basepalomino`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `codigorecuperacion`
--

CREATE TABLE `codigorecuperacion` (
  `id` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `fechaInicio` time NOT NULL,
  `fechaFinal` time NOT NULL,
  `codigoRecuperacion` varchar(255) NOT NULL,
  `usado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `codigorecuperacion`
--

INSERT INTO `codigorecuperacion` (`id`, `idUsuario`, `fechaInicio`, `fechaFinal`, `codigoRecuperacion`, `usado`) VALUES
(4, 3, '14:11:19', '16:26:19', '580130364682', 0);

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
(15, 'Hola', 'dsafdsf', 2, 31, 3),
(18, 'DGDG', 'DFGDFGFFD', 7, 43, 3),
(19, 'DFGDGFFDGD', 'DFGDFG', 10, 43, 3),
(20, 'DFGDGFFDGD', 'DFGDFG', 10, 43, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`id`, `nombre`) VALUES
(1, 'Acción'),
(2, 'Adventura'),
(3, 'Peleas'),
(4, 'Shooter primera persona'),
(5, 'Naves'),
(6, 'Fiesta'),
(7, 'Puzzles'),
(9, 'Carreras'),
(10, 'Estrategia'),
(11, 'Simulacion'),
(12, 'Deportes'),
(13, 'Shooter tercera persona'),
(14, 'RPG');

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
(59, 'http://localhost/backendPalomino/images/imagenJuegodeprueba3-0.jpg', 43, 1),
(61, 'http://localhost/backendPalomino/images/imagenJuegodeprueba4-0.jpg', 44, 1),
(62, 'http://localhost/backendPalomino/images/imagenJuegodeprueba4-1.jpg', 44, 1),
(76, 'http://localhost/backendPalomino/images/imagenJuegodeprueba3-2.jpg', 43, 0),
(77, 'http://localhost/backendPalomino/images/imagenJuegodeprueba3-3.jpg', 43, 0),
(78, 'http://localhost/backendPalomino/images/imagenJuegodeprueba3-4.jpg', 43, 0);

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
  `plataforma` int(11) NOT NULL,
  `numeroDeJugadores` varchar(255) NOT NULL,
  `fechaDePublicacion` date NOT NULL DEFAULT current_timestamp(),
  `imagen` varchar(255) NOT NULL,
  `nota` int(11) NOT NULL,
  `resumen` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `juego`
--

INSERT INTO `juego` (`id`, `nombre`, `fechaDeLanzamiento`, `comprar`, `edad`, `creador`, `genero`, `plataforma`, `numeroDeJugadores`, `fechaDePublicacion`, `imagen`, `nota`, `resumen`) VALUES
(42, 'Juego de prueba 2', '2021-05-15', 'https://www.google.es/', '12', 'Pedro', '3', 1, '12', '2021-05-15', '72', 10, 'dsfsdfsdfsdfsd'),
(43, 'Juego de prueba 3', '2021-05-15', 'https://www.google.es/', '12', 'Pedro', '13', 4, '12', '2021-05-15', '59', 9, 'dsfsdfsdfsdfsd'),
(44, 'Juego de prueba 4', '2021-05-15', 'https://www.google.es/', '12', 'Pedro', '13', 4, '12', '2021-05-15', '62', 6, 'dsfsdfsdfsdfsd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `likedislike`
--

CREATE TABLE `likedislike` (
  `id` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idComentario` int(11) NOT NULL,
  `opinion` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `likedislike`
--

INSERT INTO `likedislike` (`id`, `idUsuario`, `idComentario`, `opinion`) VALUES
(13, 3, 15, 'like'),
(14, 2, 15, 'like'),
(15, 7, 17, 'like'),
(16, 3, 16, 'like'),
(17, 3, 18, 'dislike');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plataforma`
--

CREATE TABLE `plataforma` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `plataforma`
--

INSERT INTO `plataforma` (`id`, `nombre`) VALUES
(1, 'PS4'),
(2, 'PS5'),
(3, 'PC'),
(4, 'Nintendo Switch'),
(5, 'XBOX ONE'),
(6, 'XBOX Series X');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte`
--

CREATE TABLE `reporte` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `idComentario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(3, 'manuelpalomino484@gmail.com', 'http://localhost/backendPalomino/images/imagenimagenUsuario-3', 'Manuel', '$2y$10$BqURjc0ycw.DShGIVD2zdeUbde8b2ChabCn3pdaGqq4/iL/eoqJwe', 'admin'),
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
-- Volcado de datos para la tabla `videos`
--

INSERT INTO `videos` (`id`, `direccion`, `idJuego`) VALUES
(9, 'https://www.youtube.com/watch?v=Z_fEKap24wU', 38),
(10, 'https://www.youtube.com/watch?v=Z_fEKap24wU', 38),
(11, 'fhgrfgh', 39),
(12, 'fhgrfgh', 39),
(13, 'fhgrfgh', 39),
(18, 'https://www.youtube.com/watch?v=Z_fEKap24wU', 44),
(19, 'https://www.youtube.com/watch?v=Z_fEKap24wU', 44),
(66, 'https://www.youtube.com/watch?v=Z_fEKap24wU', 42),
(67, 'https://www.youtube.com/watch?v=Z_fEKap24wU', 42),
(74, 'https://www.youtube.com/watch?v=Z_fEKap24wU', 43),
(75, 'https://www.youtube.com/watch?v=Z_fEKap24wU', 43);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `codigorecuperacion`
--
ALTER TABLE `codigorecuperacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
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
-- Indices de la tabla `likedislike`
--
ALTER TABLE `likedislike`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `plataforma`
--
ALTER TABLE `plataforma`
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
-- AUTO_INCREMENT de la tabla `codigorecuperacion`
--
ALTER TABLE `codigorecuperacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `comentario`
--
ALTER TABLE `comentario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `imagenes`
--
ALTER TABLE `imagenes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT de la tabla `juego`
--
ALTER TABLE `juego`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `likedislike`
--
ALTER TABLE `likedislike`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `plataforma`
--
ALTER TABLE `plataforma`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
