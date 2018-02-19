-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 05-02-2018 a las 17:17:31
-- Versión del servidor: 5.7.21-0ubuntu0.17.10.1
-- Versión de PHP: 7.0.22-0ubuntu0.17.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `escuela`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `idAlumno` int(11) NOT NULL,
  `nombreAlumno` varchar(45) NOT NULL,
  `fechaNacimiento` datetime NOT NULL,
  `idCarrera` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`idAlumno`, `nombreAlumno`, `fechaNacimiento`, `idCarrera`) VALUES
(1, 'son', '1988-02-01 13:45:59', 1),
(2, 'tonic', '1988-02-12 14:45:59', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `idAsignatura` int(11) NOT NULL,
  `nombreAsignatura` varchar(45) NOT NULL,
  `idCarrera` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`idAsignatura`, `nombreAsignatura`, `idCarrera`) VALUES
(1, 'introduccion programacion', 1),
(2, 'poo', 1),
(3, 'modelado 3D', 2),
(4, 'texturas 2D', 2),
(5, 'introduccion base de datos', 1),
(6, 'introduccion modelado', 2),
(7, 'base de datos avanzadas', 1),
(8, 'sistemas operativos', 1),
(9, 'base de datos distribuidas', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `idCarrera` int(11) NOT NULL,
  `nombreCarrera` varchar(45) NOT NULL,
  `altaCarrera` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`idCarrera`, `nombreCarrera`, `altaCarrera`) VALUES
(1, 'programacion', '2018-01-13 19:41:36'),
(2, 'diseño', '2018-01-13 20:03:54'),
(3, 'psicologia', '2018-01-13 20:04:16'),
(4, 'finanzas', '2018-01-13 20:04:45'),
(5, 'contabilidad', '1988-02-01 13:45:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `idGrupo` int(11) NOT NULL,
  `nombreGrupo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`idGrupo`, `nombreGrupo`) VALUES
(1, 'a1'),
(2, 'a2'),
(3, 'c1'),
(4, 'c2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE `profesor` (
  `idProfesor` int(11) NOT NULL,
  `nombreProfesor` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `profesor`
--

INSERT INTO `profesor` (`idProfesor`, `nombreProfesor`) VALUES
(1, 'ana'),
(2, 'samperio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesorgrupomap`
--

CREATE TABLE `profesorgrupomap` (
  `idProfesor` int(11) NOT NULL,
  `idGrupo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `profesorgrupomap`
--

INSERT INTO `profesorgrupomap` (`idProfesor`, `idGrupo`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 3),
(1, 4),
(2, 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`idAlumno`,`idCarrera`),
  ADD KEY `fk_alumnos_carreras_idx` (`idCarrera`);

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`idAsignatura`),
  ADD KEY `fk_materia_carrera1_idx` (`idCarrera`);

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`idCarrera`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`idGrupo`);

--
-- Indices de la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`idProfesor`);

--
-- Indices de la tabla `profesorgrupomap`
--
ALTER TABLE `profesorgrupomap`
  ADD PRIMARY KEY (`idProfesor`,`idGrupo`),
  ADD KEY `fk_profesor_has_grupo_grupo1_idx` (`idGrupo`),
  ADD KEY `fk_profesor_has_grupo_profesor1_idx` (`idProfesor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumno`
--
ALTER TABLE `alumno`
  MODIFY `idAlumno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  MODIFY `idAsignatura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `carrera`
--
ALTER TABLE `carrera`
  MODIFY `idCarrera` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `grupo`
--
ALTER TABLE `grupo`
  MODIFY `idGrupo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `profesor`
--
ALTER TABLE `profesor`
  MODIFY `idProfesor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD CONSTRAINT `FK85as5qk605jifkyx7c16btmng` FOREIGN KEY (`idCarrera`) REFERENCES `carrera` (`idCarrera`),
  ADD CONSTRAINT `fk_alumnos_carreras` FOREIGN KEY (`idCarrera`) REFERENCES `carrera` (`idCarrera`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD CONSTRAINT `FKj8dd35h7fdoc5l66dsack9bw2` FOREIGN KEY (`idCarrera`) REFERENCES `carrera` (`idCarrera`),
  ADD CONSTRAINT `fk_materia_carrera1` FOREIGN KEY (`idCarrera`) REFERENCES `carrera` (`idCarrera`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `profesorgrupomap`
--
ALTER TABLE `profesorgrupomap`
  ADD CONSTRAINT `FK2v63tdi3c431qvnlkeo0i1dbd` FOREIGN KEY (`idProfesor`) REFERENCES `profesor` (`idProfesor`),
  ADD CONSTRAINT `FK6j5c3tqk5fnjki5woirgwl7tx` FOREIGN KEY (`idGrupo`) REFERENCES `grupo` (`idGrupo`),
  ADD CONSTRAINT `fk_profesor_has_grupo_grupo1` FOREIGN KEY (`idGrupo`) REFERENCES `grupo` (`idGrupo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_profesor_has_grupo_profesor1` FOREIGN KEY (`idProfesor`) REFERENCES `profesor` (`idProfesor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
