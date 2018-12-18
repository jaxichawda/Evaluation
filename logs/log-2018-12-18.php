ERROR - 2018-12-18 13:08:55 --> Query error: FUNCTION evaluation.CONCATE does not exist - Invalid query: SELECT `u`.`UserId`, CONCATE(u.FirstName, " ", `u`, LastName) as EmployeeName
FROM `tblmstempevaluation` as `e`
LEFT JOIN `tbluser` `u` ON `u`.`UserId`=`e`.`UserId`
WHERE `e`.`EvaluationId` = '21'
ERROR - 2018-12-18 13:08:59 --> Query error: FUNCTION evaluation.CONCATE does not exist - Invalid query: SELECT `u`.`UserId`, CONCATE(u.FirstName, " ", `u`, LastName) as EmployeeName
FROM `tblmstempevaluation` as `e`
LEFT JOIN `tbluser` `u` ON `u`.`UserId`=`e`.`UserId`
WHERE `e`.`EvaluationId` = '21'
ERROR - 2018-12-18 13:10:30 --> Query error: Unknown column 'u' in 'field list' - Invalid query: SELECT `u`.`UserId`, CONCAT(u.FirstName, " ", `u`, LastName) as EmployeeName
FROM `tblmstempevaluation` as `e`
LEFT JOIN `tbluser` `u` ON `u`.`UserId`=`e`.`UserId`
WHERE `e`.`EvaluationId` = '21'
