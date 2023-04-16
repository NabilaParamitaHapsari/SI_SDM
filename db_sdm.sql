-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2023 at 09:58 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_sdm`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_absensi`
--

CREATE TABLE `tb_absensi` (
  `id_absensi` varchar(5) NOT NULL,
  `tanggal` date NOT NULL,
  `shift` varchar(10) NOT NULL,
  `id_karyawan` varchar(5) NOT NULL,
  `id_pengajuan` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_gaji`
--

CREATE TABLE `tb_gaji` (
  `id_gaji` varchar(5) NOT NULL,
  `tanggal` date NOT NULL,
  `departemen` varchar(10) NOT NULL,
  `jumlah` int(10) NOT NULL,
  `potongan_gaji` varchar(10) NOT NULL,
  `lembur` varchar(10) NOT NULL,
  `id_absensi` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_jenisijin`
--

CREATE TABLE `tb_jenisijin` (
  `kode_izin` varchar(5) NOT NULL,
  `keterangan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pegawai`
--

CREATE TABLE `tb_pegawai` (
  `id_karyawan` varchar(5) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `jenis_kelamin` varchar(20) NOT NULL,
  `alamat` varchar(20) NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `agama` varchar(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `email` varchar(20) NOT NULL,
  `no_rekening` varchar(20) NOT NULL,
  `pemilik_rekening` varchar(20) NOT NULL,
  `jabatan` varchar(10) NOT NULL,
  `id_pendidikan` varchar(5) NOT NULL,
  `id_pengembangan` varchar(5) NOT NULL,
  `id_gaji` varchar(5) NOT NULL,
  `id_tunjangan` varchar(5) NOT NULL,
  `id_pengguna` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pendidikan`
--

CREATE TABLE `tb_pendidikan` (
  `id_pendidikan` varchar(5) NOT NULL,
  `tingkat_pendidikan` varchar(10) NOT NULL,
  `jurusan` varchar(10) NOT NULL,
  `institusi` varchar(10) NOT NULL,
  `keterangan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengajuanijin`
--

CREATE TABLE `tb_pengajuanijin` (
  `id_pengajuan` varchar(5) NOT NULL,
  `tanggal_izin` date NOT NULL,
  `akhir_izin` date NOT NULL,
  `kode_izin` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengembangandiri`
--

CREATE TABLE `tb_pengembangandiri` (
  `id_pengembangan` varchar(5) NOT NULL,
  `jenis_pelatihan` varchar(20) NOT NULL,
  `institusi` varchar(25) NOT NULL,
  `tgl_mulai` date NOT NULL,
  `tgl_selesai` date NOT NULL,
  `keterangan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengguna`
--

CREATE TABLE `tb_pengguna` (
  `id_pengguna` varchar(5) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `departemen` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_tunjangan`
--

CREATE TABLE `tb_tunjangan` (
  `id_tunjangan` varchar(5) NOT NULL,
  `tanggal` date NOT NULL,
  `bpjs` varchar(10) NOT NULL,
  `thr` varchar(10) NOT NULL,
  `tunjangan_haritua` varchar(10) NOT NULL,
  `jumlah` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_absensi`
--
ALTER TABLE `tb_absensi`
  ADD PRIMARY KEY (`id_absensi`),
  ADD KEY `nip` (`id_karyawan`),
  ADD KEY `id_pengajuanijin` (`id_pengajuan`);

--
-- Indexes for table `tb_gaji`
--
ALTER TABLE `tb_gaji`
  ADD PRIMARY KEY (`id_gaji`),
  ADD KEY `id_absensi` (`id_absensi`);

--
-- Indexes for table `tb_jenisijin`
--
ALTER TABLE `tb_jenisijin`
  ADD PRIMARY KEY (`kode_izin`);

--
-- Indexes for table `tb_pegawai`
--
ALTER TABLE `tb_pegawai`
  ADD PRIMARY KEY (`id_karyawan`),
  ADD KEY `id_gaji` (`id_gaji`),
  ADD KEY `id_tunjangan` (`id_tunjangan`),
  ADD KEY `id_pengguna` (`id_pengguna`),
  ADD KEY `id_pendidikan` (`id_pendidikan`),
  ADD KEY `id_pengembangan` (`id_pengembangan`);

--
-- Indexes for table `tb_pendidikan`
--
ALTER TABLE `tb_pendidikan`
  ADD PRIMARY KEY (`id_pendidikan`);

--
-- Indexes for table `tb_pengajuanijin`
--
ALTER TABLE `tb_pengajuanijin`
  ADD PRIMARY KEY (`id_pengajuan`),
  ADD KEY `id_ijin` (`kode_izin`);

--
-- Indexes for table `tb_pengembangandiri`
--
ALTER TABLE `tb_pengembangandiri`
  ADD PRIMARY KEY (`id_pengembangan`);

--
-- Indexes for table `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- Indexes for table `tb_tunjangan`
--
ALTER TABLE `tb_tunjangan`
  ADD PRIMARY KEY (`id_tunjangan`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_absensi`
--
ALTER TABLE `tb_absensi`
  ADD CONSTRAINT `tb_absensi_ibfk_1` FOREIGN KEY (`id_karyawan`) REFERENCES `tb_pegawai` (`id_karyawan`),
  ADD CONSTRAINT `tb_absensi_ibfk_2` FOREIGN KEY (`id_pengajuan`) REFERENCES `tb_pengajuanijin` (`id_pengajuan`);

--
-- Constraints for table `tb_gaji`
--
ALTER TABLE `tb_gaji`
  ADD CONSTRAINT `tb_gaji_ibfk_1` FOREIGN KEY (`id_absensi`) REFERENCES `tb_absensi` (`id_absensi`);

--
-- Constraints for table `tb_pegawai`
--
ALTER TABLE `tb_pegawai`
  ADD CONSTRAINT `tb_pegawai_ibfk_1` FOREIGN KEY (`id_pendidikan`) REFERENCES `tb_pendidikan` (`id_pendidikan`),
  ADD CONSTRAINT `tb_pegawai_ibfk_2` FOREIGN KEY (`id_pengembangan`) REFERENCES `tb_pengembangandiri` (`id_pengembangan`),
  ADD CONSTRAINT `tb_pegawai_ibfk_3` FOREIGN KEY (`id_gaji`) REFERENCES `tb_gaji` (`id_gaji`),
  ADD CONSTRAINT `tb_pegawai_ibfk_4` FOREIGN KEY (`id_pengguna`) REFERENCES `tb_pengguna` (`id_pengguna`),
  ADD CONSTRAINT `tb_pegawai_ibfk_5` FOREIGN KEY (`id_tunjangan`) REFERENCES `tb_tunjangan` (`id_tunjangan`);

--
-- Constraints for table `tb_pengajuanijin`
--
ALTER TABLE `tb_pengajuanijin`
  ADD CONSTRAINT `tb_pengajuanijin_ibfk_1` FOREIGN KEY (`kode_izin`) REFERENCES `tb_jenisijin` (`kode_izin`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
