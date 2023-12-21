SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tourify-db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_booking`
--

CREATE TABLE `data_booking` (
  `id` int(11) NOT NULL,
  `userId` varchar(13) NOT NULL,
  `destinationId` int(11) NOT NULL,
  `tourGuideId` varchar(13) NOT NULL,
  `bookingCode` varchar(26) NOT NULL,
  `totalPayment` int(11) NOT NULL,
  `statusPayment` tinyint(1) DEFAULT NULL,
  `ordererNote` text,
  `bookingDate` datetime NOT NULL,
  `tripDate` datetime NOT NULL,
  `tripDateEnd` datetime NOT NULL,
  `checkInDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='2';

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_kuliner`
--

CREATE TABLE `data_kuliner` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `regency` varchar(200) NOT NULL,
  `province` varchar(200) NOT NULL,
  `country` varchar(200) NOT NULL,
  `caption` text NOT NULL,
  `photo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- --------------------------------------------------------

-- Struktur dari tabel `data_monumen`
--

CREATE TABLE `data_monumen` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `caption` text NOT NULL,
  `photo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_pemandu_wisata`
--

CREATE TABLE `data_pemandu_wisata` (
  `id` int(11) NOT NULL,
  `userId` varchar(15) NOT NULL,
  `servicesFee` int(11) NOT NULL,
  `rating` double NOT NULL,
  `totalTrip` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_pengguna`
--

CREATE TABLE `data_pengguna` (
  `id` varchar(13) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(35) DEFAULT NULL,
  `codeVerif` int(11) NOT NULL,
  `registrationDate` datetime DEFAULT NULL,
  `verificationDate` datetime DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLogoutDate` datetime DEFAULT NULL,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `regency` varchar(100) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `whatsapp` varchar(15) DEFAULT NULL,
  `saldo` int(11) DEFAULT NULL,
  `lon` float DEFAULT NULL,
  `lat` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_rating`
--

CREATE TABLE `data_rating` (
  `id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `destinationId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_wisata`
--

CREATE TABLE `data_wisata` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `type` varchar(100) NOT NULL,
  `subdistrict` varchar(500) NOT NULL,
  `regency` varchar(500) NOT NULL,
  `province` varchar(500) NOT NULL,
  `rating` float DEFAULT '0',
  `openOn` varchar(10) NOT NULL,
  `closedOn` varchar(10) NOT NULL,
  `ticketPrice` int(11) NOT NULL,
  `caption` text NOT NULL,
  `photo` text NOT NULL,
  `tourGuide` text NOT NULL,
  `lat` float NOT NULL,
  `lon` float NOT NULL,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_wisata_favorit`
--

CREATE TABLE `data_wisata_favorit` (
  `id` int(11) NOT NULL,
  `destinationId` int(11) NOT NULL,
  `userId` varchar(13) NOT NULL,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `destinations`
--

CREATE TABLE `destinations` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `type` text NOT NULL,
  `village` text NOT NULL,
  `subdistrict` text NOT NULL,
  `regency` text NOT NULL,
  `country` text NOT NULL,
  `type_label` int(11) NOT NULL,
  `new_rating` int(11) NOT NULL,
  `User_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ratings`
--

CREATE TABLE `ratings` (
  `User_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_booking`
--
ALTER TABLE `data_booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_kuliner`
--
ALTER TABLE `data_kuliner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_monumen`
--
ALTER TABLE `data_monumen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_pemandu_wisata`
--
ALTER TABLE `data_pemandu_wisata`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_pengguna`
--
ALTER TABLE `data_pengguna`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `data_wisata`
--
ALTER TABLE `data_wisata`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_wisata_favorit`
--
ALTER TABLE `data_wisata_favorit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `destinations`
--
ALTER TABLE `destinations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_booking`
--
ALTER TABLE `data_booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `data_kuliner`
--
ALTER TABLE `data_kuliner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT for table `data_monumen`
--
ALTER TABLE `data_monumen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `data_wisata_favorit`
--
ALTER TABLE `data_wisata_favorit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
