-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 13, 2019 at 04:44 PM
-- Server version: 5.7.25-0ubuntu0.18.04.2
-- PHP Version: 7.2.17-1+ubuntu18.04.1+deb.sury.org+3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `symfony`
--

-- --------------------------------------------------------

--
-- Table structure for table `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migration_versions`
--

INSERT INTO `migration_versions` (`version`) VALUES
('20181127194814'),
('20181128062242'),
('20181217003723'),
('20181217004023'),
('20181219003525'),
('20181219004810');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `id` int(11) NOT NULL,
  `date_from` datetime NOT NULL,
  `date_to` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fishers_number` int(11) NOT NULL,
  `house` tinyint(1) NOT NULL,
  `hours` int(11) NOT NULL,
  `payment_status` tinyint(1) NOT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `sector_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `time_from` int(11) NOT NULL,
  `time_to` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `house_price` int(11) NOT NULL,
  `fishing_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`id`, `date_from`, `date_to`, `name`, `fishers_number`, `house`, `hours`, `payment_status`, `payment_id`, `amount`, `sector_name`, `user_id`, `status`, `time_from`, `time_to`, `created_at`, `updated_at`, `house_price`, `fishing_price`) VALUES
(91, '2019-04-15 07:00:00', '2019-04-16 19:00:00', 'Micaela', 1, 0, 36, 0, NULL, 30, 'Ketvirtas Sektorius', 1, 1, 7, 19, '2019-04-11 23:19:07', '2019-04-11 23:55:09', 0, 30),
(92, '2019-04-15 07:00:00', '2019-04-16 19:00:00', 'Micaela', 1, 0, 36, 0, NULL, 30, 'Šeštas Sektorius', 1, 1, 7, 19, '2019-04-11 23:42:35', '2019-04-11 23:55:10', 0, 30);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'name0@mail.com', 'a:0:{}', '$argon2i$v=19$m=1024,t=2,p=2$NmppSTV4ajFzMmRXSVR3Yg$3Y3e/17zJ42A4j4Y5Kv2gH2gYuaRql92jKFW2NyQje4', 'Micaela', 1, '2019-03-16 15:10:36', '2019-03-16 15:10:36'),
(2, 'name1@mail.com', 'a:0:{}', '$argon2i$v=19$m=1024,t=2,p=2$NGhZMS93eUg1aEZvaHNIcg$Rxdk9jGOmIEE/jhdFNk8ymKvZHGpAdQCgurBiFGndOU', 'Lavada', 1, '2019-03-16 15:10:36', '2019-03-16 15:10:36'),
(3, 'name2@mail.com', 'a:0:{}', '$argon2i$v=19$m=1024,t=2,p=2$dWtXR2k4NmlVVkVNbjdlbA$ONYktHd4GN4BBVjDsh4JGMdjx+x6WUdTUh9+roywIN8', 'Carley', 1, '2019-03-16 15:10:36', '2019-03-16 15:10:36'),
(4, 'name3@mail.com', 'a:0:{}', '$argon2i$v=19$m=1024,t=2,p=2$Q2pmdXBheDguS0NYQ2VBbg$HJ8B9N/XDZA/WSPmZIAw/LQSpL3zXyEhSfWC8rPNTpg', 'Hans', 1, '2019-03-16 15:10:36', '2019-03-16 15:10:36'),
(5, 'name4@mail.com', 'a:0:{}', '$argon2i$v=19$m=1024,t=2,p=2$aEZkRE9vZW9pM09pSExxbw$RCA/Ul2j4wWmL2Y/QPDE+FyTZ9+OfUGca+96FH0A4RU', 'Harry', 1, '2019-03-16 15:10:36', '2019-03-16 15:10:36'),
(6, 'name5@mail.com', 'a:0:{}', '$argon2i$v=19$m=1024,t=2,p=2$NzU1eDFjWWtvUTlIMTVBeA$Jiuor7WubkCo8N+rt6axP9oIs+wb8YJSL3it7DVBeDE', 'Wilfrid', 1, '2019-03-16 15:10:36', '2019-03-16 15:10:36'),
(7, 'name6@mail.com', 'a:0:{}', '$argon2i$v=19$m=1024,t=2,p=2$MGMxZ0ZWOC43cWtsZ25aRQ$6Pl3eH3Qj5esIio7tqPL7eO6dNBOY9AMEGPAXMgq8qA', 'Oda', 1, '2019-03-16 15:10:36', '2019-03-16 15:10:36'),
(8, 'name7@mail.com', 'a:0:{}', '$argon2i$v=19$m=1024,t=2,p=2$U2l4WUViemZJOEFhc0JZcQ$6WP+kgleZwSEnz0fOgJlzgpI3VAPv+qjKK13mpk+oP0', 'Aditya', 1, '2019-03-16 15:10:36', '2019-03-16 15:10:36'),
(9, 'name8@mail.com', 'a:0:{}', '$argon2i$v=19$m=1024,t=2,p=2$NDlmRkguZmlvaGVSeVg4Mg$eGGl9LQTGtt+wb3doQPCIcGH9Cc8paDed39WCAhffgI', 'Price', 1, '2019-03-16 15:10:36', '2019-03-16 15:10:36'),
(10, 'name9@mail.com', 'a:0:{}', '$argon2i$v=19$m=1024,t=2,p=2$WmFKb2Jqc1NIVGk4cU9QNA$HLMoSA6EsY5pe1eIUBVv7tC41egQJb7EewAlpfLLQlc', 'Christian', 1, '2019-03-16 15:10:36', '2019-03-16 15:10:36'),
(11, 'name10@mail.com', 'a:0:{}', '$argon2i$v=19$m=1024,t=2,p=2$RFpFOUJPdDVrSkdnRGV3bg$JEokK8zRsrvTddedHMY/tRIpqWbtRsl8oFX30j75Uyg', 'Mya', 1, '2019-03-16 15:10:36', '2019-03-16 15:10:36'),
(12, 'name11@mail.com', 'a:0:{}', '$argon2i$v=19$m=1024,t=2,p=2$Z0ZtSlBkMHYvN3FvWU5BYQ$bB05nv6PU9OQAm4mgc6WKBdSHfmCzRPo/pp23axGLE8', 'Candelario', 1, '2019-03-16 15:10:36', '2019-03-16 15:10:36'),
(13, 'name12@mail.com', 'a:0:{}', '$argon2i$v=19$m=1024,t=2,p=2$UWZucXpsS3c5VzFtNUhJcA$S4y3pZm8mYrEYdFn37K+xmcOHjWivzC0EFFuL79Gob4', 'Karley', 1, '2019-03-16 15:10:36', '2019-03-16 15:10:36'),
(14, 'name13@mail.com', 'a:0:{}', '$argon2i$v=19$m=1024,t=2,p=2$SmJlZGRBdW9hMk5ZUExLNg$ugudPWyUYbF6ffItyEzSwGCGaU4U+yttB2RF5YezKao', 'Nasir', 1, '2019-03-16 15:10:36', '2019-03-16 15:10:36'),
(15, 'name14@mail.com', 'a:0:{}', '$argon2i$v=19$m=1024,t=2,p=2$blA4VzZOYTVUbU4wNXZCQw$K/XzF69KMuL75YO4xM7zjRSYLU715yjMucrd5aUMxgw', 'Tierra', 1, '2019-03-16 15:10:36', '2019-03-16 15:10:36'),
(16, 'name15@mail.com', 'a:0:{}', '$argon2i$v=19$m=1024,t=2,p=2$cno2MGdCVTg4Q0ppMks0Lg$XDDvjmqy4haVMlkmGMeKo12+CxhRk/Z7XDxE30n9dzQ', 'Onie', 1, '2019-03-16 15:10:36', '2019-03-16 15:10:36'),
(17, 'name16@mail.com', 'a:0:{}', '$argon2i$v=19$m=1024,t=2,p=2$THhSZHVMUXpQcjE1bzJMbg$8U2e1w9BFPdM0ZyatB8b8JFSzf6B2PwYnTiHxVuwqx0', 'Cassidy', 1, '2019-03-16 15:10:36', '2019-03-16 15:10:36'),
(18, 'name17@mail.com', 'a:0:{}', '$argon2i$v=19$m=1024,t=2,p=2$ZEljV1JnOW1wMjk3WEVWSQ$g0sWZcSp8hJp/m9asEk67tzzMfn/5xT0HFP0RaFzj5E', 'Linwood', 1, '2019-03-16 15:10:36', '2019-03-16 15:10:36'),
(19, 'name18@mail.com', 'a:0:{}', '$argon2i$v=19$m=1024,t=2,p=2$cm0yLnZiSVpDSmVXNGkuTw$lZ+Wwj7NNx2m/QdMA4YuIBUXG97Gc/eTu8aENvRfaLk', 'Hans', 1, '2019-03-16 15:10:36', '2019-03-16 15:10:36'),
(20, 'name19@mail.com', 'a:0:{}', '$argon2i$v=19$m=1024,t=2,p=2$d2JNY2tyZWFvYldTYU9aNw$mRHK4O2ZFr00UJ9oyVJ/meHJJV6GplT2/jbraOqDpV4', 'Gia', 1, '2019-03-16 15:10:36', '2019-03-16 15:10:36'),
(21, 'admin0@mail.com', 'a:1:{i:0;s:10:\"ROLE_ADMIN\";}', '$argon2i$v=19$m=1024,t=2,p=2$bExiVDhCV2VGSDA0UlBESA$T3tIJ4VoymQU9VOfaiKmD7Qmfkq63hp7k2Nd5bMsY2s', 'Hilma', 1, '2019-03-16 15:10:36', '2019-03-16 15:10:36'),
(22, 'admin1@mail.com', 'a:1:{i:0;s:10:\"ROLE_ADMIN\";}', '$argon2i$v=19$m=1024,t=2,p=2$YjlDVVJtbG1IdGZoMTBXMQ$wsezpEWfJy+0M6XzE23Cbb3nmwbyovz4zAUwfKIIWf0', 'Adrian', 1, '2019-03-16 15:10:36', '2019-03-16 15:10:36'),
(23, 'admin2@mail.com', 'a:1:{i:0;s:10:\"ROLE_ADMIN\";}', '$argon2i$v=19$m=1024,t=2,p=2$SUptS2w3WVQyTzJqN2hRQw$hk5/mcTVmkGreuer2++2LnOGKJWOYEjIrEbZmqd6Ejs', 'Maxie', 1, '2019-03-16 15:10:36', '2019-03-16 15:10:36'),
(24, 'abonentas0@mail.com', 'a:1:{i:0;s:12:\"ROLE_ABONENT\";}', '$argon2i$v=19$m=1024,t=2,p=2$a2ZxNHdZc3RnTHIxNDFOdQ$6I7JnRdfd47Q6/y+9yiwcE6EMiupH8zXXpx/FcO69cw', 'Lea', 1, '2019-03-16 15:10:36', '2019-03-16 15:10:36'),
(25, 'abonentas1@mail.com', 'a:1:{i:0;s:12:\"ROLE_ABONENT\";}', '$argon2i$v=19$m=1024,t=2,p=2$bGRYTkNlV2lYdTdSVzVFdg$c+2fMhgis9socPKayJpuy+y8zTq/rAzr13KA6eBFUSc', 'Imogene', 1, '2019-03-16 15:10:36', '2019-03-16 15:10:36'),
(26, 'abonentas2@mail.com', 'a:1:{i:0;s:12:\"ROLE_ABONENT\";}', '$argon2i$v=19$m=1024,t=2,p=2$Tm51dmdzYzIwckpwRG1jSw$4550oyUxVrCDJLDen/iaHJFwWw94GiOq28A/8WuCU5U', 'Mckayla', 1, '2019-03-16 15:10:36', '2019-03-16 15:10:36'),
(27, 'abonentas3@mail.com', 'a:1:{i:0;s:12:\"ROLE_ABONENT\";}', '$argon2i$v=19$m=1024,t=2,p=2$MTEwM1lHd0pWS0ZpamlFeQ$uqv9tv/6XwElccXejLzD9tm4zk3EFFBNXG3rPR0cvsk', 'Mireya', 1, '2019-03-16 15:10:36', '2019-03-16 15:10:36'),
(28, 'abonentas4@mail.com', 'a:1:{i:0;s:12:\"ROLE_ABONENT\";}', '$argon2i$v=19$m=1024,t=2,p=2$V1g3c2F4ZFRSUEZDVXNkMg$ycKEpXP6QiYzA4z1sCxIcRacMuyjcgbu5h7vCdVZgsQ', 'Carmelo', 1, '2019-03-16 15:10:36', '2019-03-16 15:10:36'),
(29, 'nera@ya.lt', 'a:0:{}', '$argon2i$v=19$m=1024,t=2,p=2$d2pNLmNHY09vbUhtMkFJMA$k0795EvMe8Cg/5fe3Jir9tZOAOztP9hZtAIum8jNjtg', 'viktoras', 1, '2019-03-26 20:43:47', '2019-03-26 20:43:47'),
(30, 'viktoras.jefimovas@gmail.com', 'a:0:{}', '$argon2i$v=19$m=1024,t=2,p=2$M1gzQWtMOFhHVEZJcjIveQ$VDOB25vZOnYQRXIQdSah3OEWzOzxxssW271uDtaZWOg', 'viktoras', 1, '2019-03-26 21:11:11', '2019-03-26 21:11:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_idx` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `FK_42C84955A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
