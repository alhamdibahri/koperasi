-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 09 Des 2017 pada 05.19
-- Versi Server: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `koperasi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `anggota`
--

CREATE TABLE IF NOT EXISTS `anggota` (
  `id_anggota` varchar(11) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `alamat` text NOT NULL,
  `tgl_lahir` date NOT NULL,
  `tmp_lahir` varchar(20) NOT NULL,
  `j_kel` varchar(20) NOT NULL,
  `status` varchar(8) NOT NULL,
  `no_telp` varchar(12) NOT NULL,
  `besar_simpanan` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `nama`, `alamat`, `tgl_lahir`, `tmp_lahir`, `j_kel`, `status`, `no_telp`, `besar_simpanan`) VALUES
('AGT001', 'Alhamdi Ferdiawan Bahri', 'Pamolokan', '2000-11-23', 'Sumenep', 'Laki-Laki', '1', '082301261900', 25000),
('AGT002', 'Rizal Kurniawan', 'Dungkek', '2000-11-23', 'Sumenep', 'Laki-Laki', '1', '082310001134', 25000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `angsuran`
--

CREATE TABLE IF NOT EXISTS `angsuran` (
  `id_angsuran` varchar(11) NOT NULL,
  `id_pinjaman` varchar(11) NOT NULL,
  `id_anggota` varchar(11) NOT NULL,
  `nama_pinjaman` varchar(40) NOT NULL,
  `tgl_pembayaran` date NOT NULL,
  `angsuran_ke` int(11) NOT NULL,
  `besar_angsuran` bigint(20) NOT NULL,
  `tgl_jatuh_tempo` date NOT NULL,
  `denda` bigint(20) NOT NULL,
  `bln` varchar(2) NOT NULL,
  `ket` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `k_pinjaman`
--

CREATE TABLE IF NOT EXISTS `k_pinjaman` (
  `id_k_pinjaman` int(11) NOT NULL,
  `nama_pinjaman` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `k_pinjaman`
--

INSERT INTO `k_pinjaman` (`id_k_pinjaman`, `nama_pinjaman`) VALUES
(1, 'Pinjaman Jangka Pendek'),
(2, 'Pinjaman Jangka Menengah'),
(3, 'Pinjaman Jangka Panjang');

-- --------------------------------------------------------

--
-- Struktur dari tabel `k_simpanan`
--

CREATE TABLE IF NOT EXISTS `k_simpanan` (
  `id` int(11) NOT NULL,
  `nm_simpanan` varchar(25) NOT NULL,
  `ket_simpanan` text NOT NULL,
  `besar_simpanan` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `k_simpanan`
--

INSERT INTO `k_simpanan` (`id`, `nm_simpanan`, `ket_simpanan`, `besar_simpanan`) VALUES
(1, 'Simpanan Pokok', 'Simpanan Pokok yang dibayarkan pertama kali oleh anggota koperasi dan hanya sekali saja', '50000'),
(2, 'Simpanan Wajib', 'Simpanan Wajib yang dibayarkan oleh anggota setiap bulannya', '25000'),
(3, 'Simpanan Sukarela', 'Simpanan Sukarela yang mirip seperti tabungan dengan jumlah dan waktu simpanan tidak ditentukan', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE IF NOT EXISTS `petugas` (
  `id_petugas` int(11) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `no_hp` varchar(12) NOT NULL,
  `tmp_lahir` varchar(30) NOT NULL,
  `tgl_lahir` varchar(20) NOT NULL,
  `ket` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `nama`, `alamat`, `no_hp`, `tmp_lahir`, `tgl_lahir`, `ket`) VALUES
(1, 'Alhamdi Ferdiawan Bahri', 'Jalan Pahlawan GG IV/02 Pamolokan Sumenep', '082301261900', 'Sumenep', '23/11/2000', 'Aktif'),
(2, 'sarf', 'sgfsd', '353245345', 'sdgw4t45', '04/05/2034', 'fghfgh');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pinjaman`
--

CREATE TABLE IF NOT EXISTS `pinjaman` (
  `id_pinjaman` varchar(11) NOT NULL,
  `nama_pinjaman` varchar(40) NOT NULL,
  `id_anggota` varchar(11) NOT NULL,
  `besar_pinjaman` bigint(20) NOT NULL,
  `tgl_pengajuan_pinjaman` date NOT NULL,
  `tgl_acc_pinjaman` date NOT NULL,
  `tgl_pinjaman` date NOT NULL,
  `tgl_pelunasan` date NOT NULL,
  `bln` varchar(2) NOT NULL,
  `thn` varchar(4) NOT NULL,
  `ket` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pinjaman`
--

INSERT INTO `pinjaman` (`id_pinjaman`, `nama_pinjaman`, `id_anggota`, `besar_pinjaman`, `tgl_pengajuan_pinjaman`, `tgl_acc_pinjaman`, `tgl_pinjaman`, `tgl_pelunasan`, `bln`, `thn`, `ket`) VALUES
('PMJ001', 'Pinjaman Jangka Pendek', 'AGT001', 20000000, '2017-11-26', '2017-11-27', '2017-11-28', '2018-09-28', '11', '2017', '0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `simpanan`
--

CREATE TABLE IF NOT EXISTS `simpanan` (
  `id_simpanan` int(11) NOT NULL,
  `nm_simpanan` varchar(20) DEFAULT NULL,
  `id_anggota` varchar(11) DEFAULT NULL,
  `tgl_simpanan` date DEFAULT NULL,
  `besar_simpanan` bigint(20) DEFAULT NULL,
  `ket_simpanan` text,
  `bln` varchar(2) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `simpanan`
--

INSERT INTO `simpanan` (`id_simpanan`, `nm_simpanan`, `id_anggota`, `tgl_simpanan`, `besar_simpanan`, `ket_simpanan`, `bln`) VALUES
(78, 'Simpanan Pokok', 'AGT001', '2017-11-22', 50000, 'Simpanan Pokok yang dibayarkan pertama kali oleh anggota koperasi dan hanya sekali saja', '11'),
(85, 'Simpanan Wajib', 'AGT001', '2017-11-22', 25000, 'Simpanan Wajib yang dibayarkan oleh anggota setiap bulannya', '11'),
(86, 'Simpanan Sukarela', 'AGT001', '2017-11-28', 30000, 'Simpanan Sukarela yang mirip seperti tabungan dengan jumlah dan waktu simpanan tidak ditentukan', '11'),
(87, 'Simpanan Pokok', 'AGT002', '2017-12-09', 50000, 'Simpanan Pokok yang dibayarkan pertama kali oleh anggota koperasi dan hanya sekali saja', '12'),
(88, 'Simpanan Wajib', 'AGT002', '2017-12-09', 25000, 'Simpanan Wajib yang dibayarkan oleh anggota setiap bulannya', '12');

--
-- Trigger `simpanan`
--
DELIMITER $$
CREATE TRIGGER `delete_simpanan` AFTER DELETE ON `simpanan`
 FOR EACH ROW UPDATE anggota set besar_simpanan=besar_simpanan-old.besar_simpanan WHERE id_anggota=old.id_anggota
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tambah_simpanan` AFTER INSERT ON `simpanan`
 FOR EACH ROW UPDATE anggota set besar_simpanan=besar_simpanan+new.besar_simpanan WHERE id_anggota=new.id_anggota AND new.nm_simpanan='Simpanan Wajib'
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indexes for table `angsuran`
--
ALTER TABLE `angsuran`
  ADD PRIMARY KEY (`id_angsuran`), ADD KEY `id_pinjaman` (`id_pinjaman`), ADD KEY `id_anggota` (`id_anggota`);

--
-- Indexes for table `k_pinjaman`
--
ALTER TABLE `k_pinjaman`
  ADD PRIMARY KEY (`id_k_pinjaman`);

--
-- Indexes for table `k_simpanan`
--
ALTER TABLE `k_simpanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indexes for table `pinjaman`
--
ALTER TABLE `pinjaman`
  ADD PRIMARY KEY (`id_pinjaman`), ADD KEY `id_anggota` (`id_anggota`);

--
-- Indexes for table `simpanan`
--
ALTER TABLE `simpanan`
  ADD PRIMARY KEY (`id_simpanan`), ADD KEY `id_anggota` (`id_anggota`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `k_pinjaman`
--
ALTER TABLE `k_pinjaman`
  MODIFY `id_k_pinjaman` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `k_simpanan`
--
ALTER TABLE `k_simpanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `simpanan`
--
ALTER TABLE `simpanan`
  MODIFY `id_simpanan` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=89;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `angsuran`
--
ALTER TABLE `angsuran`
ADD CONSTRAINT `angsuran_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`),
ADD CONSTRAINT `angsuran_ibfk_2` FOREIGN KEY (`id_pinjaman`) REFERENCES `pinjaman` (`id_pinjaman`);

--
-- Ketidakleluasaan untuk tabel `pinjaman`
--
ALTER TABLE `pinjaman`
ADD CONSTRAINT `pinjaman_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`);

--
-- Ketidakleluasaan untuk tabel `simpanan`
--
ALTER TABLE `simpanan`
ADD CONSTRAINT `simpanan_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
