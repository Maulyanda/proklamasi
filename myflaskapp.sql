-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 18, 2019 at 04:30 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myflaskapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(10) NOT NULL,
  `title` varchar(50) NOT NULL,
  `body` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `create_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `title`, `body`, `author`, `create_date`) VALUES
(1, 'mr', 'a', '', '2019-02-03'),
(2, 'Book', 'DILAN', 'nanda', '2019-02-04');

-- --------------------------------------------------------

--
-- Table structure for table `cek_loc`
--

CREATE TABLE `cek_loc` (
  `true_cek` varchar(50) NOT NULL,
  `false_cek` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cek_loc`
--

INSERT INTO `cek_loc` (`true_cek`, `false_cek`) VALUES
('87', ''),
('', '13');

-- --------------------------------------------------------

--
-- Table structure for table `coba`
--

CREATE TABLE `coba` (
  `part_number` varchar(50) NOT NULL,
  `wms` varchar(50) NOT NULL,
  `les` varchar(50) NOT NULL,
  `cek` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coba`
--

INSERT INTO `coba` (`part_number`, `wms`, `les`, `cek`) VALUES
('23512807', 'CGA-A01-39A', 'CGA-A01-39A', 'TRUE'),
('23516528', 'LOC-J7-04', 'LOC-J7-04', 'TRUE'),
('23520650', 'CGA-A01-06', 'CGA-A01-06', 'TRUE'),
('23521487', 'CGA-A01-12', 'CGA-A01-12', 'TRUE'),
('23528673', 'LOC-J6-05', 'LOC-J6-05', 'TRUE'),
('23531360', 'LOC-J6-06', 'LOC-J6-06', 'TRUE'),
('23534677', 'CGA-A01-21', 'CGA-A01-21', 'TRUE'),
('23534678', 'CGA-A01-22', 'CGA-A01-22', 'TRUE'),
('23536169', 'CGA-A01-20', 'CGA-A01-20', 'TRUE'),
('23539097', 'LOC-J8-24', 'LOC-J8-22', 'FALSE'),
('23539359', 'CGA-A01-26', 'CGA-A01-26', 'TRUE'),
('23540966', 'CGA-A01-23', 'CGA-A01-23', 'TRUE'),
('23540967', 'CGA-A01-24', 'CGA-A01-24', 'TRUE'),
('23540968', 'CGA-A01-25', 'CGA-A01-25', 'TRUE'),
('23547482', 'LOC-J8-20', 'LOC-J8-23', 'FALSE'),
('23556078', 'LOC-J6-07', 'LOC-J6-07', 'TRUE'),
('23557376', 'LOC-J8-11', 'LOC-B04-13', 'FALSE'),
('23557377', 'LOC-J8-15', 'LOC-B04-03', 'FALSE'),
('23557378', 'LOC-J8-17', 'LOC-B04-07', 'FALSE'),
('23558350', 'CGA-A01-10', 'CGA-A01-10', 'TRUE'),
('23558351', 'CGA-A01-35', 'CGA-A01-35', 'TRUE'),
('23558352', 'CGA-A01-36', 'CGA-A01-36', 'TRUE'),
('23558480', 'CGA-A01-09', 'CGA-A01-09', 'TRUE'),
('23864683', 'LOC-J6-32', 'LOC-J6-32', 'TRUE'),
('23871369', 'LOC-J6-22', 'LOC-J6-22', 'TRUE'),
('23909458', 'LOC-J7-08', 'LOC-J7-08', 'TRUE'),
('23910427', 'LOC-J6-16', 'LOC-J6-16', 'TRUE'),
('23910428', 'LOC-J6-17', 'LOC-J6-17', 'TRUE'),
('23910906', 'LOC-J6-18', 'LOC-J6-18', 'TRUE'),
('23910907', 'LOC-J6-10', 'LOC-J6-10', 'TRUE'),
('23920147', 'LOC-J6-26', 'LOC-J6-26', 'TRUE'),
('23920168', 'LOC-J6-29', 'LOC-J6-29', 'TRUE'),
('23927966', 'LOC-J6-30', 'LOC-J6-30', 'TRUE'),
('23928411', 'LOC-J7-05', 'LOC-J7-05', 'TRUE'),
('23928822', 'LOC-J6-19', 'LOC-J6-19', 'TRUE'),
('23928824', 'LOC-J6-11', 'LOC-J6-11', 'TRUE'),
('23928826', 'LOC-J6-12', 'LOC-J6-12', 'TRUE'),
('23929221', 'LOC-J6-23', 'LOC-J6-23', 'TRUE'),
('23930162', 'CGA-A01-01', 'CGA-A01-01', 'TRUE'),
('23932792', 'CGA-A01-17', 'CGA-A01-17', 'TRUE'),
('23933611', 'CGA-A01-16', 'CGA-A01-16', 'TRUE'),
('23933870', 'CGA-A01-07', 'CGA-A01-07', 'TRUE'),
('23935703', 'CGA-A01-15', 'CGA-A01-15', 'TRUE'),
('23935787', 'CGA-A01-14', 'CGA-A01-14', 'TRUE'),
('23939349', 'LOC-J7-03', 'LOC-J412-C02-R', 'FALSE'),
('23945888', 'CGA-A01-02', 'CGA-A01-02', 'TRUE'),
('23954868', 'CGA-A01-19', 'CGA-A01-19', 'TRUE'),
('23954940', 'LOC-J7-17', 'LOC-J7-17', 'TRUE'),
('23962296', 'LOC-J7-09', 'LOC-J7-09', 'TRUE'),
('23962297', 'LOC-J8-21', 'LOC-J8-21', 'TRUE'),
('23962298', 'LOC-J8-23', 'LOC-J8-23', 'TRUE'),
('23963894', 'LOC-J7-06', 'LOC-F05-13', 'FALSE'),
('23963895', 'LOC-J7-07', 'LOC-J7-07', 'TRUE'),
('23963902', 'CGA-A01-38B', 'CGA-A01-38B', 'TRUE'),
('23963903', 'CGA-A01-38A', 'CGA-A01-38A', 'TRUE'),
('23965238', 'CGA-A01-11', 'CGA-A01-11', 'TRUE'),
('23965267', 'CGA-A01-38', 'CGA-A01-38', 'TRUE'),
('23965272', 'CGA-A01-37', 'CGA-A01-37', 'TRUE'),
('23966189', 'CGA-A01-08', 'CGA-A01-08', 'TRUE'),
('23966583', 'LOC-J6-09', 'LOC-J6-09', 'TRUE'),
('23968490', 'LOC-J6-21', 'LOC-J6-21', 'TRUE'),
('23972397', 'LOC-J6-20', 'LOC-J6-20', 'TRUE'),
('23973360', 'LOC-J6-28', 'LOC-J6-28', 'TRUE'),
('23983240', 'LOC-J8-22', 'LOC-J8-22', 'TRUE'),
('23984343', 'CGA-A01-18', 'CGA-A01-18', 'TRUE'),
('23989810', 'LOC-J6-13', 'LOC-J6-13', 'TRUE'),
('23989811', 'LOC-J6-24', 'LOC-J6-24', 'TRUE'),
('23989812', 'LOC-J6-27', 'LOC-J6-27', 'TRUE'),
('23990390', 'LOC-J7-11', 'LOC-J7-11', 'TRUE'),
('23990392', 'LOC-J7-10', 'LOC-J7-10', 'TRUE'),
('23990394', 'LOC-J7-12', 'LOC-J7-12', 'TRUE'),
('23990396', 'LOC-J7-13', 'LOC-J7-13', 'TRUE'),
('23990398', 'LOC-J7-14', 'LOC-J7-14', 'TRUE'),
('23990400', 'LOC-J7-15', 'LOC-J7-15', 'TRUE'),
('23990402', 'LOC-J7-16', 'LOC-J7-16', 'TRUE'),
('23990404', 'LOC-J7-18', 'LOC-J7-18', 'TRUE'),
('23990406', 'LOC-J7-19', 'LOC-J7-19', 'TRUE'),
('23990408', 'LOC-J7-20', 'LOC-J7-20', 'TRUE'),
('23990410', 'LOC-J7-21', 'LOC-J7-21', 'TRUE'),
('23990412', 'LOC-J7-22', 'LOC-J7-22', 'TRUE'),
('23990414', 'LOC-J7-23', 'LOC-J7-23', 'TRUE'),
('23990416', 'LOC-J7-24', 'LOC-J7-24', 'TRUE'),
('23990418', 'LOC-J7-25', 'LOC-J7-25', 'TRUE'),
('23990420', 'LOC-J7-26', 'LOC-J7-26', 'TRUE'),
('23990422', 'LOC-J7-27', 'LOC-J7-27', 'TRUE'),
('23990424', 'LOC-J7-28', 'LOC-J7-28', 'TRUE'),
('23990426', 'LOC-J7-29', 'LOC-J7-29', 'TRUE'),
('23990428', 'LOC-J7-30', 'LOC-J7-30', 'TRUE'),
('23992930', 'LOC-J6-15', 'LOC-J6-15', 'TRUE'),
('23992931', 'LOC-J6-25', 'LOC-J6-25', 'TRUE'),
('23993957', 'CGA-A01-13', 'CGA-A01-13', 'TRUE'),
('23995215', 'LOC-J8-18', 'LOC-B04-11', 'FALSE'),
('23995216', 'LOC-J8-16', 'LOC-B04-04', 'FALSE'),
('23995217', 'LOC-J8-12', 'LOC-B04-09', 'FALSE'),
('23995218', 'LOC-J8-13', 'LOC-B04-06', 'FALSE'),
('23995219', 'LOC-J8-14', 'LOC-B04-05', 'FALSE'),
('23995220', 'LOC-J8-19', 'LOC-B04-10', 'FALSE'),
('23997501', 'LOC-J6-31', 'LOC-J6-31', 'TRUE'),
('24552956', 'LOC-J6-33', 'LOC-J6-33', 'TRUE'),
('563176', 'CBD-D01-04', 'CBD-D01-04', 'TRUE');

-- --------------------------------------------------------

--
-- Stand-in structure for view `loc`
-- (See below for the actual view)
--
CREATE TABLE `loc` (
`frekuensi_true` bigint(21)
,`persentase_true` decimal(24,0)
,`frekuensi_false` bigint(21)
,`persentase_false` decimal(24,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `locc`
-- (See below for the actual view)
--
CREATE TABLE `locc` (
`cek` varchar(50)
,`frekuensi_cek` bigint(21)
,`Prosentase` decimal(24,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `loc_false`
-- (See below for the actual view)
--
CREATE TABLE `loc_false` (
`cek` varchar(50)
,`frekuensi_false` bigint(21)
,`persentase_false` decimal(24,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `loc_true`
-- (See below for the actual view)
--
CREATE TABLE `loc_true` (
`cek` varchar(50)
,`frekuensi_true` bigint(21)
,`persentase_true` decimal(24,0)
);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`name`, `email`, `username`, `password`) VALUES
('bodat', 'bodat@gmail.com', 'bodat', 'bodat123'),
('bodat2', 'bodat@gmai.com', 'bod', '7a81eecf406c5d66adf7be5b6f99aa8d'),
('bodddd', 'bod@gmail.com', 'pos', '82122a8c97175c36d1346973a122a5521473b826'),
('bodat', 'bodat@gmail.com', 'bodat', '$5$rounds=80000$0mRlIRFKpRqoPcW6$kPPg482fvUEzmE1H/'),
('nanda', 'nanda@gmail.com', 'nanda', '$5$rounds=80000$WV7F8jjpXLzeBjM4$W4UGRExj/IEHBGZYv');

-- --------------------------------------------------------

--
-- Structure for view `loc`
--
DROP TABLE IF EXISTS `loc`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `loc`  AS  select `loc_true`.`frekuensi_true` AS `frekuensi_true`,`loc_true`.`persentase_true` AS `persentase_true`,`loc_false`.`frekuensi_false` AS `frekuensi_false`,`loc_false`.`persentase_false` AS `persentase_false` from (`loc_true` join `loc_false`) ;

-- --------------------------------------------------------

--
-- Structure for view `locc`
--
DROP TABLE IF EXISTS `locc`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `locc`  AS  select `coba`.`cek` AS `cek`,count(`coba`.`cek`) AS `frekuensi_cek`,round(((count(`coba`.`cek`) / (select count(0) from `coba`)) * 100),0) AS `Prosentase` from `coba` group by `coba`.`cek` ;

-- --------------------------------------------------------

--
-- Structure for view `loc_false`
--
DROP TABLE IF EXISTS `loc_false`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `loc_false`  AS  select `coba`.`cek` AS `cek`,count(`coba`.`cek`) AS `frekuensi_false`,round(((count(`coba`.`cek`) / (select count(0) from `coba`)) * 100),0) AS `persentase_false` from `coba` where (`coba`.`cek` = 'False') ;

-- --------------------------------------------------------

--
-- Structure for view `loc_true`
--
DROP TABLE IF EXISTS `loc_true`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `loc_true`  AS  select `coba`.`cek` AS `cek`,count(`coba`.`cek`) AS `frekuensi_true`,round(((count(`coba`.`cek`) / (select count(0) from `coba`)) * 100),0) AS `persentase_true` from `coba` where (`coba`.`cek` = 'True') ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `coba`
--
ALTER TABLE `coba`
  ADD PRIMARY KEY (`part_number`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
