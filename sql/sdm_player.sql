-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 01, 2012 at 04:37 PM
-- Server version: 5.5.9
-- PHP Version: 5.3.6



/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sdm_player`
--
DROP DATABASE `sdm_player`;
CREATE DATABASE `sdm_player`;
USE `sdm_player`;

-- --------------------------------------------------------

--
-- Table structure for table `sdm_song_file_info`
--

DROP TABLE IF EXISTS `sdm_song_file_info`;
CREATE TABLE IF NOT EXISTS `sdm_song_file_info` (
  `sdm_song_file_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sdm_song_machine_name` varchar(75) NOT NULL,
  `sdm_song_ogg_url` varchar(175) NOT NULL,
  `sdm_song_mp3_url` varchar(175) NOT NULL,
  `sdm_song_file_original_upload_date` datetime NOT NULL,
  `sdm_song_file_last_upload_date` datetime NOT NULL,
  PRIMARY KEY (`sdm_song_file_id`),
  UNIQUE KEY `sdm_song_machine_name` (`sdm_song_machine_name`,`sdm_song_ogg_url`,`sdm_song_mp3_url`),
  KEY `sdm_song_file_original_upload_date` (`sdm_song_file_original_upload_date`,`sdm_song_file_last_upload_date`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `sdm_song_file_info`
--

INSERT INTO `sdm_song_file_info` (`sdm_song_file_id`, `sdm_song_machine_name`, `sdm_song_ogg_url`, `sdm_song_mp3_url`, `sdm_song_file_original_upload_date`, `sdm_song_file_last_upload_date`) VALUES
(1, 'sdm_song_i_never_said_goodbye', 'sdm_music/INeverSaidGoodbye.ogg', 'sdm_music/INeverSaidGoodbye.mp3', '2012-05-20 15:01:33', '2012-05-20 15:01:33'),
(2, 'sdm_song_let_it_go', 'sdm_music/LetItGo.ogg', 'sdm_music/LetItGo.mp3', '2012-05-20 15:01:33', '2012-05-20 15:01:33'),
(3, 'sdm_song_meloncholy_sweepstakes', 'sdm_music/MeloncholySweepstakes.ogg', 'sdm_music/MeloncholySweepstakes.mp3', '2012-05-20 22:29:23', '2012-05-20 22:29:23'),
(4, 'sdm_song_pet_peeves', 'sdm_music/PetPeeves.OGG', 'sdm_music/PetPeeves.mp3', '2012-05-25 03:47:12', '2012-05-25 03:47:12'),
(5, 'sdm_song_hopeless', 'sdm_music/Hopeless.OGG', 'sdm_music/Hopeless.mp3', '2012-05-25 03:47:12', '2012-05-25 03:47:12'),
(6, 'sdm_song_living_free', 'sdm_music/LivingFree.OGG', 'sdm_music/LivingFree.mp3', '2012-05-25 03:56:44', '2012-05-25 03:56:44'),
(7, 'sdm_song_dumbed_by_young_love', 'sdm_music/DumbedByYoungLove.OGG', 'sdm_music/DumbedByYoungLove.mp3', '2012-05-25 03:56:44', '2012-05-25 03:56:44'),
(8, 'sdm_song_emotions_cliche', 'sdm_music/EmotionsCliche.OGG', 'sdm_music/EmotionsCliche.mp3', '2012-05-25 04:00:28', '2012-05-25 04:00:28');

-- --------------------------------------------------------

--
-- Table structure for table `sdm_song_info`
--

DROP TABLE IF EXISTS `sdm_song_info`;
CREATE TABLE IF NOT EXISTS `sdm_song_info` (
  `sdm_song_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sdm_song_machine_name` varchar(75) NOT NULL,
  `sdm_song_name` varchar(75) NOT NULL,
  `sdm_song_album` varchar(75) NOT NULL,
  `sdm_song_lyrics` text NOT NULL,
  PRIMARY KEY (`sdm_song_id`),
  UNIQUE KEY `sdm_song_id` (`sdm_song_id`,`sdm_song_name`,`sdm_song_lyrics`(9)),
  KEY `sdm_song_name` (`sdm_song_name`,`sdm_song_lyrics`(9))
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `sdm_song_info`
--

INSERT INTO `sdm_song_info` (`sdm_song_id`, `sdm_song_machine_name`, `sdm_song_name`, `sdm_song_album`, `sdm_song_lyrics`) VALUES
(1, 'sdm_song_i_never_said_goodbye', 'I Never Said Goodbye', 'Her Mother\\''s Daughter', '<h2>I never Said Goodbye</h2>\r\n<h3>Verse 1</h3>\r\n<p>Didn''t want to talk about it</p>\r\n<p>So I Just shut you out</p>\r\n<p>I never said goodbye</p>\r\n<p>Didn''t want to cry inside</p>\r\n<p>You had so many needs</p>\r\n<p>I had to pamper me</p>\r\n<p>I never said farewell</p>\r\n<p>Goodbye was worse than hell</p>\r\n<p>But now I know that I</p>\r\n<p>Will always regret inside</p>\r\n<p>That I did let you go</p>\r\n<p>Without even a note</p>\r\n<p>And though I love you so</p>\r\n<p>Alone I walk my road</p>\r\n<p>I never said goodbye</p>\r\n<p>I regret that the most</p>\r\n<h3>Chorus</h3>\r\n<p>I always thin about you</p>\r\n<p>Every time I think about it</p>\r\n<p>I can see that all my fears were unfounded</p>\r\n<p>And if I had been older</p>\r\n<p>I might not have see a boulder</p>\r\n<p>And i might have let my heart sing</p>\r\n<h5>(Repeat 2x)</h5>\r\n<h3>Verse 2</h3>\r\n<p>Just wanted to hide from it</p>\r\n<p>The pain was breaking out</p>\r\n<p>I never said goodbye</p>\r\n<p>Didn''t want to die inside</p>\r\n<p>I had so many dreams</p>\r\n<p>You couldn''t help me see</p>\r\n<p>I never said farewell</p>\r\n<p>Instead I ran like hell</p>\r\n<p>Memories still make me ill</p>\r\n<p>I just can''t talk about it</p>\r\n<p>I had to let you go</p>\r\n<p>There was no doubt about it</p>\r\n<h5>(call and response)</h5>\r\n<p>Do you regret that the most?</p>\r\n<p>Yes I regret that the most</p>\r\n<p>Do you regret that the most?</p>\r\n<p>Yes I regret that the most</p>\r\n<h5>Chorus Repeats</h5>'),
(2, 'sdm_song_let_it_go', 'Let It Go', 'Demo', '<h2>Let It GO</h2>\r\n<h3>Verse 1</h3>\r\n<p>I was alone</p>\r\n<p>I was alive</p>\r\n<p>Oh how I was inspired</p>\r\n<p>Open your eyes and come and see</p>\r\n<p>Then came a voice that split the path</p>\r\n<p>Where I was promptly asked</p>\r\n<p> Let go or fight in misery?</p>\r\n<h3>Chorus</h3>\r\nOh darling please just let go\r\n<p></p>\r\n<p>Please just let go darling child</p>\r\n<p>Oh darling please just let go</p>\r\n<p>please just let go darling child</p>\r\n<p>Oh darling please just let go child</p>\r\n<h3>Verse 2</h3>\r\n<p>Well I had come to catch a glance</p>\r\n<p>At the world beyond the glass</p>\r\n<p>Open your eyes and you will see</p>\r\n<p>That it is clear the beauty here</p>\r\n<p>Is not something to fear</p>\r\n<p>And I let go now!</p>'),
(3, 'sdm_song_meloncholy_sweepstakes', 'Meloncholy Sweepstakes', 'Sevi\\''s Sketches', '<h2>Meloncholy Sweepstakes</h2>\r\n<h3>Verse 1</h3>\r\n<p>And What I Think</p>\r\n<p>I Do not know but try to speak</p>\r\n<p>And all the days they seemed the same</p>\r\n<p>Kept falling down</p>\r\n<p>But i had my dreams</p>\r\n<p>And it hurts so good</p>\r\n<p>Oh I''ll go awhile pretending its alright</p>\r\n<h3>Chorus 1</h3>\r\n<p>And I try</p>\r\n<p>Try to treat</p>\r\n<p>My pain for all those things I''d like to be</p>\r\n<p>To see</p>\r\n<p>Ive been dreaming for to long</p>\r\n<h3>Verse 2</h3>\r\n<p>Aint'' it nice to be away from</p>\r\n<p>And is it hopeful to see that you can hide away from</p>\r\n<p>And aint'' it great that you could be so distant from it all</p>\r\n<h3>Chorus 2</h3>\r\n<p>And I</p>\r\n<p>I need time</p>\r\n<p>To sort through all that is not right</p>\r\n<p>I need more time</p>\r\n<p>''Cause I can''t let go</p>\r\n<p>I can''t let this go</p>\r\n<h3>Verse 3</h3>\r\n<p>And anytime we were on our feet</p>\r\n<p>We went to the past</p>\r\n<p>And anytime we were on our knees we would move to fast</p>\r\n<p>And baby I tell I''m begging please</p>\r\n<p>Just don''t let it go!</p>\r\n<p>And don''t you hope for tomorrow</p>\r\n<p>Because it''s not going to be so</p>\r\n<h3>Chorus 3</h3>\r\n<p>So i say we make</p>\r\n<p>The best of this dream</p>\r\n<p>It''s very hard to remain happy</p>\r\n<p>And ain''t it sad</p>\r\n<p>We all go mad</p>\r\n<p>You see we see it</p>\r\n<p>It''s a feeling though I know</p>'),
(4, 'sdm_song_pet_peeves', 'Pet Peeves', 'Pet Peeves', '<h2>Pet Peeves</h2>\r\n<h3>Verse</h3>\r\n<p>I''m At Your Feet</p>\r\n<p>I need a treat</p>\r\n<p>I need a change</p>\r\n<p>we need to speak</p>\r\n<p>There not a moment were at ease</p>\r\n<p>You act out most of my Pet Peeves</p>\r\n<p>We all know love can be sweet</p>\r\n<p>But it''s a game to you and me</p>\r\n<p>Time passes by</p>\r\n<p>And we decline</p>\r\n<p>To Face up to reality</p>\r\n<h3>Chorus</h3>\r\n<p>Oh oo Oh oo Oh...</p>\r\n<h3>Verse 2</h3>\r\n<p>It''s getting older everyday</p>\r\n<p>We see the truth and turn away</p>\r\n<p>It is a lie</p>\r\n<p>That we could try</p>\r\nTo mend this romance that has frayed\r\n<p></p>\r\n<p>Refuse to know the one mistake</p>\r\nThat hurts the most is that we stay\r\n<p></p>\r\n<p>In this devotion we let go of any chance for love that''s great</p>\r\n<h3>Chorus</h3>\r\nOh oo Oh oo Oh...\r\n<p></p>\r\n<h3>Bridge</h3>\r\n<p>As we try</p>\r\n<p>To find</p>\r\n<p>A solution for our love</p>\r\n<p>We are blind</p>\r\n<p>If we find</p>\r\n<p>That we could work it out</p>\r\n<p>Over time</p>\r\n<p>All the signs said to let him go, let her go oh oh oh</p>\r\n<p>And its time to get out</p>'),
(5, 'sdm_song_hopeless', 'Hopeless', 'Sevi''s Sketches', '<h2>Hopeless</h2>\r\n<h3>Verse 1</h3>\r\n<p>Hopelessly hopeless</p>\r\n<p>I''ve tried to work through this</p>\r\n<p>But I cannot accept these futile notions</p>\r\n<p>To continue to direct our energy to this</p>\r\n<p>Is a threat to my conscious and enables your need</p>\r\n<h3>Chorus</h3>\r\n<p>You ask why?</p>\r\n<p>You held on to me like an obsession</p>\r\n<p>Every warning I gave you fought or left to the breeze</p>\r\n<p>Oh and I cant believe that you would feed such an obsession</p>\r\n<p>Darling you must let this be</p>\r\n<h3>Verse 2</h3>\r\n<p>Instant satisfaction defined most of our actions</p>\r\n<p>What was right in the long run was simply abandoned</p>\r\n<p>I tried to work through this</p>\r\n<p>Face false words and fierce lips</p>\r\n<p>So I ended what was bound to end up in flames</p>\r\n<h5>Repeat Chorus</h5>'),
(6, 'sdm_song_living_free', 'Living Free', 'Demo', '<h2>Living Free</h2>\r\n<h3>Verse 1</h3>\r\n<p>On the red carpet</p>\r\n<p>And on the poorest streets</p>\r\n<p>I''ll cross the stepping stones</p>\r\n<p>And wind up in a dream</p>\r\n<h3>Chorus</h3>\r\n<p>I listen to my soul</p>\r\n<p>My own reality</p>\r\n<p>You say I''m stuck in dreams</p>\r\n<p>I say I''m living free</p>\r\n<h3>Verse 2</h3>\r\n<p>I''ll drink the waters</p>\r\n<p>Of sorrow love and pain</p>\r\n<p>Until my soul finds</p>\r\n<p>The wisdom that it craves</p>\r\n<h5>Repeat Chorus</h5>'),
(7, 'sdm_song_dumbed_by_young_love', 'Dumbed By Young Love', 'Demo', '<h2>Dumbed By Young Love</h2>\r\n<h3>Verse 1</h3>\r\n<p>She was</p>\r\n<p>Wishing</p>\r\n<p>For something that I couldn''t give</p>\r\n<p>I was</p>\r\n<p>Drifting</p>\r\n<p>Then drowning I got in way over my head</p>\r\n<p>We were dumbed by young love</p>\r\n<p>Saw the signs to slow down but our hearts chose to rush on</p>\r\n<p>I had to choose to grow up</p>\r\n<p>For the pain of the crash would exceed my choice to stop</p>\r\n<h3>Chorus</h3>\r\n<p>Darling you really must see</p>\r\n<p>There''s no chance for you and me no</p>\r\n<p>We just don''t work</p>\r\n<p>You needed blind commitment</p>\r\n<p>I needed space and freedom</p>\r\n<p>Your talk of us is crazy</p>\r\n<h3>Verse 2</h3>\r\n<p>Someday</p>\r\n<p>You''ll see</p>\r\n<p>The reasons why this couldn''t be</p>\r\n<p>Until then</p>\r\n<p>Your pain will remain unless you let this be</p>\r\n<h5>Chorus Repeats</h5>'),
(8, 'sdm_song_emotions_cliche', 'Emotions Cliche', 'Demo', '<h2>Emotions Cliche</h2>\r\n<h3>Verse 1</h3>\r\n<p>I''ve got my stories to tell</p>\r\n<p>And just like everyone I''ve been through hell</p>\r\n<p>And I''ve been walking down these aisle''s</p>\r\n<p>I see their political smiles facing me</p>\r\n<h3>Verse 2</h3>\r\n<p>She says that I''m just going crazy</p>\r\n<p>He says my morals just aint'' right</p>\r\n<p>She says now loosen up pretty baby</p>\r\n<p>Besides you know there aint'' no use in putting up a fight</p>\r\n<h3>Chorus 1</h3>\r\n<p>Well I can''t seem to find my way around my head</p>\r\n<p>I feel like I''m standing behind locked doors</p>\r\n<h3>Verse 3</h3>\r\n<p>I''ve got my poems to sing</p>\r\n<p>And just like before there about love</p>\r\n<p>Or something like that</p>\r\n<p>And though its been hard to say</p>\r\n<p>I''ve got to keep on saying all the things I''ve been meaning to say</p>\r\n<h3>Chorus 2</h3>\r\n<p>And I''ve been waiting for that day where i can be free</p>\r\n<p>My dreams will fall out before me</p>\r\n<h3>Bridge/Outro</h3>\r\n<p>I''ve got something to say to you today my friend</p>\r\n<p>I''ve got something to say to you today my friend</p>\r\n<p>I''ve got something again to you today</p>\r\n<p>About the way we pretend to be friends</p>');

-- --------------------------------------------------------

--
-- Table structure for table `sdm_song_musician_info`
--

DROP TABLE IF EXISTS `sdm_song_musician_info`;
CREATE TABLE IF NOT EXISTS `sdm_song_musician_info` (
  `sdm_song_musician_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sdm_song_musician_name` varchar(75) NOT NULL,
  `sdm_song_musician_instruments` text NOT NULL,
  `sdm_song_musician_tracks` text NOT NULL,
  PRIMARY KEY (`sdm_song_musician_id`),
  UNIQUE KEY `sdm_song_musician_id` (`sdm_song_musician_id`,`sdm_song_musician_name`),
  KEY `sdm_song_musician_name` (`sdm_song_musician_name`,`sdm_song_musician_instruments`(9),`sdm_song_musician_tracks`(9))
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `sdm_song_musician_info`
--

INSERT INTO `sdm_song_musician_info` (`sdm_song_musician_id`, `sdm_song_musician_name`, `sdm_song_musician_instruments`, `sdm_song_musician_tracks`) VALUES
(1, 'Sevi D', 'Vocals, Guitar, (Composition and Synthesis of Drums, Piano, & Bass )', '''All'''),
(2, 'Cody Robbins', 'Upright Bass', 'Present, Let It Go, Emotions Clich?®');
