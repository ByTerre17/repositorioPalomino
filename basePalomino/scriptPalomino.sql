-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-06-2021 a las 21:22:41
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
(17, 'Buen juego', 'El juego está bien,tiene buena jugabilidad y buenos graficos', 9, 40, 9),
(18, 'Muchos bugs', 'Desde que empecé llevo teniendo una serie de bugs que me interfieren en el disfrute del juego', 3, 40, 9),
(19, 'Modo historia muy pobre', 'El modo historia siento que es todo el rato lo mismo y le faltan muchas cosas pero el modo multijugador está perfecto ', 7, 43, 9),
(20, 'Personajes muy poco balanceados', 'Esta saga de videojuegos me gusta mucho sobre todo la campaña de este y del brawl pero cuando entramos al modo multijugador vemos como hay personajes sin sentido y nada justos', 6, 43, 9),
(21, 'Juego muy pobre', 'El juego tiene graficos de play 2, eso lo primero luego se siente el juego muy vacio no hay casi npc que sirvan o digan algo interesante y la jugabilidad es la misma que todos los demas de la saga', 2, 60, 9),
(22, 'Gran cantidad de personajes', 'Me parece estupendo que hayan introducido todos los personajes de los otros juegos anteriores y con los dlc se añaden más de 15 personajes así cada uno puede usar el que más se parezca a su estilo de pelea', 8, 43, 9),
(23, 'Bienvenida al fontanero en la nueva generación', 'Shigeru Miyamoto se ha sacado una obra maestra para empezar con los primero juegos de esta gran consola con está gran innovación', 10, 40, 9),
(24, 'Un juego bastante divertido y original', 'Al empezar el juego no sabia nada y pensaba que era un juego normal de golf pero cuando seguí me di cuenta de que todo era muy divertido ', 8, 79, 9),
(25, 'Gran juego para jugarlo en compañia', ' Ya de por sí el modo historial es brutal ya si añadimos el modo coop es muy divertido', 7, 79, 9),
(26, 'El juego más gore y violento vuelve para darlo todo', 'Yo especialmente no soy muy fan de esta saga pero me encanta que saquen más juegos para cuando solo quiero desestresarme', 8, 97, 9),
(27, 'Gran juego', 'Me encanta este juego llevo desde que salió jugandolo en el modo multijugador', 10, 97, 9),
(28, 'El peor juego que he jugado', 'Me lo compré sabiendo que era un juego de peleas y terminé sabiendo que era un juego de los peores que he jugado', 1, 97, 9),
(30, 'Gran modo campaña', 'Yo soy una persona que no le van mucho los multijugadores así que me compré este juego solo por la campaña y me vino de perlas', 8, 101, 9),
(31, 'Juego mejor optimizado de lo que pensaba', 'Yo me compré este juego pensando que me iba a ir a pocos frames pero me sorprendí cuando iba a 60 fps perfectos', 8, 101, 9),
(32, 'Juego bonito visualmente', 'Los graficos de este juego al maximo son muy bellos me gusta mucho jugarlo mientras disfruto de ellos', 9, 101, 9),
(33, 'Me gustó mucho', 'Increíble ambientación, ojalá vengan muchos juegos de este estilo.', 8, 133, 9),
(34, 'Aburrido y asqueroso', 'Little Nightmares es un juego de miedo que no da miedo. Un juego de puzzles que son demasiado fáciles para que sean interesantes', 3, 133, 9),
(35, 'No me gustó nada', 'Un juego de plataformas que no desafía con saltos espectaculares. Un juego que ni tan siquiera tiene una historia interesante. Lo único que Little Nightmares hace decentemente es dar asco a través de su estética y lo que se pone en pantalla.', 2, 133, 9),
(36, 'Me encantó', 'The Last Of Us 2 es un videojuego inolvidable. Un monumento al trabajo bien hecho, un homenaje a los videojuegos y un digno sucesor de un universo que en 2013 se consolidó como uno de los mejores de la historia. ', 9, 141, 9),
(37, 'Maravilloso juego', 'Un título que nos embarca en un viaje emotivo, sincero, directo y que nos da una lección sobre la condición humana como ningún otro videojuego haya sido capaz. Lo hace a través de una historia conmovedora, lo hace a través de unos acabados técnicos sublim', 10, 141, 9),
(38, 'Increible', ' la identidad de un equipo creativo que se ha arriesgado con una propuesta valiente, la identidad de convertirse por méritos propios en un videojuego que quedará para la posteridad.', 8, 141, 9),
(39, 'Este juego lo tiene TODO', 'Este juego logra completamente el suspenso y terror en ciertos momentos al igual que con los momentos tranquilos y los que te dejan en shock', 9, 145, 9),
(40, 'Buen juego pero con algunos bugs', 'Aún no me lo he acabado pero lo que he jugado me ha encantado. Tiene unos buenos gráficos, es entretenido y nunca te quedarás sin nada que hacer. Lo único a comentar es que yo estaba jugando en mi PS4 slim y me salió el cartel de error en la aplicación y ', 7, 145, 9),
(41, 'Ofrece mucho, pero le falta bastante. ', 'Un mundo abierto demasiado grande y sin mapa para guiarte, no existe un tutorial que te enseñe como jugar, algunos materiales son extremadamente difíciles de conseguir, juegue durante horas y no pude crear la herramienta de reparación ', 5, 145, 9),
(42, 'Buen juego, aunque a veces me asusto', ' me dio gracia. Para mi es la entrega mas buena que ha hecho capcom durante estos 25 años del primer resident evil. Además tiene buenos gráficos que si o si los recomiendo jugar porque es como una segunda parte del resident evil 7 porque seguimos con la v', 8, 164, 9),
(45, 'Simplemente wow', 'antes que nada esto no es un juego como tal sino es como un pequeño tutorial para presentarte las carateristicas del control dualsense pero fuera de eso es un gran juego y ademas este juego es gratiuto para la ps5 va estar instalado cuando lo prendas y lo', 9, 176, 9),
(46, 'Muy divertido', 'algo corto pero merece la pena jugarlo. Te evoca toda la historia de Playstation y es un juego divertido y entretenido, aunado a unos gráficos muy vistosos', 7, 176, 9),
(47, 'Me gustó', 'Lo bueno: Sientes el poder en el control y en el juego Lo malo: si quieres historia, esta no tiene nada que explicar Lo bueno: Los niveles son largos y encontraras easter eggs de homenaje a juegos olvidados Lo malo: Tiene 4 niveles', 7, 176, 9),
(48, 'No tan bueno', 'Si bien no tiene comparación con la obra maestra que es su predecesor de la ps4, Spider Man miles morales no se queda atrás. La historia no tiene mucho que ofrecer y se queda bastante atrás', 6, 167, 9),
(49, 'Buen desarrollo de prota', 'Es interesante el desarrollo de Miles a lo largo de la historia ya que en el primer juego vimos a un spider-man experimentado y en este es un héroe con mucho camino por delante que recién inicia. ', 7, 167, 9),
(50, 'Está bien', 'Mi experiencia con este juego a sido muy buena, la historia muy corta o con partes demasiado repetitivas pero fuera de eso los combates y los gráficos están muy bonitos ha tenido algunos bugs, las misiones secundarias un poco aburridas, este juego es más ', 6, 167, 9),
(51, 'Grandioso', 'Es muy entretenido, muchas misiones, muchos lugares que explorar. Armas y armaduras para fabricar, mejorar y encantar, comidas y pociones que elaborar. ', 8, 162, 9),
(52, 'Un juego muy rejugable', 'Puedes crear a tu personaje, puedes ser un nórdico, un imperial, un bretón, un guardia rojo, un alto elfo, un elfo oscuro, un  khajiit, un argoniano o un orco. Puedes ser un Feroz Guerrero, un Poderoso Mago o un Habilidoso Ladrón, aunque también puedes se', 8, 162, 9),
(53, 'Me encanta', 'Este juego es mi favorito y de muchas personas me encanta su variedad de armamento su historia sus hechizos los personajes y la jugabilidad ya que mientras que alguien sube de nivel el nivel de dificultad también me gusta los detalles en general TODO ', 10, 162, 9),
(54, 'El mejor juego de puzzles', 'De los mejores juegos de puzzles que puedes jugar, tiene una banda sonora tremenda, contiene unos easter eggs muy interesantes que hacen mucho mas interesante la historia (mucho mas de lo que es ya) la ambientacion es increible con muchisimos lugares que ', 10, 152, 9),
(55, 'El mejor juego que he jugado', 'Uno de los mejores juegos que he jugado en mi vida,100 porciento recomendado, La verdad solo veo opiniones recientes de personas que acaban de descubrir el juego,Pero los que lo conocimos en su lanzamiento, y lo terminábamos miles de veces sólo para escuc', 10, 152, 9),
(56, 'Mejor juego de la historia', 'Portal 2, De los mejores Videojuegos de toda la historia, Puzzles muy sencillos y otros muy complicados,Pasartelo sin una guia es una hazaña,Una historia totalmente memorable,Un juego que mantiene un muy buen sentido del humor y es serio en los momentos a', 10, 152, 9),
(57, 'Muy buena segunda parte', 'BUENISIMO JUEGO los bugs que tienen dijo no son chidos pero la jugabilidad y la cantidad de cosas que hacer es super grande y divertida ademas de que sabemos mas del personaje osea lo conocemos mas que en el subnautica normal lo cual es super bueno se mer', 8, 186, 9),
(58, 'Buen juego de supervivencia', 'muy buen juego y eso que no esta completo 10/10 mejor para los que le gusta los juegos de superveniencia', 7, 186, 9),
(59, 'Gran juegazo', 'juegazo por que no solo tiene buenos graficos sino paisajes maravillosos y la historia del juego es muy bueno', 7, 186, 9),
(61, 'Vale la pena pero con algunos bugs', 'Vale la pena tenerlo. 36 horas descargandolo, pero al final lo estoy disfrutando, graficos espectaculares, aun le falta en cuanto la avionica, algunos aviones le das un mando y hacen otra cosa, organizar las camaras a nuestro gusto es un enredo, hay cosas', 7, 148, 9),
(62, 'Merece la pena', 'Ha merecido la pena esperar tanto tiempo para que por fin tengamos el simulador que aprovecha las nuevas tecnologías. Es un simulador que te deja sin palabras. Sólo tienes que probarlo.', 9, 148, 9),
(63, 'Faltan cosas', 'Este simulador de vuelo es muy reciente, aún tiene que desarrollar más lo que vendrían siendo las físicas de vuelo ya que he visto vídeos en YouTube que cuando aterriza el avión frena como loco (podrías aterrizar un Boeing 747 en San Bartolomé sin problem', 8, 148, 9),
(64, 'Buena segunda entrega', 'En este videojuego estamos hablando de la segunda entrega de la serie Ori, que después de una sorprendente primera entrega con Ori and the Blind Forest, esta secuela se presenta como una continuación de nuestra primera experiencia con Ori pero mejorando e', 8, 181, 9),
(65, 'Obra de arte', 'En este videojuego estamos hablando de la segunda entrega de la serie Ori, que después de una sorprendente primera entrega con Ori and the Blind Forest, esta secuela se presenta como una continuación de nuestra primera experiencia con Ori pero mejorando e', 10, 181, 9),
(66, 'Altamente recomendado.', 'Sobre todo para aquellas personas que gusta de romperse la cabeza buscando objetos y habilidades a lo largo del mapa pues te mantiene entretenido durante horas superando obstáculos y conseguiendo \"esferas de luz\" para mejorar a Ori.', 8, 181, 9),
(67, 'Lo mismo de siempre', 'Como todos los fighting games está hecho para un mando diferente al que viene en la consola, pues el analógico genera gran cantidad de miss input y la cruceta no está preparada para la actividad que requieren los ataques y la defensa.', 2, 190, 9),
(68, 'Muy bueno pero faltan cosas', 'El mejor juego de dragón ball después del budokai 3. Online exelente y buen combate al estilo Street fighter. Sin embargo el modo historia apesta.', 6, 190, 9),
(69, 'Increible', 'Tengo que decir que el juego está MUY bien hecho además está muy relacionado con lo visto en el anime,excelentes animaciones,ataques,finales,etc y aunque el modo historia no es el mejor :v,el juego está excelente y aunque cuesta demasiado (al menos para m', 9, 190, 9),
(70, 'Genial', 'El mejor juego de Halo qué he jugado, la campaña es genial, y a veces hasta llego a pensar qué las misiones del Halo 3 son muy tediosas o aburridas', 9, 192, 9),
(71, 'Buen inicio', 'halo reach supuso para mi mi inicio en la saga halo y a pesar de que lo jugue hace poco los graficos son muy buenos reflejan el estilo de derrota y desesperacion los, los diseños son realmente sucios y me refiero a que parecen viejos', 7, 192, 9),
(72, 'El mejor halo', 'Es un juegazo, uno puede repetir la campaña tantas veces que uno quiera y aun así no te aburrirás, el modo tiroteo es un modo genial en el que puedes ver lo pro que eres, el multijugador es el mejor de todos los halos', 10, 192, 9),
(73, 'Util y bueno', 'Esta saga no me deja de Sorprender.Ubisoft lo conocere por Rabbids y esta franquicia de Just Dance.Sin duda otro juegazo para los quieren ejercitarse', 8, 195, 9),
(74, 'Increible', 'Just dance es el mejor juego del mundo, bailar con tus canciones fav que te mueve hasta lo que no tienes, simplemente hermoso', 9, 195, 9),
(75, 'Problema detección de movimiento', 'Muy guay, lo he jugado en nintendo switch y solo hay el problema de que no siempre detecta los movimientos, recomiendo jugar en consolas en las que se use la camara como la Xbox One con la Kinect', 7, 195, 9),
(76, 'Interesante', 'Hay muchísimas versiones de Tetris y definitivamente por el momento esta es la mejor, en calidad grafica es maravilloso y alucinante, respecto a esto al iniciar el juego es muy enfático en advertir que no debe ser jugado por personas sensibles a las luces', 7, 218, 9),
(77, 'Me encantó', ' cada escena tiene un tema tanto visual como musical propio, nada repetitivo, y de este apartado hay mucha variedad, no es el Tetris repetitivo de siempre (el cuál asi también es adictivo) pero aquí se añade modo aventura', 8, 218, 9),
(78, 'Buena introducción del tipico tetris a las grandes consolas', 'Excelente versión modernizada de Tetris. Espectaculares gráficos y concepto del juego mezclado con la música.', 7, 218, 9),
(79, 'Está cool', 'El juego me gusta mucho, lo gráficos son muy buenos los estadios muy originales las animaciones muy buenas.', 8, 226, 9),
(80, 'Movimiento de la pelota un poco raro', 'Algo que a veces me molesta son las físicas del juego por que por ejemplo hay veces que una pelota agarra tanto efecto que se mete en la portería como si se tratara de arte de magía.', 5, 226, 9),
(81, 'Merece la pena', 'Para mí realmente es un juego que vale la pena jugar, es Free To Play gracias a Epic. Aunque yo lo compre años atrás, tiene muchas modalidades', 7, 226, 9),
(82, 'Me encantó', 'El mejor juego de baloncesto de todos los tiempos, que ganas de jugar con Zion y los Pelicans ', 9, 228, 9),
(83, 'Muy repetitivo', 'Me compré este nba para saber si tendria algo diferente a los demas porque lo pintaban muy bien, me llevé una desilusión', 3, 228, 9),
(84, 'Graficos de play 3', 'Para ser un juego de nueva generación tiene unos graficos y jugabiliadad de 2006, inaceptable ', 1, 228, 9),
(85, 'Esto ni es resident evil ni nada', 'La historia es para pegarte dos tiros. Lo único que haces en el juego es camino y disparar.los puzzles brillan por su ausencia. Los diálogos pocos,pobres y sin sentido este resident es de los peores mano a mano con el 6.', 3, 164, 9),
(86, 'buen juego', 'lo disfruté bastante , gráficos excelentes en PS5 con una pantalla 8k se ve hermoso , la historia está bien , muy alejado de como eran los R.E originales pero se disfruta bastante , eh acabado absolutamente todos los juegos de la saga y fue un honor habla', 7, 164, 9),
(88, 'Lo mejor', 'La mejor y más realista simulación espacial que he jugado. Libertad absoluta, gran galaxia, gran variedad de misiones, desafío realista y no solo un tirador espacial pewpew, multijugador pvp y pve. Este juego lo tiene todo. Hasta ahora no he encontrado ni', 9, 194, 3);

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
(2, 'Aventura'),
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
(57, 'http://localhost/backendPalomino/images/imagenSuperMarioOdyssey-0.jpg', 40, 0),
(58, 'http://localhost/backendPalomino/images/imagenSuperMarioOdyssey-1.jpg', 40, 1),
(61, 'http://localhost/backendPalomino/images/imagenSuperSmashBros.Ultimate.-0.jpg', 43, 0),
(62, 'http://localhost/backendPalomino/images/imagenSuperSmashBros.Ultimate.-1.jpg', 43, 1),
(63, 'http://localhost/backendPalomino/images/imagenDoometernal-0.jpg', 53, 0),
(65, 'http://localhost/backendPalomino/images/imagenSkiesofFuryDX-0.jpg', 54, 0),
(67, 'http://localhost/backendPalomino/images/imagensupermarioparty-0.jpg', 55, 0),
(68, 'http://localhost/backendPalomino/images/imagensupermarioparty-1.jpg', 55, 0),
(69, 'http://localhost/backendPalomino/images/imagensupermarioparty-2.jpg', 55, 1),
(73, 'http://localhost/backendPalomino/images/imagenSnipperclips-Cutitout,together!-0.jpg', 57, 0),
(75, 'http://localhost/backendPalomino/images/imagenSnipperclips-Cutitout,together!-1.jpg', 57, 0),
(83, 'http://localhost/backendPalomino/images/imagenCrashTeamRacingNitro-Fueled-0.jpg', 59, 0),
(84, 'http://localhost/backendPalomino/images/imagenCrashTeamRacingNitro-Fueled-1.jpg', 59, 0),
(85, 'http://localhost/backendPalomino/images/imagenHarvestMoonOneWorld-0.jpg', 60, 1),
(86, 'http://localhost/backendPalomino/images/imagenDoNotFeedtheMonkeys-0.jpg', 61, 0),
(87, 'http://localhost/backendPalomino/images/imagenDoNotFeedtheMonkeys-1.jpg', 61, 1),
(89, 'http://localhost/backendPalomino/images/imagenHaven-0.jpg', 42, 0),
(102, 'http://localhost/backendPalomino/images/imagenWarframe-0.jpg', 85, 1),
(104, 'http://localhost/backendPalomino/images/imagenNowhereProphet-0.jpg', 91, 0),
(105, 'http://localhost/backendPalomino/images/imagenNowhereProphet-1.jpg', 91, 1),
(108, 'http://localhost/backendPalomino/images/imagenKingdomHeartsIII-0.jpg', 92, 0),
(109, 'http://localhost/backendPalomino/images/imagenKingdomHeartsIII-1.jpg', 92, 0),
(110, 'http://localhost/backendPalomino/images/imagenKingdomHeartsIII-2.jpg', 92, 0),
(111, 'http://localhost/backendPalomino/images/imagenKingdomHeartsIII-3.jpg', 92, 1),
(112, 'http://localhost/backendPalomino/images/imagenGhostrunner-0.jpg', 94, 0),
(118, 'http://localhost/backendPalomino/images/imagenMortalkombat11-0.jpg', 97, 0),
(119, 'http://localhost/backendPalomino/images/imagenMortalkombat11-1.jpg', 97, 1),
(152, 'http://localhost/backendPalomino/images/imagenAceCombat7:SkiesUnknown-0.jpg', 116, 0),
(153, 'http://localhost/backendPalomino/images/imagenAceCombat7:SkiesUnknown-1.jpg', 116, 1),
(179, 'http://localhost/backendPalomino/images/imagengangbeast-0.jpg', 129, 0),
(182, 'http://localhost/backendPalomino/images/imagengangbeast-1.jpg', 129, 1),
(185, 'http://localhost/backendPalomino/images/imagenCallofDutyBlackOpsColdWar-0.jpg', 101, 0),
(186, 'http://localhost/backendPalomino/images/imagenCallofDutyBlackOpsColdWar-1.jpg', 101, 0),
(189, 'http://localhost/backendPalomino/images/imagenLittleNightmares-0.jpg', 133, 0),
(190, 'http://localhost/backendPalomino/images/imagenLittleNightmares-1.png', 133, 1),
(192, 'http://localhost/backendPalomino/images/imagenF12020-0.jpg', 134, 0),
(193, 'http://localhost/backendPalomino/images/imagenF12020-1.jpg', 134, 1),
(196, 'http://localhost/backendPalomino/images/imagenFarmingSimulator19-0.png', 136, 0),
(197, 'http://localhost/backendPalomino/images/imagenFarmingSimulator19-1.jpg', 136, 1),
(200, 'http://localhost/backendPalomino/images/imagenCitiesSkylines-0.jpg', 139, 0),
(201, 'http://localhost/backendPalomino/images/imagenCitiesSkylines-1.jpg', 139, 1),
(202, 'http://localhost/backendPalomino/images/imagenfifa21-0.jpg', 140, 0),
(203, 'http://localhost/backendPalomino/images/imagenfifa21-1.jpg', 140, 1),
(204, 'http://localhost/backendPalomino/images/imagenTheLastofUsParteII-0.jpg', 141, 0),
(205, 'http://localhost/backendPalomino/images/imagenTheLastofUsParteII-1.jpg', 141, 1),
(208, 'http://localhost/backendPalomino/images/imagenDisgaea4Complete+-0.jpg', 143, 0),
(209, 'http://localhost/backendPalomino/images/imagenDisgaea4Complete+-1.jpg', 143, 1),
(210, 'http://localhost/backendPalomino/images/imagenStrandedDeep-0.jpg', 144, 0),
(211, 'http://localhost/backendPalomino/images/imagenStrandedDeep-1.jpg', 144, 1),
(212, 'http://localhost/backendPalomino/images/imagenSubnautica-0.jpg', 145, 0),
(213, 'http://localhost/backendPalomino/images/imagenSubnautica-1.jpg', 145, 1),
(215, 'http://localhost/backendPalomino/images/imagenBrawlhalla-1.jpg', 146, 1),
(216, 'http://localhost/backendPalomino/images/imagenTomClancy\'sRainbowSixSiege-0.jpg', 147, 0),
(217, 'http://localhost/backendPalomino/images/imagenTomClancy\'sRainbowSixSiege-1.jpg', 147, 1),
(218, 'http://localhost/backendPalomino/images/imagenMicrosoftFlightSimulator-0.jpg', 148, 0),
(219, 'http://localhost/backendPalomino/images/imagenMicrosoftFlightSimulator-1.jpg', 148, 1),
(220, 'http://localhost/backendPalomino/images/imagenMoveorDie-0.jpg', 149, 0),
(221, 'http://localhost/backendPalomino/images/imagenMoveorDie-1.jpg', 149, 1),
(222, 'http://localhost/backendPalomino/images/imagenPortal2-0.jpg', 152, 0),
(223, 'http://localhost/backendPalomino/images/imagenPortal2-1.jpg', 152, 1),
(225, 'http://localhost/backendPalomino/images/imagenForzaHorizon4-0.jpg', 153, 0),
(226, 'http://localhost/backendPalomino/images/imagenForzaHorizon4-1.jpg', 153, 1),
(230, 'http://localhost/backendPalomino/images/imagenStarCraftIIWingsofLiberty-0.jpg', 157, 0),
(231, 'http://localhost/backendPalomino/images/imagenStarCraftIIWingsofLiberty-1.jpg', 157, 1),
(232, 'http://localhost/backendPalomino/images/imagenEuroTruckSimulator2-0.jpg', 158, 0),
(233, 'http://localhost/backendPalomino/images/imagenEuroTruckSimulator2-1.jpg', 158, 1),
(234, 'http://localhost/backendPalomino/images/imagenGolfIt!-0.jpg', 159, 0),
(235, 'http://localhost/backendPalomino/images/imagenGolfIt!-1.jpg', 159, 1),
(236, 'http://localhost/backendPalomino/images/imagenFortniteBattleRoyale-0.jpg', 160, 0),
(238, 'http://localhost/backendPalomino/images/imagenTheElderScrollsVSkyrim-0.jpg', 162, 0),
(239, 'http://localhost/backendPalomino/images/imagenTheElderScrollsVSkyrim-1.jpg', 162, 1),
(240, 'http://localhost/backendPalomino/images/imagenResidentEvil8Village-0.jpg', 164, 0),
(241, 'http://localhost/backendPalomino/images/imagenResidentEvil8Village-1.jpg', 164, 1),
(242, 'http://localhost/backendPalomino/images/imagenSpider-ManMilesMorales-0.jpg', 167, 0),
(243, 'http://localhost/backendPalomino/images/imagenSpider-ManMilesMorales-1.jpg', 167, 1),
(244, 'http://localhost/backendPalomino/images/imagenSpider-ManMilesMorales-0.jpg', 167, 0),
(245, 'http://localhost/backendPalomino/images/imagenSpider-ManMilesMorales-1.jpg', 167, 1),
(246, 'http://localhost/backendPalomino/images/imagenSpider-ManMilesMorales-0.jpg', 167, 0),
(247, 'http://localhost/backendPalomino/images/imagenSpider-ManMilesMorales-1.jpg', 167, 1),
(248, 'http://localhost/backendPalomino/images/imagenSpider-ManMilesMorales-0.jpg', 167, 0),
(249, 'http://localhost/backendPalomino/images/imagenSpider-ManMilesMorales-1.jpg', 167, 1),
(250, 'http://localhost/backendPalomino/images/imagenWHATTHEGOLF-0.jpg', 79, 0),
(251, 'http://localhost/backendPalomino/images/imagenWHATTHEGOLF-1.png', 79, 0),
(252, 'http://localhost/backendPalomino/images/imagenSpider-ManMilesMorales-0.jpg', 167, 0),
(253, 'http://localhost/backendPalomino/images/imagenSpider-ManMilesMorales-1.jpg', 167, 1),
(254, 'http://localhost/backendPalomino/images/imagenCallofDutyWarzone-0.jpg', 172, 0),
(255, 'http://localhost/backendPalomino/images/imagenCallofDutyWarzone-0.jpg', 172, 0),
(256, 'http://localhost/backendPalomino/images/imagenCallofDutyWarzone-1.jpg', 172, 1),
(257, 'http://localhost/backendPalomino/images/imagenCallofDutyWarzone-0.jpg', 172, 0),
(258, 'http://localhost/backendPalomino/images/imagenCallofDutyWarzone-1.jpg', 172, 1),
(259, 'http://localhost/backendPalomino/images/imagenDeliverUsTheMoon-0.jpg', 175, 0),
(260, 'http://localhost/backendPalomino/images/imagenDeliverUsTheMoon-1.jpg', 175, 1),
(261, 'http://localhost/backendPalomino/images/imagenASTRO\'sPLAYROOM-0.jpg', 176, 0),
(262, 'http://localhost/backendPalomino/images/imagenASTRO\'sPLAYROOM-1.jpg', 176, 1),
(263, 'http://localhost/backendPalomino/images/imagenMaquette-0.jpg', 177, 0),
(264, 'http://localhost/backendPalomino/images/imagenMaquette-1.jpg', 177, 1),
(265, 'http://localhost/backendPalomino/images/imagenDestructionAllStars-0.jpg', 178, 0),
(266, 'http://localhost/backendPalomino/images/imagenDestructionAllStars-1.jpg', 178, 1),
(269, 'http://localhost/backendPalomino/images/imagenDarksidersGenesis-0.jpg', 180, 0),
(270, 'http://localhost/backendPalomino/images/imagenDarksidersGenesis-1.jpg', 180, 1),
(271, 'http://localhost/backendPalomino/images/imagenOriandtheWilloftheWisps-0.jpg', 181, 0),
(272, 'http://localhost/backendPalomino/images/imagenOriandtheWilloftheWisps-1.jpg', 181, 1),
(273, 'http://localhost/backendPalomino/images/imagenWormsRumble-0.jpg', 182, 0),
(274, 'http://localhost/backendPalomino/images/imagenWormsRumble-1.jpg', 182, 1),
(277, 'http://localhost/backendPalomino/images/imagenSubnauticaBelowZero-0.jpg', 186, 0),
(278, 'http://localhost/backendPalomino/images/imagenSubnauticaBelowZero-1.jpg', 186, 1),
(279, 'http://localhost/backendPalomino/images/imagenMLBTheShow21-0.jpg', 187, 0),
(280, 'http://localhost/backendPalomino/images/imagenMLBTheShow21-0.jpg', 187, 0),
(281, 'http://localhost/backendPalomino/images/imagenMLBTheShow21-1.jpg', 187, 1),
(282, 'http://localhost/backendPalomino/images/imagenRemnantFromTheAshes-0.jpg', 189, 0),
(283, 'http://localhost/backendPalomino/images/imagenRemnantFromTheAshes-1.jpg', 189, 1),
(287, 'http://localhost/backendPalomino/images/imagenHaloReach-0.jpg', 192, 0),
(288, 'http://localhost/backendPalomino/images/imagenHaloReach-1.jpg', 192, 1),
(289, 'http://localhost/backendPalomino/images/imagenDragonBallFighterZ-0.jpg', 190, 0),
(290, 'http://localhost/backendPalomino/images/imagenDragonBallFighterZ-1.jpg', 190, 0),
(291, 'http://localhost/backendPalomino/images/imagenDragonBallFighterZ-2.jpg', 190, 1),
(294, 'http://localhost/backendPalomino/images/imagenEliteDangerous-0.jpg', 194, 0),
(295, 'http://localhost/backendPalomino/images/imagenEliteDangerous-1.jpg', 194, 0),
(296, 'http://localhost/backendPalomino/images/imagenJustDance2019-0.jpg', 195, 0),
(297, 'http://localhost/backendPalomino/images/imagenJustDance2019-1.jpg', 195, 1),
(298, 'http://localhost/backendPalomino/images/imagenInside-0.jpg', 196, 0),
(299, 'http://localhost/backendPalomino/images/imagenInside-1.jpg', 196, 1),
(300, 'http://localhost/backendPalomino/images/imagenNeedforSpeedHotPursuitRemastered-0.jpg', 197, 0),
(301, 'http://localhost/backendPalomino/images/imagenNeedforSpeedHotPursuitRemastered-1.jpg', 197, 1),
(302, 'http://localhost/backendPalomino/images/imagenHaloWarsDefinitiveEdition-0.jpg', 198, 0),
(303, 'http://localhost/backendPalomino/images/imagenHaloWarsDefinitiveEdition-1.jpg', 198, 1),
(304, 'http://localhost/backendPalomino/images/imagenTheEscapists-0.jpg', 199, 0),
(305, 'http://localhost/backendPalomino/images/imagenTheEscapists-1.jpg', 199, 1),
(306, 'http://localhost/backendPalomino/images/imagenMaddenNFL21-0.jpg', 200, 0),
(307, 'http://localhost/backendPalomino/images/imagenMaddenNFL21-1.jpg', 200, 1),
(308, 'http://localhost/backendPalomino/images/imagenGearsofWar5-0.jpg', 201, 0),
(309, 'http://localhost/backendPalomino/images/imagenGearsofWar5-1.jpg', 201, 1),
(310, 'http://localhost/backendPalomino/images/imagenSekiroShadowsDieTwice-0.jpg', 202, 0),
(311, 'http://localhost/backendPalomino/images/imagenSekiroShadowsDieTwice-1.jpg', 202, 1),
(312, 'http://localhost/backendPalomino/images/imagenSekiroShadowsDieTwice-0.jpg', 202, 0),
(313, 'http://localhost/backendPalomino/images/imagenSekiroShadowsDieTwice-1.jpg', 202, 1),
(314, 'http://localhost/backendPalomino/images/imagenSekiroShadowsDieTwice-0.jpg', 202, 0),
(315, 'http://localhost/backendPalomino/images/imagenSekiroShadowsDieTwice-1.jpg', 202, 1),
(316, 'http://localhost/backendPalomino/images/imagenTalesofArise-0.jpg', 206, 0),
(317, 'http://localhost/backendPalomino/images/imagenTalesofArise-1.jpg', 206, 1),
(318, 'http://localhost/backendPalomino/images/imagenTalesofArise-0.jpg', 206, 0),
(319, 'http://localhost/backendPalomino/images/imagenTalesofArise-1.jpg', 206, 1),
(320, 'http://localhost/backendPalomino/images/imagenStonefly-0.jpg', 208, 0),
(321, 'http://localhost/backendPalomino/images/imagenStonefly-1.jpg', 208, 1),
(322, 'http://localhost/backendPalomino/images/imagenJUMPForce-0.jpg', 209, 0),
(323, 'http://localhost/backendPalomino/images/imagenJUMPForce-1.jpg', 209, 1),
(324, 'http://localhost/backendPalomino/images/imagenNecromundaHiredGun-0.jpg', 210, 0),
(325, 'http://localhost/backendPalomino/images/imagenNecromundaHiredGun-1.jpg', 210, 1),
(326, 'http://localhost/backendPalomino/images/imagenPuyoPuyoTetris2-0.jpg', 213, 0),
(327, 'http://localhost/backendPalomino/images/imagenPuyoPuyoTetris2-1.jpg', 213, 1),
(328, 'http://localhost/backendPalomino/images/imagenTetrisEffect:Connected-0.jpg', 214, 0),
(329, 'http://localhost/backendPalomino/images/imagenTetrisEffect:Connected-0.jpg', 214, 0),
(332, 'http://localhost/backendPalomino/images/imagenTetrisEffectConnected-0.jpg', 218, 0),
(333, 'http://localhost/backendPalomino/images/imagenTetrisEffectConnected-0.jpg', 218, 0),
(334, 'http://localhost/backendPalomino/images/imagenTetrisEffectConnected-0.jpg', 218, 0),
(335, 'http://localhost/backendPalomino/images/imagenTetrisEffectConnected-0.jpg', 218, 0),
(336, 'http://localhost/backendPalomino/images/imagenTetrisEffectConnected-1.jpg', 218, 1),
(337, 'http://localhost/backendPalomino/images/imagenMotoGP21-0.jpg', 222, 0),
(338, 'http://localhost/backendPalomino/images/imagenMotoGP21-1.jpg', 222, 1),
(343, 'http://localhost/backendPalomino/images/imagenRocketLeague-0.jpg', 226, 0),
(344, 'http://localhost/backendPalomino/images/imagenRocketLeague-1.jpg', 226, 1),
(345, 'http://localhost/backendPalomino/images/imagenFightsinTightSpaces-0.jpg', 227, 0),
(346, 'http://localhost/backendPalomino/images/imagenFightsinTightSpaces-1.jpg', 227, 1),
(347, 'http://localhost/backendPalomino/images/imagenNBA2K21-0.jpg', 228, 0),
(348, 'http://localhost/backendPalomino/images/imagenNBA2K21-1.jpg', 228, 1),
(349, 'http://localhost/backendPalomino/images/imagenSpacelords-0.jpg', 229, 0),
(350, 'http://localhost/backendPalomino/images/imagenSpacelords-1.jpg', 229, 1),
(351, 'http://localhost/backendPalomino/images/imagenYakuzaLikeaDragon-0.jpg', 230, 0),
(352, 'http://localhost/backendPalomino/images/imagenYakuzaLikeaDragon-1.jpg', 230, 1),
(354, 'http://localhost/backendPalomino/images/imagenHarvestMoonOneWorld-2.jpg', 60, 0),
(355, 'http://localhost/backendPalomino/images/imagenHaven-2.jpg', 42, 0),
(356, 'http://localhost/backendPalomino/images/imagenDoometernal-2.jpg', 53, 0),
(357, 'http://localhost/backendPalomino/images/imagenSkiesofFuryDX-2.jpg', 54, 0),
(358, 'http://localhost/backendPalomino/images/imagenGhostrunner-2.jpg', 94, 0);

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
  `genero` int(11) NOT NULL,
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
(40, 'Super Mario Odyssey', '2017-07-27', 'https://www.amazon.es/Nintendo-Super-Mario-Odyssey/dp/B01MZ973SY/ref=sr_1_1?camp=2025&creative=165953&creativeASIN=B01MY7GHKJ&dchild=1&keywords=Super+Mario+Odyssey+-+Nintendo+Switch&linkCode=gs3&qid=1620758805&sr=8-1', '10', 'Nintendo', 1, 4, '2', '2021-05-11', '58', 10, ' La princesa Peach ha vuelto a desaparecer - enfráscate en todo tipo de aventuras para rescatar a Peach de las garras de Bowser Usa a Cappy, la gorra de Mario, para poder enfrentarte a tus enemigos, descubre nuevos movimientos, con los que podrás tomar el control de todo tipo de cosas como objetos y enemigos Descubre el modo de juego cooperativo para 2 jugadores, usando cada uno un Joy-Con; de esta forma un jugador controlará a Mario y otro a Cappy '),
(42, 'Haven', '2021-02-04', 'https://www.nintendo.es/Juegos/Programas-descargables-Nintendo-Switch/Haven-1719432.html', '16', 'The Game Bakers', 2, 4, '2', '2021-05-12', '89', 6, 'Yu y Kay se han refugiado en un planeta olvidado, dejando atrás todo lo que conocían. Ponte en la piel de los dos amantes mientras intentan rehacer sus vidas en un mundo desconocido.  Explora el planeta en busca de materiales para reparar la nave y transformarla en un cálido hogar. Disfruta de momentos cotidianos en pareja para llegar al día siguiente: cocina, fabrica, recoge suministros... Lucha contra quienes desean separarlos y sincroniza bien las acciones. Solo si los dos personajes siguen el ritmo y logran coordinarse en perfecta sintonía podrás proteger su relación.'),
(43, 'Super Smash Bros. Ultimate.', '2018-12-07', 'https://www.nintendo.es/Juegos/Nintendo-Switch/Super-Smash-Bros-Ultimate-1395713.html', '12', 'Nintendo', 3, 4, '8', '2021-05-12', '62', 9, '     Nuevos luchadores, como los inkling de la serie Splatoon, Ridley de la serie Metroid, Simon Belmont de Castlevania y Canela de Animal Crossing, hacen su debut en Super Smash Bros. junto a todos los personajes de las entregas anteriores     Un combate más ágil, nuevos objetos, nuevos ataques, nuevas opciones defensivas, técnicas y otras muchas sorpresas mantendrán la batalla al rojo vivo cuando y donde quieras     En el modo Combate normal, podrás elegir el escenario y las reglas para darte de tortas con hasta 8 jugadores. También puedes crear un equipo de 3 o 5 luchadores y enfrentarte al de tu rival en combates sucesivos de uno contra uno en Tropa Smash     Elige el tema que más te guste para que suene mientras combates en uno de los escenarios. Hay más de 800 escenarios disponibles'),
(53, 'Doom eternal', '2020-12-08', 'https://www.amazon.com/dp/B08PP9H2HF%3FSubscriptionId%3DAKIAJHSMUOWEQCQ7QDAQ%26tag%3Dmetacritic-games-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB08PP9H2HF', '17', 'bethesda', 4, 4, '1', '2021-05-12', '63', 8, 'Doom Eternal es un videojuego de acción y disparos en primera persona desarrollado por id Software y publicado por Bethesda Softworks.​ Es el quinto título principal de la serie Doom y la secuela directa del juego estrenado en 2016.​ '),
(54, ' Skies of Fury DX', '2018-04-12', 'https://www.nintendo.es/Juegos/Programas-descargables-Nintendo-Switch/Skies-of-Fury-DX-1362878.html', '10', 'Illumination Games', 5, 4, '4', '2021-05-12', '65', 6, 'Suba a los cielos y tenga la experiencia de ser un piloto de combate en la Primera Guerra Mundial! “Skies of Fury DX” ofrece a los jugadores, la oportunidad de entablar en combates aéreos épicos en el histórico Abril Sangriento de 1917, como pilotos Británicos y Alemanes.  Usando 10 aviones distintivos de la Primera Guerra Mundial, los jugadores vuelan a través de ambientes maravillosos que fueron pintados manualmente. Combate en el aire como un jugador solo, o desafía a tus amigos a una batalla de multijugadores en pantallas divididas. '),
(55, 'super  mario party', '2018-10-05', 'https://www.amazon.es/Super-Mario-Party-Nintendo-Switch/dp/B07DPR5PFX/ref=sxin_6?__mk_es_ES=%C3%85M%C3%85%C5%BD%C3%95%C3%91&asc_contentid=amzn1.osa.626bec74-b013-4b5d-b7dd-c6064c1cf0fe.A1RKKUPIHCS9HS.es_ES&asc_contenttype=article&ascsubtag=amzn1.osa.626be', '5', 'Nintendo', 6, 4, '4', '2021-05-12', '69', 7, 'Super Mario Party es la nueva entrega para Nintendo Switch de la famosa saga de minijuegos y títulos party de Nintendo, Mario Party. El juego presenta en una estructura de tablero una gran cantidad de pequeños retos y pruebas, que en esta ocasión, pueden ser disfrutados por hasta cuatro jugadores en cualquier lugar gracias a la portabilidad de Switch.'),
(57, 'Snipperclips - Cut it out, together! ', '2017-03-03', 'https://www.nintendo.es/Juegos/Programas-descargables-Nintendo-Switch/Snipperclips-A-recortar-en-companiia--1173331.html', '5', 'Nintendo', 7, 4, '2', '2021-05-12', '73', 8, '  Te presentamos a Snip y Clip, dos amigos de papel a los que les encanta resolver puzles.  Snip y Clip siempre están listos para resolver problemas de papel, tanto si requieren rellenar una forma, hacer un mate de baloncesto o ayudar a un hámster.Snipperclips – ¡A recortar en compañía! para Nintendo Switch es un juego de acción y puzles en el que hay que comunicarse, cooperar y recortar. Disfruta de los puzles para dos jugadores en los que el trabajo en equipo es la clave, en cualquier momento y lugar con quien tú quieras. Coge un Joy-Con y pásale el otro a un amigo para jugar en la televisión o en el modo sobremesa. ¡Demuestra de qué pasta estás hecho!'),
(59, ' Crash Team Racing Nitro-Fueled', '2019-06-20', 'https://www.amazon.es/Giochi-Console-Activision-Crash-Racing/dp/B07L67B8W6/ref=sr_1_2?camp=2025&creative=165953&creativeASIN=B07N9J79SY&dchild=1&keywords=Crash+Team+Racing+Nintendo+Switch+-+Nintendo+Switch&linkCode=gs3&qid=1620833470&sr=8-2', '10', 'Activision Blizzard Int\'l BV', 9, 4, '8', '2021-05-12', '84', 8, ' ¡Crash™ vuelve al volante! Prepárate para desmelenarte con la auténtica experiencia de CTR y mucho más contenido remasterizado a tope de revoluciones!   - Calienta motores con los modos de juego, personajes, circuitos, potenciadores, armas y controles originales - Superderrapa hacia la gloria con karts, arenas y circuitos adicionales de Crash™ Nitro Kart - Compite online con tus amigos y arrasa con la competencia en los marcadores - Personaliza tu vehículo y tu personaje con objetos para karts y aspectos de locura   En Crash™ Team Racing Nitro-Fueled, el riesgo es elevado y los rivales muy duros. Es el CTR de siempre, pero a toda marcha.'),
(60, ' Harvest Moon One World ', '2021-03-02', 'https://www.amazon.es/Nintendo-Harvest-Moon-One-World/dp/B08TDGDYS6/ref=pd_sbs_1?pd_rd_w=pvrPm&pf_rd_p=6eb2cd39-d32d-407f-8571-ed2eaa41402a&pf_rd_r=BSF5FHYN5GGFE9T8F6DE&pd_rd_r=5f22ac1f-04ac-4e8f-8ce3-8386e42340b1&pd_rd_wg=AoBhd&pd_rd_i=B08TDGDYS6&psc=1', '10', 'rising star games', 10, 4, '1', '2021-05-12', '85', 5, '     Coge la azada y sumérgete en la vida agrícola mientras recoges la cosecha y cuidas de los animales en tu humilde granja. ¡Consigue dinero al vender tus productos y convierte tu hogar en una auténtica hacienda!     ¡Te aguarda una gran aventura! Viajarás por cinco regiones conectadas, cada una con su propio clima, flora y fauna.     ¡Puedes recoger la granja y llevártela dónde quieras! La gente de cada región ha adaptado sus técnicas agrícolas para sobrevivir en el clima de su zona. Para prosperar en tu nuevo hogar, deberás aprender de los lugareños, ya sea para mantener los pastos en buenas condiciones, cultivar arroz, cuidar de renos ¡y mucho más!     Las patatas son el único cultivo que queda en este mundo antaño tan fértil. Para conseguir nuevas semillas, necesitarás la ayuda de los espíritus de la cosecha, aunque no es fácil encontrarlos… Además, las semillas pueden crecer de maneras diferentes según dónde las plantes, lo que puede desembocar en nuevos cultivos.     En tu aventura conocerás y ayudarás a un amplio elenco de personajes interesantes. Forja nuevas amistades y participa en los festivales locales a medida que te integras en la comunidad. Y no solo eso: ¡hay cinco solteras y cinco solteros en busca del amor! Conquista a uno de ellos para casarte y formar una familia.     ¡Expresa tu individualidad personalizando el aspecto de tu personaje y creando artículos para tu casa!'),
(61, 'Do Not Feed the Monkeys ', '2020-06-20', 'https://www.nintendo.es/Juegos/Programas-descargables-Nintendo-Switch/Do-Not-Feed-the-Monkeys-1776716.html', '12', 'Alawar Premium ', 11, 4, '1', '2021-05-12', '87', 8, 'No alimentes a los monos es un videojuego de 2018 desarrollado por la compañía española Fictiorama Studios y publicado por Alawar Premium. Presenta al jugador como un espía que monitorea múltiples transmisiones de video en vivo a través de una computadora de escritorio en el juego.'),
(79, 'WHAT THE GOLF', '2021-05-21', 'https://www.nintendo.es/Juegos/Programas-descargables-Nintendo-Switch/WHAT-THE-GOLF--1780802.html', '10', ' Triband ', 12, 4, '1', '2021-05-12', '251', 8, 'Una estúpida y aclamada parodia del golf basada en la física en la que cada campo es un sorprendente nuevo tipo de golf; a veces extraordinario o desternillante y otras, tan absurdo que te hará exclamar \"¿WHAT THE GOLF?\"  ¡Llévate el coche al Driving Range, usa un pájaro como pelota para conseguir un Birdy, o una casa para conseguir un Home In One!  Desafía a un amigo al juego de golf menos realista del mundo en el nuevo modo de fiesta local para dos. Solo disponible en Nintendo Switch™.'),
(85, 'Warframe ', '2018-11-20', 'https://www.nintendo.es/Juegos/Programas-descargables-Nintendo-Switch/Warframe-1471859.html', '12', 'Digital Extremes ', 13, 4, 'online', '2021-05-12', '102', 9, ' ESCOGED VUESTRO WARFRAME  Hay más de 30 Warframes con habilidades únicas. Además, se pueden personalizar según vuestros gustos. CREAD VUESTRO ARSENAL  Katanas, rifles de pulso, lanzallamas... Expandid vuestro arsenal con más de 300 armas únicas. Cada una puede ser modificada para encajar con vuestro estilo de juego. EXPERIMENTAD UN COMBATE ACELERADO  Abriros paso cortando y despedazando a través de hordas de enemigos. Podéis hacerlo con pistola en mano o de forma sigilosa. ¡La decisión es vuestra! EXPLORAD MUNDOS ABIERTOS  Explorad, descubrid, pelead y volad en los grandes paisajes abiertos de Warframe. MOVIMIENTOS FLUIDOS DE PARKOUR  Saltad sin problemas, deslizaos y escabullíos a través de las instalaciones enemigas con un complejo sistema de movimiento. UN SISTEMA SOLAR EN RUINAS  En el futuro lejano de Warframe, clones grotescos y maquinas capitalistas dominan nuestro sistema solar. Combatid contra la codicia y la corrupción mientras exploráis 18 mundos llenos de horrores tecnorgánicos. FORMAD UN ESCUADRÓN  No tenéis que defender al Sistema Origen en solitario. Invitad a tres amigos o pelead junto con los 38 millones de usuarios que forman parte de la comunidad de Tenno. LOS NINJAS JUEGAN GRATIS  Warframe es completamente gratis, por lo que no hay nada que os impida uniros a nuestro universo. Os damos la bienvenida al Sistema Origen, Tenno.'),
(91, 'Nowhere Prophet ', '2020-07-30', 'https://www.nintendo.es/Juegos/Programas-descargables-Nintendo-Switch/Nowhere-Prophet-1812745.html', '12', 'No More Robots ', 14, 4, '1', '2021-05-12', '105', 8, 'Nowhere Prophet es un título de aventura y rol con toques de videojuego de cartas coleccionables diseñado para un único jugador. A través de un universo de ciencia ficción azotado por una guerra nuclear, en Nowhere Prophet viajaremos por un yermo radioactivo mientras nos enfrentamos a diversas criaturas, mutantes y enemigos. En el título tendremos la posibilidad de construir nuestro propio mazo, personalizando cartas y elementos, para lanzarnos a la aventura.'),
(92, 'Kingdom Hearts III ', '2019-12-29', 'https://www.amazon.es/Square-Enix-Kingdom-Hearts-3/dp/B00DD0ADBA/ref=sr_1_1?camp=2025&creative=165953&creativeASIN=B00DBF81JS&dchild=1&keywords=Kingdom+Hearts+III+-+PlayStation+4&linkCode=gs3&qid=1620915587&sr=8-1', '12', ' Square Enix ', 1, 1, '1', '2021-05-13', '111', 8, 'Kingdom Hearts 3 es el tercer título de una saga que vuelve a PlayStation 4. Sora seguirá siendo el protagonista y deberemos librar una nueva lucha para mantener el poder de la luz lidiando contra el malvado Maestro Xehanort. Square Enix y Disney brindan al jugador un casting cargado de personajes tan conocidos como Donald, Goofy, Mickey o Riku que se dividirán en dos grupos para avanzar en la aventura. Mientras los primeros buscarán a los guardianes de la luz Mickey y Riku deberán encontrar a los portadores de las Llaves Espada. El juego cerrará la saga Xenahort para dar respuestas a algunas cuestiones que aún estan en el aire.'),
(94, 'Ghostrunner', '2020-10-27', 'https://store.playstation.com/es-es/product/EP4040-CUSA24169_00-GHOSTRUNNER00000', '18', ' All in! Games ', 2, 1, '1', '2021-05-13', '112', 8, '\"Ghostrunner es un juego de acción vertiginosa en primera persona, ambientado en una siniestra megaestructura ciberpunk. Asciende la torre Dharma, el último refugio de la humanidad tras un cataclismo devastador. Tendrás que llegar a la cima y enfrentarte a la déspota guardiana de las llaves para vengarte de una vez por todas.  La violencia reina en las calles de la torre. Mara, la guardiana de las llaves, gobierna con mano de hierro y sin respeto alguno por la vida humana.  A medida que los recursos van escaseando, se instala irremediablemente la lay del más fuerte y el caos amenaza con devorarlo todo. La batalla final se acerca. Será la última oportunidad de buscar una solución antes de que la humanidad se extinga para siempre.  Te crearon otorgándote un dominio extraordinario de la espada, convirtiéndote en un arma letal aunque estés rodeado. Despedaza a tus enemigos con una katana monomolecular, esquiva balas gracias a unos reflejos sobrehumanos y usa técnicas especiales para sobrevivir.  Los combates son rápidos e intensos gracias a la habilidad de matar de un golpe. Aprovecha de tu increíble movilidad (y los checkpoints) para vértelas cara a cara con la muerte sin cesar.  Ghostrunner ofrece una experiencia única para un solo jugador con combates trepidantes y violentos, además de una ambientación que combina la ciencia ficción con temas postapocalípticos. Descubre la historia de un mundo que ha llegado a su fin y cuyos habitantes luchan por sobrevivir.  Ghostrunner tiene el audio únicamente en inglés, pero dispone de interfaz en inglés, español (de España y latinoamericano), francés, italiano, alemán, coreano, portugués (Brasil), ruso, chino simplificado, chino tradicional y japonés.\"'),
(97, 'Mortal kombat 11', '2019-04-23', 'https://tutiendadevideojuegos.com/videojuegos-ps4/4304-mortal-kombat-11-standard-edition-ps4-5051893238716.html', '18', 'NetherRealm Studios', 3, 1, '2', '2021-05-13', '119', 9, 'Mortal Kombat 11 es la nueva entrega de la violenta y salvaje saga de lucha de NetherRealm Studios para consolas y PC. Se trata de la undécima secuela de una serie de títulos de combate y peleas de marcada estructura 2D, que en esta ocasión, además de añadir los mejores gráficos de la serie y el gore más descarnado en los llamados Fatality, presentará luchadores clásicos y nuevos, más modos de juego y una oferta online que quiere marcar un antes y un después en los eSports. '),
(101, 'Call of Duty Black Ops Cold War', '2020-11-13', 'https://tutiendadevideojuegos.com/videojuegos-ps4/5006-call-of-duty-black-ops-cold-war-ps4-5030917291883.html', '18', ' Activision ', 4, 1, '1', '2021-05-13', '186', 8, 'all of Duty Black Ops Cold War es la nueva entrega de la famosa saga de juegos en primera persona editados por Activision para consolas y PC. Desarrollado por Treyarch, en esta ocasión viajaremos a la Guerra Fría de Estados Unidos con la Unión Soviética en los años ochenta, emprendiendo misiones encubiertas en la campaña para un jugador. El multijugador tendrá modos clásicos y otros especiales de esta versión más allá de la vertiente zombi, como Muerte por equipos, Dominación, Baja confirmada y Escolta VIP y Armas Combinadas, siendo los dos últimos una de las grandes novedades.'),
(116, ' Ace Combat 7 Skies Unknown', '2019-01-18', 'https://www.amazon.es/Lunriwis-12084-Ace-Combat-PlayStation/dp/B01MUDTTIP/ref=sr_1_1?camp=2025&creative=165953&creativeASIN=B01MUDTTIP&dchild=1&keywords=Ace+Combat+7%3A+Skies+Unknown+-+PlayStation+4&linkCode=gs3&qid=1620919515&sr=8-1', '12', ' Bandai Namco Games ', 5, 1, '8', '2021-05-13', '188', 8, 'Ace Combat vuelve a los videojuegos con una entrega numerada de la serie tras varios años de inactividad. Ace Combat 7: Skies Unknown presentará de nuevo grandes combates áreos, una historia intrincada y con fuerte énfasis en la narrativa, espectaculares gráficos para recrear los cielos y grandes extensiones de terreno bajo nosotros y una nueva compatibilidad con la realidad virtual.'),
(129, 'gang beast', '2017-01-12', 'https://www.amazon.es/Meridiem-Games-0811949031488-Gang-Beasts/dp/B07XYKD82Y/ref=sr_1_1?camp=2025&creative=165953&creativeASIN=B07YLH7K3J&dchild=1&keywords=Gang+Beasts+-+PlayStation+4&linkCode=gs3&qid=1620920750&sr=8-1', '7', ' Double Fine Productions ', 6, 1, '8', '2021-05-13', '182', 7, 'Gang Beasts es un curioso videojuego de acción y supervivencia en el que, encarnando a unos simpáticos y coloridos personajes, intentaremos asesinar y atacar a nuestros rivales. El título hace especial hincapié en el multijugador y en los escenarios más variados, como cornisas y andamios en las alturas, batallas a lomos de camiones, estaciones de metro y similares.'),
(133, 'Little Nightmares', '2017-04-28', 'https://tutiendadevideojuegos.com/videojuegos-ps4/7939-little-nightmares-complete-edition-ps4-3391892001679.html', '16', 'Tarsier Studios', 7, 1, '1', '2021-05-13', '190', 11, 'Little Nightmares nos llevará a vivir una oscura y extravagante historia que nos obligará a hacer frente a los temores de nuestra infancia. Nuestra misión será la de ayudar y guiar a una niña de chubasquero amarillo a escapar de Las Fauces -The Maw-, un enorme navío habitado por almas corruptas que ansían convertirnos en su alimento. Mezclando puzles, aventuras y plataformas, lo nuevo de Tarsier Studios pretende llevarnos a un mundo único y terrorífico. También conocido como Hunger.'),
(134, 'F1 2020', '2020-07-10', 'https://tutiendadevideojuegos.com/videojuegos-ps4/9977-f1-2020-ps4-4020628722135.html', '3', ' Codemasters', 9, 1, '1', '2021-05-13', '193', 8, 'F1 2020 es la nueva entrega de la saga de conducción con licencia oficial de F1 de Codemasters, que ofrece mejoras gráficas y técnicas, así como incorpora nuevos modos de juego. Entre ellos destaca Mi Equipo que permitirá a los jugadores crear su propia escudería de fórmula uno, la entrada de un modo a pantalla partida local o la incorporación del legendario piloto alemán Michael Schumacher junto a cuatro de sus más icónicos vehículos. También conocido como Formula 1 2020.'),
(136, 'Farming Simulator 19', '2018-11-20', 'https://tutiendadevideojuegos.com/videojuegos-pc/7625-pc-farming-simulator-19-3512899120990.html', '3', ' GIANTS Software', 10, 1, '1', '2021-05-13', '197', 6, 'Farming Simulator 19 es la nueva entrega de la saga de simulación agrícola desarrollada por GIANTS Software. Una vez más nos invita a gestionar nuestra propia explotación rural, ya sea agrícola o animal. Los jugadores podrán disfrutar de nuevas actividades agrícolas así como de cultivos como el algodón o la avena. En esta edición se han añadido nuevas maquinarias, y se nos presenta la posibilidad de cuidar de nuestras vacas, cerdos, ovejas y pollos. Además, como novedad, ahora también podremos construir nuestros establos para pasearnos por nuestros terrenos a lomos de nuestros caballos.'),
(139, 'Cities Skylines', '2017-08-15', 'https://store.playstation.com/es-es/product/EP4139-CUSA06407_00-CITIESPS4GAME001', '3', 'Colossal Order', 11, 1, '1', '2021-05-13', '201', 8, 'De los creadores de Cities in Motion, Cities: Skylines es un simulador de ciudad que intenta llevar a un paso más las dinámicas de gestión vistas en títulos como SimCity. Nos permite crear nuestra ciudad y gestionarla al máximo, comenzando con un pequeño pueblo hasta convertirla en una metrópolis.'),
(140, 'fifa 21', '2020-10-09', 'https://tutiendadevideojuegos.com/videojuegos-nintendo-switch/4818-fifa-21--legacy-edition--nintendo-switch-5030946123506.html', '3', ' EA Sports', 12, 1, '4', '2021-05-13', '203', 8, 'FIFA 21 es la nueva entrega del simulador de fútbol de EA Sports, el juego deportivo más influyente del mundo. Disponible en Xbox One, PS4, Xbox Series S/X, PS5, PC y Switch, se trata de una versión más avanzada en lo jugable y con un nuevo apartado gráfico en las consolas más potentes. Como cada año, incluye plantillas actualizadas, licencias de miles de jugadores y clubs, y la posibilidad de disfrutar de competiciones oficiales a nivel internacional.'),
(141, 'The Last of Us Parte II', '2020-06-19', 'https://tutiendadevideojuegos.com/videojuegos-ps4/2925-the-last-of-us--parte-ii-edicion-especial-ps4-7117193394038.html', '18', ' Naughty Dog', 13, 1, '1', '2021-05-13', '205', 8, 'The Last of Us 2 es la secuela de The Last of Us, uno de los juegos más aclamados de la consola PS3, que apareció en 2015 en PS4 en versión remasterizada. Esta continuación ha sido anunciada en el evento PlayStation Experience de diciembre de 2016, generando grandísimas expectativas entre los jugadores.'),
(143, 'Disgaea 4 Complete+', '2019-10-29', 'https://tutiendadevideojuegos.com/videojuegos-nintendo-switch/9120-disgaea-4-complete---a-promise-of-sardines-nintendo-switch-0810023034247.html', '12', 'Nippon Ichi Software', 14, 1, '1', '2021-05-13', '209', 8, 'Disgaea 4: A Promise Unforgotten es un videojuego de rol táctico de 2011 para PlayStation 3 y el cuarto de la serie Disgaea de Nippon Ichi Software. El juego cuenta la historia de Valvatorez, un ex tirano que lidera un partido para rebelarse contra el presidente del Inframundo.'),
(144, 'Stranded Deep ', '2015-01-23', 'https://store.steampowered.com/app/313120/Stranded_Deep/', '16', 'Beam Team Games', 1, 3, '1', '2021-05-14', '211', 8, 'Stranded Deep es un juego de aventuras y supervivencia que nos pone en el papel de un superviviente de un accidente de avión que ahora se ve atrapado en algún lugar del océano pacífico. Los escenarios son generados proceduralmente y además cuentan con ciclo día y noche que nos servirá para marcarnos pautas a la hora de explorar y construir nuestro refugio, así como adentrarnos en el mar a investigar otras islas. Pero esos idílicos parajes no estarán exentos de peligros que seguirán amenazando nuestra supervivencia. Últimas noticias'),
(145, 'Subnautica', '2018-01-23', 'https://store.steampowered.com/app/264710/Subnautica/', '16', 'Unknown Worlds', 2, 3, '1', '2021-05-14', '213', 9, 'Subnautica es un juego de supervivencia, aventura y exploración en mundo abierto desarrollado en primera persona que nos invitará a bucear en las profundidades de enorme planeta extraterrestre. Desarrollado por Unknonw Worlds Entertaiment, está disponible en Xbox One, PlayStation 4 y PC.'),
(146, 'Brawlhalla', '2017-10-17', 'https://store.steampowered.com/app/291550/Brawlhalla/', '4', 'Blue Mammoth Games', 3, 3, '4', '2021-05-14', '215', 7, 'Brawlhalla es un videojuego de lucha en 2D con toques de plataformas que puede jugarse tanto online como local con soporte para hasta ocho jugadores. El videojuego, que hace suyos elementos del género brawler, presenta distintos modos de juego, personajes y elementos de humor.'),
(147, 'Tom Clancy\'s Rainbow Six Siege', '2015-12-01', 'https://store.steampowered.com/app/359550/Tom_Clancys_Rainbow_Six_Siege/', '18', 'Ubisoft Montreal', 4, 3, '1', '2021-05-14', '217', 8, 'Tom Clancy\'s Rainbow Six Siege supone la vuelta de la saga de juegos de acción táctica en primera persona. En Rainbow Six Siege, volvemos a encarnar al famoso grupo de élite de acción táctica, e incluso a los terroristas si optamos por ello. El juego invita al conocimiento de cada facción, y por primera vez en la saga, entraremos en una profunda faceta multijugador de 5 contra 5 jugadores en el que cada usuario tendrá un papel específico en el equipo, y en el cual los mapas y escenarios, nos obligarán a adecuar nuestras estrategias de forma pormenorizada.'),
(148, 'Microsoft Flight Simulator', '2020-08-17', 'https://store.steampowered.com/app/1250410/Microsoft_Flight_Simulator/', '3', ' Asobo Studio', 5, 3, '1', '2021-05-14', '219', 9, 'Microsoft Flight Simulator es la nueva entrega de la reputada saga de simulación de vuelo de Microsoft. En esta ocasión, y a cargo de Asobo Studio, tenemos una secuela más realista, con mejores gráficos y un buen número de modelos comerciales y personales de aviones y avionetas, más que en ninguna ocasión anterior. Con un sistema de físicas y simulación meteorológica más complejo, con nubes volumétricas y cambios de luz inimaginables hace unos años, aprovechará la tecnología en la nube de Azure, mostrándose a la máxima calidad en PC y Xbox One'),
(149, 'Move or Die', '2016-01-21', 'https://store.steampowered.com/app/323850/Move_or_Die/', '12', 'Those Awesome Guys', 6, 3, '4', '2021-05-14', '221', 7, 'Move or Die es un juego diseñado para cuatro jugadores, tanto a nivel local como online, en el que las mecánicas irán cambiando cada veinte segundos para garantizar una constante acción frenética. El juego ofrece contenido desbloqueable, distintos personajes a controlar y raciones de humor desenfadado. Últimas noticias'),
(152, 'Portal 2', '2011-04-19', 'https://store.steampowered.com/app/620/Portal_2/', '12', 'valve', 7, 3, '2', '2021-05-14', '223', 8, 'Tras el éxito de Portal, convertido en juego de culto, Portal 2 para PC nos lleva de nuevo a resolver todo tipo de puzles en primera persona, usando la pistola de portales para superar todas las trampas y retos que nos plantea la sádica inteligencia artificial GladOS. Además, incluye un modo cooperativo que exigirá que tú y un amigo tengáis que cooperar para superar los diferentes puzles que nos propone el juego.'),
(153, 'Forza Horizon 4', '2021-03-09', 'https://store.steampowered.com/app/1293830/Forza_Horizon_4/', '3', 'Playground Games', 9, 3, '1', '2021-05-14', '226', 9, 'Forza Horizon 4 es la cuarta parte de la saga de conducción en mundo abierto de Microsoft y PlayGround Games. Trasladándonos a un enorme mapeado que recrea Reino Unido casi en su totalidad, la nueva entrega apuesta por incluir más coches, más eventos y competiciones, mejorar los gráficos y ofrecer un sistema de estaciones en tiempo real que nos ofrece la posibilidad de pilotar en verano, otoño, invierno y primavera. Está disponible en Xbox One y PC.'),
(157, 'StarCraft II Wings of Liberty', '2010-07-27', 'https://www.instant-gaming.com/en/1387-buy-game-battle-net-starcraft-2-battle-chest-20/?igr=vandal', '16', 'Blizzard', 10, 3, '1', '2021-05-14', '231', 9, 'Tras más de diez años, el legendario Starcraft regresa en una segunda parte dividida en tres juegos. Éste es el primero, Wings of Liberty, cuya campaña narra la historia de los Terran, los humanos lanzados a la conquista del espacio que inevitablemente se ven las caras en el camino con los Zerg y con los Protoss. Además de un completo modo campaña, Starcraft II incluye un modo multijugador lleno de posibilidades gracias a la conexión con Battle.net. Cuenta además con un potente editor de mapas con el que compartir contenido a través del sistema online de Blizzard'),
(158, 'Euro Truck Simulator 2', '2013-01-16', 'https://www.instant-gaming.com/en/309-buy-game-steam-euro-truck-simulator-2/?igr=vandal', '3', 'SCS Software', 11, 3, '1', '2021-05-14', '233', 8, 'Se trata de un título que nos permite ponernos en la piel de un conductor de camiones con el recorremos las calles de multitudes países de europa –Reino Unido, Bélgica, Alemania, Italia, Holanda, Polonia...–, con un total de 60 ciudades. Monta tu propia flota de camiones, compra garajes, contrata a conductores y consigue los máximos beneficios.'),
(159, 'Golf It!', '2017-02-17', 'https://www.instant-gaming.com/en/5302-buy-game-steam-golf-it-early-access/?igr=vandal', '7', 'Perfuse Entertainment', 12, 3, '1', '2021-05-15', '235', 7, 'Golf It! es un título de minigolf multijugador centrado en la experiencia dinámica y en la jugabilidad divertida y accesible, mientras se potencia la creación de niveles. Con varios recorridos, ambientes y características de personalización, Golf It! está diseñado para mantener a la comunidad de usuarios de PC activos y en constante evolución.'),
(160, 'Fortnite Battle Royale', '2017-09-27', 'https://www.epicgames.com/fortnite/es-ES/download', '3', 'Epic Games', 13, 3, '4', '2021-05-15', '237', 7, 'Fortnite Battle Royale es la variante ‘battle royale’ gratuita multijugador de Fortnite, el videojuego de Epic Games. Cogiendo las bases jugables del título de acción, construcción y supervivencia, los padres de Paragon han diseñado una propuesta similar a la del todopoderoso PUBG pero con sus propias ideas, tanto en consolas como PlayStation 4 y Xbox One, como en PC.'),
(162, 'The Elder Scrolls V Skyrim', '2016-10-28', 'https://store.steampowered.com/app/489830/The_Elder_Scrolls_V_Skyrim_Special_Edition/', '18', ' Bethesda Game Studios', 14, 3, '1', '2021-05-15', '239', 8, 'The Elder Scrolls V: Skyrim: Special Edition para PS4 es una remasterización de The Elder Scrolls V cinco años después del lanzamiento del original y para la nueva generación de consolas. Cuenta con todo el contenido del juego de 2011, más los tres packs de contenido descargables lanzados, más soporte para mods. Además, sus gráficos han sido rehechos para la nueva generación.'),
(163, 'The Elder Scrolls V Skyrim', '2016-10-28', 'https://store.steampowered.com/app/489830/The_Elder_Scrolls_V_Skyrim_Special_Edition/', '18', ' Bethesda Game Studios', 14, 3, '1', '2021-05-15', '', 8, 'The Elder Scrolls V: Skyrim: Special Edition para PS4 es una remasterización de The Elder Scrolls V cinco años después del lanzamiento del original y para la nueva generación de consolas. Cuenta con todo el contenido del juego de 2011, más los tres packs de contenido descargables lanzados, más soporte para mods. Además, sus gráficos han sido rehechos para la nueva generación.'),
(164, 'Resident Evil 8 Village', '2021-05-07', 'https://tutiendadevideojuegos.com/videojuegos-ps5/10053-resident-evil-viiiage-ps5-5055060952696.html', '18', 'Capcom', 1, 2, '1', '2021-05-15', '241', 8, 'Resident Evil 8: Village es la octava entrega de Resident Evil, la saga de survival horror de Capcom que a lo largo de los años nos ha llevado a luchar contra zombis, mutantes y otros seres sobrenaturales. Resident Evil 8: Village, que llegará a PlayStation 5, Xbox Series X y PC nos devuelve a la primera persona como ya sucedió en la séptima parte de la serie y nos llevará a una aldea maldita aislada en un clima hostil y frío, así como asediada por extrañas criaturas que hace la vida imposible a los habitantes.'),
(167, 'Spider-Man Miles Morales', '2020-11-12', 'https://www.game.es/marvels-spider-man-miles-morales-playstation-5-183237', '16', ' Insomniac Games', 2, 2, '1', '2021-05-15', '243', 8, 'pider-Man: Miles Morales es el nuevo juego de acción y aventura en mundo abierto de Insomniac Games para PlayStation 5, que cuenta como título independiente de Marvel’s Spider-Man para PlayStation 4 aunque ofrece su misma fórmula jugable. De esta forma, encarnando a Morales y no a Peter Parker, viajaremos por una ciudad de Nueva York mejor recreada y detallada, combatiendo el crimen y luchando contra los habituales villanos de los cómics de Marvel. '),
(172, 'Call of Duty Warzone', '2020-11-12', 'https://www.callofduty.com/es/warzone', '18', 'Infinity Ward', 4, 2, '3', '2021-05-15', '256', 8, 'Call of Duty: Warzone es la versión gratuita y battle royale del videojuego de acción en primera persona de Activision. Nos invita a combatir en un escenario gigantesco, que recopila algunos de los mejores mapas, invitándonos a ser el mejor jugador de un combate que contiene partidas de 150 jugadores. Con modalidades solitario y por grupos, y con un arsenal extraído de Modern Warfare, se trata de un éxito para consolas y PC.'),
(175, 'Deliver Us The Moon', '2020-04-24', 'https://store.playstation.com/es-es/product/EP4382-CUSA16761_00-DELIVERUSTHEMOON', '12', 'WIRED PRODUCTIONS LIMITED', 5, 2, '1', '2021-05-15', '260', 7, 'Deliver Us The Moon es un thriller de ciencia ficción ambientado en un futuro cercano apocalíptico en el que los recursos naturales de la Tierra se han agotado. Una colonia lunar que proporcionaba un suministro de energía vital ha cesado sus comunicaciones. Han enviado a un astronauta solo a la Luna en una misión crítica para salvar a la humanidad de la extinción. ¿Salvarás a la humanidad o caerás en el olvido en el oscuro abismo del espacio?'),
(176, 'ASTRO\'s PLAYROOM', '2020-11-12', 'https://store.playstation.com/es-es/product/IP9100-PPSA01325_00-PREINMASTER00000', '7', 'Sony Interactive Entertainment', 6, 2, '1', '2021-05-15', '262', 7, 'De la mano del equipo responsable del THE PLAYROOM original y el aclamado ASTRO BOT Rescue Mission, llega un nuevo título de plataformas preinstalado en tu consola PS5™. Controla a ASTRO y siente el mundo a través del mando inalámbrico DualSense™: cada paso, cada salto y cada golpe que des te transmitirán nuevas sensaciones gracias a la inmersiva tecnología de retroalimentación háptica. En tu aventura también encontrarás potenciadores que ilustran el potencial de los gatillos adaptativos dinámicos, el sensor de movimiento, el panel táctil y el altavoz integrado, que trabajan en armonía para ofrecerte una experiencia de juego totalmente inédita. Tómate tu tiempo para descubrir las múltiples referencias ocultas a la historia de PlayStation® y consigue artefactos atemporales que podrás exponer en el Laboratorio PlayStation.'),
(177, 'Maquette', '2021-03-02', 'https://www.instant-gaming.com/en/6577-buy-game-steam-maquette/?igr=vandal', '3', ' Graceful Decay', 7, 2, '1', '2021-05-15', '264', 6, 'Maquette es un videojuego de rompecabezas y aventuras desarrollado por Graceful Decay y publicado por Annapurna Interactive. El juego se desarrolla en un mundo recursivo donde cada acción en una mesa se recrea en el área exterior más grande. '),
(178, 'Destruction AllStars', '2021-02-02', 'https://tutiendadevideojuegos.com/videojuegos-ps5/2797-destruction-allstars-ps5-711719817024.html', '12', ' Lucid Games', 9, 2, '16', '2021-05-15', '266', 6, 'Destruction AllStars, es frenético juego multijugador que combina combates de héroes tanto a pie como en vehículos. Desarrollado por Lucid Games y PlayStation Studios, nos invita a formar parte de una loca carrera para conseguir entrar en un vehículo y combatir en partidas diferentes, modos de juego muy distintos y con condiciones diversas. En el juego, cada héroe tiene un coche propio con sus habilidades intrínsecas.'),
(180, 'Darksiders Genesis', '2020-02-14', 'https://tutiendadevideojuegos.com/videojuegos-ps4/97-darksiders-genesis-ps4-9120080074386.html', '12', 'Airship Syndicate', 1, 5, '2', '2021-05-15', '270', 8, 'Darksiders Genesis es un juego de acción y rol con naturaleza hack and slash desarrollado por el estudio Airship Syndicate, y supondrá el primer spin-off de la emblemática y querida saga Darksiders. Con nuevos personajes, una historia que traerá a viejos conocidos y rencillas entre deidades conocidas por los fans de la serie, llega a consolas y PC.'),
(181, 'Ori and the Will of the Wisps', '2020-03-11', 'https://tutiendadevideojuegos.com/videojuegos-xbox-series-x/8922-ori-and-the-will-of-the-wisps-xbox-one-0889842528619.html', '7', 'Moon Studios', 2, 5, '2', '2021-05-15', '272', 9, 'Ori and the Will of the Wisps es la continuación del emblemático videojuego de plataformas y aventuras Ori and the Blind Forest, desarrollado por Moon Studios. Se trata de una secuela que sigue ofreciéndonos un estilo impecable a nivel visual y jugable de la mano de Microsoft Studios y con un lanzamiento para Xbox One y PC.'),
(182, 'Worms Rumble', '2020-12-01', 'https://store.playstation.com/es-es/product/EP4064-PPSA01526_00-7366148917983053', '7', 'Team 17 Digital LTD', 10, 2, '32', '2021-05-15', '274', 7, 'Nunca antes has jugado a Worms así: Worms Rumble es una intensa arena multiplataforma de 32 jugadores en tiempo real. ¡Prepárate para los trepidantes modos Partida a muerte y Último gusano en pie!  Usa una gran variedad de armas icónicas como la bazuca, la escopeta y el lanzaovejas, así como otras novedades del arsenal para acabar con tus invertebrados enemigos y subir en la clasificación. Personaliza tu gusano, participa en desafíos y eventos por temporada, y prueba nuevas formas de jugar en el Laboratorio. Esto es Worms, reinventado.  '),
(186, 'Subnautica Below Zero', '2021-05-14', 'https://tutiendadevideojuegos.com/videojuegos-ps5/10108-subnautica-below-zero-ps5-3391892015232.html', '12', 'Unknown Worlds', 11, 2, '1', '2021-05-15', '278', 8, 'Vuelve Subnautica con una nueva aventura Subnautica Below Zero para Xbox Series, PlayStation 4 y PlayStation 5.  Subnautica Below Zero es un videojuego de aventura y supervivencia en la que los usuarios se meten en la piel de nuestra protagonista que es una científica que estudia los artefactos alienigenas, la cual se encuentra en un planeta misterioso el cuan llaman 4546B. Desde una perspectiva en primera persona, los jugadores deberán buscar pistas acerca del paradero de un familiar de nuestro personaje, fabricar herramientas, construir refugios y defenderse de terribles depredadores alienígenas.  Descubre nuevas formas de vida en la superficie helada del planeta 4546B. nada a través del gigante pez titán hueco, escapa del agresivo tiburón bruto y visita a los adorables pingüinos. Tendrás que ir con cuidado porque algunos residentes del océano helado te ayudaran, pero otros intentaran hacerte daño.  ¿Quiénes fueron los alienígenas que vivieron aquí antes? ¿Por qué estaban en este planeta? Below Zero extiende la historia del universo de subnautica, sumergiéndose profundamente en el misterio del primer juego.'),
(187, 'MLB The Show 21', '2021-04-20', 'https://www.instant-gaming.com/en/8632-buy-mlb-the-show-21-xbox-one/?igr=vandal', '3', 'San Diego Studio', 12, 2, '4', '2021-05-15', '281', 8, 'MLB The Show 21 es un videojuego de béisbol de San Diego Studio y publicado por Sony Interactive Entertainment, basado en Major League Baseball'),
(189, 'Remnant From The Ashes', '2021-05-15', 'https://tutiendadevideojuegos.com/videojuegos-ps4/72-remnant--from-the-ashes-ps4-9120080075505.html', '16', 'Gunfire Games', 13, 2, '1', '2021-05-15', '283', 8, 'Remnant From the Ashes es un shooter de acción y supervivencia en tercera persona situado en un mundo post apocalíptico controlado por monstruosas criaturas. Como uno de los últimos restos de la humanidad, saldrás solo o junto a otros dos jugadores para enfrentarte a hordas de enemigos mortales, jefes épicos y tratar de crear un lugar donde posicionarse, reconstruir y luego recuperar lo que se perdió.  • EL RESTO DE LA HUMANIDAD El mundo ha caído al caos por un mal antiguo de otra dimensión La humanidad está luchando por sobrevivir, pero poseen la tecnología para abrir portales a otros reinos y realidades alternativas Deben viajar a través de estos portales para descubrir de dónde vino el mal, buscar recursos para mantenerse con vida y luchar para reconstruir la humanidad  • TE ESPERAN REINOS FANTÁSTICOS SIN FIN explora mundos generados aleatoriamente que cambian cada vez que juegas a través de ellos, creando nuevos mapas, encuentros con enemigos, oportunidades de búsqueda y eventos en el mundo Cada uno de los cuatro mundos únicos del juego está lleno de monstruosos habitantes y entornos que proporcionarán nuevos desafíos con cada partida.Adaptarse y explorar o morir en el intento'),
(190, 'Dragon Ball FighterZ ', '2018-01-26', 'https://tutiendadevideojuegos.com/videojuegos-ps4/7997-dragon-ball-fighter-z-ps4-3391891995412.html', '12', 'Arc System Works', 3, 5, '2', '2021-05-15', '291', 9, 'Dragon Ball fighterZ es un videojuego de peleas arcade en 2D desarrollado por el estudio Arc System Works y distribuido por Namco Bandai para las plataformas de PC y Xbox One.  El juego ofrecerá combates con sabor clásico pero muy espectaculares, ya que incluye elementos en 3D como los ataques finales, movimientos especiales y distintas animaciones para imitar al máximo posible el estilo de animación del anime.'),
(192, 'Halo Reach', '2019-12-03', 'https://www.microsoft.com/es-es/p/halo-reach/9nlgw5mxwkj6?activetab=pivot:overviewtab', '16', 'Bungie', 4, 5, '1', '2021-05-15', '288', 9, 'Esta precuela de los acontecimientos de Halo, Halo 2 y Halo 3 nos cuenta la caída del planeta Reach, invadido por el Covenant, y los intentos del equipo Noble, un grupo de soldados Spartan (parecidos al Jefe Maestro) que tendrá que luchar por todo el planeta para evitar que los Covenant consiguen lo que quieren. Incluye una épica campaña que puede jugarse en cooperativo, y un modo multijugador con un completo sistema de estadísticas y el modo Firefight, en el que tendremos que luchar contra oleadas de enemigos de creciente poder de destrucción y dificultad.'),
(194, 'Elite Dangerous ', '2016-06-03', 'https://www.epicgames.com/store/es-ES/p/elite-dangerous', '7', 'Frontier Developments', 5, 5, '1', '2021-05-16', '295', 7, 'La nueva temporada del simulador espacial ofrecerá dos grandes capítulos titulados The Engineers y Planetary Landings, añadiendo la posibilidad de visitar planetas, disfrutar de nuevas misiones y permitiéndonos descubrir nuevos objetos y opciones de configuración para nuestras naves, presentándonos la esperada contratación y mejora de personal.'),
(195, 'Just Dance 2019', '2018-10-25', 'https://tutiendadevideojuegos.com/wii-wiiu/8272-wii-just-dance-2019-3307216080923.html', '3', ' Ubisoft', 6, 5, '4', '2021-05-16', '297', 7, 'Just Dance 2019 es la nueva entrega de la saga de bailes de Ubisoft. En esta ocasión, además de nuevos modos de juego, incluye temas como Bang Bang Bang by BIGBANG, Finesse (Remix) by Bruno Mars Ft. Cardi B y Fire by LLP Ft. Mike Diamondz, entre otras muchas canciones. De este modo, el título supera las 40 canciones para bailar.'),
(196, 'Inside', '2016-06-29', 'https://www.instant-gaming.com/en/1920-buy-game-steam-inside/?igr=vandal', '18', ' PlayDead', 7, 5, '1', '2021-05-16', '299', 8, 'De la mano de los creadores de Limbo nos llega Inside, su nuevo título para Xbox One que nos trasladará a un mundo de plataformas en 2 dimensiones en el que la libertad es algo casi olvidado y en el que deberemos recuperarla pasando desapercibidos y huyendo de los controles militares.'),
(197, 'Need for Speed Hot Pursuit Remastered', '2020-11-06', 'https://tutiendadevideojuegos.com/videojuegos-ps4/4887-need-for-speed-hot-pursuit-remastered-ps4-5030937124062.html', '7', 'Criterion', 9, 5, '1', '2021-05-16', '301', 7, 'Compite con colegas gracias al juego cruzado y autolog. Ve a toda velocidad por las sinuosas carreteras de Seacrest County en carreras muy competitivas: ¡ahora compatible con Juego cruzado entre PS4, Xbox One, PC y Nintendo Switch! El revolucionario Autolog te conecta con tus amigos y amigas en persecuciones y carreras cara a cara, y ofrece desafíos según las actividades de tus colegas.  Disfruta de todo el contenido adicional y actualizaciones: Consigue todos los DLC principales adicionales desde el lanzamiento, incluidas seis horas de juego adicionales y más de 30 desafíos. Incluye nuevos logros, diseños, colores del coche, menos detenciones, el modo Foto y la galería actualizados, además de múltiples actualizaciones de calidad de vida; creando una experiencia de juego aún más completa.'),
(198, 'Halo Wars Definitive Edition', '2017-04-24', 'https://www.microsoft.com/es-es/p/halo-wars-definitive-edition-pc/9nblggh5wlr0?activetab=pivot:overviewtab', '16', ' Microsoft Studios', 10, 5, '1', '2021-05-16', '303', 8, 'Halo Wars: Definitive Edition es la versión remasterizada para One y PC del éxito de Xbox 360. Siguiendo las mecánicas del famoso juego de estrategia del universo Halo, la edición definitiva incluye todo el contenido lanzado originalmente, incorpora soporte para teclado y ratón en PC y mejora resolución y texturas, que en el caso de compatibles, será de hasta 4K.'),
(199, 'The Escapists', '2015-02-13', 'https://www.instant-gaming.com/en/911-buy-game-steam-the-escapists/?igr=vandal', '7', 'Mouldy Toof Studios', 11, 5, '1', '2021-05-16', '305', 8, 'The Escapists para Xbox One es un juego en el que vemos el día a día de una prisión mientras controlamos a un equipo de reclusos que tienen la nada discreta obsesión de fugarse. Tendremos que cumplir nuestra rutina y obligaciones diarias como presos mientras nos vigilan los guardias, y conseguir objetos para ir elaborando nuestro plan de fuga, usándolas para estar cada vez más cerca de nuestro objetivo hasta poder llevar a cabo el plan de fuga.'),
(200, 'Madden NFL 21', '2020-08-28', 'https://www.instant-gaming.com/en/7797-buy-madden-nfl-21-xbox-one/?igr=vandal', '16', ' EA Tiburon', 12, 5, '1', '2021-05-16', '307', 7, 'adden NFL 21 es un videojuego de fútbol americano basado en la National Football League, desarrollado por EA Tiburon y publicado por Electronic Arts. Es una entrega de la serie Madden NFL de larga duración'),
(201, 'Gears of War 5', '2019-09-10', 'https://tutiendadevideojuegos.com/videojuegos-xbox-one/8923-gears-of-war-5-xbox-one-0889842519181.html', '18', 'The Coalition', 13, 5, '3', '2021-05-16', '309', 9, 'Gears of War 5 es la nueva entrega de la emblemática saga de acción en tercera persona Gears of War para PC y Xbox One. De la mano de The Coalition, en esta ocasión la protagonista de esta aventura de tiros con numerosas oleadas de extraterrestres será Kait, apostando por volver a las raíces de la serie y mostrar un estilo gráfico y artístico más novedoso y arriesgado. Además, será el primer videojuego de Gears of War que adopte una estructura similar a la de mundo abierto. Mostrar resumen entero'),
(202, 'Sekiro Shadows Die Twice', '2019-03-22', 'https://www.game.es/VIDEOJUEGOS/ACCION/XBOX-ONE/SEKIRO-SHADOWS-DIE-TWICE/151701', '18', 'From Software', 14, 5, '1', '2021-05-16', '311', 9, 'Sekiro: Shadows Die Twice, desarrollado por From Software y editado por Activision para PC, PlayStation 4, Xbox One y Stadia, es un RPG de acción de los creadores de Dark Souls y Bloodborne que recoge el testigo de la mítica saga Tenchu y nos lleva a la era Sengoku, en el año 1500 en Japón, en el que un samurái deberá enfrentarse a la muerte a cada paso.'),
(206, 'Tales of Arise', '2021-09-10', 'https://tutiendadevideojuegos.com/videojuegos-xbox-one/7899-tales-of-arise-xbox-one-3391892006537.html', '12', ' Bandai Namco', 1, 6, '1', '2021-05-16', '317', 6, 'Sekiro: Shadows Die Twice, desarrollado por From Software y editado por Activision para PC, PlayStation 4, Xbox One y Stadia, es un RPG de acción de los creadores de Dark Souls y Bloodborne que recoge el testigo de la mítica saga Tenchu y nos lleva a la era Sengoku, en el año 1500 en Japón, en el que un samurái deberá enfrentarse a la muerte a cada paso.'),
(208, 'Stonefly', '2021-06-01', 'https://www.instant-gaming.com/en/8748-buy-game-steam-stonefly/?igr=vandal', '12', 'Flight School Studio', 2, 6, '1', '2021-05-16', '321', 8, 'Aprovecha el viento y surca la naturaleza de Stonefly, un juego de acción y aventura tranquilo y relajado que explora temas como el autodescubrimiento, el legado y la pertenencia. Stonefly es una aventura de acción a cargo de Flight School Studio y MWM Interactive para PC, PlayStation 4, Xbox One, PlayStation 5, Xbox Series y Switch.'),
(209, 'JUMP Force', '2019-02-15', 'https://tutiendadevideojuegos.com/videojuegos-xbox-one/7941-jump-force-xbox-one-3391892000481.html', '12', ' Spike Chunsoft', 3, 6, '2', '2021-05-16', '323', 5, 'JUMP Force es un juego de combate y acción en 3D para Xbox One, PS4 y PC que tiene su principal atractivo en ofrecer un crossover de personajes y universos anime y manga basados en la prestigiosa publicación japonesa Shonen Jump. Se trata de la revista más famosa de Japón, y la cuna de las series más importantes de la historia, como Naruto, Dragon Ball, One Piece o Death Note.'),
(210, 'Necromunda Hired Gun', '2021-06-01', 'https://tutiendadevideojuegos.com/videojuegos-xbox-series-x/10284-necromunda--hired-gun-xbox-series-x-3512899124141.html', '18', 'Streum On Studio', 4, 6, '1', '2021-05-16', '325', 6, 'onviértete en mercenario. Las pagas están bien, el perro es leal y puedes confiar en tus armas. Disfruta de este FPS indie violento, ambientado en los confines más oscuros de la ciudad colmena más infame de Warhammer 40,000. Para Xbox Series, PlayStation 4 y PlayStation 5.  Navega por un mar de crímenes y corrupción y equilibra el violento ecosistema de Necromunda como un cazar recompensas. ¿Sobrevivirás a la cacería? Necromunda: Hired Gun. Por el precio Adecuado, elimina a las Bandas y mutantes más abyectos. Tu armería es un arsenal en expansión. Tu cuerpo esta mejorado con docenas de aumentos personalizables para correr por las paredes y saltar precipicios. Tu cibermastin rastreara y matara enemigos por ti, y tu rezón te permite atravesar entornos masivos de forma ágil y veloz.');
INSERT INTO `juego` (`id`, `nombre`, `fechaDeLanzamiento`, `comprar`, `edad`, `creador`, `genero`, `plataforma`, `numeroDeJugadores`, `fechaDePublicacion`, `imagen`, `nota`, `resumen`) VALUES
(213, 'Puyo Puyo Tetris 2', '2020-12-08', 'https://tutiendadevideojuegos.com/videojuegos-xbox-series-x/4069-puyo-puyo-2-tetris-xbox-series-x.html', '3', ' SEGA', 6, 6, '4', '2021-05-16', '327', 8, '¡Ha vuelto Puyo Puyo Tetris 2 y esta vez a lo grande! Puyo Puyo y Tetris, dos juegos de puzles, se han unido para ofrecer aún más diversión de la que teníamos en Puyo Puyo Tetris 2. Para jugar es muy fácil, tienes que combinar cuatro o más Puyos del mismo color o completar una línea de bloques para eliminarlos de tu tablero y arroja basura en el juego oponente. Para jugar al Puyo Puyo o al Tetris tradicional podrás mezclarlos para subir de nivel. Sin conexión o en línea, tendrás varios modos que te permiten jugar como desees, desde la aventura para un jugador hasta la competición en el sofá. '),
(214, 'Tetris Effect: Connected', '2020-11-10', 'https://www.instant-gaming.com/en/7369-buy-game-xbox-play-anywhere-tetris-effect-connected/?igr=vandal', '3', 'Monstars Inc. / Resonair', 7, 6, '1', '2021-05-16', '', 8, 'Tetris Effect es un videojuego de rompecabezas diseñado por el creador de Rez, Tetsuya Mizuguchi. El videojuego, para PC y VR, busca ofrecer una nueva vuelta de tuerca al conocido Tetris, jugando con los aspectos visuales y la jugabilidad. El nombre, Tetris Effect, se trata de una referencia al famoso efecto tetris. El efecto tetris es la habilidad de cualquier actividad, a la que una persona haya dedicado suficiente tiempo, de controlar los pensamientos, imágenes mentales y sueños del individuo. De esta manera, era común ver cómo distintos jugadores, tras largas sesiones de juego, veían cómo las piezas se desplazaban a su alrededor de forma inconsciente, incluso copando sus sueños e imaginaciones constantemente. Incluye más de 30 fases ambientadas en un entorno que reacciona y evoluciona según nuestra manera '),
(215, 'Tetris Effect Connected', '2020-11-10', 'https://www.instant-gaming.com/en/7369-buy-game-xbox-play-anywhere-tetris-effect-connected/?igr=vandal', '3', 'Monstars Inc. / Resonair', 7, 6, '1', '2021-05-16', '', 8, 'Tetris Effect es un videojuego de rompecabezas diseñado por el creador de Rez, Tetsuya Mizuguchi. El videojuego, para PC y VR, busca ofrecer una nueva vuelta de tuerca al conocido Tetris, jugando con los aspectos visuales y la jugabilidad. El nombre, Tetris Effect, se trata de una referencia al famoso efecto tetris. El efecto tetris es la habilidad de cualquier actividad, a la que una persona haya dedicado suficiente tiempo, de controlar los pensamientos, imágenes mentales y sueños del individuo. De esta manera, era común ver cómo distintos jugadores, tras largas sesiones de juego, veían cómo las piezas se desplazaban a su alrededor de forma inconsciente, incluso copando sus sueños e imaginaciones constantemente. Incluye más de 30 fases ambientadas en un entorno que reacciona y evoluciona según nuestra manera '),
(218, 'Tetris Effect Connected', '2020-11-10', 'https://www.instant-gaming.com/en/7369-buy-game-xbox-play-anywhere-tetris-effect-connected/?igr=vandal', '3', 'Monstars Inc Resonair', 7, 6, '1', '2021-05-16', '336', 8, 'Tetris Effect es un videojuego de rompecabezas diseñado por el creador de Rez, Tetsuya Mizuguchi. El videojuego, para PC y VR, busca ofrecer una nueva vuelta de tuerca al conocido Tetris, jugando con los aspectos visuales y la jugabilidad. El nombre, Tetris Effect, se trata de una referencia al famoso efecto tetris. El efecto tetris es la habilidad de cualquier actividad, a la que una persona haya dedicado suficiente tiempo, de controlar los pensamientos, imágenes mentales y sueños del individuo. De esta manera, era común ver cómo distintos jugadores, tras largas sesiones de juego, veían cómo las piezas se desplazaban a su alrededor de forma inconsciente, incluso copando sus sueños e imaginaciones constantemente. Incluye más de 30 fases ambientadas en un entorno que reacciona y evoluciona según nuestra manera '),
(222, 'MotoGP 21', '2021-04-22', 'https://tutiendadevideojuegos.com/videojuegos-nintendo-switch/10158-motogp-21-nintendo-switch-8057168502756.html', '3', ' Milestone', 9, 6, '1', '2021-05-16', '338', 7, 'Tetris Effect es un videojuego de rompecabezas diseñado por el creador de Rez, Tetsuya Mizuguchi. El videojuego, para PC y VR, busca ofrecer una nueva vuelta de tuerca al conocido Tetris, jugando con los aspectos visuales y la jugabilidad. El nombre, Tetris Effect, se trata de una referencia al famoso efecto tetris. El efecto tetris es la habilidad de cualquier actividad, a la que una persona haya dedicado suficiente tiempo, de controlar los pensamientos, imágenes mentales y sueños del individuo. De esta manera, era común ver cómo distintos jugadores, tras largas sesiones de juego, veían cómo las piezas se desplazaban a su alrededor de forma inconsciente, incluso copando sus sueños e imaginaciones constantemente. Incluye más de 30 fases ambientadas en un entorno que reacciona y evoluciona según nuestra manera '),
(226, 'Rocket League', '2016-02-17', 'https://www.epicgames.com/store/es-ES/p/rocket-league', '3', ' Psyonix', 11, 6, '4', '2021-05-16', '344', 8, 'Se trata de una secuela del juego PlayStation 3 Supersonic Acrobatic Rocket-Powered Battle-Cars, un título que combina velocidad y fútbol. En esta entrega, las principales novedades son mejora de físicas, jugabilidad más rápida, mejores gráficos, desbloqueables, más vehículos, arenas e ítems de personalización, pantalla partida para dos, tres y cuatro jugadores, servidores dedicados y editor de repeticiones para ver las jugadas en el ángulo más espectacular.'),
(227, 'Fights in Tight Spaces', '2021-02-24', 'https://www.instant-gaming.com/en/8647-buy-game-steam-fights-in-tight-spaces/', '16', 'Ground Shatter', 10, 6, '1', '2021-05-16', '340', 6, 'Fights in Tight Spaces es un próximo juego de construcción de mazos roguelike desarrollado por el estudio británico Ground Shatter y publicado por Mode 7 Games. El juego se lanzó en acceso anticipado en febrero de 2021 para Microsoft Windows y Xbox One.'),
(228, 'NBA 2K21', '2020-11-10', 'https://tutiendadevideojuegos.com/videojuegos-xbox-series-x/5455-nba-2k21-xbox-one-5026555363945.html', '3', ' Visual Concepts', 12, 6, '4', '2021-05-16', '348', 8, 'NBA 2K21 es el simulador de baloncesto profesional y callejero de Visual Concepts y 2K Sports. Gracias a la increíble potencia de Xbox Series S/X y PS5, sus responsables han podido crear una experiencia de baloncesto mucho más profunda que lo que habían conseguido hasta ahora, añadiendo mejoras jugables y cambios en el comportamiento de los jugadores o incluso gráficos más realistas. Sagas relacionadas:'),
(229, 'Spacelords', '2020-11-10', 'https://www.microsoft.com/es-es/p/spacelords/9p4d41k02wb8?activetab=pivot:overviewtab', '3', 'MercurySteam', 13, 6, '8', '2021-05-16', '350', 7, 'Spacelords es la reencarnación y reformulación del videojuego de acción en tercera persona Raiders of the Broken Planet. Cambiando su nombre y su estructura, deja de ser un título episódico de acción multijugador para convertirse en un juego online completamente free-to-play. El videojuego incorpora novedades visibles desde el primer momento, con varios tutoriales que de explicarán de manera más clara las bases de la jugabilidad, se mantendrá la estética y el universo de ciencia ficción y se potenciará la progresión de los jugadores a través de recompensas más justas tras cada partida. Aquellos usuarios que jugasen al original, mantendrán su progreso y personajes desbloqueables.'),
(230, 'Yakuza Like a Dragon', '2020-11-13', 'https://www.xbox.com/es-ES/games/yakuza-like-a-dragon', '18', 'SEGA', 14, 6, '1', '2021-05-16', '352', 9, 'Yakuza: Like a Dragon es la nueva entrega de la saga de Sega para PC, PlayStation 4, Xbox One, PlayStation 5 y Xbox Series, ahora como RPG con combates por turnos con nuevo protagonista. Conviértete en Ichiban Kasuga, un yakuza de bajo rango al que el hombre en el que más confiaba dejó al borde de la muerte. Agarra tu bate legendario y prepárate para reventar cráneos de los bajos fondos'),
(231, 'Yakuza Like a Dragon', '2020-11-13', 'https://www.xbox.com/es-ES/games/yakuza-like-a-dragon', '18', 'SEGA', 14, 6, '1', '2021-05-16', '', 9, 'Yakuza: Like a Dragon es la nueva entrega de la saga de Sega para PC, PlayStation 4, Xbox One, PlayStation 5 y Xbox Series, ahora como RPG con combates por turnos con nuevo protagonista. Conviértete en Ichiban Kasuga, un yakuza de bajo rango al que el hombre en el que más confiaba dejó al borde de la muerte. Agarra tu bate legendario y prepárate para reventar cráneos de los bajos fondos'),
(235, 'Juego de prueba', '2021-06-04', 'https://www.google.es/', '12', 'Pedro', 3, 2, '12', '2021-06-04', '', 6, 'sfsdfsf');

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
(15, 9, 17, 'like'),
(16, 9, 26, 'like'),
(17, 9, 63, 'like'),
(19, 9, 67, 'like'),
(20, 9, 78, 'like'),
(21, 10, 17, 'like'),
(22, 10, 26, 'like'),
(24, 10, 63, 'like'),
(25, 10, 67, 'like'),
(26, 10, 78, 'like'),
(27, 11, 17, 'like'),
(28, 11, 26, 'like'),
(30, 11, 63, 'like'),
(31, 11, 67, 'like'),
(32, 11, 78, 'like'),
(33, 12, 17, 'like'),
(34, 12, 26, 'like'),
(35, 12, 63, 'like'),
(36, 12, 67, 'like'),
(37, 12, 78, 'like'),
(38, 13, 17, 'like'),
(39, 13, 26, 'like'),
(40, 13, 67, 'like'),
(41, 13, 78, 'like'),
(42, 14, 17, 'like'),
(43, 14, 26, 'like'),
(44, 14, 67, 'like'),
(45, 15, 17, 'like'),
(46, 15, 26, 'like'),
(47, 16, 17, 'like'),
(48, 9, 19, 'like'),
(49, 9, 32, 'like'),
(50, 9, 50, 'like'),
(51, 9, 52, 'like'),
(52, 9, 34, 'like'),
(53, 9, 57, 'like'),
(54, 9, 25, 'like'),
(55, 9, 75, 'like'),
(56, 9, 65, 'like'),
(57, 9, 80, 'dislike'),
(58, 9, 83, 'like'),
(59, 10, 19, 'like'),
(60, 10, 21, 'like'),
(61, 10, 32, 'like'),
(62, 10, 34, 'like'),
(63, 10, 50, 'like'),
(64, 10, 47, 'like'),
(65, 10, 40, 'like'),
(66, 10, 65, 'like'),
(67, 10, 71, 'like'),
(68, 10, 75, 'like'),
(69, 10, 80, 'like'),
(70, 11, 32, 'like'),
(71, 11, 34, 'like'),
(72, 11, 50, 'like'),
(73, 11, 47, 'like'),
(74, 12, 19, 'like'),
(75, 12, 21, 'like'),
(76, 12, 32, 'like'),
(77, 12, 34, 'like'),
(78, 12, 50, 'like'),
(79, 12, 40, 'like'),
(80, 12, 65, 'like'),
(81, 3, 19, 'like'),
(82, 3, 27, 'like'),
(83, 3, 26, 'dislike');

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

--
-- Volcado de datos para la tabla `reporte`
--

INSERT INTO `reporte` (`id`, `titulo`, `descripcion`, `idComentario`) VALUES
(2, 'Ofensivo', 'No explica bien el motivo por el que no le gusta el juego', 67);

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
(3, 'manuelpalomino484@gmail.com', 'http://localhost/backendPalomino/images/imagenimagenUsuario-3', 'admin', '$2y$10$BfaSEFhgp14z5xBrKE41m.aYV43S1k1Pjy/qFurdpA3Rdkg6sOswK', 'admin'),
(6, 'manuelpalomino4884@gmail.com', 'no_foto', 'Manuel1234', '$2y$10$HCd4Ixng6Q4TSqifHgJMGe6Pvc1lYrs8UqBSFEQ52lEE.eu/pYeKS', 'user'),
(7, 'aujo@gmail.com', 'no_foto', 'aujo21', '$2y$10$GzQVwRwc8b.9RADvEYSose0wmGs3LlB/adNPMSO3hpxRj3AlSMhQm', 'user'),
(8, 'manuelpalomino040@gmail.com', 'no_foto', 'Juabhewr21', '$2y$10$W.PCAGEQP51V5p5PzQNpW.oUoFKAJkE2CzwMrIe09muO4W5BGkn/2', 'user'),
(9, 'jaimepalomino@gmail.com', 'no_foto', 'jaime', '$2y$10$enQbAQ0Gt4MqQoDJhWUU6OKj6f7tRWniK4lKL5VfezEDsSefFX3UC', 'admin'),
(10, 'rocio@gmail.com', 'no_foto', 'rocio', '$2y$10$GSUhGym9i4zOHRPOOfdGteCGslGtXZ5C4YJBROr.WV02fSm3gbHu6', 'user'),
(11, 'angelo@gmail.com', 'no_foto', 'angelo', '$2y$10$kowg7Vanr2HoQRVpYf6BXeBpLL7ZpJJsdiiMV5Z77uQwD33pycTey', 'user'),
(12, 'bianca@gmail.com', 'no_foto', 'bianca', '$2y$10$f8DPHNtVJ2hz4inMhWrpYuFWX5/8znX4R3yJGVtNDPXeGgj5CnOzq', 'user'),
(13, 'roberta@gmail.com', 'no_foto', 'roberta', '$2y$10$byzPTxFkLxNWNLFKnJO65OTOWgGgvesrKwqnX4ae/HyJ7ij5pvCCi', 'user'),
(14, 'julimentos@gmail.com', 'no_foto', 'juli', '$2y$10$HjV367zDqL7Qe0YHfpCJ2.AtuYLgJLow0CwSZtbgIKRoZltiDbLSy', 'user'),
(15, 'taquito@gmail.com', 'no_foto', 'taquito', '$2y$10$vJY3q0fhT/Z1/DivPuNMLenv9Dx0Cq5S5aVgRpXtbU846GavKMTdC', 'user'),
(16, 'alvaro@gmail.com', 'no_foto', 'varo', '$2y$10$QuX5TnQcu8zMqycUeOxIVe23dumvQYJPgE85b/TUFbOsGwqXW.Ica', 'user');

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
(12, 'https://www.youtube.com/watch?v=wGQHQc_3ycE', 40),
(13, 'https://www.youtube.com/watch?v=wGQHQc_3ycE', 40),
(14, 'https://www.youtube.com/watch?v=5kcdRBHM7kM', 40),
(109, 'https://www.youtube.com/watch?v=KQCDj3emnHk', 116),
(110, 'https://www.youtube.com/watch?v=KQCDj3emnHk', 116),
(111, 'https://www.youtube.com/watch?v=KQCDj3emnHk', 116),
(112, 'https://www.youtube.com/watch?v=KQCDj3emnHk', 116),
(113, 'https://www.youtube.com/watch?v=KQCDj3emnHk', 116),
(165, 'https://www.youtube.com/watch?v=2gUtfBmw86Y', 160),
(171, 'https://www.youtube.com/watch?v=gHzuHo80U2M', 167),
(172, 'https://www.youtube.com/watch?v=gHzuHo80U2M', 167),
(174, 'https://www.youtube.com/watch?v=gHzuHo80U2M', 167),
(175, 'https://www.youtube.com/watch?v=OZpxY9BdsaI', 167),
(176, 'https://www.youtube.com/watch?v=gHzuHo80U2M', 167),
(179, 'https://www.youtube.com/watch?v=tqSY9mlmWIs', 43),
(180, 'https://www.youtube.com/watch?v=WShCN-AYHqA', 43),
(186, 'https://www.youtube.com/watch?v=7pu9t5AL1Ss', 55),
(187, 'https://www.youtube.com/watch?v=7pu9t5AL1Ss', 55),
(188, 'https://www.youtube.com/watch?v=4i13ZZr4Urc', 59),
(189, 'https://www.youtube.com/watch?v=CZ1XCOI1d0M', 59),
(192, 'https://www.youtube.com/watch?v=Lo4mGTfhuDg', 61),
(193, 'https://www.youtube.com/watch?v=cSyLk-K3wqg', 61),
(194, 'https://www.youtube.com/watch?v=9UaWxylfEMk', 79),
(195, 'https://www.youtube.com/watch?v=A1-sb3SPtLk', 79),
(198, 'https://www.youtube.com/watch?v=3LscIoIzQ_w', 91),
(199, 'https://www.youtube.com/watch?v=hqIYz7e6pjk', 91),
(200, 'https://www.youtube.com/watch?v=zrunNL3xsUY', 92),
(201, 'https://www.youtube.com/watch?v=NKo4BgDnlfQ', 92),
(204, 'https://www.youtube.com/watch?v=bxFoRCvEjUA', 97),
(205, 'https://www.youtube.com/watch?v=7zwQPJmg-Kg', 97),
(206, 'https://www.youtube.com/watch?v=bxFoRCvEjUA', 101),
(207, 'https://www.youtube.com/watch?v=llHV5peZ8hg', 101),
(210, 'https://www.youtube.com/watch?v=Vz0BriND6pE', 129),
(211, 'https://www.youtube.com/watch?v=tNgCy92QWZY', 129),
(212, 'https://www.youtube.com/watch?v=aOadxZBsPiA', 133),
(213, 'https://www.youtube.com/watch?v=VCn430sHLxs', 133),
(214, 'https://www.youtube.com/watch?v=wF0vF1uXXYU', 134),
(215, 'https://www.youtube.com/watch?v=T58oOjZW-BE', 134),
(216, 'https://www.youtube.com/watch?v=SKWR8B0LlhI', 136),
(217, 'https://www.youtube.com/watch?v=eDCH0AY4ujg', 136),
(218, 'https://www.youtube.com/watch?v=AqzMjzQ9pH4', 139),
(219, 'https://www.youtube.com/watch?v=CpWe03NhXKs', 139),
(220, 'https://www.youtube.com/watch?v=OiV3-dZFsQY', 140),
(221, 'https://www.youtube.com/watch?v=tuLAn9adQpI', 140),
(222, 'https://www.youtube.com/watch?v=VSLSvEjDm5s', 141),
(223, 'https://www.youtube.com/watch?v=qPNiIeKMHyg', 141),
(224, 'https://www.youtube.com/watch?v=e7Q2Ipb322M', 143),
(225, 'https://www.youtube.com/watch?v=Ul_7AaZVyvs', 143),
(226, 'https://www.youtube.com/watch?v=q8AytUQi0ZM', 144),
(227, 'https://www.youtube.com/watch?v=O3TsHpeJ1Vw', 144),
(228, 'https://www.youtube.com/watch?v=8IvIFIz1hyM', 145),
(229, 'https://www.youtube.com/watch?v=_7BzngvURrk', 145),
(232, 'https://www.youtube.com/watch?v=KlbLLRdg9u8', 147),
(233, 'https://www.youtube.com/watch?v=6wlvYh0h63k', 147),
(234, 'https://www.youtube.com/watch?v=TYqJALPVn0Y', 148),
(235, 'https://www.youtube.com/watch?v=6wlvYh0h63k', 148),
(236, 'https://www.youtube.com/watch?v=A-Aw5EIkkHg', 149),
(237, 'https://www.youtube.com/watch?v=wB22pGSf1Vs', 149),
(238, 'https://www.youtube.com/watch?v=ts-j0nFf2e0', 152),
(239, 'https://www.youtube.com/watch?v=A88YiZdXugA', 152),
(240, 'https://www.youtube.com/watch?v=5xy4n73WOMM', 153),
(241, 'https://www.youtube.com/watch?v=RCRYs7yfeo4', 153),
(242, 'https://www.youtube.com/watch?v=_8NGEpmd7WU', 157),
(243, 'https://www.youtube.com/watch?v=MVbeoSPqRs4', 157),
(244, 'https://www.youtube.com/watch?v=xlTuC18xVII', 158),
(245, 'https://www.youtube.com/watch?v=MVEBdGZ7UcM', 158),
(246, 'https://www.youtube.com/watch?v=4yFN6IM3wXw', 159),
(247, 'https://www.youtube.com/watch?v=no_IUGXGFEI', 159),
(248, 'https://www.youtube.com/watch?v=JSRtYpNRoN0', 162),
(249, 'https://www.youtube.com/watch?v=QTDdzRSnbaM', 162),
(250, 'https://www.youtube.com/watch?v=CYLvi3DTwAw', 164),
(251, 'https://www.youtube.com/watch?v=JJ5TQIpDFvw', 164),
(252, 'https://www.youtube.com/watch?v=gHzuHo80U2M', 167),
(253, 'https://www.youtube.com/watch?v=lnTN93FgbnY', 167),
(254, 'https://www.youtube.com/watch?v=0E44DClsX5Q', 172),
(255, 'https://www.youtube.com/watch?v=bhMT4YAGMBs', 172),
(256, 'https://www.youtube.com/watch?v=0E44DClsX5Q', 172),
(257, 'https://www.youtube.com/watch?v=bhMT4YAGMBs', 172),
(258, 'https://www.youtube.com/watch?v=0E44DClsX5Q', 172),
(259, 'https://www.youtube.com/watch?v=bhMT4YAGMBs', 172),
(260, 'https://www.youtube.com/watch?v=6uUdSFGYlNU', 175),
(261, 'https://www.youtube.com/watch?v=kiKlyfFx3sQ', 175),
(262, 'https://www.youtube.com/watch?v=m8P9Cwvkm3g', 176),
(263, 'https://www.youtube.com/watch?v=W4gLt4oSxNs', 176),
(264, 'https://www.youtube.com/watch?v=ceMkmsyzCoc', 177),
(265, 'https://www.youtube.com/watch?v=3AGQQF_VQeo', 177),
(266, 'https://www.youtube.com/watch?v=I8Hss6uxINE', 178),
(267, 'https://www.youtube.com/watch?v=911eAdR0vSM', 178),
(270, 'https://www.youtube.com/watch?v=J9akE-42wyU', 180),
(271, 'https://www.youtube.com/watch?v=Bn7KXrj4lbc', 180),
(272, 'https://www.youtube.com/watch?v=2kPSl2vyu2Y', 181),
(273, 'https://www.youtube.com/watch?v=2reK8k8nwBc', 181),
(274, 'https://www.youtube.com/watch?v=0N9qROWDGRM', 182),
(275, 'https://www.youtube.com/watch?v=eQkI1nEo75s', 182),
(276, 'https://www.youtube.com/watch?v=0N9qROWDGRM', 182),
(277, 'https://www.youtube.com/watch?v=eQkI1nEo75s', 182),
(282, 'https://www.youtube.com/watch?v=rdix1XxaZyU', 186),
(283, 'https://www.youtube.com/watch?v=akkeVvmZOzk', 186),
(284, 'https://www.youtube.com/watch?v=MC2qa5mfRJ8', 187),
(285, 'https://www.youtube.com/watch?v=MuALIzdDZRA', 187),
(286, 'https://www.youtube.com/watch?v=MC2qa5mfRJ8', 187),
(287, 'https://www.youtube.com/watch?v=MuALIzdDZRA', 187),
(288, 'https://www.youtube.com/watch?v=6sZSOuwllrE', 189),
(289, 'https://www.youtube.com/watch?v=PqeDvBJraMk', 189),
(296, 'https://www.youtube.com/watch?v=18-_9E0HNY4', 192),
(297, 'https://www.youtube.com/watch?v=s3MabEog3yQ', 192),
(330, 'https://www.youtube.com/watch?v=fnd71bqiiW0', 146),
(331, 'https://www.youtube.com/watch?v=Mx25Q3LKQ9Q', 146),
(344, 'https://www.youtube.com/watch?v=oBI0MU73nlc', 190),
(345, 'https://www.youtube.com/watch?v=Zas4Hya4Qo4', 190),
(350, 'https://www.youtube.com/watch?v=YESNObZJTgQ', 194),
(351, 'https://www.youtube.com/watch?v=dwvjElmFCfE', 194),
(352, 'https://www.youtube.com/watch?v=701qY9G4sI0', 195),
(353, 'https://www.youtube.com/watch?v=WRvoNadPwRY', 195),
(354, 'https://www.youtube.com/watch?v=5ABy76KTMe8', 196),
(355, 'https://www.youtube.com/watch?v=SUvVmc3z8Io', 196),
(356, 'https://www.youtube.com/watch?v=wZprbtu5t3o', 197),
(357, 'https://www.youtube.com/watch?v=EbUYVkzbMeM', 197),
(358, 'https://www.youtube.com/watch?v=A6AHjLPJq2E', 198),
(359, 'https://www.youtube.com/watch?v=UK0yIgmqoOA', 198),
(360, 'https://www.youtube.com/watch?v=ixeHjuPKlUU', 199),
(361, 'https://www.youtube.com/watch?v=ixeHjuPKlUU', 199),
(362, 'https://www.youtube.com/watch?v=kfEUX1fVy5A', 200),
(363, 'https://www.youtube.com/watch?v=HNY5nsyMm-A', 200),
(364, 'https://www.youtube.com/watch?v=q_Qi14S4Djw', 201),
(365, 'https://www.youtube.com/watch?v=SEpWlFfpEkU', 201),
(366, 'https://www.youtube.com/watch?v=P1hbZQSMDP8', 202),
(367, 'https://www.youtube.com/watch?v=4OgoTZXPACo', 202),
(368, 'https://www.youtube.com/watch?v=P1hbZQSMDP8', 202),
(369, 'https://www.youtube.com/watch?v=4OgoTZXPACo', 202),
(370, 'https://www.youtube.com/watch?v=P1hbZQSMDP8', 202),
(371, 'https://www.youtube.com/watch?v=4OgoTZXPACo', 202),
(372, 'https://www.youtube.com/watch?v=P1hbZQSMDP8', 202),
(373, 'https://www.youtube.com/watch?v=4OgoTZXPACo', 202),
(374, 'https://www.youtube.com/watch?v=CNMHUZbnKkY', 206),
(375, 'https://www.youtube.com/watch?v=iGdJ4O_olBE', 206),
(376, 'https://www.youtube.com/watch?v=CNMHUZbnKkY', 206),
(377, 'https://www.youtube.com/watch?v=iGdJ4O_olBE', 206),
(378, 'https://www.youtube.com/watch?v=EeKPSgBmd4Q', 208),
(379, 'https://www.youtube.com/watch?v=qgbr5rDOlC0', 208),
(380, 'https://www.youtube.com/watch?v=kJ5JciwKjcM', 209),
(381, 'https://www.youtube.com/watch?v=KFmT5jXswV0', 209),
(382, 'https://www.youtube.com/watch?v=xYW7-aW9R7c', 210),
(383, 'https://www.youtube.com/watch?v=MI08MPiL7WQ', 210),
(384, 'https://www.youtube.com/watch?v=xYW7-aW9R7c', 210),
(385, 'https://www.youtube.com/watch?v=MI08MPiL7WQ', 210),
(386, 'https://www.youtube.com/watch?v=xYW7-aW9R7c', 210),
(387, 'https://www.youtube.com/watch?v=MI08MPiL7WQ', 210),
(388, 'https://www.youtube.com/watch?v=_-sPtVEw6xQ', 213),
(389, 'https://www.youtube.com/watch?v=xzUiIsPx89o', 213),
(390, 'https://www.youtube.com/watch?v=CCBpwyS0E1o', 214),
(391, 'https://www.youtube.com/watch?v=gT2TfOoNlrs', 214),
(392, 'https://www.youtube.com/watch?v=CCBpwyS0E1o', 214),
(393, 'https://www.youtube.com/watch?v=gT2TfOoNlrs', 214),
(398, 'https://www.youtube.com/watch?v=CCBpwyS0E1o', 218),
(399, 'https://www.youtube.com/watch?v=gT2TfOoNlrs', 218),
(400, 'https://www.youtube.com/watch?v=CCBpwyS0E1o', 218),
(401, 'https://www.youtube.com/watch?v=gT2TfOoNlrs', 218),
(402, 'https://www.youtube.com/watch?v=CCBpwyS0E1o', 218),
(403, 'https://www.youtube.com/watch?v=gT2TfOoNlrs', 218),
(404, 'https://www.youtube.com/watch?v=CCBpwyS0E1o', 218),
(405, 'https://www.youtube.com/watch?v=gT2TfOoNlrs', 218),
(406, 'https://www.youtube.com/watch?v=we1QOQ1WVDg', 222),
(407, 'https://www.youtube.com/watch?v=RCpvQpAilA8', 222),
(416, 'https://www.youtube.com/watch?v=SgSX3gOrj60', 226),
(417, 'https://www.youtube.com/watch?v=cDOQTcagOyc', 226),
(418, 'https://www.youtube.com/watch?v=eFvirN-0ync', 227),
(419, 'https://www.youtube.com/watch?v=UNZspBlaEZI', 227),
(420, 'https://www.youtube.com/watch?v=UwwySDPim5g', 228),
(421, 'https://www.youtube.com/watch?v=0NSQahGpqv0', 228),
(422, 'https://www.youtube.com/watch?v=kARfTUwQKLU', 229),
(423, 'https://www.youtube.com/watch?v=a-5vb-Dt2Xk', 229),
(424, 'https://www.youtube.com/watch?v=8GsQ1dTw-IA', 230),
(425, 'https://www.youtube.com/watch?v=SRuh6aOo7T0', 230),
(426, 'https://www.youtube.com/watch?v=8GsQ1dTw-IA', 230),
(427, 'https://www.youtube.com/watch?v=SRuh6aOo7T0', 230),
(432, 'https://www.youtube.com/watch?v=DFH2gtPu8SM', 57),
(433, 'https://www.youtube.com/watch?v=DFH2gtPu8SM', 57),
(446, 'https://www.youtube.com/watch?v=pJNbm1Keofo', 60),
(447, 'https://www.youtube.com/watch?v=Gsmbmrn8TRg', 60),
(448, 'https://www.youtube.com/watch?v=b4P1KbOrp1k', 42),
(449, 'https://www.youtube.com/watch?v=OZpxY9BdsaI', 42),
(450, 'https://www.youtube.com/watch?v=nByiLNMqC6Y', 53),
(451, 'https://www.youtube.com/watch?v=vMdNO4eMAg0', 53),
(452, 'https://www.youtube.com/watch?v=dGrT8f3jT7c', 54),
(453, 'https://www.youtube.com/watch?v=-3XZG4ZVCOY', 54),
(454, 'https://www.youtube.com/watch?v=MsbL8lFHrZI', 85),
(455, 'https://www.youtube.com/watch?v=Q6cIRZlMQ3g', 85),
(456, 'https://www.youtube.com/watch?v=SS6YC7L3L-k', 94),
(457, 'https://www.youtube.com/watch?v=b70uw0XxeLg', 94);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `codigorecuperacion`
--
ALTER TABLE `codigorecuperacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuarioCodigo` (`idUsuario`);

--
-- Indices de la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comentarioUsuario` (`idUsuario`),
  ADD KEY `comentarioJuego` (`idJuego`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `imagenes`
--
ALTER TABLE `imagenes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `juegoImagen` (`idJuego`);

--
-- Indices de la tabla `juego`
--
ALTER TABLE `juego`
  ADD PRIMARY KEY (`id`),
  ADD KEY `genero` (`genero`),
  ADD KEY `plataforma` (`plataforma`);

--
-- Indices de la tabla `likedislike`
--
ALTER TABLE `likedislike`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuarioLike` (`idUsuario`),
  ADD KEY `comentarioLike` (`idComentario`);

--
-- Indices de la tabla `plataforma`
--
ALTER TABLE `plataforma`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reporte`
--
ALTER TABLE `reporte`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reporte` (`idComentario`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `juegoVideos` (`idJuego`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `codigorecuperacion`
--
ALTER TABLE `codigorecuperacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `comentario`
--
ALTER TABLE `comentario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `imagenes`
--
ALTER TABLE `imagenes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=363;

--
-- AUTO_INCREMENT de la tabla `juego`
--
ALTER TABLE `juego`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=236;

--
-- AUTO_INCREMENT de la tabla `likedislike`
--
ALTER TABLE `likedislike`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT de la tabla `plataforma`
--
ALTER TABLE `plataforma`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `reporte`
--
ALTER TABLE `reporte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=462;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `codigorecuperacion`
--
ALTER TABLE `codigorecuperacion`
  ADD CONSTRAINT `usuarioCodigo` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `comentarioJuego` FOREIGN KEY (`idJuego`) REFERENCES `juego` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comentarioUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `imagenes`
--
ALTER TABLE `imagenes`
  ADD CONSTRAINT `juegoImagen` FOREIGN KEY (`idJuego`) REFERENCES `juego` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `juego`
--
ALTER TABLE `juego`
  ADD CONSTRAINT `genero` FOREIGN KEY (`genero`) REFERENCES `genero` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `plataforma` FOREIGN KEY (`plataforma`) REFERENCES `plataforma` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `likedislike`
--
ALTER TABLE `likedislike`
  ADD CONSTRAINT `comentarioLike` FOREIGN KEY (`idComentario`) REFERENCES `comentario` (`id`),
  ADD CONSTRAINT `usuarioLike` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reporte`
--
ALTER TABLE `reporte`
  ADD CONSTRAINT `reporte` FOREIGN KEY (`idComentario`) REFERENCES `comentario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `juegoVideos` FOREIGN KEY (`idJuego`) REFERENCES `juego` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
