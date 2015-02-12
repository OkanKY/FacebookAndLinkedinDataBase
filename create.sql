
--
-- Database: `TestDb`
--

-- --------------------------------------------------------

--
-- Table structure for table `Address`
--

CREATE TABLE IF NOT EXISTS `Address` (
  `address_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `address` varchar(45) DEFAULT NULL,
  `zip_or_postcode` mediumint(8) DEFAULT NULL,
  `other_details` varchar(45) DEFAULT NULL,
  `privacy` tinyint(3) DEFAULT NULL,
  `city_id` mediumint(8) DEFAULT NULL,
  `profile_id` bigint(8) DEFAULT NULL,
  `county` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  KEY `city_id` (`city_id`),
  KEY `profile_id` (`profile_id`),
  KEY `Address_ibfk_3` (`privacy`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;



-- --------------------------------------------------------

--
-- Table structure for table `Blog`
--

CREATE TABLE IF NOT EXISTS `Blog` (
  `blog_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `message` varchar(45) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `user_id` mediumint(8) DEFAULT NULL,
  `created_at` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`blog_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;


-- --------------------------------------------------------

--
-- Table structure for table `Bookmark`
--

CREATE TABLE IF NOT EXISTS `Bookmark` (
  `bookmark_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `clicks` smallint(5) NOT NULL,
  `rating` smallint(5) DEFAULT NULL,
  `privacy` tinyint(3) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `bookmark_category_id` smallint(5) DEFAULT NULL,
  `user_id` mediumint(8) NOT NULL,
  PRIMARY KEY (`bookmark_id`,`user_id`),
  KEY `bookmark_category_id` (`bookmark_category_id`),
  KEY `user_id` (`user_id`),
  KEY `Bookmark_ibfk_3` (`privacy`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10000 ;



-- --------------------------------------------------------

--
-- Table structure for table `Bookmark_category`
--

CREATE TABLE IF NOT EXISTS `Bookmark_category` (
  `bookmark_category_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`bookmark_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `Chat`
--

CREATE TABLE IF NOT EXISTS `Chat` (
  `chat_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) DEFAULT NULL,
  `msg` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `to` mediumint(8) DEFAULT NULL,
  PRIMARY KEY (`chat_id`),
  KEY `user_id` (`user_id`),
  KEY `Chat_ibfk_2` (`to`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;


--
-- Triggers `Chat`
--
DROP TRIGGER IF EXISTS `before_selfchat`;
DELIMITER //
CREATE TRIGGER `before_selfchat` BEFORE INSERT ON `Chat`
 FOR EACH ROW BEGIN
          IF NEW.user_id=New.`to` 
          THEN
               SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Cannot send chat to yourself';
          END IF;
     END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `update_selfchat`;
DELIMITER //
CREATE TRIGGER `update_selfchat` BEFORE UPDATE ON `Chat`
 FOR EACH ROW BEGIN
          IF NEW.user_id=New.`to` 
          THEN
               SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Cannot send chat to yourself';
          END IF;
     END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `City`
--

CREATE TABLE IF NOT EXISTS `City` (
  `city_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `country_id` mediumint(8) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`city_id`),
  KEY `country_id` (`country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=36 ;


-- --------------------------------------------------------

--
-- Table structure for table `Coment`
--

CREATE TABLE IF NOT EXISTS `Coment` (
  `coment_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) DEFAULT NULL,
  `created_id` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status_id` mediumint(8) DEFAULT NULL,
  `friend_id` mediumint(8) DEFAULT NULL,
  `user_id` mediumint(8) NOT NULL,
  PRIMARY KEY (`coment_id`),
  KEY `status_id` (`status_id`),
  KEY `friend_id` (`friend_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Connections`
--

CREATE TABLE IF NOT EXISTS `Connections` (
  `connection_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `connection_user_id` mediumint(8) DEFAULT NULL,
  `user_id` mediumint(8) DEFAULT NULL,
  `date_connection_made` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`connection_id`),
  KEY `connection_user_id` (`connection_user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Country`
--

CREATE TABLE IF NOT EXISTS `Country` (
  `country_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `country` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=240 ;


-- --------------------------------------------------------

--
-- Table structure for table `Cvs`
--

CREATE TABLE IF NOT EXISTS `Cvs` (
  `cv_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_uploaded` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`cv_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;


-- --------------------------------------------------------

--
-- Table structure for table `Cv_sections`
--

CREATE TABLE IF NOT EXISTS `Cv_sections` (
  `cv_section_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `cv_section_title` varchar(255) DEFAULT NULL,
  `cv_section_description` varchar(255) NOT NULL,
  `cv_id` mediumint(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cv_section_id`,`cv_id`),
  KEY `cv_id` (`cv_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;


-- --------------------------------------------------------

--
-- Table structure for table `Feed`
--

CREATE TABLE IF NOT EXISTS `Feed` (
  `feed_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) NOT NULL,
  `feed_category_id` smallint(5) DEFAULT NULL,
  `privacy` tinyint(3) DEFAULT NULL,
  `clicks` smallint(5) NOT NULL,
  `rating` smallint(5) DEFAULT NULL,
  `feed_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`feed_id`),
  KEY `feed_category_id` (`feed_category_id`),
  KEY `user_id` (`user_id`),
  KEY `Feed_ibfk_3` (`privacy`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;


-- --------------------------------------------------------

--
-- Table structure for table `Feed_category`
--

CREATE TABLE IF NOT EXISTS `Feed_category` (
  `feed_category_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`feed_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;



-- --------------------------------------------------------

--
-- Table structure for table `Friend`
--

CREATE TABLE IF NOT EXISTS `Friend` (
  `friend_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `friend_user_id` mediumint(8) DEFAULT NULL,
  `privacy` tinyint(3) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` mediumint(8) DEFAULT NULL,
  PRIMARY KEY (`friend_id`),
  KEY `user_id` (`user_id`),
  KEY `Friend_ibfk_3` (`friend_user_id`),
  KEY `Friend_ibfk_2` (`privacy`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;




--
-- 2Triggers `Friend_list`
--
DROP TRIGGER IF EXISTS `FRIEND NUMBER INCREMENT`;
DELIMITER //
CREATE TRIGGER `FRIEND NUMBER INCREMENT` BEFORE INSERT ON `Friend`
 FOR EACH ROW BEGIN
	UPDATE Profile SET Profile.numberOfFriends = Profile.numberOfFriends +1 
    WHERE Profile.user_id =(select NEW.friend_user_id );
	UPDATE Profile SET Profile.numberOfFriends = numberOfFriends +1  WHERE Profile.user_id =NEW.user_id;
 END

//
DELIMITER ;
DROP TRIGGER IF EXISTS `FRIEND NUMBER DECREMENT`;
DELIMITER //
CREATE TRIGGER `FRIEND NUMBER DECREMENT` BEFORE DELETE ON `Friend`
 FOR EACH ROW BEGIN
	UPDATE Profile SET Profile.numberOfFriends = Profile.numberOfFriends -1 
    WHERE Profile.user_id =(select OLD.friend_user_id );
	UPDATE Profile SET Profile.numberOfFriends = numberOfFriends -1  WHERE Profile.user_id =OLD.user_id;
     END
//
DELIMITER ;
--
-- Triggers `Friend`
--
/*
DROP TRIGGER IF EXISTS `addingfriend`;
DELIMITER //
CREATE TRIGGER `addingfriend` BEFORE INSERT ON `Friend`
 FOR EACH ROW begin
declare checks int default 0;
select count(*) into checks from Friend 
where ((New.user_id= Friend.friend_user_id) and 
       (New.friend_user_id=Friend.user_id));
if (checks >0) then 
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'You are already friend';
else if (checks=0) then 
SET NEW.Friend_number=NEW.Friend_number+1;
UPDATE User SET Friend_number=Friend_number+1 WHERE user_id = NEW.friend_user_id;
END IF;
end if;
end
//
DELIMITER ;
*/
-- --------------------------------------------------------

--
-- Table structure for table `Groups`
--

CREATE TABLE IF NOT EXISTS `Groups` (
  `group_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `created_by_user_id` mediumint(8) DEFAULT NULL,
  `numberOfgroups` tinyint(3) NOT NULL DEFAULT '0',
  `group_name` varchar(45) DEFAULT NULL,
  `group_description` varchar(255) DEFAULT NULL,
  `group_date_started` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `group_date_ended` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `group_date_last_activity` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `other_details` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`group_id`),
  KEY `created_by_user_id` (`created_by_user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;


--
-- Triggers `Groups`
--
DROP TRIGGER IF EXISTS `GROUP DELETE`;
DELIMITER //
CREATE TRIGGER `GROUP DELETE` AFTER DELETE ON `Groups`
 FOR EACH ROW BEGIN

	DELETE FROM User_groups WHERE User_groups.group_id=Groups.group_id;	
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Language`
--

CREATE TABLE IF NOT EXISTS `Language` (
  `language_id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `lang` varchar(45) DEFAULT NULL,
  `user_id` mediumint(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`language_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Table structure for table `Message`
--

CREATE TABLE IF NOT EXISTS `Message` (
  `message_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `message` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_read` tinyint(1) DEFAULT NULL,
  `is_spam` tinyint(1) DEFAULT NULL,
  `to` mediumint(8) DEFAULT NULL,
  `isreply` tinyint(1) DEFAULT NULL,
  `user_id` mediumint(8) DEFAULT NULL,
  PRIMARY KEY (`message_id`),
  KEY `user_id` (`user_id`),
  KEY `Message_ibfk_2` (`to`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;


--
-- Triggers `Message`
--
DROP TRIGGER IF EXISTS `before_selfmessage`;
DELIMITER //
CREATE TRIGGER `before_selfmessage` BEFORE INSERT ON `Message`
 FOR EACH ROW BEGIN
          IF NEW.user_id=New.`to` 
          THEN
               SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Cannot send message to yourself';
          END IF;
     END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `update_selfMessage`;
DELIMITER //
CREATE TRIGGER `update_selfMessage` BEFORE UPDATE ON `Message`
 FOR EACH ROW BEGIN
          IF NEW.user_id=New.`to` 
          THEN
               SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Cannot send message to yourself';
          END IF;
     END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Notification`
--

CREATE TABLE IF NOT EXISTS `Notification` (
  `notification_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `msg` varchar(255) DEFAULT NULL,
  `type` smallint(5) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` mediumint(8) DEFAULT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `Online`
--

CREATE TABLE IF NOT EXISTS `Online` (
  `Online_status` enum('Online','Offline') NOT NULL,
  `Last_online` datetime NOT NULL,
  `Last_offline` datetime NOT NULL,
  `user_id` mediumint(8) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- --------------------------------------------------------

--
-- Table structure for table `Organizations`
--

CREATE TABLE IF NOT EXISTS `Organizations` (
  `organization_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `organization_name` varchar(45) DEFAULT NULL,
  `organization_description` varchar(255) DEFAULT NULL,
  `other_detail` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`organization_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=101 ;



-- --------------------------------------------------------

--
-- Table structure for table `People_beeing_followed`
--

CREATE TABLE IF NOT EXISTS `People_beeing_followed` (
  `user_id` mediumint(8) NOT NULL DEFAULT '0',
  `member_beeing_followed_id` mediumint(8) NOT NULL DEFAULT '0',
  `date_started_following` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_stoped_following` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `other_details` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`member_beeing_followed_id`,`date_started_following`),
  KEY `member_beeing_followed_id` (`member_beeing_followed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Table structure for table `Privacy`
--

CREATE TABLE IF NOT EXISTS `Privacy` (
  `privacy_type` varchar(45) DEFAULT NULL,
  `privacy_id` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`privacy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Table structure for table `Profile`
--

CREATE TABLE IF NOT EXISTS `Profile` (
  `profile_id` bigint(8) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) DEFAULT NULL,
  `numberOfFriends` tinyint(3) NOT NULL DEFAULT '0',
  `privacy` tinyint(3) DEFAULT NULL,
  `rating` tinyint(3) DEFAULT NULL,
  `about_me` varchar(160) DEFAULT NULL,
  `relationship` varchar(45) DEFAULT NULL,
  `looking_for` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `interests` varchar(255) DEFAULT NULL,
  `education` varchar(255) DEFAULT NULL,
  `hobbies` varchar(255) DEFAULT NULL,
  `fav_movies` varchar(255) DEFAULT NULL,
  `fav_artists` varchar(255) DEFAULT NULL,
  `fav_books` varchar(255) DEFAULT NULL,
  `fav_animals` varchar(255) DEFAULT NULL,
  `religion` enum('Islam','Christianity','Other') DEFAULT NULL,
  `everithing_else` varchar(255) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_last_updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`profile_id`),
  KEY `user_id` (`user_id`),
  KEY `Profile_ibfk_2` (`privacy`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;


-- --------------------------------------------------------

--
-- Table structure for table `Profile_sections`
--

CREATE TABLE IF NOT EXISTS `Profile_sections` (
  `profile_id` bigint(8) NOT NULL,
  `profile_section_title` enum('Name','Headline','Location','Industry','Photo','Contact Info','Summary','Experience','Education','Recommendations','Certifications','Courses','Honors & Awards','Languages','Organizations','Patents','Publications','Skills & Endorsements','Test Scores','Volunteer Experience & Causes','Additional Information') NOT NULL,
  `profile_section_text` varchar(255) DEFAULT NULL,
  `date_updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`profile_section_title`,`profile_id`),
  KEY `profile_id` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Table structure for table `Recomendations`
--

CREATE TABLE IF NOT EXISTS `Recomendations` (
  `member_recomending_id` mediumint(8) NOT NULL DEFAULT '0',
  `member_being_recomended_id` mediumint(8) NOT NULL DEFAULT '0',
  `date_of_recomendations` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `other_details` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`member_recomending_id`,`member_being_recomended_id`),
  KEY `member_being_recomended_id` (`member_being_recomended_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Table structure for table `Ref_marital_status`
--

CREATE TABLE IF NOT EXISTS `Ref_marital_status` (
  `marital_status_description` enum('Single','Married','Separated') NOT NULL DEFAULT 'Single',
  `user_id` mediumint(8) NOT NULL,
  PRIMARY KEY (`marital_status_description`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Table structure for table `Status`
--

CREATE TABLE IF NOT EXISTS `Status` (
  `status_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `thumbs_up` smallint(5) DEFAULT NULL,
  `thumbs_down` smallint(5) DEFAULT NULL,
  `privacy` tinyint(3) DEFAULT NULL,
  `is_reply` tinyint(1) DEFAULT NULL,
  `to_fb` tinyint(1) DEFAULT NULL,
  `to_twitter` tinyint(1) DEFAULT NULL,
  `user_id` mediumint(8) DEFAULT NULL,
  PRIMARY KEY (`status_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;


-- --------------------------------------------------------

--
-- Table structure for table `Thumb_up_down`
--

CREATE TABLE IF NOT EXISTS `Thumb_up_down` (
  `thumb_up_down_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `flag` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status_id` mediumint(8) DEFAULT NULL,
  `friend_id` mediumint(8) DEFAULT NULL,
  PRIMARY KEY (`thumb_up_down_id`),
  KEY `status_id` (`status_id`),
  KEY `friend_id` (`friend_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE IF NOT EXISTS `User` (
  `user_id` mediumint(8) NOT NULL DEFAULT '0',
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `name_first` varchar(45) DEFAULT NULL,
  `name_middle` varchar(45) DEFAULT NULL,
  `name_last` varchar(45) DEFAULT NULL,
  `gender` enum('Male','Female') DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email_address` varchar(45) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `curent_organization_id` mediumint(8) DEFAULT NULL,
  `date_joined` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `other_details` varchar(45) DEFAULT NULL,
  `Friend_number` tinyint(4) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `curent_organization_id` (`curent_organization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Triggers `User`
--
DROP TRIGGER IF EXISTS `AUTOMATIC USER' S JOIN DATE`;
DELIMITER //
CREATE TRIGGER `AUTOMATIC USER' S JOIN DATE` BEFORE INSERT ON `User`
 FOR EACH ROW SET NEW.date_joined= NOW()
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `User_groups`
--

CREATE TABLE IF NOT EXISTS `User_groups` (
  `user_id` mediumint(8) NOT NULL DEFAULT '0',
  `group_id` mediumint(8) NOT NULL DEFAULT '0',
  `date_joined` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_left` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TRIGGER IF EXISTS `Group_number`;
DELIMITER //
 CREATE TRIGGER `Group_number`
 AFTER INSERT ON User_groups 
 FOR EACH ROW 
	UPDATE Groups SET Groups.numberOfgroups = Groups.numberOfgroups +1 
    WHERE Groups.group_id = (select NEW.group_id);
 //
 DELIMITER ;
 
 DROP TRIGGER IF EXISTS `Group_number_delete`;
 DELIMITER //
 CREATE TRIGGER `Group_number_delete`
AFTER DELETE ON User_groups 
 FOR EACH ROW 
	UPDATE Groups SET Groups.numberOfgroups = Groups.numberOfgroups -1 
    WHERE Groups.group_id = (select OLD.group_id);
 //
 DELIMITER ;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Address`
--
ALTER TABLE `Address`
  ADD CONSTRAINT `Address_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `City` (`city_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Address_ibfk_2` FOREIGN KEY (`profile_id`) REFERENCES `Profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Address_ibfk_3` FOREIGN KEY (`privacy`) REFERENCES `Privacy` (`privacy_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Blog`
--
ALTER TABLE `Blog`
  ADD CONSTRAINT `Blog_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Bookmark`
--
ALTER TABLE `Bookmark`
  ADD CONSTRAINT `Bookmark_ibfk_1` FOREIGN KEY (`bookmark_category_id`) REFERENCES `Bookmark_category` (`bookmark_category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Bookmark_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Bookmark_ibfk_3` FOREIGN KEY (`privacy`) REFERENCES `Privacy` (`privacy_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Chat`
--
ALTER TABLE `Chat`
  ADD CONSTRAINT `Chat_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Chat_ibfk_2` FOREIGN KEY (`to`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `City`
--
ALTER TABLE `City`
  ADD CONSTRAINT `City_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `Country` (`country_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Coment`
--
ALTER TABLE `Coment`
  ADD CONSTRAINT `Coment_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `Status` (`status_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Coment_ibfk_2` FOREIGN KEY (`friend_id`) REFERENCES `Friend` (`friend_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Coment_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Connections`
--
ALTER TABLE `Connections`
  ADD CONSTRAINT `Connections_ibfk_1` FOREIGN KEY (`connection_user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Connections_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Cvs`
--
ALTER TABLE `Cvs`
  ADD CONSTRAINT `Cvs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Cv_sections`
--
ALTER TABLE `Cv_sections`
  ADD CONSTRAINT `Cv_sections_ibfk_1` FOREIGN KEY (`cv_id`) REFERENCES `Cvs` (`cv_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Feed`
--
ALTER TABLE `Feed`
  ADD CONSTRAINT `Feed_ibfk_1` FOREIGN KEY (`feed_category_id`) REFERENCES `Feed_category` (`feed_category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Feed_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Feed_ibfk_3` FOREIGN KEY (`privacy`) REFERENCES `Privacy` (`privacy_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Friend`
--
ALTER TABLE `Friend`
  ADD CONSTRAINT `Friend_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Friend_ibfk_2` FOREIGN KEY (`privacy`) REFERENCES `Privacy` (`privacy_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Friend_ibfk_3` FOREIGN KEY (`friend_user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Groups`
--
ALTER TABLE `Groups`
  ADD CONSTRAINT `Groups_ibfk_1` FOREIGN KEY (`created_by_user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Language`
--
ALTER TABLE `Language`
  ADD CONSTRAINT `Language_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Message`
--
ALTER TABLE `Message`
  ADD CONSTRAINT `Message_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Message_ibfk_2` FOREIGN KEY (`to`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Notification`
--
ALTER TABLE `Notification`
  ADD CONSTRAINT `Notification_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Online`
--
ALTER TABLE `Online`
  ADD CONSTRAINT `Online_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`);

--
-- Constraints for table `People_beeing_followed`
--
ALTER TABLE `People_beeing_followed`
  ADD CONSTRAINT `People_beeing_followed_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `People_beeing_followed_ibfk_2` FOREIGN KEY (`member_beeing_followed_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Profile`
--
ALTER TABLE `Profile`
  ADD CONSTRAINT `Profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Profile_ibfk_2` FOREIGN KEY (`privacy`) REFERENCES `Privacy` (`privacy_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Profile_sections`
--
ALTER TABLE `Profile_sections`
  ADD CONSTRAINT `Profile_sections_ibfk_1` FOREIGN KEY (`profile_id`) REFERENCES `Profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Recomendations`
--
ALTER TABLE `Recomendations`
  ADD CONSTRAINT `Recomendations_ibfk_1` FOREIGN KEY (`member_being_recomended_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Recomendations_ibfk_2` FOREIGN KEY (`member_recomending_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Ref_marital_status`
--
ALTER TABLE `Ref_marital_status`
  ADD CONSTRAINT `Ref_marital_status_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Status`
--
ALTER TABLE `Status`
  ADD CONSTRAINT `Status_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Thumb_up_down`
--
ALTER TABLE `Thumb_up_down`
  ADD CONSTRAINT `Thumb_up_down_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `Status` (`status_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Thumb_up_down_ibfk_2` FOREIGN KEY (`friend_id`) REFERENCES `Friend` (`friend_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `User`
--
ALTER TABLE `User`
  ADD CONSTRAINT `User_ibfk_2` FOREIGN KEY (`curent_organization_id`) REFERENCES `Organizations` (`organization_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `User_groups`
--
ALTER TABLE `User_groups`
  ADD CONSTRAINT `User_groups_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `Groups` (`group_id`),
  ADD CONSTRAINT `User_groups_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
