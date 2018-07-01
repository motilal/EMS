<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

{"lavel":"ERROR","date":"2018-07-01 11:56:26","message":"404 Page Not Found: api\/Send_lead\/index"}
{"lavel":"ERROR","date":"2018-07-01 11:56:31","message":"404 Page Not Found: api\/Send_lead\/index"}
{"lavel":"ERROR","date":"2018-07-01 11:58:00","message":"Query error: Unknown column 'c.status' in 'where clause' - Invalid query: SELECT `c`.*\nFROM `companies` as `c`\nINNER JOIN `companies_city` ON `companies_city`.`companies_id`=`c`.`id`\nINNER JOIN `companies_package` as `cp` ON `cp`.`companies_id`=`c`.`id`\nWHERE `c`.`is_delete` = '0'\nAND `c`.`status` = '1'\nAND `companies_city`.`cities_id` = '6'\nAND `c`.`servicetypes_id` = '1'\nAND `cp`.`total_leads` > `cp`.`used_leads`\nAND `cp`.`is_active` = 1\nGROUP BY `c`.`id`"}
{"lavel":"ERROR","date":"2018-07-01 12:02:04","message":"Severity: Notice --> Undefined variable: row E:\\xampp\\htdocs\\easymysearch\\application\\views\\company\\manage_package.php 68"}
{"lavel":"ERROR","date":"2018-07-01 12:02:08","message":"404 Page Not Found: Asset\/plugin"}
{"lavel":"ERROR","date":"2018-07-01 12:03:31","message":"404 Page Not Found: Asset\/plugin"}
{"lavel":"ERROR","date":"2018-07-01 12:05:01","message":"404 Page Not Found: Asset\/plugin"}
{"lavel":"ERROR","date":"2018-07-01 12:05:35","message":"404 Page Not Found: Asset\/plugin"}
{"lavel":"ERROR","date":"2018-07-01 12:05:55","message":"404 Page Not Found: Asset\/plugin"}
{"lavel":"ERROR","date":"2018-07-01 12:06:12","message":"404 Page Not Found: Asset\/plugin"}
{"lavel":"ERROR","date":"2018-07-01 13:45:18","message":"Severity: Warning --> Missing argument 1 for Company_model::total_lead_sent_today(), called in E:\\xampp\\htdocs\\easymysearch\\application\\controllers\\api\\Services.php on line 110 and defined E:\\xampp\\htdocs\\easymysearch\\application\\models\\Company_model.php 154"}
{"lavel":"ERROR","date":"2018-07-01 13:45:18","message":"Severity: Notice --> Undefined variable: company_id E:\\xampp\\htdocs\\easymysearch\\application\\models\\Company_model.php 155"}
{"lavel":"ERROR","date":"2018-07-01 13:45:18","message":"Query error: Unknown column 'comapnies_id' in 'where clause' - Invalid query: SELECT count(id) as total\nFROM `leads_sent_history`\nWHERE `comapnies_id` IS NULL\nAND DATE(created) = '2018-07-01'\nGROUP BY `comapnies_id`"}
{"lavel":"ERROR","date":"2018-07-01 13:45:42","message":"Query error: Unknown column 'comapnies_id' in 'where clause' - Invalid query: SELECT count(id) as total\nFROM `leads_sent_history`\nWHERE `comapnies_id` = '2'\nAND DATE(created) = '2018-07-01'\nGROUP BY `comapnies_id`"}
{"lavel":"ERROR","date":"2018-07-01 13:46:05","message":"Query error: Unknown column 'comapnies_id' in 'group statement' - Invalid query: SELECT count(id) as total\nFROM `leads_sent_history`\nWHERE `companies_id` = '2'\nAND DATE(created) = '2018-07-01'\nGROUP BY `comapnies_id`"}
{"lavel":"ERROR","date":"2018-07-01 14:02:26","message":"Severity: Notice --> Trying to get property of non-object E:\\xampp\\htdocs\\easymysearch\\application\\controllers\\api\\Services.php 104"}
{"lavel":"ERROR","date":"2018-07-01 14:02:26","message":"Severity: Notice --> Trying to get property of non-object E:\\xampp\\htdocs\\easymysearch\\application\\controllers\\api\\Services.php 104"}
{"lavel":"ERROR","date":"2018-07-01 14:26:29","message":"Severity: Notice --> Undefined variable: service E:\\xampp\\htdocs\\easymysearch\\application\\controllers\\api\\Services.php 148"}
{"lavel":"ERROR","date":"2018-07-01 14:26:29","message":"Severity: Notice --> Undefined variable: name E:\\xampp\\htdocs\\easymysearch\\application\\controllers\\api\\Services.php 148"}
{"lavel":"ERROR","date":"2018-07-01 14:26:29","message":"Severity: Notice --> Undefined variable: phone E:\\xampp\\htdocs\\easymysearch\\application\\controllers\\api\\Services.php 148"}
{"lavel":"ERROR","date":"2018-07-01 14:26:29","message":"Severity: Notice --> Undefined variable: service E:\\xampp\\htdocs\\easymysearch\\application\\controllers\\api\\Services.php 148"}
{"lavel":"ERROR","date":"2018-07-01 14:26:29","message":"Severity: Notice --> Undefined variable: name E:\\xampp\\htdocs\\easymysearch\\application\\controllers\\api\\Services.php 148"}
{"lavel":"ERROR","date":"2018-07-01 14:26:29","message":"Severity: Notice --> Undefined variable: phone E:\\xampp\\htdocs\\easymysearch\\application\\controllers\\api\\Services.php 148"}
{"lavel":"ERROR","date":"2018-07-01 14:26:29","message":"Severity: Notice --> Undefined variable: service E:\\xampp\\htdocs\\easymysearch\\application\\controllers\\api\\Services.php 148"}
{"lavel":"ERROR","date":"2018-07-01 14:26:29","message":"Severity: Notice --> Undefined variable: name E:\\xampp\\htdocs\\easymysearch\\application\\controllers\\api\\Services.php 148"}
{"lavel":"ERROR","date":"2018-07-01 14:26:30","message":"Severity: Notice --> Undefined variable: phone E:\\xampp\\htdocs\\easymysearch\\application\\controllers\\api\\Services.php 148"}
{"lavel":"ERROR","date":"2018-07-01 14:26:30","message":"Severity: Notice --> Undefined variable: service E:\\xampp\\htdocs\\easymysearch\\application\\controllers\\api\\Services.php 148"}
{"lavel":"ERROR","date":"2018-07-01 14:26:30","message":"Severity: Notice --> Undefined variable: name E:\\xampp\\htdocs\\easymysearch\\application\\controllers\\api\\Services.php 148"}
{"lavel":"ERROR","date":"2018-07-01 14:26:30","message":"Severity: Notice --> Undefined variable: phone E:\\xampp\\htdocs\\easymysearch\\application\\controllers\\api\\Services.php 148"}
{"lavel":"ERROR","date":"2018-07-01 14:26:30","message":"Severity: Notice --> Undefined variable: service E:\\xampp\\htdocs\\easymysearch\\application\\controllers\\api\\Services.php 148"}
{"lavel":"ERROR","date":"2018-07-01 14:26:30","message":"Severity: Notice --> Undefined variable: name E:\\xampp\\htdocs\\easymysearch\\application\\controllers\\api\\Services.php 148"}
{"lavel":"ERROR","date":"2018-07-01 14:26:30","message":"Severity: Notice --> Undefined variable: phone E:\\xampp\\htdocs\\easymysearch\\application\\controllers\\api\\Services.php 148"}
{"lavel":"ERROR","date":"2018-07-01 14:26:30","message":"Severity: Notice --> Undefined variable: service E:\\xampp\\htdocs\\easymysearch\\application\\controllers\\api\\Services.php 148"}
{"lavel":"ERROR","date":"2018-07-01 14:26:30","message":"Severity: Notice --> Undefined variable: name E:\\xampp\\htdocs\\easymysearch\\application\\controllers\\api\\Services.php 148"}
{"lavel":"ERROR","date":"2018-07-01 14:26:30","message":"Severity: Notice --> Undefined variable: phone E:\\xampp\\htdocs\\easymysearch\\application\\controllers\\api\\Services.php 148"}
{"lavel":"ERROR","date":"2018-07-01 14:26:30","message":"Severity: Notice --> Undefined variable: service E:\\xampp\\htdocs\\easymysearch\\application\\controllers\\api\\Services.php 148"}
{"lavel":"ERROR","date":"2018-07-01 14:26:30","message":"Severity: Notice --> Undefined variable: name E:\\xampp\\htdocs\\easymysearch\\application\\controllers\\api\\Services.php 148"}
{"lavel":"ERROR","date":"2018-07-01 14:26:30","message":"Severity: Notice --> Undefined variable: phone E:\\xampp\\htdocs\\easymysearch\\application\\controllers\\api\\Services.php 148"}
{"lavel":"ERROR","date":"2018-07-01 14:26:30","message":"Severity: Notice --> Undefined variable: service E:\\xampp\\htdocs\\easymysearch\\application\\controllers\\api\\Services.php 148"}
{"lavel":"ERROR","date":"2018-07-01 14:26:30","message":"Severity: Notice --> Undefined variable: name E:\\xampp\\htdocs\\easymysearch\\application\\controllers\\api\\Services.php 148"}
{"lavel":"ERROR","date":"2018-07-01 14:26:30","message":"Severity: Notice --> Undefined variable: phone E:\\xampp\\htdocs\\easymysearch\\application\\controllers\\api\\Services.php 148"}
{"lavel":"ERROR","date":"2018-07-01 14:26:30","message":"Severity: Notice --> Undefined variable: service E:\\xampp\\htdocs\\easymysearch\\application\\controllers\\api\\Services.php 148"}
{"lavel":"ERROR","date":"2018-07-01 14:26:30","message":"Severity: Notice --> Undefined variable: name E:\\xampp\\htdocs\\easymysearch\\application\\controllers\\api\\Services.php 148"}
{"lavel":"ERROR","date":"2018-07-01 14:26:30","message":"Severity: Notice --> Undefined variable: phone E:\\xampp\\htdocs\\easymysearch\\application\\controllers\\api\\Services.php 148"}
