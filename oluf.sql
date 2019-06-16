-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Vært: 127.0.0.1
-- Genereringstid: 16. 05 2019 kl. 14:57:16
-- Serverversion: 5.6.24
-- PHP-version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `oluf`
--

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `ads`
--

CREATE TABLE IF NOT EXISTS `ads` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `persons` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(45) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Data dump for tabellen `ads`
--

INSERT INTO `ads` (`id`, `name`, `persons`, `price`, `image`) VALUES
(2, 'Kontorplads 6545', 45, '1200.00', '1557403016035_office.jpg'),
(3, 'Kontorplads 9878', 56, '330.00', '1557403222809_office.jpg'),
(4, 'Kontorplads 1234', 45, '1600.00', '1557471317668_office.jpg');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `articles`
--

CREATE TABLE IF NOT EXISTS `articles` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `content` tinytext NOT NULL,
  `fk_category` int(11) NOT NULL,
  `fk_author` int(11) NOT NULL,
  `image` varchar(45) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Data dump for tabellen `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(8, 'Sider'),
(9, 'Artikler'),
(10, 'Produkter'),
(11, 'test');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `conferencerooms`
--

CREATE TABLE IF NOT EXISTS `conferencerooms` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `image` varchar(45) NOT NULL,
  `opens` time NOT NULL,
  `closes` time NOT NULL,
  `interval` time NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `conferencerooms`
--

INSERT INTO `conferencerooms` (`id`, `name`, `image`, `opens`, `closes`, `interval`) VALUES
(1, 'Mødelokale 1', '1557485982693_office.jpg', '08:00:00', '16:00:00', '00:15:00'),
(2, 'test', '1557485982693_office.jpg', '12:00:00', '16:00:00', '00:25:00'),
(3, 'Sony', '1557486023876_office.jpg', '12:00:00', '13:00:00', '00:05:00');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `events`
--

CREATE TABLE IF NOT EXISTS `events` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `starts` datetime NOT NULL,
  `ends` datetime NOT NULL,
  `fk_category` int(11) NOT NULL,
  `fk_theatre_id` int(11) NOT NULL,
  `image` varchar(70) NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

--
-- Data dump for tabellen `events`
--

INSERT INTO `events` (`id`, `name`, `description`, `price`, `starts`, `ends`, `fk_category`, `fk_theatre_id`, `image`, `published`) VALUES
(23, 'Arrangement nummer 1', 'Arrangement nummer 1, til alle der elsker arrangementer.', '100.00', '2019-03-21 15:00:00', '2019-03-21 16:00:00', 8, 1, '1553170749340_blogger_32.png', 1),
(24, 'Arrangement nummer 2', 'sdfgeagrsdfgdfgdfg', '1200.00', '2019-03-24 14:00:00', '2019-03-22 16:00:00', 8, 1, '1553171879646_deviantart_32.png', 1),
(25, 'Arrangement nummer 3', 'dwfwerfwefwef', '123.00', '2019-03-29 15:00:00', '2019-03-30 17:00:00', 9, 1, '1553171920926_bebo_32.png', 1),
(26, 'Filmen over alle film', 'Hep heeeeeyyy', '345.00', '2019-04-18 12:00:00', '2019-03-29 12:00:00', 10, 1, '1553241723278_deviantart_32.png', 1),
(27, 'Foredraget om frøer', 'Frøer er the shit! Lorem ipsum dolor sit, amet consectetur adipisicing elit. Impedit doloribus, libero deleniti esse aspernatur quam, at placeat id, non dolorum odio? Minus quidem eaque tempora debitis harum non numquam autem!\nLorem ipsum dolor sit, amet', '334.00', '2019-12-31 00:00:00', '2020-01-31 00:00:00', 10, 1, '1553241839616_evernote_32.png', 1),
(28, 'Filmen om køer', 'Køer.... laaaaaange køer', '567.00', '2019-03-26 18:00:00', '2019-03-28 12:00:00', 8, 1, '1553241898882_vimeo_32.png', 1),
(29, 'Javascript - hvor skal jeg starte', 'Javascript er godt!', '12.00', '2019-03-23 13:00:00', '2019-03-23 14:00:00', 10, 1, '1553241965935_friendfeed_32.png', 1),
(30, 'A star is born', 'Filmen ''A Star is Born – Encore'' er en længere version af publikumshittet om den stærke kærlighed mellem to musikere.\n\nPå vej hjem fra en koncert møder den alholiserede rockstjerne Jack tjeneren og natklubsangerinden Ally. I takt med at kærligheden blomstrer mellem de to, får Ally den selvtillid, hun altid har manglet for at blive en stjerne.\n\nDen nye udgave indeholder to helt nye scener samt længere varianter af eksisterende scener, herunder a cappella versionen af den Oscar-vindende sang ''Shallow''.\n\nHerudover vil filmen også indeholde sangen ''Is That Alright?'', der hidtil kun har været at finde på soundtracket.\n\n''A Star Is Born'' er den tredje genindspilning af klassikeren fra 1937, der havde Janet Gaynor i rollen som den aspirerende skuespillerinde, mens 70er-versionen havde Barbara Streisand og Kris Kristofferson i hovedrollerne.\n\nLady Gaga imponerer i hovedrollen over for Bradley Cooper, der ikke bare springer ud som sanger, men som også har instrueret og skrevet manuskriptet bag den allerede kæmpemæssige succesfilm. (copyright: kino.dk)', '330.00', '2019-11-30 00:00:00', '2020-01-31 00:00:00', 8, 1, '1553530127189_a-star-is-born-pla_5b2a25ea46e1e.jpg', 1);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `globals`
--

CREATE TABLE IF NOT EXISTS `globals` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Data dump for tabellen `globals`
--

INSERT INTO `globals` (`id`, `name`, `description`) VALUES
(1, 'Oluf Graversvej', 'Kontorpladser for alle');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `images`
--

CREATE TABLE IF NOT EXISTS `images` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `position` int(11) NOT NULL,
  `fk_category` varchar(75) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

--
-- Data dump for tabellen `menu`
--

INSERT INTO `menu` (`id`, `name`, `position`, `fk_category`) VALUES
(33, 'Hjem', 10, ''),
(34, 'Login', 20, 'login'),
(35, 'Annoncer', 15, 'annoncer'),
(36, 'Booking', 17, 'booking-tid');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `content` tinytext NOT NULL,
  `fk_category` int(11) NOT NULL,
  `fk_author` int(11) NOT NULL,
  `image` varchar(45) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `sanitized_url` varchar(70) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Data dump for tabellen `pages`
--

INSERT INTO `pages` (`id`, `name`, `content`, `fk_category`, `fk_author`, `image`, `published`, `sanitized_url`) VALUES
(22, 'Forsiden', 'Velkommen til forsiden!', 8, 6, 'gamespot_32.png', 1, 'Forsiden');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `reservations`
--

CREATE TABLE IF NOT EXISTS `reservations` (
  `id` int(11) NOT NULL,
  `user_fk` int(11) NOT NULL,
  `slot_fk` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `reservations`
--

INSERT INTO `reservations` (`id`, `user_fk`, `slot_fk`, `date`) VALUES
(1, 1, 10, '2019-05-23'),
(2, 1, 14, '2019-05-16'),
(3, 1, 13, '2019-05-24'),
(4, 1, 15, '2019-05-24'),
(5, 1, 12, '2019-05-15'),
(11, 14, 18, '2019-05-17'),
(12, 14, 31, '2019-05-17'),
(13, 14, 17, '2019-05-16'),
(14, 6, 6, '2019-05-25'),
(15, 14, 4, '2019-05-17'),
(16, 14, 7, '2019-05-17'),
(17, 14, 2, '2019-05-17'),
(19, 14, 5, '2019-05-17'),
(20, 14, 7, '2019-05-17'),
(21, 14, 3, '2019-05-17'),
(22, 14, 9, '2019-05-17'),
(23, 14, 3, '2019-05-17'),
(24, 14, 5, '2019-05-16'),
(25, 14, 7, '2019-05-16');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Data dump for tabellen `roles`
--

INSERT INTO `roles` (`id`, `name`, `level`) VALUES
(1, 'Super admin', 100),
(2, 'Admin', 90),
(3, 'Moderator', 80),
(4, 'Author', 20),
(5, 'User', 10),
(6, 'Guest', 1);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `rows`
--

CREATE TABLE IF NOT EXISTS `rows` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `fk_theatre_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `rows`
--

INSERT INTO `rows` (`id`, `name`, `fk_theatre_id`) VALUES
(68, '1', 18),
(69, '2', 18),
(70, '3', 18),
(71, '4', 18),
(72, '5', 18),
(73, '6', 18),
(74, '1', 19),
(75, '2', 19),
(76, '3', 19),
(77, '4', 19);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `seats`
--

CREATE TABLE IF NOT EXISTS `seats` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `fk_row_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `seats`
--

INSERT INTO `seats` (`id`, `name`, `fk_row_id`) VALUES
(37, '1', 68),
(38, '2', 68),
(39, '3', 68),
(40, '4', 68),
(41, '5', 68),
(42, '6', 68),
(43, '7', 68),
(44, '8', 68),
(45, '9', 68),
(46, '10', 68),
(47, '1', 69),
(48, '2', 69),
(49, '3', 69),
(50, '4', 69),
(51, '5', 69),
(52, '6', 69),
(53, '7', 69),
(54, '8', 69),
(55, '9', 69),
(56, '10', 69),
(57, '1', 70),
(58, '2', 70),
(59, '3', 70),
(60, '4', 70),
(61, '5', 70),
(62, '6', 70),
(63, '7', 70),
(64, '8', 70),
(65, '9', 70),
(66, '10', 70),
(67, '11', 70),
(68, '12', 70),
(69, '1', 71),
(70, '2', 71),
(71, '3', 71),
(72, '4', 71),
(73, '5', 71),
(74, '6', 71),
(75, '7', 71),
(76, '8', 71),
(77, '9', 71),
(78, '10', 71),
(79, '11', 71),
(80, '12', 71),
(81, '1', 72),
(82, '2', 72),
(83, '3', 72),
(84, '4', 72),
(85, '5', 72),
(86, '6', 72),
(87, '7', 72),
(88, '8', 72),
(89, '9', 72),
(90, '10', 72),
(91, '11', 72),
(92, '12', 72),
(93, '13', 72),
(94, '14', 72),
(95, '15', 72),
(96, '1', 73),
(97, '2', 73),
(98, '3', 73),
(99, '4', 73),
(100, '5', 73),
(101, '6', 73),
(102, '7', 73),
(103, '8', 73),
(104, '9', 73),
(105, '10', 73),
(106, '11', 73),
(107, '12', 73),
(108, '13', 73),
(109, '14', 73),
(110, '1', 74),
(111, '2', 74),
(112, '3', 74),
(113, '4', 74),
(114, '5', 74),
(115, '1', 75),
(116, '2', 75),
(117, '3', 75),
(118, '4', 75),
(119, '5', 75),
(120, '6', 75),
(121, '7', 75),
(122, '8', 75),
(123, '1', 76),
(124, '2', 76),
(125, '3', 76),
(126, '4', 76),
(127, '5', 76),
(128, '6', 76),
(129, '7', 76),
(130, '8', 76),
(131, '1', 77),
(132, '2', 77),
(133, '3', 77),
(134, '4', 77),
(135, '5', 77),
(136, '6', 77),
(137, '7', 77),
(138, '8', 77),
(139, '9', 77),
(140, '10', 77),
(141, '11', 77);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `slots`
--

CREATE TABLE IF NOT EXISTS `slots` (
  `id` int(11) NOT NULL,
  `starts` time NOT NULL,
  `ends` time NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `slots`
--

INSERT INTO `slots` (`id`, `starts`, `ends`) VALUES
(1, '00:00:00', '00:30:00'),
(2, '00:30:00', '01:00:00'),
(3, '01:00:00', '01:30:00'),
(4, '01:30:00', '02:00:00'),
(5, '02:00:00', '02:30:00'),
(6, '02:30:00', '03:00:00'),
(7, '03:00:00', '03:30:00'),
(8, '03:30:00', '04:00:00'),
(9, '04:00:00', '04:30:00'),
(10, '04:30:00', '05:00:00'),
(11, '05:00:00', '05:30:00'),
(12, '05:30:00', '06:00:00'),
(13, '06:00:00', '06:30:00'),
(14, '06:30:00', '07:00:00'),
(15, '07:00:00', '07:30:00'),
(16, '07:30:00', '08:00:00'),
(17, '08:00:00', '08:30:00'),
(18, '08:30:00', '09:00:00'),
(19, '09:00:00', '09:30:00'),
(20, '09:30:00', '10:00:00'),
(21, '10:00:00', '10:30:00'),
(22, '10:30:00', '11:00:00'),
(23, '11:00:00', '11:30:00'),
(24, '11:30:00', '12:00:00'),
(25, '12:00:00', '12:30:00'),
(26, '12:30:00', '13:00:00'),
(27, '13:00:00', '13:30:00'),
(28, '13:30:00', '14:00:00'),
(29, '14:00:00', '14:30:00'),
(30, '14:30:00', '15:00:00'),
(31, '15:00:00', '15:30:00'),
(32, '15:30:00', '16:00:00'),
(33, '16:00:00', '16:30:00'),
(34, '16:30:00', '17:00:00'),
(35, '17:00:00', '17:30:00'),
(36, '17:30:00', '18:00:00'),
(37, '18:00:00', '18:30:00'),
(38, '18:30:00', '19:00:00'),
(39, '19:00:00', '19:30:00'),
(40, '19:30:00', '20:00:00'),
(41, '20:00:00', '20:30:00'),
(42, '20:30:00', '21:00:00'),
(43, '21:00:00', '21:30:00'),
(44, '21:30:00', '22:00:00'),
(45, '22:00:00', '22:30:00'),
(46, '22:30:00', '23:00:00'),
(47, '23:00:00', '23:30:00'),
(48, '23:30:00', '00:00:00');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `theatres`
--

CREATE TABLE IF NOT EXISTS `theatres` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `aisle` tinyint(4) NOT NULL,
  `description` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `theatres`
--

INSERT INTO `theatres` (`id`, `name`, `aisle`, `description`) VALUES
(18, 'Biografsal 1', 0, 'Den største sal i kulturhuset'),
(19, 'test', 0, 'dfhsdfhdfhdfhgdaf'),
(20, 'Hjem', 0, 'drtgstryersytrtsyesyety');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `tickets`
--

CREATE TABLE IF NOT EXISTS `tickets` (
  `id` int(11) NOT NULL,
  `fk_event_id` int(11) NOT NULL,
  `fk_seat_id` int(11) DEFAULT NULL,
  `fk_order` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `tickets`
--

INSERT INTO `tickets` (`id`, `fk_event_id`, `fk_seat_id`, `fk_order`) VALUES
(1, 28, NULL, 2),
(2, 28, NULL, 2),
(3, 28, NULL, 2),
(4, 28, NULL, 3),
(5, 28, NULL, 3),
(6, 28, NULL, 4),
(7, 28, NULL, 4),
(8, 28, NULL, 5),
(9, 28, NULL, 5),
(10, 28, NULL, 5),
(11, 28, NULL, 5),
(12, 28, NULL, 6),
(13, 28, NULL, 6),
(14, 30, NULL, 7),
(15, 30, NULL, 7),
(16, 30, NULL, 7);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  `pass` varchar(75) NOT NULL,
  `fk_role` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Data dump for tabellen `users`
--

INSERT INTO `users` (`id`, `user_name`, `pass`, `fk_role`) VALUES
(6, 'admin', '$2a$10$/eNM5k06Q8mZSNvxUhtz6.66YeArR6xuewvGJwzHbbV8CrrT3AXMm', 1),
(14, 'test', '$2a$10$rYgYOOQwYDA7EKLlduLwM.kH.uqeapiRvhmBkm5pXt/gxOLoYMf4W', 5);

--
-- Begrænsninger for dumpede tabeller
--

--
-- Indeks for tabel `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `conferencerooms`
--
ALTER TABLE `conferencerooms`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `globals`
--
ALTER TABLE `globals`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `rows`
--
ALTER TABLE `rows`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `slots`
--
ALTER TABLE `slots`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `theatres`
--
ALTER TABLE `theatres`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `user_name_UNIQUE` (`user_name`);

--
-- Brug ikke AUTO_INCREMENT for slettede tabeller
--

--
-- Tilføj AUTO_INCREMENT i tabel `ads`
--
ALTER TABLE `ads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- Tilføj AUTO_INCREMENT i tabel `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tilføj AUTO_INCREMENT i tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- Tilføj AUTO_INCREMENT i tabel `conferencerooms`
--
ALTER TABLE `conferencerooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Tilføj AUTO_INCREMENT i tabel `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;
--
-- Tilføj AUTO_INCREMENT i tabel `globals`
--
ALTER TABLE `globals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Tilføj AUTO_INCREMENT i tabel `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tilføj AUTO_INCREMENT i tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=38;
--
-- Tilføj AUTO_INCREMENT i tabel `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- Tilføj AUTO_INCREMENT i tabel `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- Tilføj AUTO_INCREMENT i tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- Tilføj AUTO_INCREMENT i tabel `rows`
--
ALTER TABLE `rows`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=78;
--
-- Tilføj AUTO_INCREMENT i tabel `seats`
--
ALTER TABLE `seats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=142;
--
-- Tilføj AUTO_INCREMENT i tabel `slots`
--
ALTER TABLE `slots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=49;
--
-- Tilføj AUTO_INCREMENT i tabel `theatres`
--
ALTER TABLE `theatres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- Tilføj AUTO_INCREMENT i tabel `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- Tilføj AUTO_INCREMENT i tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
