-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 26, 2019 at 02:40 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `moneymanagement`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ID_Admin` int(11) NOT NULL,
  `username` varchar(21) NOT NULL,
  `password` varchar(100) NOT NULL,
  `kelas` varchar(21) NOT NULL,
  `hak` int(21) NOT NULL,
  `foto` varchar(37) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jenis_pembayaran`
--

CREATE TABLE `jenis_pembayaran` (
  `id_jenispembayaran` int(10) NOT NULL,
  `jenis_pembayaran` int(20) NOT NULL,
  `tanggal_pelunasan` date NOT NULL,
  `nama_pembayaran` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keluaran`
--

CREATE TABLE `keluaran` (
  `id_keluaran` int(10) NOT NULL,
  `id_jenispembayarann` int(10) NOT NULL,
  `tanggal_pengeluaran` date NOT NULL,
  `nominal_pengeluaran` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran_bulanan`
--

CREATE TABLE `pembayaran_bulanan` (
  `NIS` int(38) NOT NULL,
  `Bulan` varchar(21) NOT NULL,
  `Tahun` varchar(21) NOT NULL,
  `Pembayaran` int(21) NOT NULL,
  `ID_PB` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembayaran_bulanan`
--

INSERT INTO `pembayaran_bulanan` (`NIS`, `Bulan`, `Tahun`, `Pembayaran`, `ID_PB`) VALUES
(82941893, 'Januari', '2019', 20000, 8),
(82941893, 'Maret', '2019', 20000, 9),
(829418949, 'Maret', '2019', 20000, 12),
(82301231, 'Desember', '2019', 20000, 13),
(82301231, 'Januari', '2019', 20000, 14),
(82941893, 'Januari', '2018', 20000, 15);

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `NIS` int(38) NOT NULL,
  `NamaSiswa` varchar(36) NOT NULL,
  `Kelas` varchar(10) NOT NULL,
  `Jurusan` varchar(21) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`NIS`, `NamaSiswa`, `Kelas`, `Jurusan`) VALUES
(1231, 'Oji', '12', 'RPL'),
(312312, 'dadad', '12', 'RPL'),
(3123123, 'Aswangga', '10', 'RPL'),
(7418491, 'sidqi', '10', 'RPL'),
(14125125, 'Nisa', '12', 'RPL'),
(48912741, 'dakdakdm', '12', 'RPL'),
(82301231, 'Kafka Khalis Kurniawan', '12', 'RPL'),
(82941893, 'Andruw', '12', 'RPL'),
(131251512, 'dada', '10', 'RPL'),
(328381032, 'Ila', '12', 'RPL'),
(829418949, 'Boim', '12', 'RPL'),
(831938111, 'Nurul', '12', 'RPL'),
(2147483647, 'Arya', '12', 'RPL');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_pembayaran`
-- (See below for the actual view)
--
CREATE TABLE `v_pembayaran` (
`NamaSiswa` varchar(36)
,`Januari` mediumtext
,`Februari` mediumtext
,`Maret` mediumtext
,`April` mediumtext
,`Mei` mediumtext
,`Juni` mediumtext
,`Juli` mediumtext
,`Agustus` mediumtext
,`September` mediumtext
,`Oktober` mediumtext
,`November` mediumtext
,`Desember` mediumtext
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_totalbulanan`
-- (See below for the actual view)
--
CREATE TABLE `v_totalbulanan` (
`NIS` int(38)
,`NamaSiswa` varchar(36)
,`TotalBayar` decimal(42,0)
);

-- --------------------------------------------------------

--
-- Structure for view `v_pembayaran`
--
DROP TABLE IF EXISTS `v_pembayaran`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_pembayaran`  AS  select `s`.`NamaSiswa` AS `NamaSiswa`,group_concat(if(`pb`.`Bulan` = 'Januari',`pb`.`Pembayaran`,NULL) separator ',') AS `Januari`,group_concat(if(`pb`.`Bulan` = 'Februari',`pb`.`Pembayaran`,NULL) separator ',') AS `Februari`,group_concat(if(`pb`.`Bulan` = 'Maret',`pb`.`Pembayaran`,NULL) separator ',') AS `Maret`,group_concat(if(`pb`.`Bulan` = 'April',`pb`.`Pembayaran`,NULL) separator ',') AS `April`,group_concat(if(`pb`.`Bulan` = 'Mei',`pb`.`Pembayaran`,NULL) separator ',') AS `Mei`,group_concat(if(`pb`.`Bulan` = 'Juni',`pb`.`Pembayaran`,NULL) separator ',') AS `Juni`,group_concat(if(`pb`.`Bulan` = 'Juli',`pb`.`Pembayaran`,NULL) separator ',') AS `Juli`,group_concat(if(`pb`.`Bulan` = 'Agustus',`pb`.`Pembayaran`,NULL) separator ',') AS `Agustus`,group_concat(if(`pb`.`Bulan` = 'September',`pb`.`Pembayaran`,NULL) separator ',') AS `September`,group_concat(if(`pb`.`Bulan` = 'Oktober',`pb`.`Pembayaran`,NULL) separator ',') AS `Oktober`,group_concat(if(`pb`.`Bulan` = 'November',`pb`.`Pembayaran`,NULL) separator ',') AS `November`,group_concat(if(`pb`.`Bulan` = 'Desember',`pb`.`Pembayaran`,NULL) separator ',') AS `Desember` from (`siswa` `s` join `pembayaran_bulanan` `pb` on(`s`.`NIS` = `pb`.`NIS`)) group by `s`.`NamaSiswa` ;

-- --------------------------------------------------------

--
-- Structure for view `v_totalbulanan`
--
DROP TABLE IF EXISTS `v_totalbulanan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_totalbulanan`  AS  select `pb`.`NIS` AS `NIS`,`s`.`NamaSiswa` AS `NamaSiswa`,sum(`pb`.`Pembayaran`) AS `TotalBayar` from (`pembayaran_bulanan` `pb` join `siswa` `s` on(`s`.`NIS` = `pb`.`NIS`)) group by `pb`.`NIS` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID_Admin`);

--
-- Indexes for table `jenis_pembayaran`
--
ALTER TABLE `jenis_pembayaran`
  ADD PRIMARY KEY (`id_jenispembayaran`);

--
-- Indexes for table `keluaran`
--
ALTER TABLE `keluaran`
  ADD PRIMARY KEY (`id_keluaran`),
  ADD KEY `id_jenispembayarann` (`id_jenispembayarann`);

--
-- Indexes for table `pembayaran_bulanan`
--
ALTER TABLE `pembayaran_bulanan`
  ADD PRIMARY KEY (`ID_PB`),
  ADD KEY `NIS` (`NIS`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`NIS`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `ID_Admin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jenis_pembayaran`
--
ALTER TABLE `jenis_pembayaran`
  MODIFY `id_jenispembayaran` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `keluaran`
--
ALTER TABLE `keluaran`
  MODIFY `id_keluaran` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pembayaran_bulanan`
--
ALTER TABLE `pembayaran_bulanan`
  MODIFY `ID_PB` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `keluaran`
--
ALTER TABLE `keluaran`
  ADD CONSTRAINT `keluaran_ibfk_1` FOREIGN KEY (`id_jenispembayarann`) REFERENCES `jenis_pembayaran` (`id_jenispembayaran`);

--
-- Constraints for table `pembayaran_bulanan`
--
ALTER TABLE `pembayaran_bulanan`
  ADD CONSTRAINT `Pembayaran_Bulanan_ibfk_1` FOREIGN KEY (`NIS`) REFERENCES `siswa` (`NIS`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
