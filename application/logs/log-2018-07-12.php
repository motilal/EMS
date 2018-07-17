<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

{"lavel":"ERROR","date":"2018-07-12 21:53:21","message":"404 Page Not Found: Admin\/index"}
{"lavel":"ERROR","date":"2018-07-12 22:20:08","message":"404 Page Not Found: Asset\/plugin"}
{"lavel":"ERROR","date":"2018-07-12 22:33:41","message":"404 Page Not Found: Asset\/plugin"}
{"lavel":"ERROR","date":"2018-07-12 22:39:18","message":"404 Page Not Found: Asset\/plugin"}
{"lavel":"ERROR","date":"2018-07-12 22:47:35","message":"404 Page Not Found: Asset\/plugin"}
{"lavel":"ERROR","date":"2018-07-12 22:47:55","message":"Could not find the language line \"CompanyPackagePaymenntDeleteSuccess\""}
{"lavel":"ERROR","date":"2018-07-12 22:48:13","message":"404 Page Not Found: Asset\/plugin"}
{"lavel":"ERROR","date":"2018-07-12 22:48:54","message":"Could not find the language line \"CompanyPackagePaymenntDeleteSuccess\""}
{"lavel":"ERROR","date":"2018-07-12 22:50:33","message":"Could not find the language line \"CompanyPackagePaymenntDeleteSuccess\""}
{"lavel":"ERROR","date":"2018-07-12 22:58:33","message":"Could not find the language line \"CompanyPackagePaymenntDeleteSuccess\""}
{"lavel":"ERROR","date":"2018-07-12 23:00:40","message":"Could not find the language line \"CompanyPackagePaymenntDeleteSuccess\""}
{"lavel":"ERROR","date":"2018-07-12 23:00:49","message":"Could not find the language line \"CompanyPackagePaymenntDeleteSuccess\""}
{"lavel":"ERROR","date":"2018-07-12 23:11:41","message":"Query error: Unknown column 'approved' in 'where clause' - Invalid query: SELECT `cp`.*, `companies`.`name` as `company_name`, `packages`.`name` as `package_name`, (SELECT SUM(amount) FROM companies_package_payment WHERE companies_package_payment.companies_package_id=cp.id) as total_paid_amount\nFROM `companies_package` as `cp`\nLEFT JOIN `companies` ON `companies`.`id`=`cp`.`companies_id`\nLEFT JOIN `packages` ON `packages`.`id`=`cp`.`packages_id`\nWHERE `approved` = '1'"}
{"lavel":"ERROR","date":"2018-07-12 23:36:53","message":"Query error: Unknown column 'approved' in 'field list' - Invalid query: UPDATE `companies_package` SET `approved` = '1'\nWHERE `id` = '7'"}
{"lavel":"ERROR","date":"2018-07-12 23:37:51","message":"Could not find the language line \"CompanyPackagePaymenntUpdateSuccess\""}
{"lavel":"ERROR","date":"2018-07-12 23:43:24","message":"Could not find the language line \"CompanyPackagePaymenntUpdateSuccess\""}
