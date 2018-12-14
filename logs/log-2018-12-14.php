ERROR - 2018-12-14 17:30:08 --> Query error: Unknown column 'tmq.QuestionTypeId' in 'on clause' - Invalid query: SELECT `tmq`.`QuestionId`, COALESCE(tmet.EvaluationTypeName, "All (Common for all Evaluation)") as EvaluationType, `tmq`.`QuestionText`, `tmc`.`DisplayText` as `QuestionType`, `tmq`.`IsActive`, (SELECT COUNT(tea.EvaluationAnswerId) FROM tblevaluationanswer as tea WHERE tmq.QuestionId=tea.QuestionId) as isdisabled
FROM `tblmstquestion` `tmq`
LEFT JOIN `tblmstevaluationtype` `tmet` ON `tmet`.`EvaluationTypeId`=`tmq`.`EvaluationTypeId`
LEFT JOIN `tblmstconfiguration` `tmc` ON `tmc`.`Value`=`tmq`.`QuestionTypeId`
WHERE `tmc`.`Key` = 'AnswerType'
ORDER BY `tmq`.`QuestionId`
