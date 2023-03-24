-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 23, 2023 lúc 08:22 AM
-- Phiên bản máy phục vụ: 10.4.21-MariaDB
-- Phiên bản PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `baitaplon`
--
CREATE DATABASE IF NOT EXISTS `baitaplon` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `baitaplon`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

CREATE TABLE `bill` (
  `ID-bill` int(12) NOT NULL,
  `Menu_ID` int(5) NOT NULL,
  `ID_staff` int(11) NOT NULL,
  `ID_customer` int(11) NOT NULL,
  `Quantity` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `total` int(12) NOT NULL,
  `Name_customer` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `pttt` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `Id_cart` int(12) NOT NULL,
  `Tensp` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Hinhsp` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Dongia` int(12) NOT NULL,
  `Soluong` int(3) NOT NULL,
  `Thanhtien` int(12) NOT NULL,
  `ID_bill` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `ID-customer` int(11) NOT NULL,
  `Name_customer` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `orders` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ID` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menu`
--

CREATE TABLE `menu` (
  `Menu-ID` int(5) NOT NULL,
  `Menu_Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type_id` int(5) NOT NULL,
  `ID_supplier` int(11) NOT NULL,
  `Image` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `Price` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `staff`
--

CREATE TABLE `staff` (
  `ID-Staff` int(11) NOT NULL,
  `Name_Staff` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Gender` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Birthday` date NOT NULL,
  `Contact` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `supplier`
--

CREATE TABLE `supplier` (
  `Id-supplier` int(11) NOT NULL,
  `Name_supplier` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address_supplier` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact_supplier` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact_person` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `type`
--

CREATE TABLE `type` (
  `Type-id` int(5) NOT NULL,
  `type_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`ID-bill`),
  ADD UNIQUE KEY `Menu_ID` (`Menu_ID`),
  ADD UNIQUE KEY `ID_staff` (`ID_staff`),
  ADD UNIQUE KEY `ID_customer` (`ID_customer`),
  ADD UNIQUE KEY `pttt` (`pttt`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`Id_cart`),
  ADD KEY `ID_bill` (`ID_bill`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`ID-customer`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Chỉ mục cho bảng `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`Menu-ID`),
  ADD UNIQUE KEY `ID_supplier` (`ID_supplier`),
  ADD KEY `type_id` (`type_id`);

--
-- Chỉ mục cho bảng `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`ID-Staff`);

--
-- Chỉ mục cho bảng `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`Id-supplier`);

--
-- Chỉ mục cho bảng `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`Type-id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bill`
--
ALTER TABLE `bill`
  MODIFY `ID-bill` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `Id_cart` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `ID-customer` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `menu`
--
ALTER TABLE `menu`
  MODIFY `Menu-ID` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `staff`
--
ALTER TABLE `staff`
  MODIFY `ID-Staff` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `supplier`
--
ALTER TABLE `supplier`
  MODIFY `Id-supplier` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `type`
--
ALTER TABLE `type`
  MODIFY `Type-id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Cơ sở dữ liệu: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Đang đổ dữ liệu cho bảng `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"relation_lines\":\"true\",\"snap_to_grid\":\"off\",\"angular_direct\":\"direct\"}');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Đang đổ dữ liệu cho bảng `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'database', 'webshop', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"brands\",\"image_library\",\"import_bill\",\"oder\",\"oder_detail\",\"products\",\"staff\",\"supplier\",\"user\"],\"table_structure[]\":[\"brands\",\"image_library\",\"import_bill\",\"oder\",\"oder_detail\",\"products\",\"staff\",\"supplier\",\"user\"],\"table_data[]\":[\"brands\",\"image_library\",\"import_bill\",\"oder\",\"oder_detail\",\"products\",\"staff\",\"supplier\",\"user\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Cấu trúc của bảng @TABLE@\",\"latex_structure_continued_caption\":\"Cấu trúc của bảng @TABLE@ (còn nữa)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Nội dung của bảng @TABLE@\",\"latex_data_continued_caption\":\"Nội dung của bảng @TABLE@ (còn nữa)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}'),
(3, 'root', 'database', 'a', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"brands\",\"image_library\",\"import_bill\",\"oder\",\"oder_detail\",\"products\",\"staff\",\"supplier\",\"user\"],\"table_structure[]\":[\"brands\",\"image_library\",\"import_bill\",\"oder\",\"oder_detail\",\"products\",\"staff\",\"supplier\",\"user\"],\"table_data[]\":[\"brands\",\"image_library\",\"import_bill\",\"oder\",\"oder_detail\",\"products\",\"staff\",\"supplier\",\"user\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Cấu trúc của bảng @TABLE@\",\"latex_structure_continued_caption\":\"Cấu trúc của bảng @TABLE@ (còn nữa)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Nội dung của bảng @TABLE@\",\"latex_data_continued_caption\":\"Nội dung của bảng @TABLE@ (còn nữa)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}'),
(4, 'root', 'database', 'abc', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"brands\",\"image_library\",\"oder\",\"oder_detail\",\"products\",\"staff\",\"user\"],\"table_structure[]\":[\"brands\",\"image_library\",\"oder\",\"oder_detail\",\"products\",\"staff\",\"user\"],\"table_data[]\":[\"brands\",\"image_library\",\"oder\",\"oder_detail\",\"products\",\"staff\",\"user\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Cấu trúc của bảng @TABLE@\",\"latex_structure_continued_caption\":\"Cấu trúc của bảng @TABLE@ (còn nữa)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Nội dung của bảng @TABLE@\",\"latex_data_continued_caption\":\"Nội dung của bảng @TABLE@ (còn nữa)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Đang đổ dữ liệu cho bảng `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"web_shop\",\"table\":\"products\"},{\"db\":\"web_shop_nga\",\"table\":\"products\"},{\"db\":\"web_shop_nga\",\"table\":\"brands\"},{\"db\":\"web_shop\",\"table\":\"oder\"},{\"db\":\"web_shop\",\"table\":\"oder_detail\"},{\"db\":\"web_shop\",\"table\":\"import_bill\"},{\"db\":\"web_shop\",\"table\":\"image_library\"},{\"db\":\"web_shop\",\"table\":\"brands\"},{\"db\":\"web_shop\",\"table\":\"user\"},{\"db\":\"web_shop\",\"table\":\"supplier\"}]');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Đang đổ dữ liệu cho bảng `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'web_shop', 'oder', '{\"sorted_col\":\"`oder`.`created_time`  DESC\"}', '2023-03-03 06:55:24'),
('root', 'web_shop', 'products', '{\"sorted_col\":\"`products`.`price`  DESC\"}', '2023-03-21 03:05:30');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Đang đổ dữ liệu cho bảng `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2023-03-23 07:21:47', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"vi\"}');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Chỉ mục cho bảng `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Chỉ mục cho bảng `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Chỉ mục cho bảng `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Chỉ mục cho bảng `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Chỉ mục cho bảng `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Chỉ mục cho bảng `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Chỉ mục cho bảng `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Chỉ mục cho bảng `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Chỉ mục cho bảng `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Chỉ mục cho bảng `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Chỉ mục cho bảng `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Chỉ mục cho bảng `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Chỉ mục cho bảng `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Chỉ mục cho bảng `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Chỉ mục cho bảng `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Chỉ mục cho bảng `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Chỉ mục cho bảng `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Cơ sở dữ liệu: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Cơ sở dữ liệu: `web_shop`
--
CREATE DATABASE IF NOT EXISTS `web_shop` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `web_shop`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(5) NOT NULL,
  `brand_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_name`) VALUES
(1, 'gucci'),
(2, 'LV'),
(3, 'Luis');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `image_library`
--

CREATE TABLE `image_library` (
  `id` int(5) NOT NULL,
  `prd_id` int(5) NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `image_library`
--

INSERT INTO `image_library` (`id`, `prd_id`, `image`) VALUES
(192, 107, '8.webp'),
(193, 107, '9.webp'),
(194, 107, '10.webp'),
(195, 108, '12.webp'),
(196, 108, '13.webp'),
(197, 108, '14.webp'),
(198, 108, '15.webp'),
(199, 109, '16.jpg'),
(200, 109, '17.webp'),
(201, 109, '18.jpg'),
(202, 109, '19.jpg'),
(203, 109, '20.jpg'),
(289, 101, '61.jpg'),
(290, 101, '62.jpg'),
(291, 101, '63.jpg'),
(292, 101, '64.jpg'),
(315, 2, '1.jpg'),
(316, 2, '2.jpg'),
(317, 2, '3.jpg'),
(318, 2, '4.jpg'),
(319, 5, '5.jpg'),
(320, 5, '6.jpg'),
(321, 5, '7.jpg'),
(322, 5, '8.jpg'),
(323, 9, '9.jpg'),
(324, 9, '10.jpg'),
(325, 9, '11.jpg'),
(326, 9, '12.jpg'),
(331, 22, '17.jpg'),
(332, 22, '18.jpg'),
(333, 22, '19.jpg'),
(334, 22, '20.jpg'),
(335, 23, '21.jpg'),
(336, 23, '22.jpg'),
(337, 23, '23.jpg'),
(338, 23, '24.jpg'),
(339, 25, '25.jpg'),
(340, 25, '26.jpg'),
(341, 25, '27.jpg'),
(342, 25, '28.jpg'),
(343, 26, '29.jpg'),
(344, 26, '30.jpg'),
(345, 26, '31.jpg'),
(346, 26, '32.jpg'),
(347, 27, '33.jpg'),
(348, 27, '34.jpg'),
(349, 27, '35.jpg'),
(350, 27, '36.jpg'),
(351, 28, '37.jpg'),
(352, 28, '38.jpg'),
(353, 28, '39.jpg'),
(354, 28, '40.jpg'),
(355, 29, '41.jpg'),
(356, 29, '42.jpg'),
(357, 29, '43.jpg'),
(358, 29, '44.jpg'),
(359, 30, '45.jpg'),
(360, 30, '46.jpg'),
(361, 30, '47.jpg'),
(362, 30, '48.jpg'),
(363, 31, '49.jpg'),
(364, 31, '50.jpg'),
(365, 31, '51.jpg'),
(366, 31, '52.jpg'),
(367, 32, '53.jpg'),
(368, 32, '54.jpg'),
(369, 32, '55.jpg'),
(370, 32, '56.jpg'),
(371, 33, '57.jpg'),
(372, 33, '58.jpg'),
(373, 33, '59.jpg'),
(374, 33, '60.jpg'),
(375, 33, '61.jpg'),
(376, 33, '62.jpg'),
(377, 34, '63.jpg'),
(378, 34, '64.jpg'),
(379, 34, '65.jpg'),
(380, 34, '66.jpg'),
(385, 35, '69.jpg'),
(386, 35, '70.jpg'),
(387, 35, '71.jpg'),
(388, 35, '72.jpg'),
(389, 36, '73.jpg'),
(390, 36, '74.jpg'),
(391, 36, '75.jpg'),
(392, 36, '76.jpg'),
(393, 37, '77.jpg'),
(394, 37, '78.jpg'),
(395, 37, '79.jpg'),
(396, 37, '80.jpg'),
(404, 87, '1n.webp'),
(405, 87, '2n.jpg'),
(406, 87, '3n.jpg'),
(407, 87, '4n.webp'),
(408, 91, '5n.webp'),
(409, 91, '6n.webp'),
(410, 91, '7n.jpg'),
(411, 91, '8n.jpg'),
(412, 92, '9n.webp'),
(413, 92, '10n.webp'),
(414, 92, '11n.webp'),
(415, 92, '12n.jpg'),
(416, 93, '13n.jpg'),
(417, 93, '14n.jpg'),
(418, 93, '15n.jpg'),
(419, 93, '16n.jpg'),
(420, 94, '17n.webp'),
(421, 94, '18n.jpg'),
(422, 94, '19n.webp'),
(423, 94, '20n.webp'),
(424, 95, '21n.webp'),
(425, 95, '22n.jpg'),
(426, 95, '23n.jpg'),
(427, 95, '24n.jpg'),
(428, 96, '25n.webp'),
(429, 96, '26n.jpg'),
(430, 96, '27n.jpg'),
(431, 96, '28n.jpg'),
(432, 97, '29n.jpg'),
(433, 97, '30n.jpg'),
(434, 97, '31n.jpg'),
(435, 97, '32n.jpg'),
(436, 98, '33n.webp'),
(437, 98, '34n.jpg'),
(438, 98, '35n.jpg'),
(439, 98, '36n.webp'),
(440, 99, '37n.webp'),
(441, 99, '38n.webp'),
(442, 99, '39n.jpg'),
(443, 99, '40n.webp'),
(444, 100, '41n.jpg'),
(445, 100, '42n.jpg'),
(446, 100, '43n.jpg'),
(447, 102, '45n.jpg'),
(448, 102, '46n.jpg'),
(449, 102, '47n.webp'),
(450, 102, '48n.jpg'),
(451, 103, '49n.webp'),
(452, 103, '50n.webp'),
(453, 103, '51n.jpg'),
(454, 103, '52n.webp'),
(455, 104, '53n.jpg'),
(456, 104, '54n.webp'),
(457, 104, '55n.jpg'),
(458, 104, '56n.webp'),
(459, 105, '57n.webp'),
(460, 105, '58n.webp'),
(461, 105, '59n.webp'),
(462, 105, '60n.jpg'),
(467, 106, '61n.jpg'),
(468, 106, '62n.webp'),
(469, 106, '63n.webp'),
(470, 106, '64n.webp');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `import_bill`
--

CREATE TABLE `import_bill` (
  `id` int(11) NOT NULL,
  `id_Supplier` int(11) NOT NULL,
  `prd_id` int(11) NOT NULL,
  `quantity_Import` int(30) NOT NULL,
  `create_time` date NOT NULL,
  `total_Import` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oder`
--

CREATE TABLE `oder` (
  `id` int(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `total` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `oder`
--

INSERT INTO `oder` (`id`, `name`, `phone`, `address`, `note`, `total`, `created_time`, `last_updated`, `status`) VALUES
(55, 'Hữu Sơn', '0949701834', 'Hà Nội', 'mang tận nơi', '44700000', 1638715528, 1638715528, 1),
(59, 'son', '0949701832', 'xã Cư Yên, huyện Lương Sơn, tỉnh Hòa Bình', 'abc', '17400000', 1650447837, 1650447837, 0),
(60, '3D', '949701834', 'xã Cư Yên, huyện Lương Sơn, tỉnh Hòa Bình', 'abc', '3000', 1650469435, 1650469435, 0),
(61, 'nhom4', '0949701832', 'xã Cư Yên, huyện Lương Sơn, tỉnh Hòa Bình', 'mang tận nơi', '2700', 1650470320, 1650470320, 0),
(62, 'Nguyễn Thành Sơ', '0949701834', 'Hà Nội', 'giao tận nơi', '5200', 1650504654, 1650504654, 0),
(63, 'Nguyễn Văn Quanga', '0949701834', 'xã Cư Yên, huyện Lương Sơn, tỉnh Hòa Bình', 'giao tận nơi', '6700', 1650516318, 1650516318, 0),
(65, '2', '0949701834', 'xã Cư Yên, huyện Lương Sơn, tỉnh Hòa Bình', 'giao tận nơi', '8100', 1650533299, 1650533299, 1),
(66, 'Nguyễn Văn Quang', '949701834', 'xã Cư Yên, huyện Lương Sơn, tỉnh Hòa Bình', 'abc', '2800', 1650533393, 1650533393, 1),
(68, 'Nguyễn Sơn', '0949701834', '123', 'abc', '3000', 1670729338, 1670729338, 1),
(70, 'son son', '0949701834', 'alo', '', '4300', 0, 1670732305, 1),
(71, 'Nguyễn Sơn', '0949701834', '123', '', '1500', 2023, 1671640445, 1),
(76, 'son son', '0949701834', 'alo', '', '1002', 1679304261, 1679304261, NULL),
(77, 'son son2', '0949701834', 'alo', '', '2002', 1679304371, 1679304371, NULL),
(78, 'son thanh', '0949701834', 'Hoang Ha', 'zbc', '1500', 1679549079, 1679549079, NULL),
(79, 'son thanh', '0949701834', 'Hoang Ha', '', '1502', 1679550718, 1679550718, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oder_detail`
--

CREATE TABLE `oder_detail` (
  `id` int(11) NOT NULL,
  `id_oder` int(10) NOT NULL,
  `id_nv` int(10) NOT NULL,
  `id_prd` int(11) NOT NULL,
  `size` char(5) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(10) NOT NULL,
  `price` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL,
  `address` varchar(500) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `oder_detail`
--

INSERT INTO `oder_detail` (`id`, `id_oder`, `id_nv`, `id_prd`, `size`, `quantity`, `price`, `created_time`, `last_updated`, `address`) VALUES
(80, 60, 3, 2, '', 2, '1500', 1650469435, 1650469435, 'xã Cư Yên, huyện Lương Sơn, tỉnh Hòa Bình'),
(82, 61, 3, 5, '', 1, '2000', 1650470320, 1650470320, 'xã Cư Yên, huyện Lương Sơn, tỉnh Hòa Bình'),
(86, 62, 3, 2, '', 3, '1500', 1650504654, 1650504654, 'Hà Nội'),
(88, 63, 3, 2, '', 4, '1500', 1650516318, 1650516318, 'xã Cư Yên, huyện Lương Sơn, tỉnh Hòa Bình'),
(92, 65, 3, 2, '', 4, '1500', 1650533299, 1650533299, 'xã Cư Yên, huyện Lương Sơn, tỉnh Hòa Bình'),
(95, 68, 3, 2, 'L', 2, '1500', 1670729338, 1670729338, '123'),
(98, 70, 3, 2, 'S', 1, '1500', 1670732305, 1670732305, 'alo'),
(99, 71, 3, 2, 'S', 1, '1500', 1671640445, 1671640445, '123'),
(106, 63, 3, 9, 'S', 1, '7000', 2023, 0, '2'),
(107, 76, 3, 87, 'S', 1, '1000', 1679304261, 1679304261, 'alo'),
(108, 76, 3, 91, 'S', 1, '2', 1679304261, 1679304261, 'alo'),
(109, 77, 3, 87, 'S', 2, '1000', 1679304371, 1679304371, 'alo'),
(111, 78, 3, 2, 'S', 1, '1500', 1679549079, 1679549079, 'Hoang Ha'),
(112, 79, 3, 2, 'S', 1, '1500', 1679550719, 1679550719, 'Hoang Ha'),
(113, 79, 3, 9, 'S', 1, '2', 1679550719, 1679550719, 'Hoang Ha');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `prd_id` int(5) NOT NULL,
  `prd_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `description` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `brand_id` int(5) NOT NULL,
  `sex` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`prd_id`, `prd_name`, `image`, `price`, `quantity`, `description`, `brand_id`, `sex`) VALUES
(2, 'Prama Decem', '1.jpg', 1500, 20, '<p>100% Cotton, Màu xanh nhạt, Regular Fit, Người mẫu mặc cỡ M (Pháp), Số đo của người mẫu: ngực 32’’/82 cm, chiều cao 6’’/183 cm, Sản xuất tại Ý</p>', 1, 0),
(5, 'Landoba', '5.jpg', 2000, 5, '<p>100% Cotton, Màu xanh nhạt, Regular Fit, Người mẫu mặc cỡ M (Pháp), Số đo của người mẫu: ngực 32’’/82 cm, chiều cao 6’’/183 cm, Sản xuất tại Ý</p>', 1, 0),
(9, '3D Monogram T-Shirt', '9.jpg', 2, 2, '<p>100% Cotton, Màu xanh nhạt, Regular Fit, Người mẫu mặc cỡ M (Pháp), Số đo của người mẫu: ngực 32’’/82 cm, chiều cao 6’’/183 cm, Sản xuất tại Ý</p>', 1, 0),
(22, 'LOUIS VUITTON COAT OF ARMS T-SHIRT', '17.jpg', 500000, 3, '<p>100% Cotton, Màu xanh nhạt, Regular Fit, Người mẫu mặc cỡ M (Pháp), Số đo của người mẫu: ngực 32’’/82 cm, chiều cao 6’’/183 cm, Sản xuất tại Ý</p>', 1, 0),
(23, 'SHOULDER TAB SHIRT', '21.jpg', 125000, 3, '<p>100% Cotton, Màu xanh nhạt, Regular Fit, Người mẫu mặc cỡ M (Pháp), Số đo của người mẫu: ngực 32’’/82 cm, chiều cao 6’’/183 cm, Sản xuất tại Ý</p>', 1, 0),
(25, 'DAMIER AZUR SHIRT', '25.jpg', 1666000, 6, '<p>100% Cotton, Màu xanh nhạt, Regular Fit, Người mẫu mặc cỡ M (Pháp), Số đo của người mẫu: ngực 32’’/82 cm, chiều cao 6’’/183 cm, Sản xuất tại Ý</p>', 1, 0),
(26, 'LV GLOBE SELF TIE T-SHIRT', '29.jpg', 1790000, 9, '<p>100% Cotton, Màu xanh nhạt, Regular Fit, Người mẫu mặc cỡ M (Pháp), Số đo của người mẫu: ngực 32’’/82 cm, chiều cao 6’’/183 cm, Sản xuất tại Ý</p>', 1, 0),
(27, '3D MONOGRAM T-SHIRT', '33.jpg', 125000, 12, '<p>100% Cotton, Màu xanh nhạt, Regular Fit, Người mẫu mặc cỡ M (Pháp), Số đo của người mẫu: ngực 32’’/82 cm, chiều cao 6’’/183 cm, Sản xuất tại Ý</p>', 1, 0),
(28, 'LV VITESSE T-SHIRT', '37.jpg', 1526000, 9, '<p>rất đẹp</p>', 3, 0),
(29, 'RETRO MONOGRAM T-SHIRT', '41.jpg', 810000, 1, '<p>100% Cotton, Màu xanh nhạt, Regular Fit, Người mẫu mặc cỡ M (Pháp), Số đo của người mẫu: ngực 32’’/82 cm, chiều cao 6’’/183 cm, Sản xuất tại Ý</p>', 3, 0),
(30, 'MIXED MONOGRAM T-SHIRT', '45.jpg', 200000, 6, '<p>100% Cotton, Màu xanh nhạt, Regular Fit, Người mẫu mặc cỡ M (Pháp), Số đo của người mẫu: ngực 32’’/82 cm, chiều cao 6’’/183 cm, Sản xuất tại Ý</p>', 3, 0),
(31, 'VUITTAMINS SPORTY JACQUARD KNIT TOP', '49.jpg', 200000, 20, '<p>100% Cotton, Màu xanh nhạt, Regular Fit, Người mẫu mặc cỡ M (Pháp), Số đo của người mẫu: ngực 32’’/82 cm, chiều cao 6’’/183 cm, Sản xuất tại Ý</p>', 3, 0),
(32, 'VUITTAMINS SHINY T-SHIRT', '53.jpg', 250000, 1, '<p>100% Cotton, Màu xanh nhạt, Regular Fit, Người mẫu mặc cỡ M (Pháp), Số đo của người mẫu: ngực 32’’/82 cm, chiều cao 6’’/183 cm, Sản xuất tại Ý</p>', 3, 0),
(33, 'MIXED MONOGRAM ', '57.jpg', 165000, 4, '<p>100% Cotton, Màu xanh nhạt, Regular Fit, Người mẫu mặc cỡ M (Pháp), Số đo của người mẫu: ngực 32’’/82 cm, chiều cao 6’’/183 cm, Sản xuất tại Ý</p>', 1, 0),
(34, 'CHAIN PRINT SILK SHIRT', '65.jpg', 1800000, 1, '<p>100% Cotton, Màu xanh nhạt, Regular Fit, Người mẫu mặc cỡ M (Pháp), Số đo của người mẫu: ngực 32’’/82 cm, chiều cao 6’’/183 cm, Sản xuất tại Ý</p>', 3, 0),
(35, 'CHAIN PRINT T-SHIRT', '69.jpg', 890, 1, '<p>t100% Cotton, Màu xanh nhạt, Regular Fit, Người mẫu mặc cỡ M (Pháp), Số đo của người mẫu: ngực 32’’/82 cm, chiều cao 6’’/183 cm, Sản xuất tại Ý</p>', 1, 0),
(36, 'SPORTY CUT-OUT T-SHIRT', '73.jpg', 250000, 2, '<p>rất đẹp</p>', 3, 0),
(37, 'WASHED SILK MONOGRAM SHIRT', '77.jpg', 178000, 5, '<p>rất đẹp</p>', 3, 0),
(38, 'PLEATED BIB SHIRT', '81.jpg', 123000, 1, '<p>tuyệt</p>', 3, 0),
(39, 'REVERSE SUNSET MONOGRAM T-SHIRT', '1.jpg', 880000, 3, '<p>đẹp</p>', 3, 0),
(41, 'SUNRISE MONOGRAM T-SHIRT', 'sp39.webp', 880, 1, 'đẹp', 3, 0),
(42, 'BLUE LAGOON MONOGRAM FLOUNCE SLEEVE T-SHIRT', 'sp40.webp', 990000, 7, '<p>rất đẹp</p>', 3, 0),
(87, 'Áo Sơ Mi', '1n.webp', 1000, 2, '<p>100% Cotton, Màu xanh nhạt, Regular Fit, Người mẫu mặc cỡ M (Pháp), Số đo của người mẫu: ngực 32’’/82 cm, chiều cao 6’’/183 cm, Sản xuất tại Ý</p>', 2, 1),
(91, 'Abstract Houndstooth', '5n.webp', 2, 1500, '<p>100% Cotton, Màu xanh nhạt, Regular Fit, Người mẫu mặc cỡ M (Pháp), Số đo của người mẫu: ngực 32’’/82 cm, chiều cao 6’’/183 cm, Sản xuất tại Ý</p>', 3, 1),
(92, 'Áo Khoác Denim', '9n.webp', 1, 10, '<p>100% Cotton, Màu xanh nhạt, Regular Fit, Người mẫu mặc cỡ M (Pháp), Số đo của người mẫu: ngực 32’’/82 cm, chiều cao 6’’/183 cm, Sản xuất tại Ý</p>', 1, 1),
(93, 'Jazz Flyers', '13n.jpg', 1000, 20, '<p>100% Cotton, Màu xanh nhạt, Regular Fit, Người mẫu mặc cỡ M (Pháp), Số đo của người mẫu: ngực 32’’/82 cm, chiều cao 6’’/183 cm, Sản xuất tại Ý</p>', 3, 1),
(94, 'Monogram Camo', '17n.webp', 1500, 25, '<p>100% Cotton, Màu xanh nhạt, Regular Fit, Người mẫu mặc cỡ M (Pháp), Số đo của người mẫu: ngực 32’’/82 cm, chiều cao 6’’/183 cm, Sản xuất tại Ý</p>', 3, 1),
(95, 'Quần Dài Dáng Thể Thao', '21n.webp', 2000, 5, '<p>100% Cotton, Màu xanh nhạt, Regular Fit, Người mẫu mặc cỡ M (Pháp), Số đo của người mẫu: ngực 32’’/82 cm, chiều cao 6’’/183 cm, Sản xuất tại Ý</p>', 3, 1),
(96, 'Áo Polo LVSE', '25n.webp', 800, 800, '<p>100% Cotton, Màu xanh nhạt, Regular Fit, Người mẫu mặc cỡ M (Pháp), Số đo của người mẫu: ngực 32’’/82 cm, chiều cao 6’’/183 cm, Sản xuất tại Ý</p>', 3, 1),
(97, 'Áo Khoác LVSE', '29n.jpg', 2100, 20, '<p>100% Cotton, Màu xanh nhạt, Regular Fit, Người mẫu mặc cỡ M (Pháp), Số đo của người mẫu: ngực 32’’/82 cm, chiều cao 6’’/183 cm, Sản xuất tại Ý</p>', 3, 1),
(98, 'Thể Thao LVSE', '33n.webp', 1400, 10, '<p>100% Cotton, Màu xanh nhạt, Regular Fit, Người mẫu mặc cỡ M (Pháp), Số đo của người mẫu: ngực 32’’/82 cm, chiều cao 6’’/183 cm, Sản xuất tại Ý</p>', 1, 1),
(99, 'Áo Sơ Mi 1AATPF', '37n.webp', 2100, 50, '<p>100% Cotton, Màu xanh nhạt, Regular Fit, Người mẫu mặc cỡ M (Pháp), Số đo của người mẫu: ngực 32’’/82 cm, chiều cao 6’’/183 cm, Sản xuất tại Ý</p>', 2, 1),
(100, 'Áo Thun', '41n.jpg', 500, 5, '<p>100% Cotton, Màu xanh nhạt, Regular Fit, Người mẫu mặc cỡ M (Pháp), Số đo của người mẫu: ngực 32’’/82 cm, chiều cao 6’’/183 cm, Sản xuất tại Ý</p>', 2, 1),
(101, 'Áo Len', '61.jpg', 1500, 20, '<p>100% Cotton, Màu xanh nhạt, Regular Fit, Người mẫu mặc cỡ M (Pháp), Số đo của người mẫu: ngực 32’’/82 cm, chiều cao 6’’/183 cm, Sản xuất tại Ý</p>', 2, 1),
(102, 'Áo Thun Dệt Kim', '45n.jpg', 1256, 12, '<p>100% Cotton, Màu xanh nhạt, Regular Fit, Người mẫu mặc cỡ M (Pháp), Số đo của người mẫu: ngực 32’’/82 cm, chiều cao 6’’/183 cm, Sản xuất tại Ý</p>', 2, 1),
(103, 'Áo Sơ Mi 1AATI2', '49n.webp', 500, 20, '<p>100% Cotton, Màu xanh nhạt, Regular Fit, Người mẫu mặc cỡ M (Pháp), Số đo của người mẫu: ngực 32’’/82 cm, chiều cao 6’’/183 cm, Sản xuất tại Ý</p>', 2, 1),
(104, 'Quần Jean', '53n.jpg', 3000, 12, '<p>100% Cotton, Màu xanh nhạt, Regular Fit, Người mẫu mặc cỡ M (Pháp), Số đo của người mẫu: ngực 32’’/82 cm, chiều cao 6’’/183 cm, Sản xuất tại Ý</p>', 2, 1),
(105, 'Áo Sơ Mi 1AATGQ', '57n.webp', 1000, 30, '<p>100% Cotton, Màu xanh nhạt, Regular Fit, Người mẫu mặc cỡ M (Pháp), Số đo của người mẫu: ngực 32’’/82 cm, chiều cao 6’’/183 cm, Sản xuất tại Ý</p>', 2, 1),
(106, '1AATG6 Áo Sơ Mi', '61n.jpg', 1500, 200, '<p>100% Cotton, Màu xanh nhạt, Regular Fit, Người mẫu mặc cỡ M (Pháp), Số đo của người mẫu: ngực 32’’/82 cm, chiều cao 6’’/183 cm, Sản xuất tại Ý</p>', 2, 1),
(107, 'Áo Khoác Denim Star', '8.webp', 1500, 10, '100% Cotton, Màu xanh nhạt, Regular Fit, Người mẫu mặc cỡ M (Pháp), Số đo của người mẫu: ngực 32’’/82 cm, chiều cao 6’’/183 cm, Sản xuất tại Ý', 2, 1),
(108, 'Áo Khoác Bomber Hai Mặt', '12.webp', 3000, 100, '100% Cotton, Màu xanh nhạt, Regular Fit, Người mẫu mặc cỡ M (Pháp), Số đo của người mẫu: ngực 32’’/82 cm, chiều cao 6’’/183 cm, Sản xuất tại Ý', 2, 1),
(109, 'Monogram Gradient', '16.jpg', 1400, 50, '100% Cotton, Màu xanh nhạt, Regular Fit, Người mẫu mặc cỡ M (Pháp), Số đo của người mẫu: ngực 32’’/82 cm, chiều cao 6’’/183 cm, Sản xuất tại Ý', 2, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `staff`
--

CREATE TABLE `staff` (
  `id_nv` int(10) NOT NULL,
  `image` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `name_nv` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `date_start_work` date NOT NULL,
  `address` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `phone` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `salary` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `staff`
--

INSERT INTO `staff` (`id_nv`, `image`, `name_nv`, `date_of_birth`, `date_start_work`, `address`, `phone`, `salary`) VALUES
(3, 'sp1.1.webp', 'Nguyễn Thành Sơn', '2001-12-02', '2021-12-07', 'Bắc Từ Liêm, Hà Nội', '09847464', 200000),
(7, 'p8.jpg', 'son son', '2023-03-01', '2023-03-22', 'alo', '0949701834', 10000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `name_Supplier` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SDT_Supplier` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `name`, `password`) VALUES
(18, '2', '$2y$10$mdd2Sc5fkw93oCurJ4kHgenqeh4wmrMvkBxpf8fO9SngV5bL/DVym'),
(19, '1', '$2y$10$lQNL3PAiSg3NA1TlAvLw4.pXP5flEyJg3DMncaydPYPdulFLz0Dbu'),
(20, 'nhom4', '$2y$10$XWZQFL1MaSIdDEFChD7t1uOeQNur.6yBo8snGYFW8XnApLfFsINRq'),
(21, 'son', '$2y$10$gXZM0mX/E18rXwWQXwoyKOoSy8u9BbutncbW1WJy4x67KHHiSv4SW'),
(22, 'nhomf4', '$2y$10$CYqM8./wNlFbn4lCfUA52eXKe2aGlxZYJxGZ3HdK06V/3CPLySvdW'),
(23, 'nhomhunre', '$2y$10$zCT4pGt7mejifamUQcs2IeIIuim2102pUxK5sro87Euv7njkp9sky'),
(24, 'sondeptrai', '$2y$10$VN9W7YK15kULKjQV3hcVTO2I4ORWsO8hEuRTF9Xr3kkXJN39xz0nK'),
(25, 'sonxoan2001', '$2y$10$m2SZDeoz5c/pPpUCr/z28.enwvFwJNxIjP3rnZiKK108jqMLN1hga'),
(26, 'quangngu', '$2y$10$q.MCPT121jSwcdj86CUTBOqMRnvt9WPcsDnjl/esGIr01yFP0KCau');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Chỉ mục cho bảng `image_library`
--
ALTER TABLE `image_library`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prd_id` (`prd_id`);

--
-- Chỉ mục cho bảng `import_bill`
--
ALTER TABLE `import_bill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_Supplier` (`id_Supplier`),
  ADD KEY `prd_id` (`prd_id`);

--
-- Chỉ mục cho bảng `oder`
--
ALTER TABLE `oder`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `oder_detail`
--
ALTER TABLE `oder_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `a` (`id_oder`),
  ADD KEY `b` (`id_prd`),
  ADD KEY `c` (`id_nv`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`prd_id`),
  ADD KEY `brand_id` (`brand_id`);

--
-- Chỉ mục cho bảng `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id_nv`);

--
-- Chỉ mục cho bảng `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `image_library`
--
ALTER TABLE `image_library`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=471;

--
-- AUTO_INCREMENT cho bảng `import_bill`
--
ALTER TABLE `import_bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `oder`
--
ALTER TABLE `oder`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT cho bảng `oder_detail`
--
ALTER TABLE `oder_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `prd_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT cho bảng `staff`
--
ALTER TABLE `staff`
  MODIFY `id_nv` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `image_library`
--
ALTER TABLE `image_library`
  ADD CONSTRAINT `image_library_ibfk_1` FOREIGN KEY (`prd_id`) REFERENCES `products` (`prd_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `import_bill`
--
ALTER TABLE `import_bill`
  ADD CONSTRAINT `fk_htk_id_sanpham` FOREIGN KEY (`id_Supplier`) REFERENCES `supplier` (`id`),
  ADD CONSTRAINT `id_Supplier` FOREIGN KEY (`id_Supplier`) REFERENCES `supplier` (`id`),
  ADD CONSTRAINT `prd_id` FOREIGN KEY (`prd_id`) REFERENCES `products` (`prd_id`);

--
-- Các ràng buộc cho bảng `oder_detail`
--
ALTER TABLE `oder_detail`
  ADD CONSTRAINT `a` FOREIGN KEY (`id_oder`) REFERENCES `oder` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `b` FOREIGN KEY (`id_prd`) REFERENCES `products` (`prd_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `c` FOREIGN KEY (`id_nv`) REFERENCES `staff` (`id_nv`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Cơ sở dữ liệu: `web_shop_nga`
--
CREATE DATABASE IF NOT EXISTS `web_shop_nga` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `web_shop_nga`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(5) NOT NULL,
  `brand_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_name`) VALUES
(1, 'Iphone'),
(2, 'SamSung'),
(3, 'Xiaomi');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `image_library`
--

CREATE TABLE `image_library` (
  `id` int(5) NOT NULL,
  `prd_id` int(5) NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `image_library`
--

INSERT INTO `image_library` (`id`, `prd_id`, `image`) VALUES
(62, 1, 'ip11.1.jpg'),
(63, 1, 'ip11.2.jpg'),
(64, 1, 'ip11.3.jpg'),
(65, 1, 'ip11.4.jpg'),
(70, 2, 'ip13prm.1.jpg'),
(71, 2, 'ip13prm.2.jpg'),
(72, 2, 'ip13prm.3.jpg'),
(73, 2, 'ip13prm.4.jpg'),
(74, 3, 'iphone13prmxanhla.1.jpg'),
(75, 3, 'iphone13prmxanhla.2.jpg'),
(76, 3, 'iphone13prmxanhla.3.jpg'),
(77, 4, 'ip13pr.1.jpg'),
(78, 4, 'ip13pr.2.jpg'),
(79, 4, 'ip13pr.3.jpg'),
(80, 4, 'ip13pr.4.jpg'),
(81, 5, 'ip12pr.1.jpg'),
(82, 5, 'ip12pr.2.jpg'),
(83, 5, 'ip12pr.3.jpg'),
(84, 6, 'ip13prxanhla.1.jpg'),
(85, 6, 'ip13prxanhla.2.jpg'),
(86, 6, 'ip13prxanhla.3.jpg'),
(87, 85, ''),
(88, 86, 'ip11.2.jpg'),
(89, 86, 'ip11.3.jpg'),
(90, 86, 'ip11.4.jpg'),
(91, 86, 'ip12pr.1.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oder`
--

CREATE TABLE `oder` (
  `id` int(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `total` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `oder`
--

INSERT INTO `oder` (`id`, `name`, `phone`, `address`, `note`, `total`, `created_time`, `last_updated`) VALUES
(55, 'Hữu Sơn', '0949701834', 'Hà Nội', 'mang tận nơi', '44700000', 1638715528, 1638715528),
(57, 'Quang', '0949701832', 'Hà Nội', '', '100', 0, 0),
(58, 'nhom4', '949701834', 'xã Cư Yên, huyện Lương Sơn, tỉnh Hòa Bình', 'mang tận nơi', '8700000', 1650447786, 1650447786),
(59, 'son', '0949701832', 'xã Cư Yên, huyện Lương Sơn, tỉnh Hòa Bình', 'abc', '17400000', 1650447837, 1650447837),
(60, '3D', '949701834', 'xã Cư Yên, huyện Lương Sơn, tỉnh Hòa Bình', 'abc', '3000', 1650469435, 1650469435),
(61, 'nhom4', '0949701832', 'xã Cư Yên, huyện Lương Sơn, tỉnh Hòa Bình', 'mang tận nơi', '2700', 1650470320, 1650470320),
(62, 'Nguyễn Thành Sơn', '0949701834', 'Hà Nội', 'giao tận nơi', '5200', 1650504654, 1650504654),
(63, 'Nguyễn Văn Quang', '0949701834', 'xã Cư Yên, huyện Lương Sơn, tỉnh Hòa Bình', 'giao tận nơi', '6700', 1650516318, 1650516318),
(64, '2', '0949701834', 'xã Cư Yên, huyện Lương Sơn, tỉnh Hòa Bình', 'giao tận nơi', '7400', 1650533240, 1650533240),
(65, '2', '0949701834', 'xã Cư Yên, huyện Lương Sơn, tỉnh Hòa Bình', 'giao tận nơi', '8100', 1650533299, 1650533299),
(66, 'Nguyễn Văn Quang', '949701834', 'xã Cư Yên, huyện Lương Sơn, tỉnh Hòa Bình', 'abc', '2800', 1650533393, 1650533393),
(67, 'SƠN', '0325478996', 'Hà Nội', 'mang tận nơi', '1500', 1650533490, 1650533490);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oder_detail`
--

CREATE TABLE `oder_detail` (
  `id` int(11) NOT NULL,
  `id_oder` int(10) NOT NULL,
  `id_nv` int(10) NOT NULL,
  `id_prd` int(11) NOT NULL,
  `size` char(5) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(10) NOT NULL,
  `price` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL,
  `address` varchar(500) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `oder_detail`
--

INSERT INTO `oder_detail` (`id`, `id_oder`, `id_nv`, `id_prd`, `size`, `quantity`, `price`, `created_time`, `last_updated`, `address`) VALUES
(78, 55, 3, 1, '', 4, '2900000', 0, 1650447786, 'xã Cư Yên, huyện Lương Sơn, tỉnh Hòa Bình'),
(79, 59, 3, 1, 'S', 6, '2900000', 1650447837, 1650447837, 'xã Cư Yên, huyện Lương Sơn, tỉnh Hòa Bình'),
(80, 60, 3, 2, '', 2, '1500', 1650469435, 1650469435, 'xã Cư Yên, huyện Lương Sơn, tỉnh Hòa Bình'),
(82, 61, 3, 5, '', 1, '2000', 1650470320, 1650470320, 'xã Cư Yên, huyện Lương Sơn, tỉnh Hòa Bình'),
(85, 62, 3, 1, '', 1, '700', 1650504654, 1650504654, 'Hà Nội'),
(86, 62, 3, 2, '', 3, '1500', 1650504654, 1650504654, 'Hà Nội'),
(87, 63, 3, 1, '', 1, '700', 1650516318, 1650516318, 'xã Cư Yên, huyện Lương Sơn, tỉnh Hòa Bình'),
(88, 63, 3, 2, '', 4, '1500', 1650516318, 1650516318, 'xã Cư Yên, huyện Lương Sơn, tỉnh Hòa Bình'),
(89, 64, 3, 1, '', 2, '700', 1650533240, 1650533240, 'xã Cư Yên, huyện Lương Sơn, tỉnh Hòa Bình'),
(90, 64, 3, 2, '', 4, '1500', 1650533240, 1650533240, 'xã Cư Yên, huyện Lương Sơn, tỉnh Hòa Bình'),
(91, 65, 3, 1, '', 3, '700', 1650533299, 1650533299, 'xã Cư Yên, huyện Lương Sơn, tỉnh Hòa Bình'),
(92, 65, 3, 2, '', 4, '1500', 1650533299, 1650533299, 'xã Cư Yên, huyện Lương Sơn, tỉnh Hòa Bình'),
(93, 66, 3, 1, '', 4, '700', 1650533393, 1650533393, 'xã Cư Yên, huyện Lương Sơn, tỉnh Hòa Bình'),
(94, 67, 3, 2, '', 1, '1500', 1650533490, 1650533490, 'Hà Nội');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `prd_id` int(5) NOT NULL,
  `prd_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `price` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(10) NOT NULL,
  `description` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `brand_id` int(5) NOT NULL,
  `sex` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`prd_id`, `prd_name`, `image`, `price`, `quantity`, `description`, `brand_id`, `sex`) VALUES
(1, 'Iphone 11', 'iphon11.jpg', '700', 10, '<p>Apple đã chính thức trình làng bộ 3 siêu phẩm iPhone 11, trong đó phiên bản <a href=\"https://www.topzone.vn/iphone/iphone-11\">iPhone 11 64GB</a> có mức giá rẻ nhất nhưng vẫn được nâng cấp mạnh mẽ như <a href=\"https://www.thegioididong.com/dtdd/iphone-xr-128gb\">iPhone Xr</a>&nbsp;ra mắt&nbsp;trước đó.</p><p>&nbsp;</p>', 1, 0),
(2, 'Iphone13 Pro Max', 'iphone13prm.jpg', '1500', 20, '<p><a href=\"https://w\">Apple. Máy có thiết kế không mấy đột phá khi so với người tiền nhiệm, bên trong đây vẫn là một sản phẩm có màn hình siêu đẹp, tần số quét được nâng cấp lên 120 Hz mượt mà, cảm biến camera có kích thước lớn hơn, cùng hiệu năng mạnh mẽ với sức mạnh đến từ Apple A15 Bionic, sẵn sàng cùng bạn</a></p>', 1, 0),
(3, 'Điện thoại iPhone 13 Pro Max 128GB Xanh lá', 'iphone13prmxanhla.jpg', '1500', 2, '<p>iPhone 13 Pro Max 128GB Xanh lá là một trong những phiên bản mới nhất của dòng điện thoại <a href=\"https://www.thegioididong.com/dtdd/iphone-13\">iPhone 13</a> series được <a href=\"https://www.thegioididong.com/dtdd-apple-iphone\">Apple</a> ra mắt gần đây. Với màu xanh lá cuốn mắt và bộ nhớ trong 128 GB giúp bạn không quá lo lắng về vấn đề dung lượng, camera sắc nét,... sẽ không khiến bạn thất vọng vọng đâu.</p>', 1, 0),
(4, 'Điện thoại iPhone 13 Pro 128GB ', 'ip13pr.jpg', '1560', 6, '<p>form đẹp</p>', 1, 0),
(5, 'Điện thoại iPhone 12 Pro Max 256GB', 'ip12pr.jpg', '2000', 5, '<p>Chiếc điện thoại <a href=\"https://www.thegioididong.com/dtdd/iphone-12-pro-max-256gb\">iPhone 12 Pro Max 256 GB</a> là mẫu smartphone sở hữu nhiều tính năng nổi bật với hệ thống camera chất lượng, hiệu năng vượt trội hay hỗ trợ kết nối 5G hứa hẹn sẽ là mẫu sản phẩm mang lại cảm giác trải nghiệm tối ưu cho người dùng.</p>', 1, 0),
(6, 'Điện thoại iPhone 13 Pro 128GB Xanh lá ', 'ip13prxanhla.jpg', '2000', 2, '<p>hài hòa</p>', 1, 0),
(7, 'A01', 'sp4.webp', '222222', 2, 'đẹp', 1, 0),
(8, 'Váy limited', 'sp7.webp', '2', 2, '323', 2, 0),
(9, '3D Monogram T-Shirt', 'sp5.webp', '2', 2, '2', 1, 0),
(21, 'xiaomi_note_5', 'sp8.webp', '180000', 2, 'rất đẹp', 2, 0),
(22, 'LOUIS VUITTON COAT OF ARMS T-SHIRT', 'sp21.webp', '500000', 3, 'tuyệt', 1, 0),
(23, 'SHOULDER TAB SHIRT', 'sp22.webp', '125000', 3, 'tuyệt', 1, 0),
(25, 'DAMIER AZUR SHIRT', 'sp23.webp', '1666000', 6, 'rất đẹp', 1, 0),
(26, 'LV GLOBE SELF TIE T-SHIRT', 'sp24.webp', '1790000', 9, 'rất đẹp', 1, 0),
(27, '3D MONOGRAM T-SHIRT', 'sp25.webp', '125000', 12, 'đẹp', 1, 0),
(28, 'LV VITESSE T-SHIRT', 'sp26.webp', '1526000', 9, 'rất đẹp', 3, 0),
(29, 'RETRO MONOGRAM T-SHIRT', 'sp27.webp', '810000', 1, 'tuyệt', 3, 0),
(30, 'MIXED MONOGRAM T-SHIRT', 'sp28.webp', '200000', 6, 'đẹp', 3, 0),
(31, 'VUITTAMINS SPORTY JACQUARD KNIT TOP', 'sp29.webp', '200000', 20, 'rất đẹp', 3, 0),
(32, 'VUITTAMINS SHINY T-SHIRT', 'sp30.webp', '250000', 1, 'đẹp', 3, 0),
(33, 'MIXED MONOGRAM MASCULINE SHIRT', 'sp31.webp', '165000', 4, 'rất đẹp', 1, 0),
(34, 'CHAIN PRINT SILK SHIRT', 'sp32.webp', '1800000', 1, 'tuyệt', 3, 0),
(35, 'CHAIN PRINT T-SHIRT', 'sp33.webp', '890', 1, 'tuyệt', 1, 0),
(36, 'SPORTY CUT-OUT T-SHIRT', 'sp34.webp', '250000', 2, 'rất đẹp', 3, 0),
(37, 'WASHED SILK MONOGRAM SHIRT', 'sp35.webp', '178000', 5, 'rất đẹp', 3, 0),
(38, 'PLEATED BIB SHIRT', 'sp36.webp', '123000', 1, 'tuyệt', 3, 0),
(39, 'REVERSE SUNSET MONOGRAM T-SHIRT', 'sp37.webp', '880000', 3, 'đẹp', 3, 0),
(40, 'MONOGRAM OMBRÉ FLOUNCE SLEEVE T-SHIRT', 'sp38.webp', '990000', 3, 'rất đẹp', 1, 0),
(41, 'SUNRISE MONOGRAM T-SHIRT', 'sp39.webp', '880', 1, 'đẹp', 3, 0),
(42, 'BLUE LAGOON MONOGRAM FLOUNCE SLEEVE T-SHIRT', 'sp40.webp', '990000', 7, 'rất đẹp', 3, 0),
(85, 'a', 'logobe.png', '1', 2, '<p>a</p>', 1, 0),
(86, 'a', 'ip11.1.jpg', '5000', 5, '<p>tốt</p>', 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `staff`
--

CREATE TABLE `staff` (
  `id_nv` int(10) NOT NULL,
  `image` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `name_nv` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `date_start_work` date NOT NULL,
  `address` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `phone` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `salary` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `staff`
--

INSERT INTO `staff` (`id_nv`, `image`, `name_nv`, `date_of_birth`, `date_start_work`, `address`, `phone`, `salary`) VALUES
(3, 'sp1.1.webp', 'Nguyễn Thành Sơn', '2001-12-02', '2021-12-07', 'Bắc Từ Liêm, Hà Nội', '09847464', 200000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `name`, `password`) VALUES
(18, '2', '$2y$10$mdd2Sc5fkw93oCurJ4kHgenqeh4wmrMvkBxpf8fO9SngV5bL/DVym'),
(19, '1', '$2y$10$lQNL3PAiSg3NA1TlAvLw4.pXP5flEyJg3DMncaydPYPdulFLz0Dbu'),
(20, 'nhom4', '$2y$10$XWZQFL1MaSIdDEFChD7t1uOeQNur.6yBo8snGYFW8XnApLfFsINRq'),
(21, 'son', '$2y$10$gXZM0mX/E18rXwWQXwoyKOoSy8u9BbutncbW1WJy4x67KHHiSv4SW'),
(22, 'nhomf4', '$2y$10$CYqM8./wNlFbn4lCfUA52eXKe2aGlxZYJxGZ3HdK06V/3CPLySvdW'),
(23, 'nhomhunre', '$2y$10$zCT4pGt7mejifamUQcs2IeIIuim2102pUxK5sro87Euv7njkp9sky'),
(24, 'sondeptrai', '$2y$10$VN9W7YK15kULKjQV3hcVTO2I4ORWsO8hEuRTF9Xr3kkXJN39xz0nK'),
(25, 'sonxoan2001', '$2y$10$m2SZDeoz5c/pPpUCr/z28.enwvFwJNxIjP3rnZiKK108jqMLN1hga'),
(26, 'quangngu', '$2y$10$q.MCPT121jSwcdj86CUTBOqMRnvt9WPcsDnjl/esGIr01yFP0KCau');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Chỉ mục cho bảng `image_library`
--
ALTER TABLE `image_library`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prd_id` (`prd_id`);

--
-- Chỉ mục cho bảng `oder`
--
ALTER TABLE `oder`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `oder_detail`
--
ALTER TABLE `oder_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `a` (`id_oder`),
  ADD KEY `b` (`id_prd`),
  ADD KEY `c` (`id_nv`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`prd_id`),
  ADD KEY `brand_id` (`brand_id`);

--
-- Chỉ mục cho bảng `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id_nv`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `image_library`
--
ALTER TABLE `image_library`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT cho bảng `oder`
--
ALTER TABLE `oder`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT cho bảng `oder_detail`
--
ALTER TABLE `oder_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `prd_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT cho bảng `staff`
--
ALTER TABLE `staff`
  MODIFY `id_nv` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `image_library`
--
ALTER TABLE `image_library`
  ADD CONSTRAINT `image_library_ibfk_1` FOREIGN KEY (`prd_id`) REFERENCES `products` (`prd_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `oder_detail`
--
ALTER TABLE `oder_detail`
  ADD CONSTRAINT `a` FOREIGN KEY (`id_oder`) REFERENCES `oder` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `b` FOREIGN KEY (`id_prd`) REFERENCES `products` (`prd_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `c` FOREIGN KEY (`id_nv`) REFERENCES `staff` (`id_nv`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
