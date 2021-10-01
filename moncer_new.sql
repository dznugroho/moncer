-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 29 Sep 2021 pada 03.48
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
-- Struktur dari tabel `csr`
--

CREATE TABLE `csr` (
  `id` bigint(20) NOT NULL,
  `usulan_id` int(11) NOT NULL,
  `perusahaan_id` int(11) NOT NULL,
  `dana` bigint(20) NOT NULL,
  `status_csr_pilihan` enum('1','2','3','4') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `csr`
--

INSERT INTO `csr` (`id`, `usulan_id`, `perusahaan_id`, `dana`, `status_csr_pilihan`, `created_at`, `updated_at`) VALUES
(1, 3, 4, 10000000, '2', '2020-10-22 07:20:15', '2021-09-24 06:24:01'),
(3, 3, 8, 20000000, '2', '2020-10-27 19:17:02', '2021-04-18 05:21:19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `danas`
--

CREATE TABLE `danas` (
  `id` int(11) NOT NULL,
  `usulan_id` varchar(20) NOT NULL,
  `total_dana` bigint(20) NOT NULL,
  `penerima_dana` varchar(100) NOT NULL,
  `jabatan_penerima` varchar(100) NOT NULL,
  `dokumen_penyerahan` text NOT NULL,
  `foto_penyerahan` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Struktur dari tabel `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `jabatan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `role`
--

INSERT INTO `role` (`id`, `jabatan`) VALUES
(1, 'Admin'),
(2, 'Umum'),
(3, 'Perusahaan');

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
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `password`, `email`, `kecamatan`, `desa`, `alamat`, `no_telp`, `role`, `created_at`, `updated_at`) VALUES
(2, 'admin', 'ADMINISTRATOR', '$2y$10$E/gdOWzJyyn9e21ZgeQWOuBra9S.UAnZOdiIdSVLvOyzJWGVkLRIC', 'dimasnugroho2709@gmail.com', '6', '3320062014', 'Kedungcino RT 13 RW 5', '08976553332', '1', '2020-10-08 08:42:22', '2021-09-24 06:40:16'),
(4, 'duaputra', 'TOKO DUA PUTRA', '$2y$10$SQ9neNJTBRsDoWBFX0Yj5OIvABxAcWu0pxWGTQ8Xjv8RJ63vnZg.m', 'dian@petanikode.com', '11', '3320112001', 'Kedungcino RT 13 RW 5', '08976553332', '3', '2020-10-09 07:25:15', '2021-09-28 13:56:52'),
(5, 'kedungcino', 'DESA KEDUNGCINO', '$2y$10$okj2CTkeM2LrG0XAV/7p8.DZHwJXM6qKVsA8TZJ93Ils1RxpcQTBC', 'zaenalarifin@gmail.com', '6', '3320062014', 'Kedungcino RT 11 RW 3', '0812837737373', '2', '2020-10-09 07:34:04', '2021-09-24 06:42:12'),
(7, 'dimas2709', 'PT. MAJU MUNDUR', '$2y$10$iDa3cxXRIE6AzRYMJ221s.f4WxjDcfRmf/lA4aIFy9/wT9yHp3CDS', 'dznugroho@gmail.com', '6', '3320062014', 'Kedungcino RT 13 RW 5', '08976553332', '3', '2020-10-27 18:42:07', '2020-10-27 18:42:07'),
(8, 'ulum1234', 'PT. SEJAHTERA', '$2y$10$YX7FBhg94rW0x5HbTRBk0O7hZTpkxtRnyzY6lvBYN1f/uweAfKDHG', 'ulumskom@gmail.com', '5', '3320052001', '1234112113', '1231313131', '3', '2020-10-27 19:15:58', '2021-09-25 02:38:00'),
(9, 'menganti', 'DESA MENGANTI', '$2y$10$ZfgsMt9LnlM59ceX3GKchuqMS3tRqqt1wu5zggJRNjzsZ4i/0ofOO', 'zaenalarifin22@gmail.com', '1', '3320012014', 'Menganti Wetan RT 1 RW 1', '081555351135', '2', '2021-01-06 14:26:52', '2021-09-24 06:42:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `usulans`
--

CREATE TABLE `usulans` (
  `id` bigint(20) NOT NULL,
  `bidang_id` varchar(10) NOT NULL,
  `subbidang_id` varchar(10) NOT NULL,
  `nama_kegiatan` varchar(200) NOT NULL,
  `tgl_pengusulan` date NOT NULL,
  `anggaran` bigint(20) NOT NULL,
  `kecamatan_id` varchar(10) NOT NULL,
  `desa_id` varchar(15) NOT NULL,
  `alamat_kegiatan` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `nama_pengusul` varchar(100) NOT NULL,
  `file` varchar(255) NOT NULL DEFAULT 'default.pdf',
  `status_pengajuan` enum('1','2','3') NOT NULL,
  `ket_pengajuan` text NOT NULL DEFAULT 'Proses Review',
  `status_pendanaan` enum('1','2') NOT NULL,
  `id_pengusul` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `usulans`
--

INSERT INTO `usulans` (`id`, `bidang_id`, `subbidang_id`, `nama_kegiatan`, `tgl_pengusulan`, `anggaran`, `kecamatan_id`, `desa_id`, `alamat_kegiatan`, `deskripsi`, `nama_pengusul`, `file`, `status_pengajuan`, `ket_pengajuan`, `status_pendanaan`, `id_pengusul`, `created_at`, `updated_at`) VALUES
(3, '1', '101', 'Pengadan Bantuan Kuota', '2021-09-08', 50000000, '7', '3320072001', 'Mororejo', 'adadadadsfadadadsa', 'Karang Taruna', '1602821124.pdf', '2', 'Disetujui', '1', '5', '2020-10-16 04:05:24', '2021-09-28 14:37:04'),
(5, '2', '201', 'Kesehatan', '2021-09-09', 20000000, '10', '3320102004', 'Karimun Jawa', 'adadadadsfadadadsa', 'Karang Taruna Soleh', '1602820594.pdf', '2', 'Disetujui', '1', '5', '2020-10-16 03:56:34', '2021-09-28 01:49:15'),
(9, '2', '201', 'Keseheatan', '2021-09-09', 15000000, '13', '3320132001', 'Kemujaan RT 1 RW 1', 'DWSFGHJJHGFDGFDS', 'dfsjkhjhdggfdg', '1602820594.pdf', '2', 'Disetujui', '1', '5', '2021-01-07 14:52:45', '2021-09-28 15:20:32'),
(10, '2', '201', 'Keseheatan', '2021-09-03', 50000000, '7', '3320072001', '1312313131', 'Makan makan', 'Dimas Adi Nugroho', 'default.pdf', '3', 'Silahkan upload proposalnya dulu', '1', '5', '2021-01-07 14:55:56', '2021-09-28 03:19:56'),
(11, '4', '401', 'Pengadan Bantuan Kuota', '2021-09-22', 3300000, '8', '3320082001', 'Kaliombo RT 1 RW 1', 'fsfsfsfsf', 'sfsfsfsfsffs', '1632800087.pdf', '1', 'Proses Review', '1', '5', '2021-09-28 03:34:47', '2021-09-28 03:34:47');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bidangs`
--
ALTER TABLE `bidangs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `csr`
--
ALTER TABLE `csr`
  ADD PRIMARY KEY (`id`);

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
-- Indeks untuk tabel `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT untuk tabel `csr`
--
ALTER TABLE `csr`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `subbidangs`
--
ALTER TABLE `subbidangs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=506;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `usulans`
--
ALTER TABLE `usulans`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
