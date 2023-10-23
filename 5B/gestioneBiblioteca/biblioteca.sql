-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Ott 17, 2023 alle 14:24
-- Versione del server: 10.4.27-MariaDB
-- Versione PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `biblioteca`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `autori`
--

CREATE TABLE `autori` (
  `CodiceAutore` int(4) NOT NULL,
  `Nominativo` char(45) NOT NULL,
  `Nazione` char(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `copie`
--

CREATE TABLE `copie` (
  `NumeroInventario` int(11) NOT NULL,
  `Collocazione` char(5) NOT NULL,
  `DataPrestito` date NOT NULL,
  `CodiceLibro` int(11) NOT NULL,
  `CodiceSocio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `editori`
--

CREATE TABLE `editori` (
  `CodiceEditore` int(4) NOT NULL,
  `Nome` char(45) NOT NULL,
  `Indirizzo` char(60) NOT NULL,
  `Agente` char(45) NOT NULL,
  `Telefono` int(11) NOT NULL,
  `SitoWeb` char(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `libri`
--

CREATE TABLE `libri` (
  `CodiceLibro` int(4) NOT NULL,
  `Titolo` text NOT NULL,
  `AnnoPubblicazione` year(4) NOT NULL,
  `Lingua` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `parolechiave`
--

CREATE TABLE `parolechiave` (
  `CodiceParolaChiave` int(11) NOT NULL,
  `Descrizione` char(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `pubblicano`
--

CREATE TABLE `pubblicano` (
  `Progressivo` int(11) NOT NULL,
  `CodiceLibro` int(11) NOT NULL,
  `CodiceEditore` int(11) NOT NULL,
  `AnnoStampa` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `scrivono`
--

CREATE TABLE `scrivono` (
  `CodiceLibro` int(4) NOT NULL,
  `CodiceAutore` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `soci`
--

CREATE TABLE `soci` (
  `CodiceSocio` char(4) NOT NULL,
  `Nominativo` char(45) NOT NULL,
  `Indirizzo` char(35) NOT NULL,
  `Telefono` int(11) NOT NULL,
  `Email` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `sonocontenute`
--

CREATE TABLE `sonocontenute` (
  `CodiceLibro` int(11) NOT NULL,
  `CodiceParolaChiave` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `autori`
--
ALTER TABLE `autori`
  ADD PRIMARY KEY (`CodiceAutore`);

--
-- Indici per le tabelle `copie`
--
ALTER TABLE `copie`
  ADD PRIMARY KEY (`NumeroInventario`);

--
-- Indici per le tabelle `editori`
--
ALTER TABLE `editori`
  ADD PRIMARY KEY (`CodiceEditore`);

--
-- Indici per le tabelle `libri`
--
ALTER TABLE `libri`
  ADD PRIMARY KEY (`CodiceLibro`);

--
-- Indici per le tabelle `parolechiave`
--
ALTER TABLE `parolechiave`
  ADD PRIMARY KEY (`CodiceParolaChiave`);

--
-- Indici per le tabelle `pubblicano`
--
ALTER TABLE `pubblicano`
  ADD PRIMARY KEY (`Progressivo`);

--
-- Indici per le tabelle `soci`
--
ALTER TABLE `soci`
  ADD PRIMARY KEY (`CodiceSocio`);

--
-- Indici per le tabelle `sonocontenute`
--
ALTER TABLE `sonocontenute`
  ADD PRIMARY KEY (`CodiceLibro`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
