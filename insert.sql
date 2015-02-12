--
-- Dumping data for table `Privacy`
--

INSERT INTO `Privacy` (`privacy_type`, `privacy_id`) VALUES
('Only me', 0),
('Friends', 1),
('Friends of friends', 2),
('Public', 3);
--
-- Dumping data for table `Country`
--

INSERT INTO `Country` (`country_id`, `country`) VALUES
(1, 'AFGHANISTAN'),
(2, 'ALBANIA'),
(3, 'ALGERIA'),
(4, 'AMERICAN SAMOA'),
(5, 'ANDORRA'),
(6, 'ANGOLA'),
(7, 'ANGUILLA'),
(8, 'ANTARCTICA'),
(9, 'ANTIGUA AND BARBUDA'),
(10, 'ARGENTINA'),
(11, 'ARMENIA'),
(12, 'ARUBA'),
(13, 'AUSTRALIA'),
(14, 'AUSTRIA'),
(15, 'AZERBAIJAN'),
(16, 'BAHAMAS'),
(17, 'BAHRAIN'),
(18, 'BANGLADESH'),
(19, 'BARBADOS'),
(20, 'BELARUS'),
(21, 'BELGIUM'),
(22, 'BELIZE'),
(23, 'BENIN'),
(24, 'BERMUDA'),
(25, 'BHUTAN'),
(26, 'BOLIVIA'),
(28, 'BOTSWANA'),
(29, 'BOUVET ISLAND'),
(30, 'Brazil'),
(33, 'BULGARIA'),
(34, 'BURKINA FASO'),
(35, 'BURUNDI'),
(36, 'CAMBODIA'),
(37, 'CAMEROON'),
(38, 'CANADA'),
(39, 'CAPE VERDE'),
(40, 'CAYMAN ISLANDS'),
(42, 'CHAD'),
(43, 'CHILE'),
(44, 'CHINA'),
(45, 'CHRISTMAS ISLAND'),
(46, 'COCOS ISLANDS'),
(47, 'COLOMBIA'),
(48, 'COMOROS'),
(49, 'CONGO'),
(50, 'CONGO'),
(51, 'COOK ISLANDS'),
(52, 'COSTA RICA'),
(62, 'ECUADOR'),
(63, 'EGYPT'),
(72, 'Finland'),
(73, 'France'),
(96, 'Hong Kong'),
(97, 'Hungary'),
(98, 'Iceland'),
(99, 'India'),
(100, 'INDONESIA'),
(101, ' ISLAMIC REPUBLIC OF'),
(102, 'IRAQ'),
(107, 'JAPAN'),
(119, 'LESOTHO'),
(120, 'LIBERIA'),
(194, 'SLOVENIA'),
(196, 'SOMALIA'),
(197, 'SOUTH AFRICA'),
(199, 'SPAIN'),
(205, 'SWEDEN'),
(211, 'THAILAND'),
(215, 'TONGA'),
(216, 'TRINIDAD AND TOBAGO'),
(217, 'TUNISIA'),
(218, 'TURKEY'),
(219, 'TURKMENISTAN'),
(220, 'TURKS AND CAICOS ISLANDS'),
(221, 'TUVALU'),
(222, 'UGANDA'),
(223, 'UKRAINE'),
(224, 'UNITED ARAB EMIRATES'),
(225, 'UNITED KINGDOM'),
(226, 'UNITED STATES'),
(235, 'WALLIS AND FUTUNA'),
(236, 'WESTERN SAHARA'),
(237, 'YEMEN'),
(238, 'ZAMBIA'),
(239, 'ZIMBABWE');
--
-- Dumping data for table `City`
--

INSERT INTO `City` (`city_id`, `country_id`, `city`) VALUES
(1, 100, 'Jakarta'),
(6, 218, 'Ankara'),
(9, 218, 'Nazilli'),
(20, 218, 'Denizli'),
(34, 218, 'istanbul'),
(35, 218, 'Izmir');
--
-- Dumping data for table `Organizations`
--

INSERT INTO `Organizations` (`organization_id`, `organization_name`, `organization_description`, `other_detail`) VALUES
(1, 'Kurultay', 'Uylerimizin gelmelerini isteriz', ''),
(2, 'Yilbasi Partisi', 'Tum is Arkadaslarimizi Beklemekteyiz', ''),
(3, 'Maclis Toplantisi', 'Uylerimizin gelmelerini isteriz', ''),
(4, 'Is Toplantsi', 'Tum is Arkadaslarimizi Beklemekteyiz', ''),
(5, 'Klup Toplantisi', 'Uylerimizin gelmelerini isteriz', ''),
(99, 'TUBITAk', 'Turkey Research Center', NULL),
(100, 'Ege University', 'Ege university', NULL);

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`user_id`, `username`, `password`, `name_first`, `name_middle`, `name_last`, `gender`, `date_of_birth`, `email_address`, `picture`, `active`, `curent_organization_id`, `date_joined`, `other_details`, `Friend_number`) VALUES
(1, 'okan', '1234', 'okan', 'kaya', 'kaya', 'Male', '1993-01-14', 'okan93kaya@gmail.com', NULL, 1, 100, '2014-12-22 16:32:13', NULL, 0),
(2, 'Jason', '1234', 'Jason', NULL, 'Martin', 'Male', '1992-11-04', 'jm@hotmail.com', NULL, 1, 100, '2014-12-22 17:06:28', NULL, 0),
(3, 'ADAMS', '1234', 'ADAMS', '', 'CLERK', 'Male', '1991-01-14', 'www.example.com', '', 1, 100, '2014-12-22 17:03:17', NULL, 0),
(4, 'Kaya4', 'jkl', 'Okan', NULL, 'Kaya', 'Male', '1993-02-02', 'ok35@hoymail.com', NULL, 3, 4, '2014-12-22 19:34:34', NULL, 0),
(5, 'Fb5', 'mnp', 'Merve', NULL, 'Boz', 'Female', '1993-01-01', 'mb35@hotmail.com', NULL, 3, 5, '2014-12-22 19:35:41', NULL, 0);
--
-- Dumping data for table `People_beeing_followed`
--

INSERT INTO `People_beeing_followed` (`user_id`, `member_beeing_followed_id`, `date_started_following`, `date_stoped_following`, `other_details`) VALUES
(1, 2, '2014-12-23 10:04:22', '0000-00-00 00:00:00', NULL),
(2, 3, '2014-12-23 10:04:32', '0000-00-00 00:00:00', NULL);

--
-- Dumping data for table `Profile`
--

INSERT INTO `Profile` (`profile_id`, `user_id`,`numberOfFriends`, `privacy`, `rating`, `about_me`, `relationship`, `looking_for`, `phone`, `interests`, `education`, `hobbies`, `fav_movies`, `fav_artists`, `fav_books`, `fav_animals`, `religion`, `everithing_else`, `date_created`, `date_last_updated`) VALUES
(1, 1,0, 1, NULL, NULL, NULL, 'Women', '00800900', 'Computer', 'Computer Engineering', 'Browsing', '3 idiots', 'bradpit', 'digital foltras', 'chicken', 'Islam', NULL, '2014-12-21 22:00:00', '2014-12-21 22:00:00'),
(2, 2,0, 1, NULL, NULL, NULL, 'women', '00800900', 'computer', 'Chemistry', 'reading', 'my name is khan', 'jet li', NULL, 'rabbit', 'Islam', NULL, '2014-12-21 22:00:00', '2014-12-21 22:00:00'),
(3, 3,0, 1, NULL, 'I am jenius', NULL, 'women', '00800900', 'bicycling', 'biology', 'diving', 'how to train your dragon', NULL, NULL, 'rabbit', 'Islam', NULL, '2014-12-15 22:00:00', '2014-12-15 22:00:00');

--
-- Dumping data for table `Address`
--

INSERT INTO `Address` (`address_id`, `address`, `zip_or_postcode`, `other_details`, `privacy`, `city_id`, `profile_id`, `county`) VALUES
(1, 'Yunus Emre Mah. 6444 Sok. No:3', 68121, NULL, 1, 35, 1, 'Bornova'),
(2, 'Altintop Mah. Lise Cad. No:2', 1235, NULL, 1, 34, 2, 'Çankaya'),
(3, 'Ataturk Mah. 2. Cad. No:5', 68212, NULL, 1, 35, 3, 'Alt?nda?');

--
-- Dumping data for table `Bookmark_category`
--

INSERT INTO `Bookmark_category` (`bookmark_category_id`, `name`) VALUES
(1, 'E kategorisi'),
(2, 'D kategorisi'),
(3, 'C kategorisi'),
(4, 'B kategorisi'),
(5, 'A kategorisi');

--
-- Dumping data for table `Feed_category`
--

INSERT INTO `Feed_category` (`feed_category_id`, `name`) VALUES
(1, 'X'),
(2, 'Y'),
(3, 'Z'),
(4, 'Q'),
(5, 'W');

--
-- Dumping data for table `Language`
--

INSERT INTO `Language` (`language_id`, `lang`, `user_id`) VALUES
(1, 'ingilizce', 1),
(2, 'almanca', 1),
(3, 'ingilizce', 2),
(4, 'fransizca', 1),
(5, 'latince', 4),
(6, 'fransizca', 5);
--
-- Dumping data for table `Notification`
--

INSERT INTO `Notification` (`notification_id`, `msg`, `type`, `created_at`, `user_id`) VALUES
(1, '?mza gunu etkinligi Olusturuldu!', 1, '2012-11-30 22:00:00', 1),
(2, 'okan senin bagtini begendi!', 2, '2012-11-02 22:00:00', 2),
(3, 'Jason seni bir gonderide etiketledi!', 2, '2013-01-03 22:00:00', 3),
(4, 'ADAMS yeni bir kitap önerdi!', 1, '2012-02-13 22:00:00', 4),
(5, ' yeni bir oyun istegi gönderdi!', 1, '2012-01-24 22:00:00', 5);


--
-- Dumping data for table `Status`
--

INSERT INTO `Status` (`status_id`, `message`, `created_at`, `thumbs_up`, `thumbs_down`, `privacy`, `is_reply`, `to_fb`, `to_twitter`, `user_id`) VALUES
(1, 'Keyifli', '2014-11-30 22:00:00', 1000, 1005, 1, 1, 1, 1, 1),
(2, 'Mutlu', '2014-12-01 22:00:00', 1001, 1006, 2, 0, 0, 1, 2),
(3, 'Uzgun', '2014-12-02 22:00:00', 1002, 1007, 3, 1, 0, 0, 3),
(4, 'KÄ±zgÄ±n', '2014-12-03 22:00:00', 1003, 1008, 3, 0, 0, 0, 4),
(5, 'Aglamis', '2014-12-04 22:00:00', 1004, 1009, 4, 1, 0, 1, 5);
--
-- Dumping data for table `Cvs`
--

INSERT INTO `Cvs` (`cv_id`, `user_id`, `date_created`, `date_uploaded`) VALUES
(1, 1, '2013-05-10 21:00:00', '2014-10-09 21:00:00'),
(2, 5, '2013-06-18 21:00:00', '2014-05-09 21:00:00'),
(3, 4, '2013-06-14 21:00:00', '2014-07-10 21:00:00'),
(4, 2, '2013-04-20 21:00:00', '2014-04-10 21:00:00'),
(5, 3, '2013-07-12 21:00:00', '2014-08-10 21:00:00');
--
-- Dumping data for table `Cv_sections`
--

INSERT INTO `Cv_sections` (`cv_section_id`, `cv_section_title`, `cv_section_description`, `cv_id`) VALUES
(1, 'adres bilgisi iÃ§erir', '1031 sokak 11 blok no 3 daire 30', 1),
(2, 'Tez bilgileri', 'Hastane otomasyonu', 2),
(3, 'Oduller', 'Tubitak ', 3),
(4, 'Ilgi alani', 'c#', 4),
(5, 'Yabanci dil', 'ingilizce,almanca', 5);

--
-- Dumping data for table `Friend`
--

INSERT INTO `Friend` (`friend_id`, `friend_user_id`, `privacy`, `created_at`, `user_id`) VALUES
(1, 2, 1,  '2008-12-31 22:00:00', 1);
--
-- Dumping data for table `Bookmark`
--

INSERT INTO `Bookmark` (`bookmark_id`, `url`, `clicks`, `rating`, `privacy`, `created_at`, `bookmark_category_id`, `user_id`) VALUES
(3030, 'https://www.facebook.com/a.b.1', 555, 657, 1, '2014-02-12 22:00:00', 1, 1),
(4877, 'https://www.facebook.com/a.e.2', 687, 987, 1, '2014-02-12 22:00:00', 2, 2),
(7899, 'https://www.facebook.com/z.s.12', 854, 544, 1, '2014-03-31 21:00:00', 3, 3),
(8710, 'https://www.facebook.com/s.z.15', 999, 100, 1, '2014-08-11 21:00:00', 4, 3),
(9999, 'https://www.facebook.com/l.m.5', 541, 200, 1, '2013-12-11 22:00:00', 5, 1);
--
-- Dumping data for table `Feed`
--

INSERT INTO `Feed` (`feed_id`, `user_id`, `feed_category_id`, `privacy`, `clicks`, `rating`, `feed_url`, `created_at`) VALUES
(1, 1, 1, 1, 6, 10, 'http://exampleblogcu.blogspot.com/ab.xml', '2013-08-19 21:00:00'),
(2, 2, 2, 2, 2, 15, 'http://asdblogcu.blogspot.com/ds.xml', '2013-08-20 21:00:00'),
(3, 3, 3, 1, 5, 41, 'http://awsblogcu.blogspot.com/es.xml', '2013-08-21 21:00:00'),
(4, 4, 4, 2, 7, 5, 'http://sssblogcu.blogspot.com/ss.xml', '2013-08-22 21:00:00'),
(5, 5, 5, 3, 3, 6, 'http://bbablogcu.blogspot.com/as.xml', '2013-08-23 21:00:00');
--
-- Dumping data for table `Profile_sections`
--

INSERT INTO `Profile_sections` (`profile_id`, `profile_section_title`, `profile_section_text`, `date_updated`, `date_created`) VALUES
(1, 'Courses', 'English course', '0000-00-00 00:00:00', '2013-12-23 10:05:30');
--
-- Dumping data for table `Recomendations`
--

INSERT INTO `Recomendations` (`member_recomending_id`, `member_being_recomended_id`, `date_of_recomendations`, `other_details`) VALUES
(1, 2, '2014-12-23 10:05:55', NULL);

--
-- Dumping data for table `Ref_marital_status`
--

INSERT INTO `Ref_marital_status` (`marital_status_description`, `user_id`) VALUES
('Single', 1),
('Married', 2),
('Separated', 3),
('Separated', 4),
('Married', 5);

--
-- Dumping data for table `Groups`
--

INSERT INTO `Groups` (`group_id`, `created_by_user_id`,`numberOfgroups`, `group_name`, `group_description`, `group_date_started`, `group_date_ended`, `group_date_last_activity`, `other_details`) VALUES
(1, 1,0,'Kitap Serverler', 'Roman severler buraya!', '2015-01-13 22:00:00', '2012-01-13 22:00:00', '2014-01-13 22:00:00', 'Acik'),
(2, 2,0, 'Bilgisayarcilar', 'Bilgisayar okuyanlar', '2012-01-13 22:00:00', '2014-01-13 22:00:00', '2014-01-13 22:00:00', 'kapali'),
(3, 3,0, 'Elektirikciler', 'Elektirik Elektronik Okuyanlar', '2015-01-13 22:00:00', '2013-01-13 22:00:00', '2014-01-13 22:00:00', 'Acik'),
(4, 1,0, 'Hayvan Serverler', 'Hayvan severler buraya!', '2015-01-13 22:00:00', '2012-01-13 22:00:00', '2014-09-13 21:00:00', 'kapali'),
(5, 2,0, ' Yeni Filmler ', 'Vizyona giren filimler buraya!', '2015-01-13 22:00:00', '2012-01-13 22:00:00', '2014-10-13 21:00:00', 'Acik');


--
-- Dumping data for table `User_groups`
--

INSERT INTO `User_groups` (`user_id`, `group_id`, `date_joined`, `date_left`) VALUES
(1, 1, '2012-01-13 22:00:00', '2014-01-13 22:00:00'),
(2, 2, '2012-01-13 22:00:00', '2014-01-13 22:00:00'),
(3, 2, '2012-01-14 22:00:00', '2013-02-13 22:00:00'),
(4, 2, '2012-01-14 22:00:00', '2013-03-13 22:00:00'),
(5, 1, '2013-01-13 22:00:00', '2014-01-13 22:00:00');
--
-- Dumping data for table `Blog`
--

INSERT INTO `Blog` (`blog_id`, `message`, `author`, `user_id`, `created_at`) VALUES
(1, 'My Note', 'www.example.com', 1, 'august 2014'),
(2, 'My Works', 'John', 2, 'september 2014');



--
-- Dumping data for table `Chat`
--

INSERT INTO `Chat` (`chat_id`, `user_id`, `msg`, `created_at`, `to`) VALUES
(1, 1, 'halo', '2014-12-23 09:55:49', 2),
(3, 1, 'hey', '2014-12-23 09:48:22', 2);







--
-- Dumping data for table `Message`
--

INSERT INTO `Message` (`message_id`, `message`, `created_at`, `is_read`, `is_spam`, `to`, `isreply`, `user_id`) VALUES
(1, 'Try sending message', '2014-12-23 11:02:27', 0, 0, 1, 0, 2);


--
-- Dumping data for table `Online`
--

INSERT INTO `Online` (`Online_status`, `Last_online`, `Last_offline`, `user_id`) VALUES
('Online', '2014-12-01 00:00:00', '2014-12-03 00:00:00', 1),
('Online', '2014-12-23 00:00:00', '2014-12-22 00:00:00', 2);
