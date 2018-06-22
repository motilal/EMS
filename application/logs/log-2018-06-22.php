<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

{"lavel":"ERROR","date":"2018-06-22 07:48:13","message":"Query error: Table 'easymysearch.package_types' doesn't exist - Invalid query: SELECT `packages`.*, `servicetypes`.`name` as `service_name`, `ptype`.`name` as `package_type_name`\nFROM `packages`\nLEFT JOIN `package_types` `ptype` ON `ptype`.`id`=`packages`.`package_types_id`\nLEFT JOIN `servicetypes` ON `servicetypes`.`id`=`packages`.`servicetypes_id`\nWHERE `packages`.`is_delete` = '0'"}
