ERROR - 2018-12-14 14:32:20 --> Query error: Expression #9 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'evaluation.ee.StatusId' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by - Invalid query: SELECT CONCAT(u.FirstName, " ", u.LastName) as Name, `jt`.`JobTitleName`, `e`.`EvaluationId`, `e`.`UserId`, `e`.`EvaluationTypeId`, `e`.`EvaluationDate`, `e`.`EvaluationDescription`, `et`.`EvaluationTypeName`, `ee`.`StatusId`
FROM `tblmstempevaluation` as `e`
LEFT JOIN `tblmstevaluationtype` `et` ON `et`.`EvaluationTypeId`=`e`.`EvaluationTypeId`
LEFT JOIN `tblmstempevaluator` `ee` ON (`ee`.`EvaluationId`=e.EvaluationId) AND (`ee`.`EvaluatorId`=e.UserId)
LEFT JOIN `tbluser` `u` ON `u`.`UserId`=`e`.`UserId`
LEFT JOIN `tblmstjobtitle` `jt` ON `jt`.`JobTitleId`=`u`.`JobTitleId`
GROUP BY `e`.`EvaluationId`
ORDER BY `e`.`EvaluationId` ASC
ERROR - 2018-12-14 16:34:05 --> Query error: Unknown column 'tmq.EvaluationTypeId' in 'on clause' - Invalid query: SELECT `tmq`.`QuestionId`, COALESCE(tmet.EvaluationTypeName, "All (Common for all Evaluation)") as EvaluationType, `tmq`.`QuestionText`, `tmc`.`DisplayText` as `QuestionType`, `tmq`.`IsActive`, (SELECT COUNT(tea.EvaluationAnswerId) FROM tblevaluationanswer as tea WHERE tmq.QuestionId=tea.QuestionId) as isdisabled
FROM `tblmstquestion` `tmq`
LEFT JOIN `tblmstevaluationtype` `tmet` ON `tmet`.`EvaluationTypeId`=`tmq`.`EvaluationTypeId`
LEFT JOIN `tblmstconfiguration` `tmc` ON `tmc`.`Value`=`tmq`.`QuestionTypeId`
WHERE `tmc`.`Key` = 'AnswerType'
ORDER BY `tmq`.`QuestionId`
