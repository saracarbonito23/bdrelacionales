-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 21, 2026 at 07:41 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `app`
--

-- --------------------------------------------------------

--
-- Table structure for table `comentarios`
--

CREATE TABLE `comentarios` (
  `comentario_id` int(11) NOT NULL,
  `pub_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `texto` varchar(300) NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `comentarios`
--

INSERT INTO `comentarios` (`comentario_id`, `pub_id`, `usuario_id`, `texto`, `fecha`) VALUES
(1, 1, 3, ' me encanto la foto', '2024-09-21 05:04:19'),
(2, 4, 4, ' quiero pizza', '2022-09-19 12:08:19'),
(3, 5, 6, ' no tengo a quien mandarselo', '2025-02-14 16:13:37'),
(4, 3, 2, ' que lindos', '2023-06-18 18:33:37'),
(5, 2, 6, ' guapos', '2025-08-20 20:31:16');

-- --------------------------------------------------------

--
-- Table structure for table `hashtags`
--

CREATE TABLE `hashtags` (
  `hashtag_id` int(11) NOT NULL,
  `etiqueta` varchar(60) NOT NULL,
  `creado_en` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `hashtags`
--

INSERT INTO `hashtags` (`hashtag_id`, `etiqueta`, `creado_en`) VALUES
(1, '#kawaii', '2017-06-11'),
(2, '#friends', '2012-10-28'),
(3, '#model', '2018-09-06'),
(4, '#pizza', '2020-04-06'),
(5, '#sanvalentin', '2015-04-14');

-- --------------------------------------------------------

--
-- Table structure for table `publicaciones`
--

CREATE TABLE `publicaciones` (
  `pub_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `contenido` text NOT NULL,
  `imagen_url` varchar(255) NOT NULL,
  `fecha_pub` datetime NOT NULL,
  `likes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `publicaciones`
--

INSERT INTO `publicaciones` (`pub_id`, `usuario_id`, `contenido`, `imagen_url`, `fecha_pub`, `likes`) VALUES
(1, 2, ' soy guapo lo sé', 'https://i.pinimg.com/736x/0a/36/2b/0a362b271cb234a1a7cc9b6ca5da3380.jpg', '2025-06-08 08:10:42', 1000000),
(2, 3, ' con mi bro', 'https://i.pinimg.com/1200x/df/ad/3c/dfad3c7b3cafb8bab11b2c2fb90c98c7.jpg', '2023-08-04 12:07:42', 2000000),
(3, 4, ' con la familia', 'https://i.pinimg.com/1200x/eb/06/7b/eb067bf18cb7281d035cb31703d0b92f.jpg', '2027-03-09 10:21:47', 30000),
(4, 5, ' amo la pizzaaa', 'https://i.pinimg.com/736x/e9/b2/f2/e9b2f2db2dd8d870dd2c107d83c68bf1.jpg', '2018-11-11 19:26:56', 70000),
(5, 6, ' para ti bb', 'https://i.pinimg.com/736x/61/0e/ed/610eedf7aec89ebf1af82460ae1194c5.jpg', '2026-02-14 14:30:52', 35000);

-- --------------------------------------------------------

--
-- Table structure for table `pub_hashtags`
--

CREATE TABLE `pub_hashtags` (
  `pub_id` int(11) NOT NULL,
  `hashtag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pub_hashtags`
--

INSERT INTO `pub_hashtags` (`pub_id`, `hashtag_id`) VALUES
(1, 3),
(4, 4),
(3, 1),
(5, 5),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `pub_likes`
--

CREATE TABLE `pub_likes` (
  `pub_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `fecha_like` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pub_likes`
--

INSERT INTO `pub_likes` (`pub_id`, `usuario_id`, `fecha_like`) VALUES
(4, 5, '2023-12-22 05:32:39'),
(1, 2, '2023-07-21 05:32:39'),
(2, 3, '2026-04-21 05:40:27'),
(3, 4, '2026-04-21 05:40:27'),
(5, 6, '2026-04-21 05:43:12');

-- --------------------------------------------------------

--
-- Table structure for table `seguidores`
--

CREATE TABLE `seguidores` (
  `seguidores_id` int(11) NOT NULL,
  `seguido_id` int(11) NOT NULL,
  `fecha_follow` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `seguidores`
--

INSERT INTO `seguidores` (`seguidores_id`, `seguido_id`, `fecha_follow`) VALUES
(3, 2, '2023-03-19'),
(4, 5, '2026-06-15'),
(6, 3, '2019-04-16'),
(4, 5, '2022-09-12'),
(2, 4, '2021-05-12');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `usuarios_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `bio` varchar(200) NOT NULL,
  `fecha_reg` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`usuarios_id`, `username`, `email`, `bio`, `fecha_reg`) VALUES
(2, 'gatitokawaii', ' lino_25@gmail.com', ' amo a los gatos \r\n me gusta el pudding \r\n soy otaku ', '2018-10-06'),
(3, '_doolsetnet', ' quokka14@gmail.com', ' me gusta gatitokawaii\r\n me gustan los dinosaurios \r\n y el cheesecake', '2017-02-19'),
(4, 'cinnaUwU', ' cinnamoroll08@gmail.com', ' soy macho \r\n soy bonito y kawaii ', '2012-06-21'),
(5, 'gatapanzona', ' pusheen10@gmail.com', ' me gusta dormir \r\n soy un unicornio \r\n estoy panzona', '2010-02-18'),
(6, 'francisca_yuri', ' fanciscayuri@gmail.com\r\n ', ' el monte everest no tiene nada en contra de mi', '2013-05-29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`comentario_id`),
  ADD KEY `pub_id` (`pub_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indexes for table `hashtags`
--
ALTER TABLE `hashtags`
  ADD PRIMARY KEY (`hashtag_id`),
  ADD UNIQUE KEY `etiqueta` (`etiqueta`);

--
-- Indexes for table `publicaciones`
--
ALTER TABLE `publicaciones`
  ADD PRIMARY KEY (`pub_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indexes for table `pub_hashtags`
--
ALTER TABLE `pub_hashtags`
  ADD KEY `hashtag_id` (`hashtag_id`),
  ADD KEY `hashtag_id_2` (`hashtag_id`),
  ADD KEY `pub_id` (`pub_id`);

--
-- Indexes for table `pub_likes`
--
ALTER TABLE `pub_likes`
  ADD KEY `pub_id` (`pub_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indexes for table `seguidores`
--
ALTER TABLE `seguidores`
  ADD KEY `seguidores_id` (`seguidores_id`),
  ADD KEY `seguido_id` (`seguido_id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuarios_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `comentario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `hashtags`
--
ALTER TABLE `hashtags`
  MODIFY `hashtag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `publicaciones`
--
ALTER TABLE `publicaciones`
  MODIFY `pub_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pub_hashtags`
--
ALTER TABLE `pub_hashtags`
  MODIFY `hashtag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pub_likes`
--
ALTER TABLE `pub_likes`
  MODIFY `pub_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usuarios_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`pub_id`) REFERENCES `publicaciones` (`pub_id`),
  ADD CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuarios_id`);

--
-- Constraints for table `publicaciones`
--
ALTER TABLE `publicaciones`
  ADD CONSTRAINT `publicaciones_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuarios_id`);

--
-- Constraints for table `pub_hashtags`
--
ALTER TABLE `pub_hashtags`
  ADD CONSTRAINT `pub_hashtags_ibfk_1` FOREIGN KEY (`hashtag_id`) REFERENCES `hashtags` (`hashtag_id`),
  ADD CONSTRAINT `pub_hashtags_ibfk_2` FOREIGN KEY (`pub_id`) REFERENCES `publicaciones` (`pub_id`);

--
-- Constraints for table `pub_likes`
--
ALTER TABLE `pub_likes`
  ADD CONSTRAINT `pub_likes_ibfk_1` FOREIGN KEY (`pub_id`) REFERENCES `publicaciones` (`pub_id`),
  ADD CONSTRAINT `pub_likes_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuarios_id`);

--
-- Constraints for table `seguidores`
--
ALTER TABLE `seguidores`
  ADD CONSTRAINT `seguidores_ibfk_1` FOREIGN KEY (`seguidores_id`) REFERENCES `usuarios` (`usuarios_id`),
  ADD CONSTRAINT `seguidores_ibfk_2` FOREIGN KEY (`seguido_id`) REFERENCES `usuarios` (`usuarios_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
