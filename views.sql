
-- This code is provided under a Creative Commons Attribution license (for
-- details see: http://creativecommons.org/licenses/by/3.0/). In
-- summary, you are free to use the code for any purpose as long as you remember
-- to mention my name (Torben Sko) at some point. Also please note that my code
-- is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING THE WARRANTY OF
-- DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.

DROP VIEW IF EXISTS `full_comment`;
CREATE VIEW full_comment AS SELECT topic, website_id, position_on_page, author, timestamp_str, comment from comment left join website on website.id = comment.website_id;
