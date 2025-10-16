-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 15, 2025 at 04:20 PM
-- Server version: 8.4.3
-- PHP Version: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `agriadapt`
--

-- --------------------------------------------------------

--
-- Table structure for table `cuaca`
--

CREATE TABLE `cuaca` (
  `id_cuaca` int NOT NULL,
  `id_lokasi` int NOT NULL,
  `tanggal` date NOT NULL,
  `suhu` decimal(5,2) DEFAULT NULL,
  `kelembapan` decimal(5,2) DEFAULT NULL,
  `kecepatan_angin` decimal(5,2) DEFAULT NULL,
  `kondisi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cuaca`
--

INSERT INTO `cuaca` (`id_cuaca`, `id_lokasi`, `tanggal`, `suhu`, `kelembapan`, `kecepatan_angin`, `kondisi`) VALUES
(7, 1, '2025-10-15', 29.50, 82.30, 12.50, 'Cerah Berawan'),
(8, 2, '2025-10-15', 30.10, 78.00, 10.20, 'Hujan Ringan'),
(9, 3, '2025-10-15', 28.40, 85.10, 9.80, 'Berawan');

-- --------------------------------------------------------

--
-- Table structure for table `komoditas`
--

CREATE TABLE `komoditas` (
  `id_komoditas` int NOT NULL,
  `nama_komoditas` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `komoditas`
--

INSERT INTO `komoditas` (`id_komoditas`, `nama_komoditas`) VALUES
(1, 'Padi'),
(2, 'Jagung'),
(3, 'Cabai'),
(4, 'Tomat'),
(5, 'Kangkung');

-- --------------------------------------------------------

--
-- Table structure for table `lokasi`
--

CREATE TABLE `lokasi` (
  `id_lokasi` int NOT NULL,
  `nama_kota` varchar(100) NOT NULL,
  `provinsi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `lokasi`
--

INSERT INTO `lokasi` (`id_lokasi`, `nama_kota`, `provinsi`) VALUES
(1, 'Kendari', 'Sulawesi Tenggara'),
(2, 'Baubau', 'Sulawesi Tenggara'),
(3, 'Kolaka', 'Sulawesi Tenggara'),
(4, 'Konawe', 'Sulawesi Tenggara'),
(5, 'Bombana', 'Sulawesi Tenggara'),
(6, 'Buton', 'Sulawesi Tenggara'),
(7, 'Raha', 'Sulawesi Tenggara'),
(8, 'Wakatobi', 'Sulawesi Tenggara');

-- --------------------------------------------------------

--
-- Table structure for table `musim`
--

CREATE TABLE `musim` (
  `id_musim` int NOT NULL,
  `nama_musim` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `musim`
--

INSERT INTO `musim` (`id_musim`, `nama_musim`) VALUES
(1, 'Hujan'),
(2, 'Kemarau');

-- --------------------------------------------------------

--
-- Table structure for table `rekomendasi`
--

CREATE TABLE `rekomendasi` (
  `id_rekomendasi` int NOT NULL,
  `id_musim` int NOT NULL,
  `id_komoditas` int NOT NULL,
  `id_lahan` int NOT NULL,
  `isi_rekomendasi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `rekomendasi`
--

INSERT INTO `rekomendasi` (`id_rekomendasi`, `id_musim`, `id_komoditas`, `id_lahan`, `isi_rekomendasi`) VALUES
(4, 2, 1, 1, 'Periksa ketersediaan air irigasi. Gunakan benih bersertifikat. Pemupukan awal N-P-K berimbang. Cek hama wereng & tikus. Mode lahan: Sawah — atur irigasi & pupuk sesuai kondisi.'),
(5, 1, 2, 2, 'Jagung cocok di musim hujan pada lahan tegal. Pastikan drainase baik dan hindari genangan air.'),
(6, 2, 3, 3, 'Kedelai cocok ditanam saat kemarau pada lahan kebun. Siram secara teratur dan gunakan pupuk fosfat tinggi.');

-- --------------------------------------------------------

--
-- Table structure for table `tipe_lahan`
--

CREATE TABLE `tipe_lahan` (
  `id_lahan` int NOT NULL,
  `nama_lahan` varchar(100) NOT NULL,
  `deskripsi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tipe_lahan`
--

INSERT INTO `tipe_lahan` (`id_lahan`, `nama_lahan`, `deskripsi`) VALUES
(1, 'Sawah', 'Lahan persawahan untuk padi'),
(2, 'Tegal', 'Lahan tegalan untuk jagung dan palawija'),
(3, 'Kebun', 'Lahan kebun untuk kedelai dan sayuran');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cuaca`
--
ALTER TABLE `cuaca`
  ADD PRIMARY KEY (`id_cuaca`),
  ADD KEY `id_lokasi` (`id_lokasi`);

--
-- Indexes for table `komoditas`
--
ALTER TABLE `komoditas`
  ADD PRIMARY KEY (`id_komoditas`);

--
-- Indexes for table `lokasi`
--
ALTER TABLE `lokasi`
  ADD PRIMARY KEY (`id_lokasi`);

--
-- Indexes for table `musim`
--
ALTER TABLE `musim`
  ADD PRIMARY KEY (`id_musim`);

--
-- Indexes for table `rekomendasi`
--
ALTER TABLE `rekomendasi`
  ADD PRIMARY KEY (`id_rekomendasi`),
  ADD KEY `id_musim` (`id_musim`),
  ADD KEY `id_komoditas` (`id_komoditas`),
  ADD KEY `id_lahan` (`id_lahan`);

--
-- Indexes for table `tipe_lahan`
--
ALTER TABLE `tipe_lahan`
  ADD PRIMARY KEY (`id_lahan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cuaca`
--
ALTER TABLE `cuaca`
  MODIFY `id_cuaca` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `komoditas`
--
ALTER TABLE `komoditas`
  MODIFY `id_komoditas` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lokasi`
--
ALTER TABLE `lokasi`
  MODIFY `id_lokasi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `musim`
--
ALTER TABLE `musim`
  MODIFY `id_musim` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rekomendasi`
--
ALTER TABLE `rekomendasi`
  MODIFY `id_rekomendasi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tipe_lahan`
--
ALTER TABLE `tipe_lahan`
  MODIFY `id_lahan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cuaca`
--
ALTER TABLE `cuaca`
  ADD CONSTRAINT `cuaca_ibfk_1` FOREIGN KEY (`id_lokasi`) REFERENCES `lokasi` (`id_lokasi`) ON DELETE CASCADE;

--
-- Constraints for table `rekomendasi`
--
ALTER TABLE `rekomendasi`
  ADD CONSTRAINT `rekomendasi_ibfk_1` FOREIGN KEY (`id_musim`) REFERENCES `musim` (`id_musim`) ON DELETE CASCADE,
  ADD CONSTRAINT `rekomendasi_ibfk_2` FOREIGN KEY (`id_komoditas`) REFERENCES `komoditas` (`id_komoditas`) ON DELETE CASCADE,
  ADD CONSTRAINT `rekomendasi_ibfk_3` FOREIGN KEY (`id_lahan`) REFERENCES `tipe_lahan` (`id_lahan`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
