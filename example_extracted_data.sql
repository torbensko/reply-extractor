-- this file is automatically generated - do not edit directly

-- This code is provided under a Creative Commons Attribution license (for
-- details see: http://creativecommons.org/licenses/by/3.0/). In
-- summary, you are free to use the code for any purpose as long as you remember
-- to mention my name (Torben Sko) at some point. Also please note that my code
-- is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING THE WARRANTY OF
-- DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.

DROP DATABASE IF EXISTS comments;
CREATE DATABASE comments;

USE comments;

CREATE TABLE `website`
(
	`id` VARCHAR(128), 
	`website` VARCHAR(64), 
	`topic` VARCHAR(64), 
	`title` VARCHAR(256), 
	`url`  VARCHAR(512),
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `comment`
(
	`id` INTEGER NOT NULL AUTO_INCREMENT,
	`website_id` VARCHAR(128), 
	`position_on_page` INTEGER,
	`author` VARCHAR(64), 
	`timestamp_str` VARCHAR(64), 
	`comment` TEXT,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

INSERT INTO website (id, website, topic, title, url) VALUES ('example_readme-p1', 'example_readme', 'example', 'README example', 'missing');
INSERT INTO comment (position_on_page, website_id, author, timestamp_str, comment) VALUES (1,'example_readme-p1', 'User 1', 'timestamp 1', 'Comment 1');
INSERT INTO comment (position_on_page, website_id, author, timestamp_str, comment) VALUES (2,'example_readme-p1', 'User 2', 'timestamp 2', 'Comment 2');

-- finished
INSERT INTO website (id, website, topic, title, url) VALUES ('example_reddit-p1', 'example_reddit', 'example', 'Page title', 'http://www.reddit.com/');
INSERT INTO comment (position_on_page, website_id, author, timestamp_str, comment) VALUES (1,'example_reddit-p1', 'user1', 'Fri Sep 30 07:03:26 2011 GMT', 'comment 1');
INSERT INTO comment (position_on_page, website_id, author, timestamp_str, comment) VALUES (2,'example_reddit-p1', 'user2', 'Fri Sep 30 08:22:19 2011 GMT', 'comment 2');
INSERT INTO comment (position_on_page, website_id, author, timestamp_str, comment) VALUES (3,'example_reddit-p1', 'user3', 'Fri Sep 30 07:09:39 2011 GMT', 'comment 3');
INSERT INTO comment (position_on_page, website_id, author, timestamp_str, comment) VALUES (4,'example_reddit-p1', 'user4', 'Fri Sep 30 07:15:31 2011 GMT', 'comment 4');
INSERT INTO comment (position_on_page, website_id, author, timestamp_str, comment) VALUES (5,'example_reddit-p1', 'user5', 'Fri Sep 30 08:07:14 2011 GMT', 'comment 5');

-- finished