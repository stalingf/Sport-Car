-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2016 at 04:34 AM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 5.5.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sportcar`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ID` mediumint(9) NOT NULL,
  `Nombre` varchar(200) NOT NULL,
  `Apellido` varchar(200) NOT NULL,
  `Cedula` varchar(200) NOT NULL,
  `Telefono` varchar(200) NOT NULL,
  `Foto` varchar(200) NOT NULL,
  `rango` varchar(50) NOT NULL,
  `clave` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`ID`, `Nombre`, `Apellido`, `Cedula`, `Telefono`, `Foto`, `rango`, `clave`, `email`) VALUES
(1, 'STALING', 'JIM', '11', '2545465', '', '10', 'ss', 'ss@gmail.com'),
(2, 'YOO', 'tu', '555', '444555', 'images/CLIENTES/YOO/n@gmail.com', '1', '555', 'n@gmail.com'),
(3, 'YOO', 'tu', '555', '444555', 'images/ADMIN/YOO/nm@gmail.com', '1', '555', 'nm@gmail.com'),
(4, 'claudia', 'suarez', '1235', '5535', 'images/ADMIN/claudia/cla@gmail.com', '10', '1235', 'cla@gmail.com'),
(5, 'yo', 'kjl', '455', '455', 'images/ADMIN/yo/s@gmail.comm', '10', '455', 's@gmail.comm'),
(6, 'YO', 'JSKLJF', '11', '5555', 'images/ADMIN/YO/YO@GMAIL.COM', '1', '11', 'YO@GMAIL.COM');

-- --------------------------------------------------------

--
-- Table structure for table `alquilado`
--

CREATE TABLE `alquilado` (
  `ID` mediumint(9) NOT NULL,
  `nombreCliente` varchar(200) NOT NULL,
  `apellidoCliente` varchar(200) NOT NULL,
  `cedulaCliente` varchar(200) NOT NULL,
  `fotoCliente` varchar(200) NOT NULL,
  `marcaAuto` varchar(200) NOT NULL,
  `modeloAuto` varchar(200) NOT NULL,
  `codigoAuto` varchar(200) NOT NULL,
  `fotoAuto` varchar(200) NOT NULL,
  `rentadoDia` varchar(200) DEFAULT NULL,
  `paraEntregar` varchar(200) DEFAULT NULL,
  `RegresadoDia` varchar(200) DEFAULT NULL,
  `estado` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `alquilado`
--

INSERT INTO `alquilado` (`ID`, `nombreCliente`, `apellidoCliente`, `cedulaCliente`, `fotoCliente`, `marcaAuto`, `modeloAuto`, `codigoAuto`, `fotoAuto`, `rentadoDia`, `paraEntregar`, `RegresadoDia`, `estado`) VALUES
(1, 'YONQUE', 'FULANO', '55', '12', 'NOSE', 'TAMPOCO', '27116028', '15', '2016/01/18 15:54:38', '2016-01-09', '2016/01/19 00:20:06', 'Regresado'),
(2, 'YONQUE', 'FULANO', '55', 'images/CLIENTES/YONQUE/55', 'CARRO', 'KYYY', '23116278', 'images/AUTOS/CARRO/KYYY/2015/23116278/231162781', '2016/01/18 15:59:32', '2016-01-10', '2016/01/21 13:55:44', 'Regresado'),
(3, 'YONQUE', 'FULANO', '55 ', 'images/CLIENTES/YONQUE/55 ', 'NOSE', 'TAMPOCO', '27116028', 'images/AUTOS/NOSE/TAMPOCO/2015/27116028/271160281', '2016/01/19 00:18:56', '2016-01-09', '2016/01/19 00:20:06', 'Regresado'),
(4, 'YONQUE', 'FULANO', '55 ', 'images/CLIENTES/YONQUE/55 ', 'BMW', 'ZX-8', '23116278', 'images/AUTOS/CARRO/KYYY/2015/23116278/231162781', '2016/01/19 23:21:54', '2016-01-08', '2016/01/21 13:55:44', 'Regresado');

-- --------------------------------------------------------

--
-- Table structure for table `autos`
--

CREATE TABLE `autos` (
  `ID` mediumint(9) NOT NULL,
  `marca` varchar(200) NOT NULL,
  `modelo` varchar(200) NOT NULL,
  `ano` varchar(200) NOT NULL,
  `codigo` varchar(200) NOT NULL,
  `foto1` varchar(200) NOT NULL,
  `foto2` varchar(200) DEFAULT NULL,
  `foto3` varchar(200) DEFAULT NULL,
  `foto4` varchar(200) DEFAULT NULL,
  `foto5` varchar(200) DEFAULT NULL,
  `estado` varchar(200) NOT NULL,
  `color` varchar(200) NOT NULL,
  `taza` varchar(200) NOT NULL,
  `motivo` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `autos`
--

INSERT INTO `autos` (`ID`, `marca`, `modelo`, `ano`, `codigo`, `foto1`, `foto2`, `foto3`, `foto4`, `foto5`, `estado`, `color`, `taza`, `motivo`) VALUES
(20, 'NN', 'NNN', '2012', '16316016', 'images/AUTOS/NN/NNN/2012/16316016/163160161', 'images/AUTOS/NN/NNN/2012/16316016/163160162', 'images/AUTOS/NN/NNN/2012/16316016/163160163', 'images/AUTOS/NN/NNN/2012/16316016/163160164', 'images/AUTOS/NN/NNN/2012/16316016/163160165', 'Disponible', 'MM', '500', NULL),
(21, 'NN', 'NN', '2012', '21316596', 'images/AUTOS/NN/NN/2012/21316596/213165961', NULL, NULL, NULL, NULL, 'Disponible', 'NNN', '500', NULL),
(22, 'TOYOTA', 'CAMRY', '2012', '29316066', 'images/AUTOS/TOYOTA/CAMRY/2012/29316066/293160661', NULL, NULL, NULL, NULL, 'Disponible', 'BLANCO', '500', NULL),
(23, 'UUU', 'UUU', '2012', '30316466', 'images/AUTOS/UUU/UUU/2012/30316466/303164661', NULL, NULL, NULL, NULL, 'Disponible', 'MMM', '500', NULL),
(24, 'NN', 'NNN', '2012', '31316416', 'images/AUTOS/NN/NNN/2012/31316416/313164161', NULL, NULL, NULL, NULL, 'Disponible', 'NN', '500', NULL),
(25, 'HH', 'HH', '2012', '32316216', 'images/AUTOS/HH/HH/2012/32316216/323162161', NULL, NULL, NULL, NULL, 'Disponible', 'HH', '500', NULL),
(26, 'KJKK', 'KJKJ', '2015', '33316106', 'images/AUTOS/KJKK/KJKJ/2015/33316106/333161061', NULL, NULL, NULL, NULL, 'Disponible', 'KJKJKJJ', '500', NULL),
(27, 'KJH', 'KJLKJ', '2015', '34316436', 'images/AUTOS/KJH/KJLKJ/2015/34316436/343164361', NULL, NULL, NULL, NULL, 'Disponible', 'LJLK', '685', NULL),
(28, 'SJFDLJ', 'LKJLKJLK', '2012', '39316016', 'images/AUTOS/SJFDLJ/LKJLKJLK/2012/39316016/393160161', NULL, NULL, NULL, NULL, 'Disponible', 'LKJ', '500', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `ID` mediumint(9) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `apellido` varchar(200) NOT NULL,
  `cedula` varchar(200) NOT NULL,
  `telefono` varchar(200) NOT NULL,
  `foto` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`ID`, `nombre`, `apellido`, `cedula`, `telefono`, `foto`) VALUES
(12, 'STALING', 'FURCAL', '55  ', '44  ', 'images/CLIENTES/STALING/55  ');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `alquilado`
--
ALTER TABLE `alquilado`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `autos`
--
ALTER TABLE `autos`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `ID` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `alquilado`
--
ALTER TABLE `alquilado`
  MODIFY `ID` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `autos`
--
ALTER TABLE `autos`
  MODIFY `ID` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
