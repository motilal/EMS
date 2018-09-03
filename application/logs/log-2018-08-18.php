<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

{"lavel":"ERROR","date":"2018-08-18 13:47:35","message":"Query error: Unknown column 'follow_up.companies_id' in 'on clause' - Invalid query: SELECT `follow_up`.*, CONCAT_WS(' ', `users`.`first_name`, users.last_name) as username, `companies`.`name` as `company_name`\nFROM `follow_up`\nLEFT JOIN `companies` ON `companies`.`id`=`follow_up`.`companies_id`\nLEFT JOIN `users` ON `users`.`id`=`follow_up`.`users_id`\nWHERE `follow_up`.`is_delete` = '0'"}
