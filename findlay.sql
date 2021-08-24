-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mar. 24 août 2021 à 18:39
-- Version du serveur :  5.7.24
-- Version de PHP : 7.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `findlay`
--

-- --------------------------------------------------------

--
-- Structure de la table `artists`
--

CREATE TABLE `artists` (
  `artist-id` int(11) NOT NULL,
  `artist_name` varchar(255) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `artists`
--

INSERT INTO `artists` (`artist-id`, `artist_name`) VALUES
(10, 'Dorothée'),
(11, 'Guns\'n roses'),
(13, 'Bob Marley'),
(14, 'Sting'),
(15, 'Petrucciani'),
(16, 'Francis Cabrel'),
(17, 'Calvin Russel'),
(18, 'Tryo'),
(19, 'babababa'),
(20, 'babababa'),
(21, 'babababa'),
(22, 'aler go c bon'),
(23, 'zzzzzuuuuuttttt'),
(24, 'zzzzzuuuuuttttt'),
(25, 'zzzzzuuuuuttttt'),
(26, 'zzzzzuuuuuttttt'),
(27, 'testModif'),
(28, 'testModif'),
(29, 'test 2'),
(30, 'test 2'),
(31, 'bbbbbbbBbbb'),
(32, 'bbbbbbbBbbb'),
(33, 'jjjjuuu'),
(34, 'mmmmm'),
(35, 'mmmmm');

-- --------------------------------------------------------

--
-- Structure de la table `assoc_artists_styles`
--

CREATE TABLE `assoc_artists_styles` (
  `assoc_artist_style_id` int(11) NOT NULL,
  `assoc_artist_id` int(11) NOT NULL,
  `assoc_style_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `assoc_artists_styles`
--

INSERT INTO `assoc_artists_styles` (`assoc_artist_style_id`, `assoc_artist_id`, `assoc_style_id`) VALUES
(1, 13, 474),
(2, 17, 3),
(3, 10, 549),
(4, 16, 457),
(5, 11, 518),
(6, 15, 25),
(7, 14, 542),
(8, 18, 482);

-- --------------------------------------------------------

--
-- Structure de la table `genres`
--

CREATE TABLE `genres` (
  `genre_id` int(11) NOT NULL,
  `genre_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `genres`
--

INSERT INTO `genres` (`genre_id`, `genre_name`) VALUES
(1, 'Blues'),
(2, 'Brass & Military'),
(3, 'Children’s'),
(4, 'Classical'),
(5, 'Electronic'),
(6, 'Folk, World, & Country'),
(7, 'Funk & Soul'),
(8, 'Hip Hop'),
(9, 'Jazz'),
(10, 'Latin'),
(11, 'Non-Music'),
(12, 'Pop'),
(13, 'Reggae'),
(14, 'Rock'),
(15, 'Stage & Screen'),
(16, NULL),
(17, NULL),
(18, NULL),
(19, NULL),
(20, NULL),
(21, 'hhhhh'),
(22, 'ddddd'),
(23, 'ddddd');

-- --------------------------------------------------------

--
-- Structure de la table `styles`
--

CREATE TABLE `styles` (
  `style_id` int(11) NOT NULL,
  `style_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `style_genre_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `styles`
--

INSERT INTO `styles` (`style_id`, `style_name`, `style_genre_id`) VALUES
(1, 'Boogie Woogie', 1),
(2, 'Chicago Blues', 1),
(3, 'Country Blues', 1),
(4, 'Delta Blues', 1),
(5, 'East Coast Blues', 1),
(6, 'Electric Blues', 1),
(7, 'Harmonica Blues', 1),
(8, 'Hill Country Blues', 1),
(9, 'Jump Blues', 1),
(10, 'Louisiana Blues', 1),
(11, 'Memphis Blues', 1),
(12, 'Modern Electric Blues', 1),
(13, 'Piano Blues', 1),
(14, 'Piedmont Blues', 1),
(15, 'Texas Blues', 1),
(16, 'Brass Band', 2),
(17, 'Marches', 2),
(18, 'Military', 2),
(19, 'Pipe & Drum', 2),
(20, 'Educational', 3),
(21, 'Nursery Rhymes', 3),
(22, 'Story', 3),
(23, 'Baroque', 4),
(24, 'Choral', 4),
(25, 'Classical', 4),
(26, 'Contemporary', 4),
(27, 'Early', 4),
(28, 'Impressionist', 4),
(29, 'Medieval', 4),
(30, 'Modern', 4),
(31, 'Neo-Classical', 4),
(32, 'Neo-Romantic', 4),
(33, 'Opera', 4),
(34, 'Operetta', 4),
(35, 'Oratorio', 4),
(36, 'Post-Modern', 4),
(37, 'Renaissance', 4),
(38, 'Romantic', 4),
(39, 'Serial', 4),
(40, 'Twelve-tone', 4),
(41, 'Zarzuela', 4),
(42, 'Abstract', 5),
(43, 'Acid', 5),
(44, 'Acid House', 5),
(45, 'Acid Jazz', 5),
(46, 'Ambient', 5),
(47, 'Ballroom', 5),
(48, 'Baltimore Club', 5),
(49, 'Bassline', 5),
(50, 'Beatdown', 5),
(51, 'Berlin-School', 5),
(52, 'Big Beat', 5),
(53, 'Bleep', 5),
(54, 'Breakbeat', 5),
(55, 'Breakcore', 5),
(56, 'Breaks', 5),
(57, 'Broken Beat', 5),
(58, 'Chillwave', 5),
(59, 'Chiptune', 5),
(60, 'Dance-pop', 5),
(61, 'Dark Ambient', 5),
(62, 'Darkwave', 5),
(63, 'Deep House', 5),
(64, 'Deep Techno', 5),
(65, 'Disco', 5),
(66, 'Disco Polo', 5),
(67, 'Donk', 5),
(68, 'Doomcore', 5),
(69, 'Downtempo', 5),
(70, 'Drone', 5),
(71, 'Drum n Bass', 5),
(72, 'Dub', 5),
(73, 'Dub Techno', 5),
(74, 'Dubstep', 5),
(75, 'Dungeon Synth', 5),
(76, 'EBM', 5),
(77, 'Electro', 5),
(78, 'Electro House', 5),
(79, 'Electro Swing', 5),
(80, 'Electroacoustic', 5),
(81, 'Electroclash', 5),
(82, 'Euro House', 5),
(83, 'Euro-Disco', 5),
(84, 'Eurobeat', 5),
(85, 'Eurodance', 5),
(86, 'Experimental', 5),
(87, 'Footwork', 5),
(88, 'Freestyle', 5),
(89, 'Funkot', 5),
(90, 'Future Jazz', 5),
(91, 'Gabber', 5),
(92, 'Garage House', 5),
(93, 'Ghetto', 5),
(94, 'Ghetto House', 5),
(95, 'Ghettotech', 5),
(96, 'Glitch', 5),
(97, 'Glitch Hop', 5),
(98, 'Goa Trance', 5),
(99, 'Grime', 5),
(100, 'Halftime', 5),
(101, 'Hands Up', 5),
(102, 'Happy Hardcore', 5),
(103, 'Hard Beat', 5),
(104, 'Hard House', 5),
(105, 'Hard Techno', 5),
(106, 'Hard Trance', 5),
(107, 'Hardcore', 5),
(108, 'Hardstyle', 5),
(109, 'Harsh Noise Wall', 5),
(110, 'Hi NRG', 5),
(111, 'Hip Hop', 5),
(112, 'Hip-House', 5),
(113, 'House', 5),
(114, 'IDM', 5),
(115, 'Illbient', 5),
(116, 'Industrial', 5),
(117, 'Italo House', 5),
(118, 'Italo-Disco', 5),
(119, 'Italodance', 5),
(120, 'J-Core', 5),
(121, 'Jazzdance', 5),
(122, 'Jersey Club', 5),
(123, 'Juke', 5),
(124, 'Jumpstyle', 5),
(125, 'Jungle', 5),
(126, 'Latin', 5),
(127, 'Leftfield', 5),
(128, 'Lento Violento', 5),
(129, 'Makina', 5),
(130, 'Minimal', 5),
(131, 'Minimal Techno', 5),
(132, 'Modern Classical', 5),
(133, 'Moombahton', 5),
(134, 'Musique Concrète', 5),
(135, 'Neo Trance', 5),
(136, 'Neofolk', 5),
(137, 'Nerdcore Techno', 5),
(138, 'New Age', 5),
(139, 'New Beat', 5),
(140, 'Noise', 5),
(141, 'Nu-Disco', 5),
(142, 'Power Electronics', 5),
(143, 'Progressive Breaks', 5),
(144, 'Progressive House', 5),
(145, 'Progressive Trance', 5),
(146, 'Psy-Trance', 5),
(147, 'Rhythmic Noise', 5),
(148, 'Schranz', 5),
(149, 'Skweee', 5),
(150, 'Sound Collage', 5),
(151, 'Speed Garage', 5),
(152, 'Speedcore', 5),
(153, 'Synth-pop', 5),
(154, 'Synthwave', 5),
(155, 'Tech House', 5),
(156, 'Tech Trance', 5),
(157, 'Techno', 5),
(158, 'Trance', 5),
(159, 'Tribal', 5),
(160, 'Tribal House', 5),
(161, 'Trip Hop', 5),
(162, 'Tropical House', 5),
(163, 'UK Funky', 5),
(164, 'UK Garage', 5),
(165, 'Vaporwave', 5),
(166, 'Witch House', 5),
(167, 'Aboriginal', 6),
(168, 'African', 6),
(169, 'Andalusian Classical', 6),
(170, 'Andean Music', 6),
(171, 'Appalachian Music', 6),
(172, 'Bangladeshi Classical', 6),
(173, 'Basque Music', 6),
(174, 'Bengali Music', 6),
(175, 'Bhangra', 6),
(176, 'Bluegrass', 6),
(177, 'Cajun', 6),
(178, 'Cambodian Classical', 6),
(179, 'Canzone Napoletana', 6),
(180, 'Carnatic', 6),
(181, 'Catalan Music', 6),
(182, 'Celtic', 6),
(183, 'Chacarera', 6),
(184, 'Chamamé', 6),
(185, 'Chinese Classical', 6),
(186, 'Chutney', 6),
(187, 'Cobla', 6),
(188, 'Copla', 6),
(189, 'Country', 6),
(190, 'Cretan', 6),
(191, 'Dangdut', 6),
(192, 'Éntekhno', 6),
(193, 'Fado', 6),
(194, 'Filk', 6),
(195, 'Flamenco', 6),
(196, 'Folk', 6),
(197, 'Funaná', 6),
(198, 'Gagaku', 6),
(199, 'Galician Traditional', 6),
(200, 'Gamelan', 6),
(201, 'Għana', 6),
(202, 'Ghazal', 6),
(203, 'Griot', 6),
(204, 'Guarania', 6),
(205, 'Gwo Ka', 6),
(206, 'Hawaiian', 6),
(207, 'Highlife', 6),
(208, 'Hillbilly', 6),
(209, 'Hindustani', 6),
(210, 'Honky Tonk', 6),
(211, 'Huayno', 6),
(212, 'Indian Classical', 6),
(213, 'Jota', 6),
(214, 'Jug Band', 6),
(215, 'Kaseko', 6),
(216, 'Keroncong', 6),
(217, 'Kizomba', 6),
(218, 'Klasik', 6),
(219, 'Klezmer', 6),
(220, 'Korean Court Music', 6),
(221, 'Laïkó', 6),
(222, 'Lao Music', 6),
(223, 'Liscio', 6),
(224, 'Luk Krung', 6),
(225, 'Luk Thung', 6),
(226, 'Maloya', 6),
(227, 'Mbalax', 6),
(228, 'Min’yō', 6),
(229, 'Mizrahi', 6),
(230, 'Mo Lam', 6),
(231, 'Morna', 6),
(232, 'Mouth Music', 6),
(233, 'Mugham', 6),
(234, 'Népzene', 6),
(235, 'Nhạc Vàng', 6),
(236, 'Nordic', 6),
(237, 'Ottoman Classical', 6),
(238, 'Overtone Singing', 6),
(239, 'Pacific', 6),
(240, 'Pasodoble', 6),
(241, 'Persian Classical', 6),
(242, 'Philippine Classical', 6),
(243, 'Phleng Phuea Chiwit', 6),
(244, 'Piobaireachd', 6),
(245, 'Polka', 6),
(246, 'Progressive Bluegrass', 6),
(247, 'Qawwali', 6),
(248, 'Raï', 6),
(249, 'Rebetiko', 6),
(250, 'Romani', 6),
(251, 'Rune Singing', 6),
(252, 'Salegy', 6),
(253, 'Sámi Music', 6),
(254, 'Sea Shanties', 6),
(255, 'Séga', 6),
(256, 'Sephardic', 6),
(257, 'Soukous', 6),
(258, 'Taarab', 6),
(259, 'Tamil Film Music', 6),
(260, 'Thai Classical', 6),
(261, 'Volksmusik', 6),
(262, 'Waiata', 6),
(263, 'Western Swing', 6),
(264, 'Yemenite Jewish', 6),
(265, 'Zamba', 6),
(266, 'Zemer Ivri', 6),
(267, 'Zouk', 6),
(268, 'Zydeco', 6),
(269, 'Bayou Funk', 7),
(270, 'Boogie', 7),
(271, 'Contemporary R&B', 7),
(272, 'Free Funk', 7),
(273, 'Funk', 7),
(274, 'Gogo', 7),
(275, 'Gospel', 7),
(276, 'Minneapolis Sound', 7),
(277, 'Neo Soul', 7),
(278, 'New Jack Swing', 7),
(279, 'P.Funk', 7),
(280, 'Psychedelic', 7),
(281, 'Rhythm & Blues', 7),
(282, 'Soul', 7),
(283, 'Swingbeat', 7),
(284, 'UK Street Soul', 7),
(285, 'Bass Music', 8),
(286, 'Beatbox', 8),
(287, 'Bongo Flava', 8),
(288, 'Boom Bap', 8),
(289, 'Bounce', 8),
(290, 'Britcore', 8),
(291, 'Cloud Rap', 8),
(292, 'Conscious', 8),
(293, 'Crunk', 8),
(294, 'Cut-up/DJ', 8),
(295, 'DJ Battle Tool', 8),
(296, 'Favela Funk', 8),
(297, 'G-Funk', 8),
(298, 'Gangsta', 8),
(299, 'Go-Go', 8),
(300, 'Hardcore Hip-Hop', 8),
(301, 'Hiplife', 8),
(302, 'Horrorcore', 8),
(303, 'Hyphy', 8),
(304, 'Instrumental', 8),
(305, 'Jazzy Hip-Hop', 8),
(306, 'Kwaito', 8),
(307, 'Miami Bass', 8),
(308, 'Motswako', 8),
(309, 'Phonk', 8),
(310, 'Pop Rap', 8),
(311, 'Ragga HipHop', 8),
(312, 'RnB/Swing', 8),
(313, 'Screw', 8),
(314, 'Spaza', 8),
(315, 'Thug Rap', 8),
(316, 'Trap', 8),
(317, 'Turntablism', 8),
(318, 'Afro-Cuban Jazz', 9),
(319, 'Afrobeat', 9),
(320, 'Avant-garde Jazz', 9),
(321, 'Big Band', 9),
(322, 'Bop', 9),
(323, 'Bossa Nova', 9),
(324, 'Cape Jazz', 9),
(325, 'Contemporary Jazz', 9),
(326, 'Cool Jazz', 9),
(327, 'Dark Jazz', 9),
(328, 'Dixieland', 9),
(329, 'Easy Listening', 9),
(330, 'Free Improvisation', 9),
(331, 'Free Jazz', 9),
(332, 'Fusion', 9),
(333, 'Gypsy Jazz', 9),
(334, 'Hard Bop', 9),
(335, 'Jazz-Funk', 9),
(336, 'Jazz-Rock', 9),
(337, 'Latin Jazz', 9),
(338, 'Modal', 9),
(339, 'Post Bop', 9),
(340, 'Ragtime', 9),
(341, 'Smooth Jazz', 9),
(342, 'Soul-Jazz', 9),
(343, 'Space-Age', 9),
(344, 'Stride', 9),
(345, 'Swing', 9),
(346, 'Afro-Cuban', 10),
(347, 'Aguinaldo', 10),
(348, 'Axé', 10),
(349, 'Bachata', 10),
(350, 'Baião', 10),
(351, 'Bambuco', 10),
(352, 'Batucada', 10),
(353, 'Beguine', 10),
(354, 'Bolero', 10),
(355, 'Bomba', 10),
(356, 'Boogaloo', 10),
(357, 'Bossanova', 10),
(358, 'Candombe', 10),
(359, 'Carimbó', 10),
(360, 'Cha-Cha', 10),
(361, 'Champeta', 10),
(362, 'Charanga', 10),
(363, 'Choro', 10),
(364, 'Compas', 10),
(365, 'Conjunto', 10),
(366, 'Corrido', 10),
(367, 'Cuatro', 10),
(368, 'Cubano', 10),
(369, 'Cumbia', 10),
(370, 'Danzon', 10),
(371, 'Descarga', 10),
(372, 'Forró', 10),
(373, 'Gaita', 10),
(374, 'Guaguancó', 10),
(375, 'Guajira', 10),
(376, 'Guaracha', 10),
(377, 'Jibaro', 10),
(378, 'Joropo', 10),
(379, 'Lambada', 10),
(380, 'Mambo', 10),
(381, 'Marcha Carnavalesca', 10),
(382, 'Mariachi', 10),
(383, 'Marimba', 10),
(384, 'Merengue', 10),
(385, 'MPB', 10),
(386, 'Musette', 10),
(387, 'Música Criolla', 10),
(388, 'Norteño', 10),
(389, 'Nueva Cancion', 10),
(390, 'Nueva Trova', 10),
(391, 'Occitan', 10),
(392, 'Pachanga', 10),
(393, 'Plena', 10),
(394, 'Porro', 10),
(395, 'Quechua', 10),
(396, 'Ranchera', 10),
(397, 'Reggaeton', 10),
(398, 'Rumba', 10),
(399, 'Salsa', 10),
(400, 'Samba', 10),
(401, 'Samba-Canção', 10),
(402, 'Seresta', 10),
(403, 'Son', 10),
(404, 'Son Montuno', 10),
(405, 'Sonero', 10),
(406, 'Tango', 10),
(407, 'Tejano', 10),
(408, 'Timba', 10),
(409, 'Trova', 10),
(410, 'Vallenato', 10),
(411, 'Audiobook', 11),
(412, 'Comedy', 11),
(413, 'Dialogue', 11),
(414, 'Education', 11),
(415, 'Erotic', 11),
(416, 'Field Recording', 11),
(417, 'Health-Fitness', 11),
(418, 'Interview', 11),
(419, 'Monolog', 11),
(420, 'Movie Effects', 11),
(421, 'Poetry', 11),
(422, 'Political', 11),
(423, 'Promotional', 11),
(424, 'Public Broadcast', 11),
(425, 'Public Service Announcement', 11),
(426, 'Radioplay', 11),
(427, 'Religious', 11),
(428, 'Sermon', 11),
(429, 'Sound Art', 11),
(430, 'Sound Poetry', 11),
(431, 'Special Effects', 11),
(432, 'Speech', 11),
(433, 'Spoken Word', 11),
(434, 'Technical', 11),
(435, 'Therapy', 11),
(436, 'Ballad', 12),
(437, 'Barbershop', 12),
(438, 'Bollywood', 12),
(439, 'Break-In', 12),
(440, 'Bubblegum', 12),
(441, 'Cantopop', 12),
(442, 'Chanson', 12),
(443, 'City Pop', 12),
(444, 'Enka', 12),
(445, 'Ethno-pop', 12),
(446, 'Europop', 12),
(447, 'Hokkien Pop', 12),
(448, 'Indie Pop', 12),
(449, 'Indo-Pop', 12),
(450, 'J-pop', 12),
(451, 'K-pop', 12),
(452, 'Karaoke', 12),
(453, 'Kayōkyoku', 12),
(454, 'Levenslied', 12),
(455, 'Light Music', 12),
(456, 'Mandopop', 12),
(457, 'Music Hall', 12),
(458, 'Néo Kyma', 12),
(459, 'Novelty', 12),
(460, 'Ryūkōka', 12),
(461, 'Schlager', 12),
(462, 'Villancicos', 12),
(463, 'Vocal', 12),
(464, 'Azonto', 13),
(465, 'Bubbling', 13),
(466, 'Calypso', 13),
(467, 'Dancehall', 13),
(468, 'Dub Poetry', 13),
(469, 'Junkanoo', 13),
(470, 'Lovers Rock', 13),
(471, 'Mento', 13),
(472, 'Ragga', 13),
(473, 'Rapso', 13),
(474, 'Reggae', 13),
(475, 'Reggae Gospel', 13),
(476, 'Reggae-Pop', 13),
(477, 'Rocksteady', 13),
(478, 'Roots Reggae', 13),
(479, 'Soca', 13),
(480, 'Steel Band', 13),
(481, 'Acid Rock', 14),
(482, 'Acoustic', 14),
(483, 'Alternative Rock', 14),
(484, 'AOR', 14),
(485, 'Arena Rock', 14),
(486, 'Art Rock', 14),
(487, 'Atmospheric Black Metal', 14),
(488, 'Avantgarde', 14),
(489, 'Beat', 14),
(490, 'Black Metal', 14),
(491, 'Blues Rock', 14),
(492, 'Brit Pop', 14),
(493, 'Classic Rock', 14),
(494, 'Coldwave', 14),
(495, 'Country Rock', 14),
(496, 'Crust', 14),
(497, 'Death Metal', 14),
(498, 'Deathcore', 14),
(499, 'Deathrock', 14),
(500, 'Depressive Black Metal', 14),
(501, 'Doo Wop', 14),
(502, 'Doom Metal', 14),
(503, 'Dream Pop', 14),
(504, 'Emo', 14),
(505, 'Ethereal', 14),
(506, 'Folk Metal', 14),
(507, 'Folk Rock', 14),
(508, 'Funeral Doom Metal', 14),
(509, 'Funk Metal', 14),
(510, 'Garage Rock', 14),
(511, 'Glam', 14),
(512, 'Goregrind', 14),
(513, 'Goth Rock', 14),
(514, 'Gothic Metal', 14),
(515, 'Grindcore', 14),
(516, 'Groove Metal', 14),
(517, 'Grunge', 14),
(518, 'Hard Rock', 14),
(519, 'Heavy Metal', 14),
(520, 'Horror Rock', 14),
(521, 'Indie Rock', 14),
(522, 'Industrial Metal', 14),
(523, 'J-Rock', 14),
(524, 'Jangle Pop', 14),
(525, 'K-Rock', 14),
(526, 'Krautrock', 14),
(527, 'Lo-Fi', 14),
(528, 'Lounge', 14),
(529, 'Math Rock', 14),
(530, 'Melodic Death Metal', 14),
(531, 'Melodic Hardcore', 14),
(532, 'Metalcore', 14),
(533, 'Mod', 14),
(534, 'NDW', 14),
(535, 'New Wave', 14),
(536, 'No Wave', 14),
(537, 'Noisecore', 14),
(538, 'Nu Metal', 14),
(539, 'Oi', 14),
(540, 'Parody', 14),
(541, 'Pop Punk', 14),
(542, 'Pop Rock', 14),
(543, 'Pornogrind', 14),
(544, 'Post Rock', 14),
(545, 'Post-Hardcore', 14),
(546, 'Post-Metal', 14),
(547, 'Post-Punk', 14),
(548, 'Power Metal', 14),
(549, 'Power Pop', 14),
(550, 'Power Violence', 14),
(551, 'Prog Rock', 14),
(552, 'Progressive Metal', 14),
(553, 'Psychedelic Rock', 14),
(554, 'Psychobilly', 14),
(555, 'Pub Rock', 14),
(556, 'Punk', 14),
(557, 'Rock & Roll', 14),
(558, 'Rock Opera', 14),
(559, 'Rockabilly', 14),
(560, 'Shoegaze', 14),
(561, 'Ska', 14),
(562, 'Skiffle', 14),
(563, 'Sludge Metal', 14),
(564, 'Soft Rock', 14),
(565, 'Southern Rock', 14),
(566, 'Space Rock', 14),
(567, 'Speed Metal', 14),
(568, 'Stoner Rock', 14),
(569, 'Surf', 14),
(570, 'Swamp Pop', 14),
(571, 'Symphonic Metal', 14),
(572, 'Symphonic Rock', 14),
(573, 'Technical Death Metal', 14),
(574, 'Thrash', 14),
(575, 'Twist', 14),
(576, 'Viking Metal', 14),
(577, 'Yé-Yé', 14),
(578, 'Cabaret', 15),
(579, 'Musical', 15),
(580, 'Score', 15),
(581, 'Soundtrack', 15),
(582, 'Theme', 15),
(583, 'Vaudeville', 15),
(584, 'Video Game Music', 15);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `artists`
--
ALTER TABLE `artists`
  ADD PRIMARY KEY (`artist-id`);

--
-- Index pour la table `assoc_artists_styles`
--
ALTER TABLE `assoc_artists_styles`
  ADD PRIMARY KEY (`assoc_artist_style_id`),
  ADD KEY `assoc_artist_id` (`assoc_artist_id`),
  ADD KEY `assoc_style_id` (`assoc_style_id`);

--
-- Index pour la table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`genre_id`);

--
-- Index pour la table `styles`
--
ALTER TABLE `styles`
  ADD PRIMARY KEY (`style_id`),
  ADD KEY `style_genre_id` (`style_genre_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `artists`
--
ALTER TABLE `artists`
  MODIFY `artist-id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT pour la table `assoc_artists_styles`
--
ALTER TABLE `assoc_artists_styles`
  MODIFY `assoc_artist_style_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `genres`
--
ALTER TABLE `genres`
  MODIFY `genre_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `styles`
--
ALTER TABLE `styles`
  MODIFY `style_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=585;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `assoc_artists_styles`
--
ALTER TABLE `assoc_artists_styles`
  ADD CONSTRAINT `assoc_artists_styles_ibfk_1` FOREIGN KEY (`assoc_artist_id`) REFERENCES `artists` (`artist-id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assoc_artists_styles_ibfk_2` FOREIGN KEY (`assoc_style_id`) REFERENCES `styles` (`style_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `styles`
--
ALTER TABLE `styles`
  ADD CONSTRAINT `styles_ibfk_1` FOREIGN KEY (`style_genre_id`) REFERENCES `genres` (`genre_id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
