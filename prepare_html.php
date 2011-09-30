<?php

// This code is provided under a Creative Commons Attribution license (for
// details see: http://creativecommons.org/licenses/by/3.0/). In
// summary, you are free to use the code for any purpose as long as you remember
// to mention my name (Torben Sko) at some point. Also please note that my code
// is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING THE WARRANTY OF
// DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.


/*

Usage: 
php prepare_html.php html_file.html head_template.html parameter_file.txt produced_file.sql

Procedure:
1. reads in a html file (a), a replacement header file (b) and a params file (c)
2. from (a) it extracts the title and url and combines them with the values in (c) 
   to create the following list:
      TITLE, URL, WRAPPER, COMMENT, DATE, USER, OUTPUT_NAME
3. these values are subsituted into (b)
4. the altered (b) is used to replace the existing header in (a) and the modified (a) 
   is displayed

*/

error_reporting(true);
ini_set('display_errors', true);
ini_set('memory_limit', '1024M');

define("PARAM_DELIM", 	"///");
define("CHUNK_SIZE",	50000);

if(count($argv) < 5)
	exit();

$subs = array();

$html	  = file_get_contents($argv[1]);	// e.g. ./source_forums__fo_off_topic/p1.html
$head 	  = file_get_contents($argv[2]);	// e.g. head.html
          
$params	  = file_get_contents($argv[3]);	// e.g. ./source_forums__fo_off_topic/params.txt
$params	  = preg_replace("/[\\n\\r]/", PARAM_DELIM, $params);

$subs["OUTPUT_NAME"] = $argv[4];

$tmp = explode('/', $argv[1]);
$subs["NAME"] = $tmp[1];
$subs["TOPIC"] = 'unknown';

$tmp = array();
preg_match("%< *title[^>]*>(.*)</ *title *>%s", $html, $tmp);
$subs["TITLE"] = (count($tmp) > 1) ? trim(preg_replace("/[\\n\\r]/", "", $tmp[1])) : "missing";

$tmp = array();
preg_match("%<!-- saved from url=\(\d+\)(.*?) -->%", $html, $tmp);
$subs["URL"] = (count($tmp) > 1) ? $tmp[1] : "missing";

foreach(explode(PARAM_DELIM, $params) as $param) {
	$parts = explode("=", $param);
	if(count($parts) == 2)
		$subs[trim($parts[0])] = trim($parts[1]);
}

foreach($subs as $placeholder => $value) {
	$head = str_replace("__{$placeholder}__", $value, $head);
}

// we can't process it all at once if the file is too big, so we cut it up
$i = 0;
while(!preg_match("#</ *head *>#s", substr($html, $i*CHUNK_SIZE, CHUNK_SIZE))) $i++;
echo preg_replace("#^.*</ *head *>#s", $head, substr($html, $i*CHUNK_SIZE, CHUNK_SIZE));
echo substr($html, ($i+1)*CHUNK_SIZE);

if (preg_last_error() == PREG_BACKTRACK_LIMIT_ERROR) {
    print 'Backtrack limit was exhausted!';
}

?>