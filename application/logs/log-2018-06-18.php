<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

{"lavel":"ERROR","date":"2018-06-18 21:34:53","message":"Query error: Cannot add or update a child row: a foreign key constraint fails (`easymysearch`.`packages`, CONSTRAINT `packages_ibfk_1` FOREIGN KEY (`servicetypes_id`) REFERENCES `servicetypes` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION) - Invalid query: INSERT INTO `packages` (`name`, `package_type`, `duration`, `amount`, `no_of_leads`, `servicetypes_id`, `description`, `created`) VALUES ('Gold', '1', '90', '999', '120', '0', 'gold is highest package of this ', '2018-06-18 21:34:53')"}
{"lavel":"ERROR","date":"2018-06-18 21:38:32","message":"Query error: Column 'servicetypes_id' cannot be null - Invalid query: INSERT INTO `packages` (`name`, `package_type`, `duration`, `amount`, `no_of_leads`, `servicetypes_id`, `description`, `created`) VALUES ('Gold', '1', '90', '999', '120', NULL, 'gold is highest package of this ', '2018-06-18 21:38:32')"}
{"lavel":"ERROR","date":"2018-06-18 21:39:54","message":"Query error: Column 'servicetypes_id' cannot be null - Invalid query: INSERT INTO `packages` (`name`, `package_type`, `duration`, `amount`, `no_of_leads`, `servicetypes_id`, `description`, `created`) VALUES ('Gold', '1', '90', '999', '120', NULL, 'gold is highest package of this ', '2018-06-18 21:39:54')"}
{"lavel":"ERROR","date":"2018-06-18 21:42:46","message":"Could not find the language line \"ComapanyAddSuccess\""}
{"lavel":"ERROR","date":"2018-06-18 21:43:55","message":"Could not find the language line \"ComapanyActiveSuccess\""}
{"lavel":"ERROR","date":"2018-06-18 21:47:51","message":"Could not find the language line \"ComapanyUpdateSuccess\""}
{"lavel":"ERROR","date":"2018-06-18 22:31:09","message":"Severity: Notice --> Undefined variable: companies_id E:\\xampp\\htdocs\\easymysearch\\application\\models\\Company_model.php 118"}
{"lavel":"ERROR","date":"2018-06-18 22:31:09","message":"Severity: Error --> Call to a member function result() on null E:\\xampp\\htdocs\\easymysearch\\application\\controllers\\admin\\Companies.php 297"}
{"lavel":"ERROR","date":"2018-06-18 22:31:44","message":"Query error: Unknown table 'easymysearch.companies_package' - Invalid query: SELECT `companies_package`.*, `companies`.`name` as `company_name`, `packages`.`name` as `package_name`\nFROM `companies_package` as `cp`\nLEFT JOIN `companies` ON `companies`.`id`=`cp`.`companies_id`\nLEFT JOIN `packages` ON `packages`.`id`=`cp`.`packages_id`\nWHERE `cp`.`is_delete` =0\nAND `cp`.`companies_id` = '1'"}
{"lavel":"ERROR","date":"2018-06-18 22:47:17","message":"Could not find the language line \"CompanyPackageActiveSuccess\""}
{"lavel":"ERROR","date":"2018-06-18 22:56:26","message":"Query error: Unknown column 'cp.is_delete' in 'where clause' - Invalid query: SELECT `cp`.*, `companies`.`name` as `company_name`, `packages`.`name` as `package_name`\nFROM `companies_package` as `cp`\nLEFT JOIN `companies` ON `companies`.`id`=`cp`.`companies_id`\nLEFT JOIN `packages` ON `packages`.`id`=`cp`.`packages_id`\nWHERE `cp`.`is_delete` =0\nAND `cp`.`companies_id` = '1'"}
{"lavel":"ERROR","date":"2018-06-18 22:57:15","message":"404 Page Not Found: admin\/Cities\/delete_comapany_package"}
{"lavel":"ERROR","date":"2018-06-18 22:58:05","message":"404 Page Not Found: admin\/Cities\/delete_comapany_package"}
{"lavel":"ERROR","date":"2018-06-18 22:58:36","message":"404 Page Not Found: admin\/Cities\/delete_company_package"}
{"lavel":"ERROR","date":"2018-06-18 22:59:25","message":"Query error: Table 'easymysearch.companies_package1' doesn't exist - Invalid query: DELETE FROM `companies_package1`\nWHERE `id` = '2'"}
