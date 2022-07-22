-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 19 Jul 2022 pada 09.00
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `moncer_new`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bidangs`
--

CREATE TABLE `bidangs` (
  `id` int(11) NOT NULL,
  `nama_bidang` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `bidangs`
--

INSERT INTO `bidangs` (`id`, `nama_bidang`, `created_at`, `updated_at`) VALUES
(1, 'Bidang Pendidikan', '2020-09-25 03:06:08', '2020-09-25 03:06:08'),
(2, 'Bidang Kesehatan', '2020-09-26 03:06:08', '2020-09-26 03:06:08'),
(3, 'Bidang Lingkungan', '2020-09-27 03:06:08', '2020-09-27 03:06:08'),
(4, 'Bidang Peningkatan Ekonomi Kerakyatan', '2020-09-28 03:06:08', '2020-09-28 03:06:08'),
(5, 'Bidang Infrastruktur', '2020-09-29 03:06:08', '2020-09-29 03:06:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `chartdesa`
--

CREATE TABLE `chartdesa` (
  `id` int(11) NOT NULL,
  `status_pelaksanaan` varchar(20) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `chartdesa`
--

INSERT INTO `chartdesa` (`id`, `status_pelaksanaan`, `jumlah`) VALUES
(1, 'Belum Terlaksana', 6),
(2, 'Dalam Pelaksanaan', 1),
(3, 'Terlaksana', 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `csr`
--

CREATE TABLE `csr` (
  `csr_id` bigint(20) NOT NULL,
  `usulan_id` int(11) NOT NULL,
  `perusahaan_id` varchar(100) NOT NULL,
  `penanggung_jawab` varchar(100) DEFAULT NULL,
  `jumlah_target` int(5) NOT NULL,
  `dana` bigint(20) NOT NULL,
  `tgl_mulai` date NOT NULL,
  `tgl_selesai` date NOT NULL,
  `status_csr` enum('1','2') NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `csr`
--

INSERT INTO `csr` (`csr_id`, `usulan_id`, `perusahaan_id`, `penanggung_jawab`, `jumlah_target`, `dana`, `tgl_mulai`, `tgl_selesai`, `status_csr`, `created_at`, `updated_at`) VALUES
(1, 5, '1', 'Haryadi, M.Kom', 1, 40000000, '2022-02-01', '2022-03-01', '2', '2022-01-30 14:18:32', '2022-02-08 16:06:44'),
(55, 10, '1', 'Haryadi, M.Kom', 20, 20000000, '2022-01-30', '2022-02-02', '2', '2022-01-30 14:21:06', '2022-01-30 14:26:12'),
(56, 3, '1', 'Haryadi, M.Kom', 2, 10000000, '2022-01-30', '2022-02-01', '2', '2022-01-30 14:21:55', '2022-01-30 14:26:15'),
(57, 51, '1', 'Haryadi, M.Kom', 50, 12500000, '2022-01-31', '2022-02-05', '2', '2022-01-30 14:22:49', '2022-01-30 14:26:26'),
(58, 40, '1', 'Haryadi, M.Kom', 1, 20000000, '2022-02-01', '2022-03-01', '2', '2022-01-30 14:23:29', '2022-01-30 14:26:20'),
(59, 31, '1', 'Haryadi, M.Kom', 1, 40000000, '2022-02-01', '2022-01-29', '2', '2022-01-30 14:24:09', '2022-01-30 14:26:22'),
(60, 8, '1', 'Haryadi, M.Kom', 20, 20000000, '2022-01-15', '2022-02-05', '2', '2022-01-30 14:24:50', '2022-01-30 14:26:18'),
(61, 66, '1', 'Haryadi, M.Kom', 250, 25000000, '2022-01-13', '2022-03-01', '2', '2022-01-30 14:25:28', '2022-02-01 12:34:40'),
(62, 61, '1', 'Haryadi, M.Kom', 100, 40000000, '2022-03-01', '2022-03-26', '2', '2022-01-30 14:28:06', '2022-02-01 12:34:43'),
(63, 56, '1', 'Haryadi, M.Kom', 1, 35000000, '2022-01-21', '2022-02-28', '2', '2022-01-30 14:28:34', '2022-02-01 12:34:46'),
(64, 48, '1', 'Haryadi, M.Kom', 100, 25000000, '2022-01-30', '2022-03-04', '2', '2022-01-30 14:29:04', '2022-02-01 12:34:48'),
(65, 2, '1', 'Haryadi, M.Kom', 10, 50000000, '2022-01-30', '2022-02-23', '2', '2022-01-30 14:29:45', '2022-02-01 12:34:36'),
(66, 39, '1', 'Ali Zaenal', 25, 25000000, '2022-03-01', '2022-04-01', '2', '2022-02-01 13:01:43', '2022-02-01 13:23:22'),
(67, 69, '1', 'Ali Zaenal', 150, 25000000, '2022-03-01', '2022-04-01', '2', '2022-02-01 13:02:37', '2022-02-01 13:13:22'),
(68, 76, '1', 'Ali Zaenal', 2, 40000000, '2022-02-07', '2022-04-01', '2', '2022-02-01 13:03:04', '2022-02-08 15:38:54'),
(69, 45, '1', 'Ali Zaenal', 15, 25000000, '2022-03-01', '2022-04-01', '1', '2022-02-01 13:07:01', '2022-02-01 13:07:01'),
(70, 29, '1', 'Ali Zaenal', 2, 50000000, '2022-03-01', '2022-04-01', '2', '2022-02-01 13:07:34', '2022-02-01 13:13:25'),
(71, 4, '1', 'Ali Zaenal', 2, 30000000, '2022-03-16', '2022-04-01', '2', '2022-02-01 13:08:08', '2022-02-01 13:13:11'),
(72, 99, '1', 'Ali Zaenal', 1, 50000000, '2022-03-23', '2022-04-14', '2', '2022-02-01 13:08:38', '2022-02-01 13:23:18'),
(73, 97, '1', 'Ali Zaenal', 1, 40000000, '2022-02-26', '2022-03-12', '2', '2022-02-01 13:09:16', '2022-02-01 13:25:04'),
(74, 57, '1', 'Djatmiko', 1, 25000000, '2022-02-20', '2022-03-11', '1', '2022-02-01 13:11:44', '2022-02-01 13:11:44'),
(75, 81, '1', 'Suharto', 5, 25000000, '2022-02-01', '2022-02-24', '1', '2022-02-01 13:28:28', '2022-02-01 13:28:28'),
(76, 35, '1', 'Ali Zaenal Abidin', 25, 60000000, '2022-02-24', '2022-02-26', '1', '2022-02-01 13:29:00', '2022-02-01 13:29:00'),
(77, 9, '1', 'Djatmiko', 15, 20000000, '2022-02-01', '2022-02-10', '1', '2022-02-01 13:29:31', '2022-02-01 13:29:31'),
(78, 13, '1', 'Ali Zaenal Abidin', 30, 50000000, '2022-02-01', '2022-02-18', '1', '2022-02-01 13:29:59', '2022-02-01 13:29:59'),
(80, 67, '1', 'Djatmiko', 150, 40000000, '2022-02-17', '2022-03-10', '1', '2022-02-01 13:31:20', '2022-02-01 13:31:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `desas`
--

CREATE TABLE `desas` (
  `id` varchar(20) NOT NULL,
  `nama_desa` varchar(100) NOT NULL,
  `kecamatan_id` varchar(11) NOT NULL,
  `kabupaten` varchar(100) NOT NULL,
  `provinsi` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `desas`
--

INSERT INTO `desas` (`id`, `nama_desa`, `kecamatan_id`, `kabupaten`, `provinsi`, `created_at`, `updated_at`) VALUES
('3320012001', 'Kedungmalang', '1', 'Jepara', 'Jawa Tengah', '2020-09-25 03:06:08', '2020-09-25 03:06:08'),
('3320012002', 'Kalianyar', '1', 'Jepara', 'Jawa Tengah', '2020-09-26 03:06:08', '2020-09-26 03:06:08'),
('3320012003', 'Karangaji', '1', 'Jepara', 'Jawa Tengah', '2020-09-27 03:06:08', '2020-09-27 03:06:08'),
('3320012004', 'Tedunan', '1', 'Jepara', 'Jawa Tengah', '2020-09-28 03:06:08', '2020-09-28 03:06:08'),
('3320012005', 'Sowan lor', '1', 'Jepara', 'Jawa Tengah', '2020-09-29 03:06:08', '2020-09-29 03:06:08'),
('3320012006', 'Sowan Kidul', '1', 'Jepara', 'Jawa Tengah', '2020-09-30 03:06:08', '2020-09-30 03:06:08'),
('3320012007', 'Wanusobo', '1', 'Jepara', 'Jawa Tengah', '2020-10-01 03:06:08', '2020-10-01 03:06:08'),
('3320012008', 'Surodadi', '1', 'Jepara', 'Jawa Tengah', '2020-10-02 03:06:08', '2020-10-02 03:06:08'),
('3320012009', 'Panggung', '1', 'Jepara', 'Jawa Tengah', '2020-10-03 03:06:08', '2020-10-03 03:06:08'),
('3320012010', 'Bulak Baru', '1', 'Jepara', 'Jawa Tengah', '2020-10-04 03:06:08', '2020-10-04 03:06:08'),
('3320012011', 'Jondang', '1', 'Jepara', 'Jawa Tengah', '2020-10-05 03:06:08', '2020-10-05 03:06:08'),
('3320012012', 'Bugel', '1', 'Jepara', 'Jawa Tengah', '2020-10-06 03:06:08', '2020-10-06 03:06:08'),
('3320012013', 'Dongos', '1', 'Jepara', 'Jawa Tengah', '2020-10-07 03:06:08', '2020-10-07 03:06:08'),
('3320012014', 'Menganti', '1', 'Jepara', 'Jawa Tengah', '2020-10-08 03:06:08', '2020-10-08 03:06:08'),
('3320012015', 'Kerso', '1', 'Jepara', 'Jawa Tengah', '2020-10-09 03:06:08', '2020-10-09 03:06:08'),
('3320012016', 'Tanggultlare', '1', 'Jepara', 'Jawa Tengah', '2020-10-10 03:06:08', '2020-10-10 03:06:08'),
('3320012017', 'Rau', '1', 'Jepara', 'Jawa Tengah', '2020-10-11 03:06:08', '2020-10-11 03:06:08'),
('3320012018', 'Sukosono', '1', 'Jepara', 'Jawa Tengah', '2020-10-12 03:06:08', '2020-10-12 03:06:08'),
('3320022001', 'Kaliombo', '2', 'Jepara', 'Jawa Tengah', '2020-10-13 03:06:08', '2020-10-13 03:06:08'),
('3320022002', 'Karangrandu', '2', 'Jepara', 'Jawa Tengah', '2020-10-14 03:06:08', '2020-10-14 03:06:08'),
('3320022003', 'Gerdu', '2', 'Jepara', 'Jawa Tengah', '2020-10-15 03:06:08', '2020-10-15 03:06:08'),
('3320022004', 'Pecangaan Kulon', '2', 'Jepara', 'Jawa Tengah', '2020-10-16 03:06:08', '2020-10-16 03:06:08'),
('3320022005', 'Rengging', '2', 'Jepara', 'Jawa Tengah', '2020-10-17 03:06:08', '2020-10-17 03:06:08'),
('3320022006', 'Troso', '2', 'Jepara', 'Jawa Tengah', '2020-10-18 03:06:08', '2020-10-18 03:06:08'),
('3320022007', 'Ngeling', '2', 'Jepara', 'Jawa Tengah', '2020-10-19 03:06:08', '2020-10-19 03:06:08'),
('3320022008', 'Pulodarat', '2', 'Jepara', 'Jawa Tengah', '2020-10-20 03:06:08', '2020-10-20 03:06:08'),
('3320022009', 'Lebuawu', '2', 'Jepara', 'Jawa Tengah', '2020-10-21 03:06:08', '2020-10-21 03:06:08'),
('3320022010', 'Gemulung', '2', 'Jepara', 'Jawa Tengah', '2020-10-22 03:06:08', '2020-10-22 03:06:08'),
('3320022011', 'Pecangaan Wetan', '2', 'Jepara', 'Jawa Tengah', '2020-10-23 03:06:08', '2020-10-23 03:06:08'),
('3320022012', 'Krasak', '2', 'Jepara', 'Jawa Tengah', '2020-10-24 03:06:08', '2020-10-24 03:06:08'),
('3320032001', 'Ujung Pandan', '3', 'Jepara', 'Jawa Tengah', '2020-10-25 03:06:08', '2020-10-25 03:06:08'),
('3320032002', 'Karanganyar', '3', 'Jepara', 'Jawa Tengah', '2020-10-26 03:06:08', '2020-10-26 03:06:08'),
('3320032003', 'Guwosobokerto', '3', 'Jepara', 'Jawa Tengah', '2020-10-27 03:06:08', '2020-10-27 03:06:08'),
('3320032004', 'Kedungsarimulyo', '3', 'Jepara', 'Jawa Tengah', '2020-10-28 03:06:08', '2020-10-28 03:06:08'),
('3320032005', 'Bugo', '3', 'Jepara', 'Jawa Tengah', '2020-10-29 03:06:08', '2020-10-29 03:06:08'),
('3320032006', 'Welahan', '3', 'Jepara', 'Jawa Tengah', '2020-10-30 03:06:08', '2020-10-30 03:06:08'),
('3320032007', 'Gedangan', '3', 'Jepara', 'Jawa Tengah', '2020-10-31 03:06:08', '2020-10-31 03:06:08'),
('3320032008', 'Ketileng Singolelo', '3', 'Jepara', 'Jawa Tengah', '2020-11-01 03:06:08', '2020-11-01 03:06:08'),
('3320032009', 'Kalipucang Wetan', '3', 'Jepara', 'Jawa Tengah', '2020-11-02 03:06:08', '2020-11-02 03:06:08'),
('3320032010', 'Kalipucang Kulon', '3', 'Jepara', 'Jawa Tengah', '2020-11-03 03:06:08', '2020-11-03 03:06:08'),
('3320032011', 'Gidangelo', '3', 'Jepara', 'Jawa Tengah', '2020-11-04 03:06:08', '2020-11-04 03:06:08'),
('3320032012', 'Kendeng Sidialit', '3', 'Jepara', 'Jawa Tengah', '2020-11-05 03:06:08', '2020-11-05 03:06:08'),
('3320032013', 'Sidigede', '3', 'Jepara', 'Jawa Tengah', '2020-11-06 03:06:08', '2020-11-06 03:06:08'),
('3320032014', 'Teluk Wetan', '3', 'Jepara', 'Jawa Tengah', '2020-11-07 03:06:08', '2020-11-07 03:06:08'),
('3320032015', 'Brantak Sekarjati', '3', 'Jepara', 'Jawa Tengah', '2020-11-08 03:06:08', '2020-11-08 03:06:08'),
('3320042001', 'Mayong Lor', '4', 'Jepara', 'Jawa Tengah', '2020-11-09 03:06:08', '2020-11-09 03:06:08'),
('3320042002', 'Tigajuru', '4', 'Jepara', 'Jawa Tengah', '2020-11-10 03:06:08', '2020-11-10 03:06:08'),
('3320042003', 'Paren', '4', 'Jepara', 'Jawa Tengah', '2020-11-11 03:06:08', '2020-11-11 03:06:08'),
('3320042004', 'Kuanyar', '4', 'Jepara', 'Jawa Tengah', '2020-11-12 03:06:08', '2020-11-12 03:06:08'),
('3320042005', 'Pelang', '4', 'Jepara', 'Jawa Tengah', '2020-11-13 03:06:08', '2020-11-13 03:06:08'),
('3320042006', 'Sengonbugel', '4', 'Jepara', 'Jawa Tengah', '2020-11-14 03:06:08', '2020-11-14 03:06:08'),
('3320042007', 'Jebol', '4', 'Jepara', 'Jawa Tengah', '2020-11-15 03:06:08', '2020-11-15 03:06:08'),
('3320042008', 'Singorojo', '4', 'Jepara', 'Jawa Tengah', '2020-11-16 03:06:08', '2020-11-16 03:06:08'),
('3320042009', 'Pelemkerep', '4', 'Jepara', 'Jawa Tengah', '2020-11-17 03:06:08', '2020-11-17 03:06:08'),
('3320042010', 'Buaran', '4', 'Jepara', 'Jawa Tengah', '2020-11-18 03:06:08', '2020-11-18 03:06:08'),
('3320042011', 'Ngroto', '4', 'Jepara', 'Jawa Tengah', '2020-11-19 03:06:08', '2020-11-19 03:06:08'),
('3320042012', 'Rajekwesi', '4', 'Jepara', 'Jawa Tengah', '2020-11-20 03:06:08', '2020-11-20 03:06:08'),
('3320042013', 'Datar', '4', 'Jepara', 'Jawa Tengah', '2020-11-21 03:06:08', '2020-11-21 03:06:08'),
('3320042014', 'Pule', '4', 'Jepara', 'Jawa Tengah', '2020-11-22 03:06:08', '2020-11-22 03:06:08'),
('3320042015', 'Bandung', '4', 'Jepara', 'Jawa Tengah', '2020-11-23 03:06:08', '2020-11-23 03:06:08'),
('3320042016', 'Bungu', '4', 'Jepara', 'Jawa Tengah', '2020-11-24 03:06:08', '2020-11-24 03:06:08'),
('3320042017', 'Pancur', '4', 'Jepara', 'Jawa Tengah', '2020-11-25 03:06:08', '2020-11-25 03:06:08'),
('3320042018', 'Mayong Kidul', '4', 'Jepara', 'Jawa Tengah', '2020-11-26 03:06:08', '2020-11-26 03:06:08'),
('3320052001', 'Geneng', '5', 'Jepara', 'Jawa Tengah', '2020-11-27 03:06:08', '2020-11-27 03:06:08'),
('3320052002', 'Raguklampitan', '5', 'Jepara', 'Jawa Tengah', '2020-11-28 03:06:08', '2020-11-28 03:06:08'),
('3320052003', 'Ngasem', '5', 'Jepara', 'Jawa Tengah', '2020-11-29 03:06:08', '2020-11-29 03:06:08'),
('3320052004', 'Bawu', '5', 'Jepara', 'Jawa Tengah', '2020-11-30 03:06:08', '2020-11-30 03:06:08'),
('3320052005', 'Mindahan', '5', 'Jepara', 'Jawa Tengah', '2020-12-01 03:06:08', '2020-12-01 03:06:08'),
('3320052006', 'Somosari', '5', 'Jepara', 'Jawa Tengah', '2020-12-02 03:06:08', '2020-12-02 03:06:08'),
('3320052007', 'Batealit', '5', 'Jepara', 'Jawa Tengah', '2020-12-03 03:06:08', '2020-12-03 03:06:08'),
('3320052008', 'Bringin', '5', 'Jepara', 'Jawa Tengah', '2020-12-04 03:06:08', '2020-12-04 03:06:08'),
('3320052009', 'Bantrung', '5', 'Jepara', 'Jawa Tengah', '2020-12-05 03:06:08', '2020-12-05 03:06:08'),
('3320052010', 'Pekalongan', '5', 'Jepara', 'Jawa Tengah', '2020-12-06 03:06:08', '2020-12-06 03:06:08'),
('3320052011', 'Mindahan Kidul', '5', 'Jepara', 'Jawa Tengah', '2020-12-07 03:06:08', '2020-12-07 03:06:08'),
('3320061001', 'Karangkebagusan', '6', 'Jepara', 'Jawa Tengah', '2020-12-08 03:06:08', '2020-12-08 03:06:08'),
('3320061002', 'Demaan', '6', 'Jepara', 'Jawa Tengah', '2020-12-09 03:06:08', '2020-12-09 03:06:08'),
('3320061003', 'Potroyudan', '6', 'Jepara', 'Jawa Tengah', '2020-12-10 03:06:08', '2020-12-10 03:06:08'),
('3320061004', 'Bapangan', '6', 'Jepara', 'Jawa Tengah', '2020-12-11 03:06:08', '2020-12-11 03:06:08'),
('3320061005', 'Saripan', '6', 'Jepara', 'Jawa Tengah', '2020-12-12 03:06:08', '2020-12-12 03:06:08'),
('3320061006', 'Panggang', '6', 'Jepara', 'Jawa Tengah', '2020-12-13 03:06:08', '2020-12-13 03:06:08'),
('3320061007', 'Kauman', '6', 'Jepara', 'Jawa Tengah', '2020-12-14 03:06:08', '2020-12-14 03:06:08'),
('3320061008', 'Bulu', '6', 'Jepara', 'Jawa Tengah', '2020-12-15 03:06:08', '2020-12-15 03:06:08'),
('3320061009', 'Jobokuto', '6', 'Jepara', 'Jawa Tengah', '2020-12-16 03:06:08', '2020-12-16 03:06:08'),
('3320061010', 'Ujungbatu', '6', 'Jepara', 'Jawa Tengah', '2020-12-17 03:06:08', '2020-12-17 03:06:08'),
('3320061011', 'Pengkol', '6', 'Jepara', 'Jawa Tengah', '2020-12-18 03:06:08', '2020-12-18 03:06:08'),
('3320062012', 'Mulyoharjo', '6', 'Jepara', 'Jawa Tengah', '2020-12-19 03:06:08', '2020-12-19 03:06:08'),
('3320062013', 'Wonorejo', '6', 'Jepara', 'Jawa Tengah', '2020-12-20 03:06:08', '2020-12-20 03:06:08'),
('3320062014', 'Kedungcino', '6', 'Jepara', 'Jawa Tengah', '2020-12-21 03:06:08', '2020-12-21 03:06:08'),
('3320062015', 'Kuwasen', '6', 'Jepara', 'Jawa Tengah', '2020-12-22 03:06:08', '2020-12-22 03:06:08'),
('3320062016', 'Bandengan', '6', 'Jepara', 'Jawa Tengah', '2020-12-23 03:06:08', '2020-12-23 03:06:08'),
('3320072001', 'Mororejo', '7', 'Jepara', 'Jawa Tengah', '2020-12-24 03:06:08', '2020-12-24 03:06:08'),
('3320072009', 'Suwawal', '7', 'Jepara', 'Jawa Tengah', '2020-12-25 03:06:08', '2020-12-25 03:06:08'),
('3320072010', 'Sinanggul', '7', 'Jepara', 'Jawa Tengah', '2020-12-26 03:06:08', '2020-12-26 03:06:08'),
('3320072011', 'Jambu', '7', 'Jepara', 'Jawa Tengah', '2020-12-27 03:06:08', '2020-12-27 03:06:08'),
('3320072012', 'Srobyong', '7', 'Jepara', 'Jawa Tengah', '2020-12-28 03:06:08', '2020-12-28 03:06:08'),
('3320072013', 'Sekuro', '7', 'Jepara', 'Jawa Tengah', '2020-12-29 03:06:08', '2020-12-29 03:06:08'),
('3320072014', 'Karanggondang', '7', 'Jepara', 'Jawa Tengah', '2020-12-30 03:06:08', '2020-12-30 03:06:08'),
('3320072015', 'Jambu Timur', '7', 'Jepara', 'Jawa Tengah', '2020-12-31 03:06:08', '2020-12-31 03:06:08'),
('3320082001', 'Guyangan', '8', 'Jepara', 'Jawa Tengah', '2021-01-01 03:06:08', '2021-01-01 03:06:08'),
('3320082002', 'Kepuk', '8', 'Jepara', 'Jawa Tengah', '2021-01-02 03:06:08', '2021-01-02 03:06:08'),
('3320082003', 'Papasan', '8', 'Jepara', 'Jawa Tengah', '2021-01-03 03:06:08', '2021-01-03 03:06:08'),
('3320082004', 'Srikandang', '8', 'Jepara', 'Jawa Tengah', '2021-01-04 03:06:08', '2021-01-04 03:06:08'),
('3320082005', 'Tengguli', '8', 'Jepara', 'Jawa Tengah', '2021-01-05 03:06:08', '2021-01-05 03:06:08'),
('3320082006', 'Bangsri', '8', 'Jepara', 'Jawa Tengah', '2021-01-06 03:06:08', '2021-01-06 03:06:08'),
('3320082007', 'Banjaran', '8', 'Jepara', 'Jawa Tengah', '2021-01-07 03:06:08', '2021-01-07 03:06:08'),
('3320082008', 'Wedelan', '8', 'Jepara', 'Jawa Tengah', '2021-01-08 03:06:08', '2021-01-08 03:06:08'),
('3320082009', 'Kedungleper', '8', 'Jepara', 'Jawa Tengah', '2021-01-09 03:06:08', '2021-01-09 03:06:08'),
('3320082010', 'Jerukwangi', '8', 'Jepara', 'Jawa Tengah', '2021-01-10 03:06:08', '2021-01-10 03:06:08'),
('3320082011', 'Bondo', '8', 'Jepara', 'Jawa Tengah', '2021-01-11 03:06:08', '2021-01-11 03:06:08'),
('3320082012', 'Banjaragung', '8', 'Jepara', 'Jawa Tengah', '2021-01-12 03:06:08', '2021-01-12 03:06:08'),
('3320092001', 'Tempur', '9', 'Jepara', 'Jawa Tengah', '2021-01-13 03:06:08', '2021-01-13 03:06:08'),
('3320092002', 'Damarwulan', '9', 'Jepara', 'Jawa Tengah', '2021-01-14 03:06:08', '2021-01-14 03:06:08'),
('3320092003', 'Kunir', '9', 'Jepara', 'Jawa Tengah', '2021-01-15 03:06:08', '2021-01-15 03:06:08'),
('3320092004', 'Watuaji', '9', 'Jepara', 'Jawa Tengah', '2021-01-16 03:06:08', '2021-01-16 03:06:08'),
('3320092005', 'Klepu', '9', 'Jepara', 'Jawa Tengah', '2021-01-17 03:06:08', '2021-01-17 03:06:08'),
('3320092006', 'Tunahan', '9', 'Jepara', 'Jawa Tengah', '2021-01-18 03:06:08', '2021-01-18 03:06:08'),
('3320092007', 'Kaligarang', '9', 'Jepara', 'Jawa Tengah', '2021-01-19 03:06:08', '2021-01-19 03:06:08'),
('3320092008', 'Keling', '9', 'Jepara', 'Jawa Tengah', '2021-01-20 03:06:08', '2021-01-20 03:06:08'),
('3320092009', 'Gelang', '9', 'Jepara', 'Jawa Tengah', '2021-01-21 03:06:08', '2021-01-21 03:06:08'),
('3320092010', 'Jlegong', '9', 'Jepara', 'Jawa Tengah', '2021-01-22 03:06:08', '2021-01-22 03:06:08'),
('3320092011', 'Kelet', '9', 'Jepara', 'Jawa Tengah', '2021-01-23 03:06:08', '2021-01-23 03:06:08'),
('3320092020', 'Bumiharjo', '9', 'Jepara', 'Jawa Tengah', '2021-01-24 03:06:08', '2021-01-24 03:06:08'),
('3320102001', 'Karimun Jawa', '10', 'Jepara', 'Jawa Tengah', '2021-01-25 03:06:08', '2021-01-25 03:06:08'),
('3320102002', 'Kemujan', '10', 'Jepara', 'Jawa Tengah', '2021-01-26 03:06:08', '2021-01-26 03:06:08'),
('3320102003', 'Parang', '10', 'Jepara', 'Jawa Tengah', '2021-01-27 03:06:08', '2021-01-27 03:06:08'),
('3320102004', 'Nyamuk', '10', 'Jepara', 'Jawa Tengah', '2021-01-28 03:06:08', '2021-01-28 03:06:08'),
('3320112001', 'Ngabul', '11', 'Jepara', 'Jawa Tengah', '2021-01-29 03:06:08', '2021-01-29 03:06:08'),
('3320112002', 'Langon', '11', 'Jepara', 'Jawa Tengah', '2021-01-30 03:06:08', '2021-01-30 03:06:08'),
('3320112003', 'Sukodono', '11', 'Jepara', 'Jawa Tengah', '2021-01-31 03:06:08', '2021-01-31 03:06:08'),
('3320112004', 'Petekeyan', '11', 'Jepara', 'Jawa Tengah', '2021-02-01 03:06:08', '2021-02-01 03:06:08'),
('3320112005', 'Mangunan', '11', 'Jepara', 'Jawa Tengah', '2021-02-02 03:06:08', '2021-02-02 03:06:08'),
('3320112006', 'Platar', '11', 'Jepara', 'Jawa Tengah', '2021-02-03 03:06:08', '2021-02-03 03:06:08'),
('3320112007', 'Semat', '11', 'Jepara', 'Jawa Tengah', '2021-02-04 03:06:08', '2021-02-04 03:06:08'),
('3320112008', 'Teluk Awur', '11', 'Jepara', 'Jawa Tengah', '2021-02-05 03:06:08', '2021-02-05 03:06:08'),
('3320112009', 'Demangan', '11', 'Jepara', 'Jawa Tengah', '2021-02-06 03:06:08', '2021-02-06 03:06:08'),
('3320112010', 'Tegalsambi', '11', 'Jepara', 'Jawa Tengah', '2021-02-07 03:06:08', '2021-02-07 03:06:08'),
('3320112011', 'Mantingan', '11', 'Jepara', 'Jawa Tengah', '2021-02-08 03:06:08', '2021-02-08 03:06:08'),
('3320112012', 'Tahunan', '11', 'Jepara', 'Jawa Tengah', '2021-02-09 03:06:08', '2021-02-09 03:06:08'),
('3320112013', 'Kecapi', '11', 'Jepara', 'Jawa Tengah', '2021-02-10 03:06:08', '2021-02-10 03:06:08'),
('3320112014', 'Senenan', '11', 'Jepara', 'Jawa Tengah', '2021-02-11 03:06:08', '2021-02-11 03:06:08'),
('3320112015', 'Krapyak', '11', 'Jepara', 'Jawa Tengah', '2021-02-12 03:06:08', '2021-02-12 03:06:08'),
('3320122001', 'Blimbingrejo', '12', 'Jepara', 'Jawa Tengah', '2021-02-13 03:06:08', '2021-02-13 03:06:08'),
('3320122002', 'Tunggul Pandean', '12', 'Jepara', 'Jawa Tengah', '2021-02-14 03:06:08', '2021-02-14 03:06:08'),
('3320122003', 'Pringtulis', '12', 'Jepara', 'Jawa Tengah', '2021-02-15 03:06:08', '2021-02-15 03:06:08'),
('3320122004', 'Jatisari', '12', 'Jepara', 'Jawa Tengah', '2021-02-16 03:06:08', '2021-02-16 03:06:08'),
('3320122005', 'Gemiring Kidul', '12', 'Jepara', 'Jawa Tengah', '2021-02-17 03:06:08', '2021-02-17 03:06:08'),
('3320122006', 'Gemiring Lor', '12', 'Jepara', 'Jawa Tengah', '2021-02-18 03:06:08', '2021-02-18 03:06:08'),
('3320122007', 'Nalumsari', '12', 'Jepara', 'Jawa Tengah', '2021-02-19 03:06:08', '2021-02-19 03:06:08'),
('3320122008', 'Tritis', '12', 'Jepara', 'Jawa Tengah', '2021-02-20 03:06:08', '2021-02-20 03:06:08'),
('3320122009', 'Daren', '12', 'Jepara', 'Jawa Tengah', '2021-02-21 03:06:08', '2021-02-21 03:06:08'),
('3320122010', 'Karangnongko', '12', 'Jepara', 'Jawa Tengah', '2021-02-22 03:06:08', '2021-02-22 03:06:08'),
('3320122011', 'Ngetuk', '12', 'Jepara', 'Jawa Tengah', '2021-02-23 03:06:08', '2021-02-23 03:06:08'),
('3320122012', 'Bendanpete', '12', 'Jepara', 'Jawa Tengah', '2021-02-24 03:06:08', '2021-02-24 03:06:08'),
('3320122013', 'Muryolobo', '12', 'Jepara', 'Jawa Tengah', '2021-02-25 03:06:08', '2021-02-25 03:06:08'),
('3320122014', 'Bategede', '12', 'Jepara', 'Jawa Tengah', '2021-02-26 03:06:08', '2021-02-26 03:06:08'),
('3320122015', 'Dorang', '12', 'Jepara', 'Jawa Tengah', '2021-02-27 03:06:08', '2021-02-27 03:06:08'),
('3320132001', 'Batukali', '13', 'Jepara', 'Jawa Tengah', '2021-02-28 03:06:08', '2021-02-28 03:06:08'),
('3320132002', 'Bandungrejo', '13', 'Jepara', 'Jawa Tengah', '2021-03-01 03:06:08', '2021-03-01 03:06:08'),
('3320132003', 'Banyuputih', '13', 'Jepara', 'Jawa Tengah', '2021-03-02 03:06:08', '2021-03-02 03:06:08'),
('3320132004', 'Pendosawalan', '13', 'Jepara', 'Jawa Tengah', '2021-03-03 03:06:08', '2021-03-03 03:06:08'),
('3320132005', 'Damarjati', '13', 'Jepara', 'Jawa Tengah', '2021-03-04 03:06:08', '2021-03-04 03:06:08'),
('3320132006', 'Purwogondo', '13', 'Jepara', 'Jawa Tengah', '2021-03-05 03:06:08', '2021-03-05 03:06:08'),
('3320132007', 'Margoyoso', '13', 'Jepara', 'Jawa Tengah', '2021-03-06 03:06:08', '2021-03-06 03:06:08'),
('3320132008', 'Sendang', '13', 'Jepara', 'Jawa Tengah', '2021-03-07 03:06:08', '2021-03-07 03:06:08'),
('3320132009', 'Kriyan', '13', 'Jepara', 'Jawa Tengah', '2021-03-08 03:06:08', '2021-03-08 03:06:08'),
('3320132010', 'Robayan', '13', 'Jepara', 'Jawa Tengah', '2021-03-09 03:06:08', '2021-03-09 03:06:08'),
('3320132011', 'Bakalan', '13', 'Jepara', 'Jawa Tengah', '2021-03-10 03:06:08', '2021-03-10 03:06:08'),
('3320132012', 'Manyargading', '13', 'Jepara', 'Jawa Tengah', '2021-03-11 03:06:08', '2021-03-11 03:06:08'),
('3320142001', 'Dudakawu', '14', 'Jepara', 'Jawa Tengah', '2021-03-12 03:06:08', '2021-03-12 03:06:08'),
('3320142002', 'Sumanding', '14', 'Jepara', 'Jawa Tengah', '2021-03-13 03:06:08', '2021-03-13 03:06:08'),
('3320142003', 'Bucu', '14', 'Jepara', 'Jawa Tengah', '2021-03-14 03:06:08', '2021-03-14 03:06:08'),
('3320142004', 'Cepogo', '14', 'Jepara', 'Jawa Tengah', '2021-03-15 03:06:08', '2021-03-15 03:06:08'),
('3320142005', 'Pendem', '14', 'Jepara', 'Jawa Tengah', '2021-03-16 03:06:08', '2021-03-16 03:06:08'),
('3320142006', 'Jinggotan', '14', 'Jepara', 'Jawa Tengah', '2021-03-17 03:06:08', '2021-03-17 03:06:08'),
('3320142007', 'Dermolo', '14', 'Jepara', 'Jawa Tengah', '2021-03-18 03:06:08', '2021-03-18 03:06:08'),
('3320142008', 'Kaliaman', '14', 'Jepara', 'Jawa Tengah', '2021-03-19 03:06:08', '2021-03-19 03:06:08'),
('3320142009', 'Tubanan', '14', 'Jepara', 'Jawa Tengah', '2021-03-20 03:06:08', '2021-03-20 03:06:08'),
('3320142010', 'Balong', '14', 'Jepara', 'Jawa Tengah', '2021-03-21 03:06:08', '2021-03-21 03:06:08'),
('3320142011', 'Kancilan', '14', 'Jepara', 'Jawa Tengah', '2021-03-22 03:06:08', '2021-03-22 03:06:08'),
('3320152001', 'Lebak', '15', 'Jepara', 'Jawa Tengah', '2021-03-23 03:06:08', '2021-03-23 03:06:08'),
('3320152002', 'Bulungan', '15', 'Jepara', 'Jawa Tengah', '2021-03-24 03:06:08', '2021-03-24 03:06:08'),
('3320152003', 'Suwawal Timur', '15', 'Jepara', 'Jawa Tengah', '2021-03-25 03:06:08', '2021-03-25 03:06:08'),
('3320152004', 'Kawak', '15', 'Jepara', 'Jawa Tengah', '2021-03-26 03:06:08', '2021-03-26 03:06:08'),
('3320152005', 'Tanjung', '15', 'Jepara', 'Jawa Tengah', '2021-03-27 03:06:08', '2021-03-27 03:06:08'),
('3320152006', 'Plajan', '15', 'Jepara', 'Jawa Tengah', '2021-03-28 03:06:08', '2021-03-28 03:06:08'),
('3320152007', 'Slagi', '15', 'Jepara', 'Jawa Tengah', '2021-03-29 03:06:08', '2021-03-29 03:06:08'),
('3320152008', 'Mambak', '15', 'Jepara', 'Jawa Tengah', '2021-03-30 03:06:08', '2021-03-30 03:06:08'),
('3320162001', 'Sumberrejo', '16', 'Jepara', 'Jawa Tengah', '2021-03-31 03:06:08', '2021-03-31 03:06:08'),
('3320162002', 'Clering', '16', 'Jepara', 'Jawa Tengah', '2021-04-01 03:06:08', '2021-04-01 03:06:08'),
('3320162003', 'Ujung Watu', '16', 'Jepara', 'Jawa Tengah', '2021-04-02 03:06:08', '2021-04-02 03:06:08'),
('3320162004', 'Banyumanis', '16', 'Jepara', 'Jawa Tengah', '2021-04-03 03:06:08', '2021-04-03 03:06:08'),
('3320162005', 'Tulakan', '16', 'Jepara', 'Jawa Tengah', '2021-04-04 03:06:08', '2021-04-04 03:06:08'),
('3320162006', 'Bandungharjo', '16', 'Jepara', 'Jawa Tengah', '2021-04-05 03:06:08', '2021-04-05 03:06:08'),
('3320162007', 'Blingoh', '16', 'Jepara', 'Jawa Tengah', '2021-04-06 03:06:08', '2021-04-06 03:06:08'),
('3320162008', 'Jugo', '16', 'Jepara', 'Jawa Tengah', '2021-04-07 03:06:08', '2021-04-07 03:06:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kecamatans`
--

CREATE TABLE `kecamatans` (
  `id` int(11) NOT NULL,
  `nama_kecamatan` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kecamatans`
--

INSERT INTO `kecamatans` (`id`, `nama_kecamatan`, `created_at`, `updated_at`) VALUES
(1, 'Kedung', '2020-09-25 03:06:08', '2020-09-25 03:06:08'),
(2, 'Pecangaan', '2020-09-26 03:06:08', '2020-09-26 03:06:08'),
(3, 'Welahan', '2020-09-27 03:06:08', '2020-09-27 03:06:08'),
(4, 'Mayong', '2020-09-28 03:06:08', '2020-09-28 03:06:08'),
(5, 'Batealit', '2020-09-29 03:06:08', '2020-09-29 03:06:08'),
(6, 'Jepara', '2020-09-30 03:06:08', '2020-09-30 03:06:08'),
(7, 'Mlonggo', '2020-10-01 03:06:08', '2020-10-01 03:06:08'),
(8, 'Bangsri', '2020-10-02 03:06:08', '2020-10-02 03:06:08'),
(9, 'Keling', '2020-10-03 03:06:08', '2020-10-03 03:06:08'),
(10, 'Karimun Jawa', '2020-10-04 03:06:08', '2020-10-04 03:06:08'),
(11, 'Tahunan', '2020-10-05 03:06:08', '2020-10-05 03:06:08'),
(12, 'Nalumsari', '2020-10-06 03:06:08', '2020-10-06 03:06:08'),
(13, 'Kalinyamatan', '2020-10-07 03:06:08', '2020-10-07 03:06:08'),
(14, 'Kembang', '2020-10-08 03:06:08', '2020-10-08 03:06:08'),
(15, 'Pakis aji', '2020-10-09 03:06:08', '2020-10-09 03:06:08'),
(16, 'Donorojo', '2020-10-10 03:06:08', '2020-10-10 03:06:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `laporan`
--

CREATE TABLE `laporan` (
  `laporan_id` int(11) NOT NULL,
  `csr_id` varchar(20) DEFAULT NULL,
  `jumlah_target` int(11) DEFAULT NULL,
  `dana_akhir` bigint(20) DEFAULT NULL,
  `tgl_selesai` date DEFAULT NULL,
  `file_laporan` text DEFAULT NULL,
  `konfirmasi_desa` enum('1','2','3') DEFAULT '1',
  `status_validasi` enum('1','2','3') DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `laporan`
--

INSERT INTO `laporan` (`laporan_id`, `csr_id`, `jumlah_target`, `dana_akhir`, `tgl_selesai`, `file_laporan`, `konfirmasi_desa`, `status_validasi`, `created_at`, `updated_at`) VALUES
(19, '1', 1, 20000000, '2022-02-01', '11643721632.pdf', '3', '3', '2022-01-30 14:20:06', '2022-01-30 14:20:06'),
(20, '55', 20, 20000000, '2022-01-30', '551643553027.pdf', '3', '3', '2022-01-30 14:26:12', '2022-01-30 14:26:12'),
(21, '56', 2, 10000000, '2022-01-31', '561643553054.pdf', '3', '3', '2022-01-30 14:26:15', '2022-01-30 14:26:15'),
(22, '60', 20, 20000000, '2022-02-01', '601643554028.pdf', '3', '3', '2022-01-30 14:26:18', '2022-01-30 14:26:18'),
(23, '58', 2, 40000000, '2022-02-01', '581643721654.pdf', '3', '3', '2022-01-30 14:26:20', '2022-01-30 14:26:20'),
(24, '59', 1, 40000000, '2022-02-01', '591643721690.pdf', '3', '3', '2022-01-30 14:26:22', '2022-01-30 14:26:22'),
(25, '57', 100, 25000000, '2022-02-01', '571643721710.pdf', '3', '2', '2022-01-30 14:26:26', '2022-01-30 14:26:26'),
(26, '65', 10, 50000000, '2022-02-01', '651643721738.pdf', '3', '3', '2022-02-01 12:34:36', '2022-02-01 12:34:36'),
(27, '61', 150, 25000000, '2022-02-01', '611643721986.pdf', '1', '2', '2022-02-01 12:34:40', '2022-02-01 12:34:40'),
(28, '62', 100, 40000000, '2022-02-01', '621643722021.pdf', '1', '2', '2022-02-01 12:34:43', '2022-02-01 12:34:43'),
(29, '63', 2, 60000000, '2022-02-01', '631643722045.pdf', '1', '2', '2022-02-01 12:34:46', '2022-02-01 12:34:46'),
(30, '64', 100, 25000000, '2022-02-01', '641643722066.pdf', '3', '2', '2022-02-01 12:34:48', '2022-02-01 12:34:48'),
(31, '71', NULL, NULL, NULL, NULL, '1', '1', '2022-02-01 13:13:11', '2022-02-01 13:13:11'),
(32, '67', NULL, NULL, NULL, NULL, '1', '1', '2022-02-01 13:13:22', '2022-02-01 13:13:22'),
(33, '70', NULL, NULL, NULL, NULL, '1', '1', '2022-02-01 13:13:25', '2022-02-01 13:13:25'),
(34, '72', NULL, NULL, NULL, NULL, '1', '1', '2022-02-01 13:23:18', '2022-02-01 13:23:18'),
(35, '66', NULL, NULL, NULL, NULL, '1', '1', '2022-02-01 13:23:22', '2022-02-01 13:23:22'),
(36, '73', NULL, NULL, NULL, NULL, '1', '1', '2022-02-01 13:25:04', '2022-02-01 13:25:04'),
(37, '68', NULL, NULL, NULL, NULL, '1', '1', '2022-02-01 13:25:07', '2022-02-01 13:25:07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `satuan`
--

CREATE TABLE `satuan` (
  `satuan_id` int(11) NOT NULL,
  `nama_satuan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `satuan`
--

INSERT INTO `satuan` (`satuan_id`, `nama_satuan`) VALUES
(1, 'METER'),
(2, 'ORANG'),
(3, 'UNIT'),
(4, 'KELOMPOK');

-- --------------------------------------------------------

--
-- Struktur dari tabel `subbidangs`
--

CREATE TABLE `subbidangs` (
  `id` int(11) NOT NULL,
  `nama_sub` varchar(100) NOT NULL,
  `bidang_id` varchar(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `subbidangs`
--

INSERT INTO `subbidangs` (`id`, `nama_sub`, `bidang_id`, `created_at`, `updated_at`) VALUES
(101, 'Penyedia Sarana dan Prasarana di Bidang Pendidikan', '1', '2020-09-25 03:06:08', '2020-09-25 03:06:08'),
(102, 'Peningkatan Kualifikasi dan Kompentensi Tenaga Pendidik dan Kependidikan', '1', '2020-09-26 03:06:08', '2020-09-26 03:06:08'),
(103, 'Pemberian Beasiswa', '1', '2020-09-27 03:06:08', '2020-09-27 03:06:08'),
(104, 'Kegiatan Pengembangan SDM', '1', '2020-09-28 03:06:08', '2020-09-28 03:06:08'),
(201, 'Sarana dan Prasarana Puskesmas', '2', '2020-09-29 03:06:08', '2020-09-29 03:06:08'),
(202, 'Sarana dan Prasarana Puskesmas Pembantu', '2', '2020-09-30 03:06:08', '2020-09-30 03:06:08'),
(203, 'Sarana dan Prasarana Poliklinik Kesehatan', '2', '2020-10-01 03:06:08', '2020-10-01 03:06:08'),
(204, 'Sarana dan Prasarana Posyandu', '2', '2020-10-02 03:06:08', '2020-10-02 03:06:08'),
(205, 'Peningkatan Kualitas Tenaga Kesehatan', '2', '2020-10-03 03:06:08', '2020-10-03 03:06:08'),
(301, 'Pencegahan Polusi', '3', '2020-10-04 03:06:08', '2020-10-04 03:06:08'),
(302, 'Penggunaan Sumber Daya yang Berkelanjutan', '3', '2020-10-05 03:06:08', '2020-10-05 03:06:08'),
(303, 'Pegembangan Penyehatan Lingkungan', '3', '2020-10-06 03:06:08', '2020-10-06 03:06:08'),
(304, 'Pengembangan Sarana Prasarana Umum', '3', '2020-10-07 03:06:08', '2020-10-07 03:06:08'),
(305, 'Bantuan Korban Bencana Alam', '3', '2020-10-08 03:06:08', '2020-10-08 03:06:08'),
(306, 'Pendidikan dan Latihan', '3', '2020-10-09 03:06:08', '2020-10-09 03:06:08'),
(307, 'Bantuan Pelestarian Alam', '3', '2020-10-10 03:06:08', '2020-10-10 03:06:08'),
(401, 'Peningkatan Pendapatan Masyarakat Khususnya Sektor Usaha Mikro dan Menengah', '4', '2020-10-11 03:06:08', '2020-10-11 03:06:08'),
(501, 'Pembangunan Rumah Layak Huni', '5', '2020-10-12 03:06:08', '2020-10-12 03:06:08'),
(502, 'Penyediaan Listrik Pedesaan', '5', '2020-10-13 03:06:08', '2020-10-13 03:06:08'),
(503, 'Penyediaan Air Bersih', '5', '2020-10-14 03:06:08', '2020-10-14 03:06:08'),
(504, 'Pembangunan Jalan', '5', '2020-10-15 03:06:08', '2020-10-15 03:06:08'),
(505, 'Pembangunan Jembatan', '5', '2020-10-16 03:06:08', '2020-10-16 03:06:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `kecamatan` varchar(100) NOT NULL,
  `desa` varchar(100) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `role` enum('1','2','3') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `password`, `email`, `kecamatan`, `desa`, `alamat`, `no_telp`, `role`, `created_at`, `updated_at`) VALUES
(1, 'duaputra', 'CV. DUA PUTRA', '$2y$10$SQ9neNJTBRsDoWBFX0Yj5OIvABxAcWu0pxWGTQ8Xjv8RJ63vnZg.m', 'duaputra123@gmail.com', '11', '3320112001', 'Jl. Raya Perniagaan Baru N0.2A, Jepara', '061324615', '3', '2022-01-29 14:28:50', '2022-01-29 15:04:17'),
(2, 'aek1234', 'AEK TARUM', '$2y$10$Yo9ix7rU/4Hn3FtZPJi6yeszFc/uCC.K7.ixXti1ZO8gqKskEhjVS', 'duaputra123@gmail.com', '9', '3320092001', 'Jl.Basuki Rahmat No.788 Palembang 30127 South Sumetera', '0711811921', '3', '2022-01-29 14:28:50', '2022-01-30 12:24:18'),
(3, 'agra1234', 'AGRA MASANG PERKASA II', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '4', '3320042007', 'JL.A.Yani No.102 B Ranto Prapat Labuhan Batu Sumatera Utara', '061571554', '3', '2022-01-29 14:28:50', '2022-01-30 12:24:31'),
(4, 'agra1235', 'Agra Masang Perkasa Plantation', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'JL.A.Yani No.102 B Ranto Prapat Labuhan Batu Sumatera Utara', '061-571554', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(5, 'agra1236', 'AGRA PARACITRA', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'JL.A.Yani No.102 B Ranto Prapat Labuhan Batu Sumatera Utara', '061571554', '3', '2022-01-29 14:28:50', '2022-01-30 12:24:04'),
(6, 'agra1237', 'AGRI ANDALAS', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '5', '3320052001', 'Jl.Simalungun No.1 Medan North Sumatera', '06154326', '3', '2022-01-29 14:28:50', '2022-01-30 12:24:53'),
(7, 'agricinal', 'Agricinal', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Kapuas No.16, Bengkulu', '0736-26346', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(8, 'agrikarsa', 'AGRIKARSA CENDANA', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '13', '3320132001', 'Jl.Kali Besar Barat No.50 GG,Jakarta 11230', '0216903334', '3', '2022-01-29 14:28:50', '2022-01-30 12:25:09'),
(9, 'agritasara', 'Agritasara Prima', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Kedoya Baru, Blok A-IV/5 Kebon Jeruk, Jakarta Barat', '021- 5801462', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(10, 'agro1234', 'Agro Indah Sembada', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Bank Pasifik Building 17th Floor, Jl.Jend.Sudirman Kav.7-8 Jakarta 10220', '021-5700700', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(11, 'agro1235', 'Agro Indomas', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Bank Surya Building 7th Floor, Jl.MH.Thamrind Jakarta Pusat', '021-3902250', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(12, 'agro1236', 'Agro Manunggal', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Wisma Daya,5th floor Jl.Asemka No.21 Jakarta Barat', '(021) 6903746', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(13, 'agro1237', 'Agro Menara Rahmat', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Pulo Ayang raya,Blok OR Kav.1 Kawasan industri Pulogadung Jakarta Timur', '(021)4616555', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(14, 'agro1238', 'Agro Palindo Sakti', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Basuki Rahmat No.788 Palembang 30127 South Sumetera', '0711-811901', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(15, 'agro1239', 'Agro Teknika Pratama', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Padang Kemiling No.12 Padang, West Sumatera', '0751-25132', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(16, 'agro1240', 'Agro Wiratama', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Aspak Building, 7th Floor room 705, Jl.H.R.Rasuna, Kav.X-2, No.4, Kuningan, Jakarta 12950', '021-5228794', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(17, 'agrodesa', 'Agrodesa Palmaindo', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Dempo Dalam I, No.930, Palembang, South Sumatera', '0711- 3120198', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(18, 'agrointim', 'Agrointim Respati', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'JITJ, 5th Floor, Jl.Mangga Dua Raya Jakarta 14430', '021-601796', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(19, 'agromuko', 'Agromuko', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Let.Jen.S.Parman No.217 Medan 20112 North Sumatera', '061- 552043', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(20, 'agropanca', 'Agropanca Modem', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'JITJ, 5th Floor, Jl.Mangga Dua Raya Jakarta 14430', '021-601796', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(21, 'agrowiyana', 'Agrowiyana', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Wisma Bakri,6th FloorJl.H.R.Rasuna Kav.B-1 Jakarta Selatan', '(021)5250192', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(22, 'agrowiyana', 'Agrowiyana (I)', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Wisma Bakri,6th FloorJl.H.R.Rasuna Kav.B-1 Jakarta Selatan', '(021)5250192', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(23, 'aimer123', 'Aimer Agromas', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'JITJ, 5th Floor, Jl.Mangga Dua Raya Jakarta 14430', '021-6017996', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(24, 'alam123', 'Alam Sari Lestari', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Sunter Mall Blok 1 No.7, Jl.Danau Sunter Utara Kav.G7 Jakarta 14350', '021-6410412', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(25, 'alicia1234', 'Alicia Indonesia', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Let.Jen.S.Parman No.217 Medan 20112 North Sumatera', '061-552043', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(26, 'alno1234', 'Alno Agro Utama', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Siti Khadijah No.62 Bengkulu', '0736-23678', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(27, 'aloer1234', 'Aloer Timur', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Sunggal No.91 Medan, North Sumatera', '061-851744', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(28, 'amaltani', 'Amaltani', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Nibungbaru No. 12-14 Medan, North Sumatera', '061-532515', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(29, 'aMP1234', 'AMP Plantation', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Samudera,No.26,Padang,West Sumatra', '(0751)33435', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(30, 'amri1234', 'Amri Bakti Utama', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Wolter Minginsidi No.12, Poso, Central Sulawesi', '0452- 21878', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(31, 'anak1234', 'Anak Tasik', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Bumi Dewi Building 3rd floor Jl Imam Bonjol,No.16 D Medan,North Sumatra', '(061)550496', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(32, 'anam1234', 'Anam Koto', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Khatib.Sulaiman Padang, West Sumatera', '0751-52217', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(33, 'andalas', 'Andalas Inti Estate Corp', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'BNI Building, 20th Floor, Jl.Jend.Sudirman Kav.1 Jakarta 10220', '021-5707500', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(34, 'aneka1234', 'Aneka Inti Persada,', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Central Plaza, 19-21st Floor, Jl.Jend.Sudirman Kav.47 Jakarta 12930', '021-5702288', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(35, 'aneka1235', 'Aneka Multi Kerta', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Central Plaza, 19-21st Floor, Jl.Jend.Sudirman Kav.47 Jakarta 12931', '021-5702289', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(36, 'antang123', 'Antang Ganda Utama', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'PLAZA MASHILL,9th floor Jl.Jendral Sudirman,Kav.25 Jakarta', '(021)5229818-22', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(37, 'antar1234', 'Antar Mustika Segara', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Gunung Sahari Raya,No.1 Blok A,No.8-9, 2nd Floor Jakarta Pusat', '(021)6299650-53', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(38, 'antari123', 'Antari Raya', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'JITJ, 5th Floor, Jl.Mangga Dua Raya Jakarta 14430', '021-6017996', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(39, 'archipelago', 'Archipelago Timur Indah', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'BNI Building, 22nd Floor, Jl.Jend.Sudirman Kav.1 Jakarta 10220', '021-5707500', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(40, 'arco1234', 'Arco (Aceh Rubbercorp)', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Panglima Polim No.118 Langsa, D.I.Aceh', '0641- 21123', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(41, 'arindo1234', 'Arindo Trisejahtera', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Teuku Umar No.48 Pekan Baru Riau', '0761-36663', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(42, 'asam1234', 'Asam Jawa', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Gajah Mada No.40, Medan, North Sumatera', '061-536379', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(43, 'asiatic12', 'Asiatic Persada', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Price Water House,12th floor,Room 1210 Jl.H.R.Rasuna Said,Kav.C-3,Jakarta Selatan', '(021)5212914', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(44, 'asririmba', 'Asririmba Wirabhakti', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Meranti No.1 Bengkulu', '0736-21867', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(45, 'astra1234', 'Astra Agro lestari Tbk', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Pulo Ayang raya,Blok OR Kav.1 Kawasan industri Pulogadung Jakarta13930', '(021)4616555', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(46, 'atakana', 'Atakana Company', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Sabarudin No.9 C Medan, North Sumatera', '061-740319', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(47, 'ayu1234', 'Ayu Sawit Lestari', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Sabarudin No.9 C Medan, North Sumatera', '061-740320', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(48, 'azarupindo', 'Azarupindo Jaya Corporation', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Ciledug Raya No.82 Kebayoran Lama, Jakarta Selatan', '021- 7398325', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(49, 'bagus1234', 'Bagus Sentosa gemilang', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Sudirman Tower,25th Floor,Jl.Jend.Sudirman Kav .60,Jakarta Selatan', '021-5226877', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(50, 'bahari123', 'Bahari Gembira Ria', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Central Plaza, 7th Floor, Jl.Jend.Sudirman Kav.47 Jakarta 12930', '021-2521607', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(51, 'bahruny', 'Bahruny', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Letkol Martinus Lubis,No.44 Medan,North Sumatra', '061- 530689', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(52, 'bakrie1234', 'Bakrie Nusantara Plantation', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Wisma Bakri,6th FloorJl.H.R.Rasuna Kav.B-1 Jakarta Selatan', '(021)5250192', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(53, 'bakrie1235', 'Bakrie Pasaman Plantations', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Wisma Bakrie Jl. H.R Rasuna Kav B-1 Kakarta 12920,Desa Buntut Kisaran 21202,North Sumatra', '(021)5250192', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(54, 'banda1234', 'Banda Aceh Sakti Jaya', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Taman Setia Budi Indah Blok RR No.147 Medan, North Sumatera', '061-800567', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(55, 'bandar1234', 'Bandar Sumatera Rubber', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Let.Jen.S.Parman No.217 Medan 20112 North Sumatera', '061-552043', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(56, 'bangun1234', 'Bangun Jaya ALam Permai', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Tanjung Tembaga No.8. 2nd Floor Perak Barat Kembangan Surabaya,East Java', '(031)3292125', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(57, 'bangun1235', 'Bangun Maya Indah', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Gunung Sahari Raya No.1 Blk A No.8-9 2nd Floor Jakarta Pusat', '021- 6299650/53', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(58, 'bangun1236', 'Bangun Nusa Indah Lampung', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Wisma Budi 8-9th Floor, Jl.HR.Rasuna Said Kav.C-6, Jakarta 12940', '021-5213383', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(59, 'bangun1237', 'Bangun Tatalampung Asri', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Wisma Budi 8-9th Floor, Jl.HR.Rasuna Said Kav.C-6, Jakarta 12940', '021-5213383', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(60, 'bantanan', 'Bantanan Ekajaya', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'JITJ, 5th Floor, Jl.Mangga Dua Raya Jakarta 14430', '021-6017996', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(61, 'batuna1234', 'Batuna Negara', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Sudirman Tower,25th Floor,Jl.Jend.Sudirman Kav .60,Jakarta Selatan', '(021)5226877', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(62, 'bengkulu', 'Bengkulu Sawit Jaya', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Wisma Daya,5th floor Jl.Asemka No.21 Jakarta Barat', '(021)6907346', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(63, 'berkatmas', 'Berkatmas Gitapersada', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Tanah Abang III,No.26 G Jakarta Pusat', '021- 3440906', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(64, 'bersama', 'Bersama Sejahtera Sakti', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Central Plaza, 20th Floor, Jl.Jend.Sudirman Kav.47-48 Jakarta 12930', '021-5702288', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(65, 'beurata12', 'Beurata Maju', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Central Plaza, 20th Floor, Jl.Jend.Sudirman Kav.47-48 Jakarta 12931', '021-5702289', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(66, 'bhadra123', 'Bhadra Cemerlang', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Pulo Ayang raya,Blok OR Kav.1 Kawasan industri Pulogadung Jakarta13930', '(021)4616555', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(67, 'bhumireksa', 'Bhumireksa Nusa Sejati', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Central Plaza, 7th Floor, Jl.Jend.Sudirman Kav.47 Jakarta 12930', '021-2521607', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(68, 'bilah1234', 'Bilah Plantindo,. PT', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Let.Jen.S.Parman No.217 Medan 20112 North Sumatera', '061-552043', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(69, 'bina1234', 'Bina Pitri Jaya', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Nangka No.283 B Pekan Baru, Riau', '0761-35219', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(70, 'bina1235', 'Bina Pratama Sekatojaya', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'JL.P.Diponegoro No,7 Padang 25117 West Sumatera', '0761-35220', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(71, 'bina1236', 'Bina Sains Corp', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Central Plaza, 19-21st Floor, Jl.Jend.Sudirman Kav.47 Jakarta 12930', '021-5702288', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(72, 'binanga', 'Binanga Karya', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Tan Malaka No.88 ABC Medan North Sumatera', '061- 538188', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(73, 'binasawit', 'Binasawit Abadi Pratama', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Wisma KODEL,4th Floor Jl.H.R Rasuna Said Kav.B-4 Jakarta 12920', '021-5222306', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(74, 'bintang', 'Bintang Mahkota', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Bima Sakti Plaza, Jl.Jend.Sudirman 143 Pekan Baru Riau', '0761- 31633', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(75, 'bintang', 'Bintang Mahkota', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Bima Sakti Plaza, Jl.Jend.Sudirman 143 Pekan Baru Riau', '0761- 31633', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(76, 'bintara', 'Bintara Tani Nusantara', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Wisma KODEL, 11 th Floor, Jl.H.R.Rasuna Said Kav B-4, Jakarta 12920', '021-5222225', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(77, 'bio1234', 'Bio Nusantara Teknologi Benkulu', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Kebon Kacang Raya,No.1.Flat 4, 3rd Floor,Jakarta 10240', '(021)3141208', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(78, 'blangkolam', 'Blangkolam-Blangara', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Ir.H.Juanda No.53, Medan, North Sumatera', '061- 327548', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(79, 'bohindomas', 'Bohindomas Permai/Agra Indomas', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Ir.H.Juanda No.53, Medan, North Sumatera', '061- 327549', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(80, 'bontipermai', 'Bontipermai Jayaraya', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Abdul Muis No.48-50, Jakarta Pusat', '021-3800051', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(81, 'borneo', 'Borneo IndoSubur', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'GAPURA MAS Building,5th floor.Jl Letjen. S.Parman Kav.91,Slipi,Jakarta 11420', '(021)5668383', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(82, 'boswa', 'Boswa Megapolish', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Waringin No.2 Medan', '061-529472', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(83, 'brohol', 'Brohol Catur Lestari', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Orion No.25, Medan', '061- 522238', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(84, 'buana', 'Buana Wira Lestari', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'JITJ Perkebunan SINARMAS2, 5th Floor, Jl.Mangga Dua Raya Jakarta Utara', '021- 60117996', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(85, 'buana', 'Buana Wirasubur Sakti', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.PupukTimur IV/88-A, Balikpapan, East Kalimantan', '0542- 63188', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(86, 'budi12', 'Budi Dwiyasa Perkasa', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Wisma Budi 8-9th Floor, Jl.HR.Rasuna Said Kav.C-6, Jakarta 12940', '021-5213383', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(87, 'budidaya', 'Budidaya Agrolestari', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Gunung Sahari Raya,No.1 Blok A,No.8-9, 2nd Floor Jakarta Pusat', '(021)6299650', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(88, 'budinusa', 'Budinusa Ciptawahana', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Wisma Budi 8-9th Floor, Jl.HR.Rasuna Said Kav.C-6, Jakarta 12940', '021-5213383', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(89, 'bukit001', 'Bukit Barisan Indah Prima', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Wisma Budi 8-9th Floor, Jl.HR.Rasuna Said Kav.C-6, Jakarta 12941', '021-5213384', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(90, 'bukit002', 'Bukit Kautsar', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Wisma Budi 8-9th Floor, Jl.HR.Rasuna Said Kav.C-6, Jakarta 12942', '021-5213385', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(91, 'bukit003', 'Bukit Safa', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Wisma Budi 8-9th Floor, Jl.HR.Rasuna Said Kav.C-6, Jakarta 12943', '021-5213386', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(92, 'buluh1234', 'Buluh Cawang Plantation', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Basuki Rahmat No.788 Palembang 30127 South Sumetera', '0711-811901', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(93, 'bulungan', 'Bulungan Sarana Utama', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'JITJ, 5th Floor, Jl.Mangga Dua Raya Jakarta 14430', '021-6017996', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(94, 'bumi1234', 'Bumi Flora II', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Gatot Subroto No.333, Medan', '061-546404/5', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(95, 'bumi1235', 'Bumi Flora III', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Gatot Subroto No.333, Medan', '061-546404/5', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(96, 'bumi1236', 'Bumi Flora', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Gatot Subroto No.333, Medan', '061-546404/5', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(97, 'bumi1237', 'Bumi Indo Kapuas', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Diponegoro,No.7, Padang 25117,West Sumatra', '(0751)33142', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(98, 'bumi1238', 'Bumi Palma Lestari P/P.Sambu', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'JITJ Building, 5th Floor, Jl.Mangga Dua Raya Jakarta 14430', '021-6017996/98', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(99, 'bumi1239', 'Bumi Permai Lestari', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'JITJ, 5th Floor, Jl.Mangga Dua Raya Jakarta 14430', '021-6017996', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(100, 'bumi1240', 'Bumi Permai Lestari', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'JITJ Perkebunan Sinar Mas II, 5th Floor, Jl.Mangga Dua Raya Jakarta Utara', '021-6017996', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(101, 'bumi1241', 'Bumi Pratama Khatulistiwa', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'JL.M.T.Haryono,No.23 A,Pontianak,Kalimantan', '(0561)31731', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(102, 'bumi1242', 'Bumi Putra Surya Lestari', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.KH.Zainul Arifin No.1 F Jakarta Pusat', '021-3441066', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(103, 'bumi1243', 'Bumi Raya Investindo', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Raya Teluk Betung No.43 Jakarta Pusat', '(021)3100238', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(104, 'bumi1244', 'Bumi Sawindo Permai', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Kompleks ROXY MAS,Blok E-2 No.9- 11, JL.KH.Hasyim Ashari,Jakarta Pusat', '(021)3856525', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(105, 'bumi1245', 'Bumi Sawit Permai', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'JITJ Perkebunan Sinar Mas II', '021-6017996', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(106, 'bumi1246', 'Bumi Sentosa Abadi', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Wisma Budi 8-9th Floor, Jl.HR.Rasuna Said Kav.C-6, Jakarta 12940', '021-5213383', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(107, 'bumi1247', 'Bumi Warnatama Lestari', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Biliton No.15 Jakarta Pusat', '021-336578', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(108, 'bumipalma', 'Bumipalma Lestari Persada', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Rawa Bebek N0.14 Jakarta 14440', '021-6690254', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(109, 'bumipermai', 'Bumipermai Surya Lestari', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.KH.Zainul Arifin No.1 F Jakarta Pusat', '021-6341375', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(110, 'bumireksa', 'Bumireksa Nusasejati', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Central Plaza, 19-21st Floor, Jl.Jend.Sudirman Kav.47 Jakarta 12930', '021-5702288', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(111, 'bunga01', 'Bunga Kemulyaan', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Tomang Raya No.6', '021-5702289', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(112, 'bunga02', 'Bunga Kemulyaan', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Tomang Raya No.40.Jakarta 11440', '(021)5666261', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(113, 'duaputra', 'PT DUA PUTRA', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Kedungcino RT 13 RW 05', '291304004', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(114, 'cahaya', 'Cahaya Pelita Andika', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Kompleks SINAR Plaza, Blok G, No.13- 14,Jl Guru Patimpus,Medan 20111,North Sumatra', '(061)322849', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(115, 'cakradenta', 'Cakradenta Agung Pertiwi', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl. S. Parman Kav. 107, Jakarta', '(021)5664687', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(116, 'cakung', 'Cakung Permata Nusa', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Pulo Ayang raya,Blok OR Kav.1 Kawasan industri Pulogadung Jakarta13930', '(021)4616555', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(117, 'calista', 'Calista Alam', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Cycas II Blok UU, No.55 Taman Setia Budi Indah, Medan, North Sumatera', '061- 800200', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(118, 'caraka', 'Caraka Embun Permai', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Sudirman Tower,25th Floor,Jl.Jend.Sudirman Kav .60,Jakarta Selatan', '(021)5226877', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(119, 'cemaru', 'Cemaru Lestari', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Pembangunan I, No.3 Jakarta', '021-3803803', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(120, 'cemerlang', 'Cemerlang Abadi', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Central Plaza, 3rd Floor, Jl.Jend.Sudirman Kav.47 Jakarta 12930', '021-5255414', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(121, 'cendrago', 'Cendrago Utama', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'JITJ, 5th Floor, Jl.Mangga Dua Raya Jakarta 14430', '021-6017996', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(122, 'cerenti', 'Cerenti Subur', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Ir.H.Huanda III, No.29, Jakarta Pusat', '021-385811', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(123, 'ceria', 'Ceria Karya Pranawa', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'SELMIS Building 1st-3rd Floor, Jl.Asem Baris Raya Kav 15-16 No.52 Jakarta 12830', '021- 8307607', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(124, 'cibaliung', 'Cibaliung Tunggal Plantation', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Central Plaza, 3rd Floor, Jl.Jend.Sudirman Kav.47 Jakarta 12930', '021- 6702288', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(125, 'ciliandra', 'Ciliandra Perkasa', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Wisma GKBI, 31st Floor, Jl.Jend.Sudirman, Kav 28 Jakarta Selatan', '021-5740888', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(126, 'cinta', 'Cinta Raja', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Palangkaraya Baru No.19 Medan', '061- 549989,544690', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(127, 'cipta01', 'Cipta Daya Sejati', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Palangkaraya Baru No.19 Medan', '061- 549989,544691', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(128, 'cipta02', 'Cipta Futura', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Mayor Ruslan No.4465 Palermbang South Sumatera', '0711-311572', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(129, 'cipta03', 'Cipta Karya Murdaya', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Cikini Raya,No.78,Jakatrta 10330', '(021)3141607', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(130, 'cipta04', 'Cipta Narada Sejati', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Pulo Ayang raya,Blok OR Kav.1 Kawasan industri Pulogadung Jakarta13930', '(021)4616555', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(131, 'cisadane', 'Cisadane Sawit Raya', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Kali Besar No.50.Jakarta Barat', '(021)6266358', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(132, 'citrakoprasindotani', 'Citrakoprasindotani', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Gedung Metro, 8th Floor, Jl.H.Samanhudi Pasar Baru, Jakarta Pusat', '021-3448684', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(133, 'citramandiri', 'Citramandiri Widyanusa', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Veteran,No.23,Padang,West Sumatra', '(0751)28083', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(134, 'comismas', 'Comismas Wanamaja Agro', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Manggala Wanabhakti 2nd Floor, Jl.Jend.Gatoto Subroto Jakarta Selatan', '(0751)28084', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(135, 'condong', 'Condong Garut', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Wijaya I,No.9 AB,Kebayoran Baru , Jakarta Selatan', '(021)7267619', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(136, 'crownixindo', 'Crownixindo Artara', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Wijaya Grand Centre Blok E/20, Jl.Wijaya II Jakarta Selatan', '021-7202902', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(137, 'damai1234', 'Damai Nusa Selawan', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Iskandar Muda No.107, Medan, North Sumatera', '061- 569144', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(138, 'damar1234', 'Damar Siput', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'JL.A.Yani No.102 B Ranto Prapat Labuhan Batu Sumatera Utara', '061-571554', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(139, 'danuarta', 'Danuarta Bahagia', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Menara Imperium 16th floor.Jl. H.R. Rasuna Said,Kav.1.Jakarta 12980', '(021)8354040', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(140, 'daria1234', 'Daria Dharma Pratama ', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Wisma Daria,J.Iskandarsyah Raya No.7,Kebayoran Baru Jakarta Selatan', '(021)8354041', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(141, 'darmali', 'Darmali Jaya Lestari', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'BNI Building, 20th Floor, Jl.Jend.Sudirman Kav.1 Jakarta', '021-5707500', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(142, 'dasa1234', 'Dasa Anugerah Sejati', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'BNI Building, 20th Floor, Jl.Jend.Sudirman Kav.1 Jakarta', '021-8400934', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(143, 'daya1234', 'Daya Labuan Indah', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Anyelis No.S-28, Cijantung, Jakarta Timur', '021-8400935', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(144, 'delima', 'Delima Makmur', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Gedung Bank EXIM, 3rd A Floor, Jl.Tanjung Karang No.3-4a Jakarta 10230', '021-3913650/52', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(145, 'desa1234', 'Desa Djaya', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Alur Meranti Sungai Liput, Kejuruan Muda Aceh 24477', '0641-31086', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(146, 'dewi1234', 'Dewi Anthika Bahari', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Menara Imperium 16th floor.Jl. H.R. Rasuna Said,Kav.1.Jakarta 12980', '(021)8354040', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(147, 'deya1234', 'Deya Andharana Kurnia', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Kompleks Perkantoran MAJAHIT PERMAI, Jl.Majaoahit 18-22 Blk B No.111 Jakarta 10160', '021-3810975/76', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(148, 'dharma1234', 'Dharma Wungu Guna', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Gedung ARTHA GRAHA,6th Floor,Jl.Jend. Sudirman Kav.52-53,Jakarta 12190', '(021)5152992', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(149, 'djuandasawit', 'Djuandasawit Lestari', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'JITJ, 5th Floor, Jl.Mangga Dua Raya Jakarta 14430', '021-6017996', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(150, 'duta1234', 'Duta Palma Nusantara', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Wisma GKBI,22nd floor, Jl.Jend Sudirman No.28,Jakarta', '(021)2511747', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(151, 'duta1236', 'Duta Sumber Nabati', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Gunung Sahari Raya,No.1 Blok A,No.8-9, 2nd Floor Jakarta Pusat', '(021)6299650', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(152, 'duta1235', 'Duta Swakarya Indah', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Wisma GKBI, 31st Floor, Jl.Jend.Sudirman, Kav 28 Jakarta Selatan', '021-5740888', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(153, 'dwi1234', 'Dwi Reksa Usaha Perkasa', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'c/o PT.London Sumatera Indonesia, Jl.Veteran No.335/76 Palembang South Sumatera', '0711-367152', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(154, 'dwi1235', 'Dwi Suryani Bahtera ', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Menara Imperium 16th floor.Jl. H.R. Rasuna Said,Kav.1.Jakarta 12980', '(021)8354040', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(155, 'eastern', 'Eastern Sumatera Indonesia', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Let.Jen.S.Parman No.217 Medan 20112 North Sumatera', '061-552043', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(156, 'egastuti', 'Egastuti Nagasakti', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Tanjung Datuk No.81 Pekan Baru, Riau', '0761-34942', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(157, 'eka1234', 'Eka Dura Indonesia I', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Pulo Ayang raya,Blok OR Kav.1 Kawasan industri Pulogadung Jakarta13930', '(021)4616555', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(158, 'eka1235', 'Eka Dura Indonesia II', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Pulo Ayang raya,Blok OR Kav.1 Kawasan industri Pulogadung Jakarta13930', '(021)4616555', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(159, 'eka1236', 'Eka Pendawa Sakti', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'JL.A.Yani No.96 Ranto Prapat Labuhan Batu Sumatera Utara', '061- 559988', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(160, 'eluan1234', 'Eluan Mahkota', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'JL.A.Yani No.96 Ranto Prapat Labuhan Batu Sumatera Utara', '061- 559989', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(161, 'eramitra', 'Eramitra Agrolestari', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Gajah Mada No.61, Jambi', '0741-20050', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(162, 'fajar1234', 'Fajar Agung Company', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Gedung Arca, No.26-28, Medan North Sumatera', '061- 746455', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(163, 'fajar1235', 'Fajar Baizuri & Brothers', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Berkah No 41 Jakarta 12860', '021-8304763', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(164, 'first1234', 'First Mujur Plantations', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Komplek SINAR Plaza Blk G No.13-14, Jl.Guru Patimpus Medan 20111, North Sumatera', '061-322849', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(165, 'flora1234', 'Flora Surya Lestari', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.MH.Thamrind No.128 A Medan North Sumatera', '061-710200', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(166, 'flora1235', 'Flora Wahana Tata I,II', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.MH.Thamrind No.128 A Medan North Sumatera', '061-710201', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(167, 'forestlestari', 'Forestlestari Dwikarya', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'JITJ, 5th Floor, Jl.Mangga Dua Raya Jakarta 14430', '021-6017996', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(168, 'ganda1234', 'Ganda Buaninda', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'JITJ, 5th Floor, Jl.Mangga Dua Raya Jakarta 14431', '021-6017997', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(169, 'gandaerah', 'Gandaerah Hendana', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Wisma BARITO PACIFIC Tower B,4thFloor,Jl.S.Parman,Kav 62-63,Slipi Jakarta 11410', '(021)5358458', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(170, 'gatra1234', 'Gatra Kembang Paseban', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Gedung Metro, 8th Floor, Jl.H.Samanhudi Pasar Baru, Jakarta Pusat', '021-3448684', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(171, 'gawi1234', 'Gawi Makmur Kalimantan', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Tanah Abang II, No.2 Jakarta 10160', '021- 5350538', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(172, 'gelora1234', 'Gelora Sawita Makmur', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'LENDMARK Centre,Tower A, 8th floor,Jl. Jend sudirman No.1 Jakarta 12910', '(021)5712790', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(173, 'gelora1235', 'Gelora Sawita Sawut', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'HOKINDO Building, 5th floor .Jl.Mangga Dua raya,Block F1.No,Jakarta', '(021)6011809', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(174, 'gemareksa', 'Gemareksa Mekarsari', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Abdul Muis No.46, Jakarta', '021-3861010', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(175, 'gemareksa', 'Gemareksa Mekarsari', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Abdul Muis No.46, Jakarta 10160', '021-3861010', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(176, 'gergas1234', 'Gergas Utama', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Rachmadsyah No.140 DE Medan North Sumatera', '061-712740', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(177, 'gersindo', 'Gersindo Minang Plantations', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Samudera,No.26,Padang,West Sumatra', '(0751)33435', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(178, 'graha1234', 'Graha Cakramulia', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Letjen Suprapto No.8 A-B Jakarta 10530', '021- 4242605', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(179, 'grahadura', 'Grahadura Leidongprima', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Bilal Harmonis II No.11-15 Medan 20239 Norh Sumatera', '061- 611534', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(180, 'gunung1234', 'Gunung Mas Raya', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Central Plaza, 20- 21st Floor, Jl.Jend.Sudirman Kav.47-48 Jakarta 12930', '021- 5702288', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(181, 'gunung1235', 'Gunung Melayu. PT', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Central Plaza, 21st Floor, Jl.Jend.Sudirman Kav.47-48 Jakarta 12930', '021-2526584', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(182, 'gunung1236', 'Gunung Sejahtera Dua Indah', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Pulo Ayang raya,Blok OR Kav.1 Kawasan industri Pulogadung Jakarta13930', '(021)4616555', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(183, 'gunung1237', 'Gunung Sejahtera Ibu Pertiwi', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Pulo Ayang raya,Blok OR Kav.1 Kawasan industri Pulogadung Jakarta13930', '(021)4616555', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50');
INSERT INTO `users` (`id`, `username`, `name`, `password`, `email`, `kecamatan`, `desa`, `alamat`, `no_telp`, `role`, `created_at`, `updated_at`) VALUES
(184, 'gunung1238', 'Gunung Sejahtera Puti Pesona', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Pulo Ayang raya,Blok OR Kav.1 Kawasan industri Pulogadung Jakarta13930', '(021)4616555', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(185, 'gunung1239', 'Gunung Sejahtera Raman Permai', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Pulo Ayang raya,Blok OR Kav.1 Kawasan industri Pulogadung Jakarta13930', '(021)4616555', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(186, 'gunung1240', 'Gunung Sejahtera Yoli Makmur', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Pulo Ayang raya,Blok OR Kav.1 Kawasan industri Pulogadung Jakarta13930', '(021)4616555', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(187, 'gunungsawit', 'Gunungsawit Bina Lestari', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Raya Pagarawan Km8 Sungai Liat, Sumatera Selatan', '(021)4616556', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(188, 'guthrie', 'Guthrie Pecconina', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl Bekasi Timur IV ,No.3-A,Jatinegara.Jakarta 13410', '(021)8199739', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(189, 'Hamenisia', 'Hamenisia', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Manggala Wanabhakti Building 3rd Flroor, Room 304, Jl.Jend.Gatot Subroto Jakarta 10270', '021- 5703265 ext 524', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(190, 'harapan', 'Harapan Hibrida Malabar', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Pahlawan No.41-42 A-D Pontianak West Kalimantan', '021- 5703265 ext 524', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(191, 'hardaya', 'Hardaya Inti Plantations', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Terusan Lembang.No.D 51- 53,Menteng,Jakarta Pusat', '(021)3905751', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(192, 'hari1234', 'Hari Sawit Jaya', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'BNI Building, 22nd Floor, Jl.Jend.Sudirman Kav.1 Jakarta 10220', '021-5707500', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(193, 'hasil1234', 'Hasil Musi Lestari Perkebunan', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Wisma BARITO PACIFIC Tower B,4th Floor,Jl.S.Parman,Kav 62-63,Jakarta 11410', '(021)5707048', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(194, 'hasjrat1234', 'Hasjrat Cipta', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Samanhudi No.15 Medan, North Sumatera', '061-516076', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(196, 'herfinta', 'Herfinta Farm & Plantation', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'JL.A.Yani No.103 Ranto Prapat Labuhan Batu Sumatera Utara', '061- 517032', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(197, 'hindoli', 'Hindoli ', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'PANIN Bank Centre,5th Floor,JL.Jendral Sudirman,Senayan,Jakarta 10270', '(021)7207003', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(198, 'hutahean', 'Hutahean', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'duaputra123@gmail.com', '1', '3320012002', 'Jl.Melur No.143 V', '0761-22536', '3', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(199, 'admin1234', 'DIMAS ADI NUGROHO', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'dimasnugroho2709@gmail.com', '3', '3320032001', 'Ujung pandan', '0291456789', '1', '2022-01-29 14:28:50', '2022-02-06 12:04:06'),
(201, 'kalianyar', 'KALIANYAR', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'kalianyar@gmail.com', '1', '3320012002', 'Jalan test nomer 22 Jepara', '02919393993', '2', '2022-01-29 14:28:50', '2022-01-29 14:30:01'),
(202, 'karangaji', 'KARANGAJI', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'karangaji@gmail.com', '1', '3320012003', 'Jalan test nomer 22 Jepara', '02917377733', '2', '2022-01-29 14:28:50', '2022-01-29 14:30:15'),
(203, 'tedunan', 'TEDUNAN', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'tedunan@gmail.com', '1', '3320012004', 'Jalan test nomer 22 Jepara', '0216903334', '2', '2022-01-29 14:28:50', '2022-02-06 12:05:43'),
(204, 'sowanlor', 'SOWAN LOR', '$2y$10$WUqaWP6xFr2xjmBBJAphj.GkWFTxh/KdrIeyjgi1y7EcGTjZBpQR6', 'sowanlor@gmail.com', '1', '3320012005', 'Jalan test nomer 22 Jepara', '0216903334', '2', '2022-01-29 14:28:50', '2022-02-06 12:07:40'),
(205, 'sowankidul', 'SOWAN KIDUL', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'sowankidul@gmail.com', '1', '3320012006', 'Jalan test nomer 22 Jepara', '02917377733', '2', '2022-01-29 14:28:50', '2022-02-06 12:07:55'),
(206, 'wanusobo', 'WANUSOBO', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'wanusobo@gmail.com', '1', '3320012007', 'Jalan test nomer 22 Jepara', '0216903334', '2', '2022-01-29 14:28:50', '2022-02-06 12:08:05'),
(207, 'surodadi', 'SURODADI', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'surodadi@gmail.com', '1', '3320012008', 'Jalan test nomer 22 Jepara', '0216903334', '2', '2022-01-29 14:28:50', '2022-02-06 12:08:14'),
(208, 'panggung', 'PANGGUNG', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'panggung@gmail.com', '1', '3320012009', 'Jalan test nomer 22 Jepara', '02919393993', '2', '2022-01-29 14:28:50', '2022-02-06 12:08:21'),
(209, 'bulakbaru', 'BULAK BARU', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'bulakbaru@gmail.com', '1', '3320012010', 'Jalan test nomer 22 Jepara', '02917377733', '2', '2022-01-29 14:28:50', '2022-02-06 12:08:44'),
(210, 'jondang', 'JONDANG', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'jondang@gmail.com', '1', '3320012011', 'Jalan test nomer 22 Jepara', '02919393993', '2', '2022-01-29 14:28:50', '2022-02-06 12:09:44'),
(211, 'bugel', 'Bugel', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'bugel@gmail.com', '1', '3320012012', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(212, 'dongos', 'Dongos', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'dongos@gmail.com', '1', '3320012013', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(213, 'menganti', 'Menganti', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'menganti@gmail.com', '1', '3320012014', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(214, 'kerso', 'Kerso', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'kerso@gmail.com', '1', '3320012015', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(215, 'tanggultlare', 'Tanggultlare', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'tanggultlare@gmail.com', '1', '3320012016', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(216, 'rau', 'Rau', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'rau@gmail.com', '1', '3320012017', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(217, 'sukosono', 'Sukosono', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'sukosono@gmail.com', '1', '3320012018', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(218, 'kaliombo', 'Kaliombo', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'kaliombo@gmail.com', '2', '3320022001', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(219, 'karangrandu', 'Karangrandu', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'karangrandu@gmail.com', '2', '3320022002', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(220, 'gerdu', 'Gerdu', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'gerdu@gmail.com', '2', '3320022003', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(221, 'pecangaan kulon', 'Pecangaan Kulon', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'pecangaan kulon@gmail.com', '2', '3320022004', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(222, 'rengging', 'Rengging', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'rengging@gmail.com', '2', '3320022005', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(223, 'troso', 'Troso', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'troso@gmail.com', '2', '3320022006', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(224, 'ngeling', 'Ngeling', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'ngeling@gmail.com', '2', '3320022007', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(225, 'pulodarat', 'Pulodarat', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'pulodarat@gmail.com', '2', '3320022008', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(226, 'lebuawu', 'Lebuawu', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'lebuawu@gmail.com', '2', '3320022009', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(227, 'gemulung', 'Gemulung', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'gemulung@gmail.com', '2', '3320022010', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(228, 'pecangaan wetan', 'Pecangaan Wetan', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'pecangaan wetan@gmail.com', '2', '3320022011', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(229, 'krasak', 'Krasak', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'krasak@gmail.com', '2', '3320022012', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(230, 'ujung pandan', 'Ujung Pandan', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'ujung pandan@gmail.com', '3', '3320032001', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(231, 'karanganyar', 'Karanganyar', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'karanganyar@gmail.com', '3', '3320032002', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(232, 'guwosobokerto', 'Guwosobokerto', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'guwosobokerto@gmail.com', '3', '3320032003', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(233, 'kedungsarimulyo', 'Kedungsarimulyo', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'kedungsarimulyo@gmail.com', '3', '3320032004', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(234, 'bugo', 'Bugo', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'bugo@gmail.com', '3', '3320032005', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(235, 'welahan', 'Welahan', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'welahan@gmail.com', '3', '3320032006', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(236, 'gedangan', 'Gedangan', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'gedangan@gmail.com', '3', '3320032007', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(237, 'ketileng singolelo', 'Ketileng Singolelo', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'ketileng singolelo@gmail.com', '3', '3320032008', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(238, 'kalipucang wetan', 'Kalipucang Wetan', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'kalipucang wetan@gmail.com', '3', '3320032009', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(239, 'kalipucang kulon', 'Kalipucang Kulon', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'kalipucang kulon@gmail.com', '3', '3320032010', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(240, 'gidangelo', 'Gidangelo', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'gidangelo@gmail.com', '3', '3320032011', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(241, 'kendeng sidialit', 'Kendeng Sidialit', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'kendeng sidialit@gmail.com', '3', '3320032012', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(242, 'sidigede', 'Sidigede', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'sidigede@gmail.com', '3', '3320032013', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(243, 'teluk wetan', 'Teluk Wetan', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'teluk wetan@gmail.com', '3', '3320032014', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(244, 'brantak sekarjati', 'Brantak Sekarjati', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'brantak sekarjati@gmail.com', '3', '3320032015', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(245, 'mayong lor', 'Mayong Lor', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'mayong lor@gmail.com', '4', '3320042001', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(246, 'tigajuru', 'Tigajuru', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'tigajuru@gmail.com', '4', '3320042002', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(247, 'paren', 'Paren', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'paren@gmail.com', '4', '3320042003', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(248, 'kuanyar', 'Kuanyar', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'kuanyar@gmail.com', '4', '3320042004', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(249, 'pelang', 'Pelang', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'pelang@gmail.com', '4', '3320042005', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(250, 'sengonbugel', 'Sengonbugel', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'sengonbugel@gmail.com', '4', '3320042006', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(251, 'jebol', 'Jebol', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'jebol@gmail.com', '4', '3320042007', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(252, 'singorojo', 'Singorojo', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'singorojo@gmail.com', '4', '3320042008', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(253, 'pelemkerep', 'Pelemkerep', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'pelemkerep@gmail.com', '4', '3320042009', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(254, 'buaran', 'Buaran', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'buaran@gmail.com', '4', '3320042010', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(255, 'ngroto', 'Ngroto', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'ngroto@gmail.com', '4', '3320042011', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(256, 'rajekwesi', 'Rajekwesi', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'rajekwesi@gmail.com', '4', '3320042012', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(257, 'datar', 'Datar', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'datar@gmail.com', '4', '3320042013', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(258, 'pule', 'Pule', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'pule@gmail.com', '4', '3320042014', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(259, 'bandung', 'Bandung', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'bandung@gmail.com', '4', '3320042015', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(260, 'bungu', 'Bungu', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'bungu@gmail.com', '4', '3320042016', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(261, 'pancur', 'Pancur', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'pancur@gmail.com', '4', '3320042017', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(262, 'mayong kidul', 'Mayong Kidul', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'mayong kidul@gmail.com', '4', '3320042018', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(263, 'geneng', 'Geneng', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'geneng@gmail.com', '5', '3320052001', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(264, 'raguklampitan', 'Raguklampitan', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'raguklampitan@gmail.com', '5', '3320052002', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(265, 'ngasem', 'Ngasem', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'ngasem@gmail.com', '5', '3320052003', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(266, 'bawu', 'Bawu', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'bawu@gmail.com', '5', '3320052004', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(267, 'mindahan', 'Mindahan', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'mindahan@gmail.com', '5', '3320052005', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(268, 'somosari', 'Somosari', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'somosari@gmail.com', '5', '3320052006', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(269, 'batealit', 'Batealit', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'batealit@gmail.com', '5', '3320052007', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(270, 'bringin', 'Bringin', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'bringin@gmail.com', '5', '3320052008', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(271, 'bantrung', 'Bantrung', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'bantrung@gmail.com', '5', '3320052009', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(272, 'pekalongan', 'Pekalongan', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'pekalongan@gmail.com', '5', '3320052010', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(273, 'mindahan kidul', 'Mindahan Kidul', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'mindahan kidul@gmail.com', '5', '3320052011', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(274, 'karangkebagusan', 'Karangkebagusan', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'karangkebagusan@gmail.com', '6', '3320061001', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(275, 'demaan', 'Demaan', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'demaan@gmail.com', '6', '3320061002', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(276, 'potroyudan', 'Potroyudan', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'potroyudan@gmail.com', '6', '3320061003', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(277, 'bapangan', 'Bapangan', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'bapangan@gmail.com', '6', '3320061004', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(278, 'saripan', 'Saripan', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'saripan@gmail.com', '6', '3320061005', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(279, 'panggang', 'Panggang', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'panggang@gmail.com', '6', '3320061006', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(280, 'kauman', 'Kauman', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'kauman@gmail.com', '6', '3320061007', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(281, 'bulu', 'Bulu', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'bulu@gmail.com', '6', '3320061008', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(282, 'jobokuto', 'Jobokuto', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'jobokuto@gmail.com', '6', '3320061009', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(283, 'ujungbatu', 'Ujungbatu', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'ujungbatu@gmail.com', '6', '3320061010', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(284, 'pengkol', 'Pengkol', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'pengkol@gmail.com', '6', '3320061011', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(285, 'mulyoharjo', 'Mulyoharjo', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'mulyoharjo@gmail.com', '6', '3320062012', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(286, 'wonorejo', 'Wonorejo', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'wonorejo@gmail.com', '6', '3320062013', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(287, 'kedungcino', 'DESA KEDUNGCINO', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'kedungcino@gmail.com', '6', '3320062014', 'Kedungcino RT 12 RW 4', '0291837737', '2', '2022-01-29 14:28:50', '2022-02-06 12:05:34'),
(288, 'kuwasen', 'Kuwasen', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'kuwasen@gmail.com', '6', '3320062015', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(289, 'bandengan', 'Bandengan', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'bandengan@gmail.com', '6', '3320062016', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(290, 'mororejo', 'Mororejo', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'mororejo@gmail.com', '7', '3320072001', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(291, 'suwawal', 'Suwawal', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'suwawal@gmail.com', '7', '3320072009', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(292, 'sinanggul', 'Sinanggul', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'sinanggul@gmail.com', '7', '3320072010', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(293, 'jambu', 'Jambu', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'jambu@gmail.com', '7', '3320072011', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(294, 'srobyong', 'Srobyong', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'srobyong@gmail.com', '7', '3320072012', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(295, 'sekuro', 'Sekuro', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'sekuro@gmail.com', '7', '3320072013', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(296, 'karanggondang', 'Karanggondang', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'karanggondang@gmail.com', '7', '3320072014', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(297, 'jambu timur', 'Jambu Timur', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'jambu timur@gmail.com', '7', '3320072015', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(298, 'guyangan', 'Guyangan', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'guyangan@gmail.com', '8', '3320082001', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(299, 'kepuk', 'Kepuk', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'kepuk@gmail.com', '8', '3320082002', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(300, 'papasan', 'Papasan', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'papasan@gmail.com', '8', '3320082003', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(301, 'srikandang', 'Srikandang', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'srikandang@gmail.com', '8', '3320082004', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(302, 'tengguli', 'Tengguli', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'tengguli@gmail.com', '8', '3320082005', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(303, 'bangsri', 'Bangsri', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'bangsri@gmail.com', '8', '3320082006', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(304, 'banjaran', 'Banjaran', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'banjaran@gmail.com', '8', '3320082007', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(305, 'wedelan', 'Wedelan', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'wedelan@gmail.com', '8', '3320082008', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(306, 'kedungleper', 'Kedungleper', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'kedungleper@gmail.com', '8', '3320082009', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(307, 'jerukwangi', 'Jerukwangi', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'jerukwangi@gmail.com', '8', '3320082010', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(308, 'bondo', 'Bondo', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'bondo@gmail.com', '8', '3320082011', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(309, 'banjaragung', 'Banjaragung', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'banjaragung@gmail.com', '8', '3320082012', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(310, 'tempur', 'Tempur', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'tempur@gmail.com', '9', '3320092001', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(311, 'damarwulan', 'Damarwulan', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'damarwulan@gmail.com', '9', '3320092002', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(312, 'kunir', 'Kunir', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'kunir@gmail.com', '9', '3320092003', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(313, 'watuaji', 'Watuaji', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'watuaji@gmail.com', '9', '3320092004', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(314, 'klepu', 'Klepu', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'klepu@gmail.com', '9', '3320092005', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(315, 'tunahan', 'Tunahan', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'tunahan@gmail.com', '9', '3320092006', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(316, 'kaligarang', 'Kaligarang', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'kaligarang@gmail.com', '9', '3320092007', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(317, 'keling', 'Keling', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'keling@gmail.com', '9', '3320092008', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(318, 'gelang', 'Gelang', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'gelang@gmail.com', '9', '3320092009', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(319, 'jlegong', 'Jlegong', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'jlegong@gmail.com', '9', '3320092010', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(320, 'kelet', 'Kelet', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'kelet@gmail.com', '9', '3320092011', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(321, 'bumiharjo', 'Bumiharjo', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'bumiharjo@gmail.com', '9', '3320092020', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(322, 'karimun jawa', 'Karimun Jawa', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'karimun jawa@gmail.com', '10', '3320102001', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(323, 'kemujan', 'Kemujan', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'kemujan@gmail.com', '10', '3320102002', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(324, 'parang', 'Parang', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'parang@gmail.com', '10', '3320102003', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(325, 'nyamuk', 'Nyamuk', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'nyamuk@gmail.com', '10', '3320102004', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(326, 'ngabul', 'Ngabul', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'ngabul@gmail.com', '11', '3320112001', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(327, 'langon', 'Langon', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'langon@gmail.com', '11', '3320112002', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(328, 'sukodono', 'Sukodono', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'sukodono@gmail.com', '11', '3320112003', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(329, 'petekeyan', 'Petekeyan', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'petekeyan@gmail.com', '11', '3320112004', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(330, 'mangunan', 'Mangunan', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'mangunan@gmail.com', '11', '3320112005', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(331, 'platar', 'Platar', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'platar@gmail.com', '11', '3320112006', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(332, 'semat', 'Semat', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'semat@gmail.com', '11', '3320112007', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(333, 'teluk awur', 'Teluk Awur', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'teluk awur@gmail.com', '11', '3320112008', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(334, 'demangan', 'Demangan', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'demangan@gmail.com', '11', '3320112009', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(335, 'tegalsambi', 'Tegalsambi', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'tegalsambi@gmail.com', '11', '3320112010', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(336, 'mantingan', 'Mantingan', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'mantingan@gmail.com', '11', '3320112011', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(337, 'tahunan', 'Tahunan', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'tahunan@gmail.com', '11', '3320112012', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(338, 'kecapi', 'Kecapi', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'kecapi@gmail.com', '11', '3320112013', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(339, 'senenan', 'Senenan', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'senenan@gmail.com', '11', '3320112014', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(340, 'krapyak', 'Krapyak', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'krapyak@gmail.com', '11', '3320112015', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(341, 'blimbingrejo', 'Blimbingrejo', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'blimbingrejo@gmail.com', '12', '3320122001', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(342, 'tunggul pandean', 'Tunggul Pandean', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'tunggul pandean@gmail.com', '12', '3320122002', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(343, 'pringtulis', 'Pringtulis', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'pringtulis@gmail.com', '12', '3320122003', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(344, 'jatisari', 'Jatisari', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'jatisari@gmail.com', '12', '3320122004', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(345, 'gemiring kidul', 'Gemiring Kidul', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'gemiring kidul@gmail.com', '12', '3320122005', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(346, 'gemiring lor', 'Gemiring Lor', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'gemiring lor@gmail.com', '12', '3320122006', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(347, 'nalumsari', 'Nalumsari', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'nalumsari@gmail.com', '12', '3320122007', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(348, 'tritis', 'Tritis', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'tritis@gmail.com', '12', '3320122008', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(349, 'daren', 'Daren', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'daren@gmail.com', '12', '3320122009', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(350, 'karangnongko', 'Karangnongko', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'karangnongko@gmail.com', '12', '3320122010', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(351, 'ngetuk', 'Ngetuk', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'ngetuk@gmail.com', '12', '3320122011', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(352, 'bendanpete', 'Bendanpete', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'bendanpete@gmail.com', '12', '3320122012', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(353, 'muryolobo', 'Muryolobo', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'muryolobo@gmail.com', '12', '3320122013', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(354, 'bategede', 'Bategede', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'bategede@gmail.com', '12', '3320122014', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(355, 'dorang', 'Dorang', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'dorang@gmail.com', '12', '3320122015', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(356, 'batukali', 'Batukali', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'batukali@gmail.com', '13', '3320132001', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(357, 'bandungrejo', 'Bandungrejo', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'bandungrejo@gmail.com', '13', '3320132002', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(358, 'banyuputih', 'Banyuputih', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'banyuputih@gmail.com', '13', '3320132003', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(359, 'pendosawalan', 'Pendosawalan', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'pendosawalan@gmail.com', '13', '3320132004', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(360, 'damarjati', 'Damarjati', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'damarjati@gmail.com', '13', '3320132005', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(361, 'purwogondo', 'Purwogondo', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'purwogondo@gmail.com', '13', '3320132006', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(362, 'margoyoso', 'Margoyoso', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'margoyoso@gmail.com', '13', '3320132007', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(363, 'sendang', 'Sendang', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'sendang@gmail.com', '13', '3320132008', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(364, 'kriyan', 'Kriyan', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'kriyan@gmail.com', '13', '3320132009', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(365, 'robayan', 'Robayan', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'robayan@gmail.com', '13', '3320132010', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(366, 'bakalan', 'Bakalan', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'bakalan@gmail.com', '13', '3320132011', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(367, 'manyargading', 'Manyargading', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'manyargading@gmail.com', '13', '3320132012', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(368, 'dudakawu', 'Dudakawu', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'dudakawu@gmail.com', '14', '3320142001', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(369, 'sumanding', 'Sumanding', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'sumanding@gmail.com', '14', '3320142002', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(370, 'bucu', 'Bucu', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'bucu@gmail.com', '14', '3320142003', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(371, 'cepogo', 'Cepogo', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'cepogo@gmail.com', '14', '3320142004', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(372, 'pendem', 'Pendem', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'pendem@gmail.com', '14', '3320142005', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(373, 'jinggotan', 'Jinggotan', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'jinggotan@gmail.com', '14', '3320142006', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(374, 'dermolo', 'Dermolo', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'dermolo@gmail.com', '14', '3320142007', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(375, 'kaliaman', 'Kaliaman', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'kaliaman@gmail.com', '14', '3320142008', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(376, 'tubanan', 'Tubanan', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'tubanan@gmail.com', '14', '3320142009', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(377, 'balong', 'Balong', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'balong@gmail.com', '14', '3320142010', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(378, 'kancilan', 'Kancilan', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'kancilan@gmail.com', '14', '3320142011', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(379, 'lebak', 'Lebak', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'lebak@gmail.com', '15', '3320152001', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(380, 'bulungan', 'Bulungan', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'bulungan@gmail.com', '15', '3320152002', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(381, 'suwawal timur', 'Suwawal Timur', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'suwawal timur@gmail.com', '15', '3320152003', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(382, 'kawak', 'Kawak', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'kawak@gmail.com', '15', '3320152004', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(383, 'tanjung', 'Tanjung', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'tanjung@gmail.com', '15', '3320152005', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(384, 'plajan', 'Plajan', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'plajan@gmail.com', '15', '3320152006', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(385, 'slagi', 'Slagi', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'slagi@gmail.com', '15', '3320152007', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(386, 'mambak', 'Mambak', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'mambak@gmail.com', '15', '3320152008', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(387, 'sumberrejo', 'Sumberrejo', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'sumberrejo@gmail.com', '16', '3320162001', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(388, 'clering', 'Clering', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'clering@gmail.com', '16', '3320162002', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(389, 'ujung watu', 'Ujung Watu', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'ujung watu@gmail.com', '16', '3320162003', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(390, 'banyumanis', 'Banyumanis', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'banyumanis@gmail.com', '16', '3320162004', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(391, 'tulakan', 'Tulakan', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'tulakan@gmail.com', '16', '3320162005', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(392, 'bandungharjo', 'Bandungharjo', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'bandungharjo@gmail.com', '16', '3320162006', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(393, 'blingoh', 'Blingoh', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'blingoh@gmail.com', '16', '3320162007', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(394, 'jugo', 'Jugo', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'jugo@gmail.com', '16', '3320162008', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50'),
(396, 'kedungmalang', 'Kedungmalang', '$2y$10$jDUAuvSiUfM88ThgbrlXlOIZOouHr.7lBS1E28HJjJPPxlGlzA.dW', 'kedungmalang@gmail.com', '1', '3320012001', 'Jalan test nomer 22 Jepara', '', '2', '2022-01-29 14:28:50', '2022-01-29 14:28:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `usulans`
--

CREATE TABLE `usulans` (
  `id` bigint(20) NOT NULL,
  `bidang_id` varchar(10) NOT NULL,
  `subbidang_id` varchar(10) NOT NULL,
  `nama_kegiatan` varchar(200) NOT NULL,
  `thn_pengusulan` year(4) NOT NULL,
  `jumlah_target` int(5) NOT NULL,
  `satuan_id` int(2) NOT NULL,
  `anggaran` bigint(20) NOT NULL,
  `hasil_kegiatan` varchar(255) NOT NULL,
  `kecamatan_id` varchar(10) NOT NULL,
  `desa_id` varchar(15) NOT NULL,
  `alamat_kegiatan` varchar(255) NOT NULL,
  `nama_pengusul` varchar(100) NOT NULL,
  `file` varchar(255) NOT NULL DEFAULT 'default.pdf',
  `status_pengajuan` enum('1','2','3') NOT NULL,
  `ket_pengajuan` text NOT NULL,
  `status_pendanaan` enum('1','2','3') NOT NULL,
  `id_pengusul` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `usulans`
--

INSERT INTO `usulans` (`id`, `bidang_id`, `subbidang_id`, `nama_kegiatan`, `thn_pengusulan`, `jumlah_target`, `satuan_id`, `anggaran`, `hasil_kegiatan`, `kecamatan_id`, `desa_id`, `alamat_kegiatan`, `nama_pengusul`, `file`, `status_pengajuan`, `ket_pengajuan`, `status_pendanaan`, `id_pengusul`, `created_at`, `updated_at`) VALUES
(2, '1', '101', 'Pengadaan Komputer SMP Bakti Praja', 2020, 10, 3, 50000000, 'Pengadaan Komputer SMP Bakti Praja', '1', '3320012002', 'Kedungcino  RT 12 RW 05', 'Haryadi', '2871643549409.pdf', '2', 'Terima', '2', '201', '2022-01-30 13:28:14', '2022-02-08 14:15:34'),
(3, '1', '101', 'Pembangunan Ruang Belajar Kelas 9 ', 2021, 2, 3, 10000000, 'Pembangunan Ruang Belajar Kelas 9 ', '1', '3320012002', 'Kedungcino  RT 12 RW 06', 'Karsono', '2871643549426.pdf', '2', 'Terima', '2', '201', '2022-01-30 13:28:14', '2022-02-08 14:15:41'),
(4, '1', '101', 'Pengadaan Printer 3 Dimensi', 2021, 2, 3, 30000000, 'Pengadaan Printer 3 Dimensi', '1', '3320012002', 'Kedungcino  RT 12 RW 07', 'Suherman', '2871643549440.pdf', '2', 'Terima', '2', '287', '2022-01-30 13:28:14', '2022-02-01 13:08:08'),
(5, '1', '101', 'Pengadaan Mesin Ukir', 2022, 1, 3, 40000000, 'Pengadaan Mesin Ukir', '1', '3320012002', 'Kedungcino  RT 12 RW 08', 'Murtando', '2871643550724.pdf', '2', 'Terima', '2', '201', '2022-01-30 13:28:14', '2022-02-08 14:16:54'),
(6, '1', '102', 'Pelatihan Guru SD', 2020, 8, 2, 10000000, 'Pelatihan Guru SD', '1', '3320012002', 'Kedungcino  RT 12 RW 09', 'Darsono', 'default.pdf', '1', 'proses', '1', '287', '2022-01-30 13:28:14', '2022-01-30 13:28:14'),
(7, '1', '102', 'Pembelajaran Psikologi untuk guru BK', 2020, 10, 2, 10000000, 'Pembelajaran Psikologi untuk guru BK', '1', '3320012002', 'Kedungcino  RT 12 RW 10', 'Endro Santoso', '2871643549453.pdf', '2', 'Terima', '1', '287', '2022-01-30 13:28:14', '2022-01-30 13:44:30'),
(8, '1', '102', 'Pelatihan Guru SMP', 2021, 20, 2, 20000000, 'Pelatihan Guru SMP', '1', '3320012002', 'Kedungcino  RT 12 RW 11', 'Aryadi', '2871643549461.pdf', '2', 'Terima', '2', '287', '2022-01-30 13:28:14', '2022-01-30 14:24:50'),
(9, '1', '102', 'Pelatihan Guru SMA', 2021, 15, 2, 20000000, 'Pelatihan Guru SMA', '1', '3320012002', 'Kedungcino  RT 12 RW 12', 'Dandi Wicaksono', '2871643550960.pdf', '2', 'Terima', '2', '287', '2022-01-30 13:28:14', '2022-02-01 13:29:32'),
(10, '1', '102', 'Pelatihan Guru SMK', 2022, 20, 2, 20000000, 'Pelatihan Guru SMK', '1', '3320012002', 'Kedungcino  RT 12 RW 13', 'Suharto', '2871643549480.pdf', '2', 'Terima', '2', '201', '2022-01-30 13:28:14', '2022-02-08 14:17:23'),
(11, '1', '103', 'Bantuan Beasiswa Keluarga Miskin', 2020, 20, 2, 50000000, 'Bantuan Beasiswa Keluarga Miskin', '1', '3320012002', 'Kedungcino  RT 12 RW 14', 'Haryadi', 'default.pdf', '1', 'proses', '1', '287', '2022-01-30 13:28:14', '2022-01-30 13:28:14'),
(12, '1', '103', 'Bantuan Beasiswa SMP', 2020, 30, 2, 50000000, 'Bantuan Beasiswa SMP', '1', '3320012002', 'Kedungcino  RT 12 RW 15', 'Karsono', '2871643549674.pdf', '2', 'Terima', '1', '287', '2022-01-30 13:28:14', '2022-01-30 13:44:52'),
(13, '1', '103', 'Bantuan Beasiswa SMA', 2021, 30, 2, 50000000, 'Bantuan Beasiswa SMA', '1', '3320012002', 'Kedungcino  RT 12 RW 16', 'Suherman', '2871643550977.pdf', '2', 'Terima', '2', '287', '2022-01-30 13:28:14', '2022-02-01 13:30:00'),
(14, '1', '103', 'Bantuan Beasiswa SMK', 2021, 30, 2, 50000000, 'Bantuan Beasiswa SMK', '1', '3320012002', 'Kedungcino  RT 12 RW 17', 'Murtando', '2871643550952.pdf', '2', 'Terima', '1', '287', '2022-01-30 13:28:14', '2022-01-30 14:04:15'),
(15, '1', '103', 'Bantuan Beasiswa Kuliah', 2022, 5, 2, 50000000, 'Bantuan Beasiswa Kuliah', '1', '3320012002', 'Kedungcino  RT 12 RW 18', 'Darsono', '2871643549659.pdf', '2', 'Terima', '1', '287', '2022-01-30 13:28:14', '2022-01-30 13:45:04'),
(16, '1', '104', 'Pelatihan Komputer Siswa SMP', 2020, 50, 2, 15000000, 'Pelatihan Komputer Siswa SMP', '1', '3320012002', 'Kedungcino  RT 12 RW 19', 'Endro Santoso', '2871643549850.pdf', '2', 'Terima', '1', '287', '2022-01-30 13:28:14', '2022-01-30 13:45:12'),
(17, '1', '104', 'Pelatihan Tenaga Kerja', 2020, 50, 2, 10000000, 'Pelatihan Tenaga Kerja', '1', '3320012002', 'Kedungcino  RT 12 RW 20', 'Aryadi', 'default.pdf', '1', 'proses', '1', '287', '2022-01-30 13:28:14', '2022-01-30 13:28:14'),
(18, '1', '104', 'Pelatihan Tenaga Kerja', 2021, 50, 2, 5000000, 'Pelatihan Tenaga Kerja', '1', '3320012002', 'Kedungcino  RT 12 RW 21', 'Dandi Wicaksono', '2871643551224.pdf', '2', 'Terima', '1', '287', '2022-01-30 13:28:14', '2022-01-30 14:05:36'),
(19, '1', '104', 'Pelatihan Tenaga Kerja', 2021, 50, 2, 5000000, 'Pelatihan Tenaga Kerja', '1', '3320012002', 'Kedungcino  RT 12 RW 22', 'Suharto', '2871643549686.pdf', '2', 'Terima', '1', '287', '2022-01-30 13:28:14', '2022-01-30 13:45:18'),
(20, '1', '104', 'Pelatihan Tenaga Kerja', 2022, 50, 2, 5000000, 'Pelatihan Tenaga Kerja', '1', '3320012002', 'Kedungcino  RT 12 RW 23', 'Haryadi', 'default.pdf', '3', 'LENGKAPI DATA DULU', '1', '287', '2022-01-30 13:28:14', '2022-01-30 13:54:20'),
(21, '2', '201', 'Pengadaan Alat APD', 2020, 200, 3, 50000000, 'Pengadaan Alat APD', '1', '3320012002', 'Kedungcino  RT 12 RW 24', 'Karsono', 'default.pdf', '1', 'proses', '1', '287', '2022-01-30 13:28:14', '2022-01-30 13:28:14'),
(22, '2', '201', 'Pembangunan RS. Asyah', 2020, 1, 3, 100000000, 'Pembangunan RS. Asyah', '1', '3320012002', 'Kedungcino  RT 12 RW 25', 'Suherman', 'default.pdf', '1', 'proses', '1', '287', '2022-01-30 13:28:14', '2022-01-30 13:28:14'),
(23, '2', '201', 'Pengadaan Mobil Ambulan', 2021, 1, 3, 65000000, 'Pengadaan Mobil Ambulan', '1', '3320012002', 'Kedungcino  RT 12 RW 26', 'Murtando', '2871643549645.pdf', '2', 'Terima', '1', '287', '2022-01-30 13:28:14', '2022-01-30 13:45:30'),
(24, '2', '201', 'Pengadaan Alat Operasi', 2021, 2, 3, 65000000, 'Pengadaan Alat Operasi', '1', '3320012002', 'Kedungcino  RT 12 RW 27', 'Darsono', '2871643549840.pdf', '2', 'Terima', '1', '287', '2022-01-30 13:28:14', '2022-01-30 13:45:38'),
(25, '2', '201', 'Pengadaan Alat Operasi', 2022, 2, 3, 65000000, 'Pengadaan Alat Operasi', '1', '3320012002', 'Kedungcino  RT 12 RW 28', 'Endro Santoso', '2871643549880.pdf', '2', 'Terima', '1', '287', '2022-01-30 13:28:14', '2022-01-30 13:45:47'),
(26, '2', '202', 'Pembangunan Ruang UGD', 2020, 2, 3, 65000000, 'Pembangunan Ruang UGD', '1', '3320012002', 'Kedungcino  RT 12 RW 29', 'Aryadi', 'default.pdf', '1', 'proses', '1', '287', '2022-01-30 13:28:14', '2022-01-30 13:28:14'),
(27, '2', '202', 'Pengadaan Mobil Ambulan', 2020, 1, 3, 100000000, 'Pengadaan Mobil Ambulan', '1', '3320012002', 'Kedungcino  RT 12 RW 30', 'Dandi Wicaksono', '2871643549718.pdf', '2', 'Terima', '1', '287', '2022-01-30 13:28:14', '2022-01-30 13:46:00'),
(28, '2', '202', 'Pengadaan Alat Operasi', 2021, 1, 3, 40000000, 'Pengadaan Alat Operasi', '1', '3320012002', 'Kedungcino  RT 12 RW 31', 'Suharto', '2871643551214.pdf', '2', 'Terima', '1', '287', '2022-01-30 13:28:14', '2022-01-30 14:05:42'),
(29, '2', '202', 'Pengadaan Alat Operasi', 2021, 2, 3, 60000000, 'Pengadaan Alat Operasi', '1', '3320012002', 'Kedungcino  RT 12 RW 32', 'Haryadi', '2871643549865.pdf', '2', 'Terima', '2', '287', '2022-01-30 13:28:14', '2022-02-01 13:07:34'),
(30, '2', '202', 'Pengadaan Alat Rontgen', 2022, 1, 3, 25000000, 'Pengadaan Alat Rontgen', '1', '3320012002', 'Kedungcino  RT 12 RW 33', 'Karsono', 'default.pdf', '3', 'Silahkan Upload Proposal', '1', '287', '2022-01-30 13:28:14', '2022-01-30 13:54:39'),
(31, '2', '203', 'Pengadaan Mobil Ambulan', 2020, 1, 3, 40000000, 'Pengadaan Mobil Ambulan', '1', '3320012002', 'Kedungcino  RT 12 RW 34', 'Suherman', '2871643549889.pdf', '2', 'Terima', '2', '287', '2022-01-30 13:28:14', '2022-01-30 14:24:09'),
(32, '2', '203', 'Pengadaan Alat Operasi', 2020, 1, 3, 60000000, 'Pengadaan Alat Operasi', '1', '3320012002', 'Kedungcino  RT 12 RW 35', 'Murtando', 'default.pdf', '1', 'proses', '1', '287', '2022-01-30 13:28:14', '2022-01-30 13:28:14'),
(33, '2', '203', 'Pengadaan Alat Operasi', 2021, 1, 3, 25000000, 'Pengadaan Alat Operasi', '1', '3320012002', 'Kedungcino  RT 12 RW 36', 'Darsono', '2871643551278.pdf', '2', 'Terima', '1', '287', '2022-01-30 13:28:14', '2022-01-30 14:05:48'),
(34, '2', '203', 'Pengadaan Alat Rontgen', 2021, 1, 3, 40000000, 'Pengadaan Alat Rontgen', '1', '3320012002', 'Kedungcino  RT 12 RW 37', 'Endro Santoso', '2871643551841.pdf', '2', 'Terima', '1', '287', '2022-01-30 13:28:14', '2022-02-01 12:47:51'),
(35, '2', '203', 'Pengadaan Obat Imunisasi', 2022, 25, 3, 60000000, 'Pengadaan Obat Imunisasi', '1', '3320012002', 'Kedungcino  RT 12 RW 38', 'Aryadi', '2871643549705.pdf', '2', 'Terima', '2', '287', '2022-01-30 13:28:14', '2022-02-01 13:29:00'),
(36, '2', '204', 'Pengadaan Obat Imunisasi', 2020, 25, 3, 25000000, 'Pengadaan Obat Imunisasi', '1', '3320012002', 'Kedungcino  RT 12 RW 39', 'Dandi Wicaksono', 'default.pdf', '1', 'proses', '1', '287', '2022-01-30 13:28:14', '2022-01-30 13:28:14'),
(37, '2', '204', 'Pengadaan Alat USG', 2020, 2, 3, 40000000, 'Pengadaan Obat Imunisasi', '1', '3320012002', 'Kedungcino  RT 12 RW 40', 'Suharto', 'default.pdf', '1', 'proses', '1', '287', '2022-01-30 13:28:14', '2022-01-30 13:28:14'),
(38, '2', '204', 'Pengadaan Obat Imunisasi', 2021, 25, 3, 60000000, 'Pengadaan Obat Imunisasi', '1', '3320012002', 'Kedungcino  RT 12 RW 41', 'Haryadi', '2871643551850.pdf', '2', 'Terima', '1', '287', '2022-01-30 13:28:14', '2022-02-01 12:47:57'),
(39, '2', '204', 'Pengadaan Obat Imunisasi', 2021, 25, 3, 25000000, 'Pengadaan Obat Imunisasi', '1', '3320012002', 'Kedungcino  RT 12 RW 42', 'Karsono', '2871643551256.pdf', '2', 'Terima', '2', '287', '2022-01-30 13:28:14', '2022-02-01 13:01:43'),
(40, '2', '204', 'Pengadaan Alat USG', 2022, 2, 3, 40000000, 'Pengadaan Alat USG', '1', '3320012002', 'Kedungcino  RT 12 RW 43', 'Suherman', '2871643550754.pdf', '2', 'Terima', '2', '287', '2022-01-30 13:28:14', '2022-01-30 14:23:29'),
(41, '2', '205', 'Pembiayaan Beasiswa Sekolah Kesehatan', 2020, 15, 2, 60000000, 'Pembiayaan Beasiswa Sekolah Kesehatan', '1', '3320012002', 'Kedungcino  RT 12 RW 44', 'Murtando', '2871643549737.pdf', '2', 'Terima', '1', '287', '2022-01-30 13:28:14', '2022-01-30 13:46:49'),
(42, '2', '205', 'Pembiayaan Beasiswa Sekolah Kesehatan', 2020, 15, 2, 25000000, 'Pembiayaan Beasiswa Sekolah Kesehatan', '1', '3320012002', 'Kedungcino  RT 12 RW 45', 'Darsono', 'default.pdf', '1', 'proses', '1', '287', '2022-01-30 13:28:14', '2022-01-30 13:28:14'),
(43, '2', '205', 'Pembiayaan Beasiswa Sekolah Kesehatan', 2021, 15, 2, 40000000, 'Pembiayaan Beasiswa Sekolah Kesehatan', '1', '3320012002', 'Kedungcino  RT 12 RW 46', 'Endro Santoso', '2871643551888.pdf', '2', 'Terima', '1', '287', '2022-01-30 13:28:14', '2022-02-01 12:48:05'),
(44, '2', '205', 'Pembiayaan Beasiswa Sekolah Kesehatan', 2021, 15, 2, 60000000, 'Pembiayaan Beasiswa Sekolah Kesehatan', '1', '3320012002', 'Kedungcino  RT 12 RW 47', 'Aryadi', '2871643551859.pdf', '2', 'Terima', '1', '287', '2022-01-30 13:28:14', '2022-02-01 12:48:10'),
(45, '2', '205', 'Pembiayaan Beasiswa Sekolah Kesehatan', 2022, 15, 2, 25000000, 'Pembiayaan Beasiswa Sekolah Kesehatan', '1', '3320012002', 'Kedungcino  RT 12 RW 48', 'Dandi Wicaksono', '2871643549967.pdf', '2', 'Terima', '2', '287', '2022-01-30 13:28:14', '2022-02-01 13:07:01'),
(46, '3', '301', 'Penanaman Pohon', 2020, 100, 3, 40000000, 'Penanaman Pohon', '1', '3320012002', 'Kedungcino  RT 12 RW 49', 'Suharto', 'default.pdf', '1', 'proses', '1', '287', '2022-01-30 13:28:14', '2022-01-30 13:28:14'),
(47, '3', '301', 'Reboisasi Hutan', 2020, 100, 3, 60000000, 'Reboisasi Hutan', '1', '3320012002', 'Kedungcino  RT 12 RW 50', 'Haryadi', 'default.pdf', '1', 'proses', '1', '287', '2022-01-30 13:28:14', '2022-01-30 13:28:14'),
(48, '3', '301', 'Pengadaan pupuk pohon organik', 2021, 100, 3, 25000000, 'Pengadaan pupuk pohon organik', '1', '3320012002', 'Kedungcino  RT 12 RW 51', 'Karsono', '2871643551286.pdf', '2', 'Terima', '2', '287', '2022-01-30 13:28:14', '2022-01-30 14:29:04'),
(49, '3', '301', 'Pengadaan pupuk pohon organik', 2021, 100, 3, 40000000, 'Pengadaan pupuk pohon organik', '1', '3320012002', 'Kedungcino  RT 12 RW 52', 'Suherman', '2871643551895.pdf', '2', 'Terima', '1', '287', '2022-01-30 13:28:14', '2022-02-01 12:48:18'),
(50, '3', '303', 'Reboisasi Hutan', 2021, 100, 3, 60000000, 'Reboisasi Hutan', '1', '3320012002', 'Kedungcino  RT 12 RW 57', 'Murtando', '2871643551906.pdf', '2', 'Terima', '1', '287', '2022-01-30 13:28:14', '2022-02-01 12:48:24'),
(51, '3', '303', 'Reboisasi Hutan', 2022, 100, 3, 25000000, 'Reboisasi Hutan', '1', '3320012002', 'Kedungcino  RT 12 RW 58', 'Darsono', '2871643550744.pdf', '2', 'Terima', '2', '287', '2022-01-30 13:28:14', '2022-01-30 14:22:49'),
(52, '3', '303', 'Reboisasi Hutan', 2020, 100, 3, 40000000, 'Reboisasi Hutan', '1', '3320012002', 'Kedungcino  RT 12 RW 59', 'Endro Santoso', 'default.pdf', '1', 'proses', '1', '287', '2022-01-30 13:28:14', '2022-01-30 13:28:14'),
(53, '3', '303', 'Reboisasi Hutan', 2020, 100, 3, 60000000, 'Reboisasi Hutan', '1', '3320012002', 'Kedungcino  RT 12 RW 60', 'Aryadi', 'default.pdf', '1', 'proses', '1', '287', '2022-01-30 13:28:14', '2022-01-30 13:28:14'),
(54, '3', '304', 'Pembangunan Taman Kota', 2021, 3, 3, 25000000, 'Pembangunan Taman Kota', '1', '3320012002', 'Kedungcino  RT 12 RW 61', 'Dandi Wicaksono', '2871643551915.pdf', '1', 'proses', '1', '287', '2022-01-30 13:28:14', '2022-01-30 14:11:55'),
(55, '3', '304', 'Pembangunan Jembatan', 2021, 1, 3, 40000000, 'Pembangunan Jembatan', '1', '3320012002', 'Kedungcino  RT 12 RW 62', 'Suharto', '2871643552006.pdf', '1', 'proses', '1', '287', '2022-01-30 13:28:14', '2022-01-30 14:13:26'),
(56, '3', '304', 'Pengembangan Wisata Pantai', 2022, 2, 3, 60000000, 'Pengembangan Wisata Pantai', '1', '3320012002', 'Kedungcino  RT 12 RW 63', 'Haryadi', '2871643550903.pdf', '2', 'Terima', '2', '287', '2022-01-30 13:28:14', '2022-01-30 14:28:34'),
(57, '3', '304', 'Pengembangan Wisata Gunung', 2020, 1, 3, 25000000, 'Pengembangan Wisata Gunung', '1', '3320012002', 'Kedungcino  RT 12 RW 64', 'Karsono', '2871643551676.pdf', '2', 'Terima', '2', '287', '2022-01-30 13:28:14', '2022-02-01 13:11:44'),
(58, '3', '305', 'Pemberian Sembako Korban Banjir', 2020, 100, 2, 40000000, 'Pemberian Sembako Korban Banjir', '1', '3320012002', 'Kedungcino  RT 12 RW 65', 'Suherman', '2871643551660.pdf', '2', 'Terima', '1', '287', '2022-01-30 13:28:14', '2022-01-30 14:12:52'),
(59, '3', '305', 'Pemberian Sandang Korban Bencana Alam', 2021, 100, 2, 60000000, 'Pemberian Sandang Korban Bencana Alam', '1', '3320012002', 'Kedungcino  RT 12 RW 66', 'Murtando', '2871643552014.pdf', '1', 'proses', '1', '287', '2022-01-30 13:28:14', '2022-01-30 14:13:34'),
(60, '3', '305', 'Pemberian Korban Bencana Alam', 2021, 100, 2, 25000000, 'Pemberian Korban Bencana Alam', '1', '3320012002', 'Kedungcino  RT 12 RW 67', 'Darsono', '2871643552022.pdf', '1', 'proses', '1', '287', '2022-01-30 13:28:14', '2022-01-30 14:13:42'),
(61, '3', '305', 'Pemberian Sandang Korban Bencana Alam', 2022, 100, 2, 40000000, 'Pemberian Sandang Korban Bencana Alam', '1', '3320012002', 'Kedungcino  RT 12 RW 68', 'Endro Santoso', '2871643550911.pdf', '2', 'Terima', '2', '287', '2022-01-30 13:28:14', '2022-01-30 14:28:06'),
(62, '3', '306', 'Pelatihan Ketenaga Kerjaan', 2020, 45, 2, 60000000, 'Pelatihan Ketenaga Kerjaan', '1', '3320012002', 'Kedungcino  RT 12 RW 69', 'Aryadi', '2871643721262.pdf', '2', 'Terima', '1', '287', '2022-01-30 13:28:14', '2022-02-01 13:24:10'),
(63, '3', '306', 'Pelatihan Ketenaga Kerjaan', 2020, 45, 2, 25000000, 'Pelatihan Ketenaga Kerjaan', '1', '3320012002', 'Kedungcino  RT 12 RW 70', 'Dandi Wicaksono', 'default.pdf', '1', 'proses', '1', '287', '2022-01-30 13:28:14', '2022-01-30 13:28:14'),
(64, '3', '306', 'Pelatihan Ketenaga Kerjaan', 2021, 45, 2, 40000000, 'Pelatihan Ketenaga Kerjaan', '1', '3320012002', 'Kedungcino  RT 12 RW 71', 'Suharto', '2871643552029.pdf', '1', 'proses', '1', '287', '2022-01-30 13:28:14', '2022-01-30 14:13:49'),
(65, '3', '306', 'Pelatihan Ketenaga Kerjaan', 2021, 45, 2, 60000000, 'Pelatihan Ketenaga Kerjaan', '1', '3320012002', 'Kedungcino  RT 12 RW 72', 'Haryadi', '2871643552049.pdf', '1', 'proses', '1', '287', '2022-01-30 13:28:14', '2022-01-30 14:14:09'),
(66, '3', '307', 'Reboisasi Hutan', 2022, 150, 3, 25000000, 'Reboisasi Hutan', '1', '3320012002', 'Kedungcino  RT 12 RW 73', 'Karsono', '2871643551195.pdf', '2', 'Terima', '2', '287', '2022-01-30 13:28:14', '2022-01-30 14:25:28'),
(67, '3', '307', 'Reboisasi Hutan', 2020, 150, 3, 40000000, 'Reboisasi Hutan', '1', '3320012002', 'Kedungcino  RT 12 RW 74', 'Suherman', '2871643551642.pdf', '2', 'Terima', '2', '287', '2022-01-30 13:28:14', '2022-02-01 13:31:20'),
(68, '3', '307', 'Reboisasi Hutan', 2020, 150, 3, 60000000, 'Reboisasi Hutan', '1', '3320012002', 'Kedungcino  RT 12 RW 75', 'Murtando', '2871643551942.pdf', '2', 'Terima', '1', '287', '2022-01-30 13:28:14', '2022-01-30 14:12:35'),
(69, '3', '307', 'Reboisasi Hutan', 2021, 150, 3, 25000000, 'Reboisasi Hutan', '1', '3320012002', 'Kedungcino  RT 12 RW 76', 'Darsono', '2871643549831.pdf', '2', 'Terima', '2', '287', '2022-01-30 13:28:14', '2022-02-01 13:02:37'),
(70, '4', '401', 'Pemberian Bantuan Modal UKM', 2021, 5, 2, 40000000, 'Pemberian Bantuan Modal UKM', '1', '3320012002', 'Kedungcino  RT 12 RW 77', 'Endro Santoso', '2871643552057.pdf', '1', 'proses', '1', '287', '2022-01-30 13:28:14', '2022-01-30 14:14:17'),
(71, '4', '401', 'Pelatihan UKM', 2022, 30, 2, 60000000, 'Pelatihan UKM', '1', '3320012002', 'Kedungcino  RT 12 RW 78', 'Aryadi', '2871643549815.pdf', '2', 'Terima', '1', '287', '2022-01-30 13:28:14', '2022-01-30 13:47:11'),
(72, '4', '401', 'Pemberian Bantuan Modal UKM', 2020, 5, 2, 25000000, 'Pemberian Bantuan Modal UKM', '1', '3320012002', 'Kedungcino  RT 12 RW 79', 'Dandi Wicaksono', 'default.pdf', '1', 'proses', '1', '287', '2022-01-30 13:28:14', '2022-01-30 13:28:14'),
(73, '4', '401', 'Pelatihan UKM', 2020, 40, 2, 40000000, 'Pelatihan UKM', '1', '3320012002', 'Kedungcino  RT 12 RW 80', 'Suharto', '2871643551651.pdf', '2', 'Terima', '1', '287', '2022-01-30 13:28:14', '2022-01-30 14:09:23'),
(74, '5', '501', 'Pembedahan Rumah Tidak Layak Huni', 2021, 2, 2, 60000000, 'Pembedahan Rumah Tidak Layak Huni', '1', '3320012002', 'Kedungcino  RT 12 RW 81', 'Haryadi', '2871643552064.pdf', '1', 'proses', '1', '287', '2022-01-30 13:28:14', '2022-01-30 14:14:24'),
(75, '5', '501', 'Pembedahan Rumah Tidak Layak Huni', 2021, 1, 2, 25000000, 'Pembedahan Rumah Tidak Layak Huni', '1', '3320012002', 'Kedungcino  RT 12 RW 82', 'Karsono', '2871643552081.pdf', '2', 'Terima', '1', '287', '2022-01-30 13:28:14', '2022-01-30 14:16:29'),
(76, '5', '501', 'Pembedahan Rumah Tidak Layak Huni', 2022, 2, 2, 40000000, 'Pembedahan Rumah Tidak Layak Huni', '1', '3320012002', 'Kedungcino  RT 12 RW 83', 'Suherman', '2871643550920.pdf', '2', 'Terima', '2', '287', '2022-01-30 13:28:14', '2022-02-01 13:03:04'),
(77, '5', '501', 'Pembedahan Rumah Tidak Layak Huni', 2020, 1, 2, 60000000, 'Pembedahan Rumah Tidak Layak Huni', '1', '3320012002', 'Kedungcino  RT 12 RW 84', 'Murtando', 'default.pdf', '1', 'proses', '1', '287', '2022-01-30 13:28:14', '2022-01-30 13:28:14'),
(78, '5', '501', 'Pembedahan Rumah Tidak Layak Huni', 2020, 2, 2, 25000000, 'Pembedahan Rumah Tidak Layak Huni', '1', '3320012002', 'Kedungcino  RT 12 RW 85', 'Darsono', '2871643551688.pdf', '2', 'Terima', '1', '287', '2022-01-30 13:28:14', '2022-01-30 14:09:31'),
(79, '5', '502', 'Pengadaan Tiang Listrik', 2021, 5, 3, 40000000, 'Pengadaan Tiang Listrik', '1', '3320012002', 'Kedungcino  RT 12 RW 86', 'Endro Santoso', '2871643721270.pdf', '1', 'proses', '1', '287', '2022-01-30 13:28:14', '2022-02-01 13:14:30'),
(80, '5', '502', 'Pembangunan Sumber Listrik', 2021, 5, 3, 60000000, 'Pembangunan Sumber Listrik', '1', '3320012002', 'Kedungcino  RT 12 RW 87', 'Aryadi', '2871643721292.pdf', '1', 'proses', '1', '287', '2022-01-30 13:28:14', '2022-02-01 13:14:52'),
(81, '5', '502', 'Pengadaan Tiang Listrik', 2022, 5, 3, 25000000, 'Pengadaan Tiang Listrik', '1', '3320012002', 'Kedungcino  RT 12 RW 88', 'Dandi Wicaksono', '2871643551203.pdf', '2', 'Terima', '2', '287', '2022-01-30 13:28:14', '2022-02-01 13:28:28'),
(82, '5', '502', 'Pembangunan Sumber Listrik', 2020, 5, 3, 40000000, 'Pembangunan Sumber Listrik', '1', '3320012002', 'Kedungcino  RT 12 RW 89', 'Suharto', '2871643551622.pdf', '2', 'Terima', '1', '287', '2022-01-30 13:28:14', '2022-01-30 14:09:40'),
(83, '5', '502', 'Pengadaan Tiang Listrik', 2020, 5, 3, 60000000, 'Pengadaan Tiang Listrik', '1', '3320012002', 'Kedungcino  RT 12 RW 90', 'Haryadi', '2871643721245.pdf', '2', 'Terima', '1', '287', '2022-01-30 13:28:14', '2022-02-01 13:24:18'),
(84, '5', '503', 'Pembangunan Sumur Bor', 2021, 2, 3, 25000000, 'Pembangunan Sumur Bor', '1', '3320012002', 'Kedungcino  RT 12 RW 91', 'Karsono', 'default.pdf', '1', 'proses', '1', '287', '2022-01-30 13:28:14', '2022-01-30 13:28:14'),
(85, '5', '503', 'Pengadaan Air PAM', 2021, 10, 3, 40000000, 'Pengadaan Air PAM', '1', '3320012002', 'Kedungcino  RT 12 RW 92', 'Suherman', 'default.pdf', '1', 'proses', '1', '287', '2022-01-30 13:28:14', '2022-01-30 13:28:14'),
(86, '5', '503', 'Pembangunan Sumur Bor', 2022, 2, 3, 60000000, 'Pembangunan Sumur Bor', '1', '3320012002', 'Kedungcino  RT 12 RW 93', 'Murtando', '2871643550929.pdf', '2', 'Terima', '1', '287', '2022-01-30 13:28:14', '2022-01-30 14:03:42'),
(87, '5', '503', 'Pengadaan Air PAM', 2020, 10, 3, 25000000, 'Pengadaan Air PAM', '1', '3320012002', 'Kedungcino  RT 12 RW 94', 'Darsono', '2871643551612.pdf', '2', 'Terima', '1', '287', '2022-01-30 13:28:14', '2022-01-30 14:08:52'),
(88, '5', '503', 'Pembangunan Sumur Bor', 2020, 2, 3, 40000000, 'Pembangunan Sumur Bor', '1', '3320012002', 'Kedungcino  RT 12 RW 95', 'Endro Santoso', '2871643721253.pdf', '2', 'Terima', '1', '287', '2022-01-30 13:28:14', '2022-02-07 01:33:27'),
(89, '5', '504', 'Pembangunan Jalan Desa', 2021, 50, 1, 60000000, 'Pembangunan Jalan Desa', '1', '3320012002', 'Kedungcino  RT 12 RW 96', 'Aryadi', 'default.pdf', '1', 'proses', '1', '287', '2022-01-30 13:28:14', '2022-01-30 13:28:14'),
(90, '5', '504', 'Perbaikan Jalan ', 2021, 100, 1, 25000000, 'Perbaikan Jalan ', '1', '3320012002', 'Kedungcino  RT 12 RW 97', 'Dandi Wicaksono', 'default.pdf', '1', 'proses', '1', '287', '2022-01-30 13:28:14', '2022-01-30 13:28:14'),
(91, '5', '504', 'Perbaikan Jembatan', 2022, 2, 3, 40000000, 'Perbaikan Jembatan', '1', '3320012002', 'Kedungcino  RT 12 RW 98', 'Suharto', '2871643550939.pdf', '2', 'Terima', '1', '287', '2022-01-30 13:28:14', '2022-01-30 14:03:47'),
(92, '5', '504', 'Pembangunan Jalan TOL', 2020, 4000, 1, 60000000, 'Pembangunan Jalan TOL', '1', '3320012002', 'Kedungcino  RT 12 RW 99', 'Haryadi', '2871643551926.pdf', '2', 'Terima', '1', '287', '2022-01-30 13:28:14', '2022-01-30 14:12:44'),
(93, '5', '504', 'Pengecatan Jalan', 2020, 1000, 1, 25000000, 'Pengecatan Jalan', '1', '3320012002', 'Kedungcino  RT 12 RW 100', 'Karsono', '2871643551632.pdf', '2', 'Terima', '1', '287', '2022-01-30 13:28:14', '2022-01-30 14:09:03'),
(94, '5', '505', 'Pembangunan Jembatan', 2021, 1, 3, 40000000, 'Pembangunan Jembatan', '1', '3320012002', 'Kedungcino  RT 12 RW 101', 'Suherman', 'default.pdf', '1', 'proses', '1', '287', '2022-01-30 13:28:14', '2022-01-30 13:28:14'),
(95, '5', '505', 'Pembangunan Jembatan Layang', 2021, 1, 3, 60000000, 'Pembangunan Jembatan Layang', '1', '3320012002', 'Kedungcino  RT 12 RW 102', 'Murtando', 'default.pdf', '1', 'proses', '1', '287', '2022-01-30 13:28:14', '2022-01-30 13:28:14'),
(96, '5', '505', 'Perbaikan Jembatan Antar Desa', 2022, 1, 3, 25000000, 'Perbaikan Jembatan Antar Desa', '1', '3320012002', 'Kedungcino  RT 12 RW 103', 'Darsono', '2871643551234.pdf', '2', 'Terima', '1', '287', '2022-01-30 13:28:14', '2022-01-30 14:03:56'),
(97, '5', '505', 'Pembangunan Jembatan Layang', 2020, 1, 3, 40000000, 'Pembangunan Jembatan Layang', '1', '3320012002', 'Kedungcino  RT 12 RW 104', 'Endro Santoso', '2871643552089.pdf', '2', 'Terima', '2', '287', '2022-01-30 13:28:14', '2022-02-01 13:09:17'),
(98, '5', '505', 'Perbaikan Jembatan Antar Desa', 2020, 1, 3, 60000000, 'Perbaikan Jembatan Antar Desa', '1', '3320012002', 'Kedungcino  RT 12 RW 105', 'Aryadi', '2871643551266.pdf', '2', 'Terima', '1', '287', '2022-01-30 13:28:14', '2022-01-30 14:06:10'),
(99, '1', '101', 'Pembangunan Perpustakaan SD Mamba\'ul Ulum', 2020, 1, 3, 60000000, 'Pembangunan Perpustakaan SD Mamba\'ul Ulum', '1', '3320012002', 'Kedungcino  RT 12 RW 04', 'Suharto', '2871643552099.pdf', '2', 'Terima', '2', '287', '2022-01-30 13:28:14', '2022-02-01 13:08:38'),
(100, '3', '301', 'TEST', 2022, 20, 1, 200000, 'TEST', '11', '3320112001', 'Kalianyar RT 5 RW 1', 'Karnoto', '2871643549524.pdf', '2', 'Terima', '1', '287', '2022-01-30 13:32:04', '2022-01-30 13:44:00');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bidangs`
--
ALTER TABLE `bidangs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `chartdesa`
--
ALTER TABLE `chartdesa`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `csr`
--
ALTER TABLE `csr`
  ADD PRIMARY KEY (`csr_id`);

--
-- Indeks untuk tabel `desas`
--
ALTER TABLE `desas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kecamatans`
--
ALTER TABLE `kecamatans`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `laporan`
--
ALTER TABLE `laporan`
  ADD PRIMARY KEY (`laporan_id`);

--
-- Indeks untuk tabel `satuan`
--
ALTER TABLE `satuan`
  ADD PRIMARY KEY (`satuan_id`);

--
-- Indeks untuk tabel `subbidangs`
--
ALTER TABLE `subbidangs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `usulans`
--
ALTER TABLE `usulans`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bidangs`
--
ALTER TABLE `bidangs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `chartdesa`
--
ALTER TABLE `chartdesa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `csr`
--
ALTER TABLE `csr`
  MODIFY `csr_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT untuk tabel `kecamatans`
--
ALTER TABLE `kecamatans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `laporan`
--
ALTER TABLE `laporan`
  MODIFY `laporan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT untuk tabel `satuan`
--
ALTER TABLE `satuan`
  MODIFY `satuan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `subbidangs`
--
ALTER TABLE `subbidangs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=506;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=398;

--
-- AUTO_INCREMENT untuk tabel `usulans`
--
ALTER TABLE `usulans`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
