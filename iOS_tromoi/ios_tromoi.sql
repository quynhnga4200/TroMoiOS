-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: May 30, 2022 at 07:43 PM
-- Server version: 5.7.28
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ios_tromoi`
--

-- --------------------------------------------------------

--
-- Table structure for table `loaiphong`
--

DROP TABLE IF EXISTS `loaiphong`;
CREATE TABLE IF NOT EXISTS `loaiphong` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `loai` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `loaiphong`
--

INSERT INTO `loaiphong` (`id`, `loai`) VALUES
(1, 'Phòng'),
(2, 'Căn hộ'),
(3, 'Căn hộ mini'),
(4, 'Nguyên căn');

-- --------------------------------------------------------

--
-- Table structure for table `loaitin`
--

DROP TABLE IF EXISTS `loaitin`;
CREATE TABLE IF NOT EXISTS `loaitin` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `loai` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `loaitin`
--

INSERT INTO `loaitin` (`id`, `loai`) VALUES
(1, 'Cho thuê'),
(2, 'Tìm người ở ghép');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
CREATE TABLE IF NOT EXISTS `room` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `loaitinid` int(2) NOT NULL,
  `loaiphongid` int(2) NOT NULL,
  `giaphong` int(12) NOT NULL,
  `dientich` int(5) NOT NULL,
  `DiaChi` varchar(500) NOT NULL,
  `Tieude` varchar(200) NOT NULL,
  `Chitiet` varchar(1000) NOT NULL,
  `Sodt` varchar(50) NOT NULL,
  `tienIch` text NOT NULL,
  `image` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_loaitin` (`loaitinid`),
  KEY `FK_loaiphong` (`loaiphongid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`id`, `loaitinid`, `loaiphongid`, `giaphong`, `dientich`, `DiaChi`, `Tieude`, `Chitiet`, `Sodt`, `tienIch`, `image`) VALUES
(1, 1, 1, 3000000, 45, '128 Đặng Văn Bi, Thủ Đức, Hồ Chí Minh', 'Cho thuê phòng gần chợ Thủ Đức', '- Phòng mới xây sạch sẽ, thoáng mát\r\n- Gần các trường ĐH, CĐ, Bệnh viện Thủ Đức thuận tiện đi lại.\r\n- Cách chợ Thủ Đức 300m', '0987215467-Huy Bóng', '1,2,3,4,5,6,7,8', 'http://192.168.56.1/ios_tromoi/image/1.jpg'),
(2, 2, 4, 6000000, 80, '35/6 Đường số 8, Phường Linh Chiều, Thủ Đức, Hồ Chí Minh', 'Tìm người ở ghép nhà nguyên căn', '- Nhà nguyên căn có 2 phòng diện tích 30m2/1 phòng.\r\n- Đầy đủ tiện ích\r\n- Chỉ cần mang đồ vào có thể ở ngay.', '0111222333-Nga', '1,2,4,6,7', 'http://192.168.56.1/ios_tromoi/image/2.jpg'),
(3, 1, 1, 45, 54, 'Hồ Chí Minh  Tân Phú  Tây Thạnh, Tây Thạnh, Tân Phú, Hồ Chí Minh', 'Cho thuê Căn hộ Mới 100%, Sẵn Nội Thất Ngay KCN Tân Bình', ' Giá: 3TR7 - 4TR1 ( ban công riêng siêu thoáng ) Đ/c: Tây Thạnh, Phường Tây Thạnh, Tân Phú Phòng sẵn nội thất, Cửa sổ Ban công riêng siêu thoáng.Giờ giấc tự do, Không chung chủ.', '01212266666', '1', 'http://192.168.56.1/ios_tromoi/image/3.jpg'),
(7, 1, 1, 3000, 45, ' Cao Văn Ngọc, P11, Tân Phú, Hồ Chí Minh', 'Cho thuê phòng gần chợ Thủ Đức', '- Phòng mới xây sạch sẽ, thoáng mát\r\n- Gần các trường ĐH, CĐ, Bệnh viện Thủ Đức thuận tiện đi lại.\r\n- Cách chợ Thủ Đức 300m', '0987215467-Huy Bóng', '1,2,3,4,5,6,7,8', 'http://192.168.56.1/ios_tromoi/image/4.jpg'),
(8, 2, 4, 600, 80, 'Hẻm 22 Nguyễn Hữu Tiến, P. Tây Thạnh, Tân Phú, Hồ Chí Minh', 'Tìm người ở ghép nhà nguyên căn', '- Nhà nguyên căn có 2 phòng diện tích 30m2/1 phòng.\r\n- Đầy đủ tiện ích\r\n- Chỉ cần mang đồ vào có thể ở ngay.', '0111222333-Nga', '1,2,4,6,7', 'http://192.168.56.1/ios_tromoi/image/5.jpg'),
(9, 1, 1, 45, 54, 'Hồ Chí Minh  Tân Phú  Tây Thạnh, Tây Thạnh, Tân Phú, Hồ Chí Minh', 'Cho thuê Căn hộ Mới 100%, Sẵn Nội Thất Ngay KCN Tân Bình', ' Giá: 3TR7 - 4TR1 ( ban công riêng siêu thoáng ) Đ/c: Tây Thạnh, Phường Tây Thạnh, Tân Phú Phòng sẵn nội thất, Cửa sổ Ban công riêng siêu thoáng.Giờ giấc tự do, Không chung chủ.', '01212266666', '1', 'http://192.168.56.1/ios_tromoi/image/6.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tienich`
--

DROP TABLE IF EXISTS `tienich`;
CREATE TABLE IF NOT EXISTS `tienich` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `ten` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tienich`
--

INSERT INTO `tienich` (`id`, `ten`) VALUES
(1, 'Wifi'),
(2, 'WC riêng'),
(3, 'Giữu xe'),
(4, 'Tự do'),
(5, 'Bếp'),
(6, 'Điều hoà'),
(7, 'Tủ lạnh'),
(8, 'Máy giặt');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `FK_loaiphong` FOREIGN KEY (`loaiphongid`) REFERENCES `loaiphong` (`id`),
  ADD CONSTRAINT `fk_loaitin` FOREIGN KEY (`loaitinid`) REFERENCES `loaitin` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
