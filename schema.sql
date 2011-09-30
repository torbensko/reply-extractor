
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
