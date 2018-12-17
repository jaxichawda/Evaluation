<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

ERROR - 2018-12-17 15:10:39 --> Query error: Unknown column 'tmq.EvaluationTypeId' in 'on clause' - Invalid query: SELECT `tmq`.`QuestionId`, COALESCE(tmet.EvaluationTypeName, "All (Common for all Evaluation)") as EvaluationType, `tmq`.`QuestionText`, `tmc`.`DisplayText` as `QuestionType`, `tmq`.`IsActive`, (SELECT COUNT(tea.EvaluationAnswerId) FROM tblevaluationanswer as tea WHERE tmq.QuestionId=tea.QuestionId) as isdisabled
FROM `tblmstquestion` `tmq`
LEFT JOIN `tblmstevaluationtype` `tmet` ON `tmet`.`EvaluationTypeId`=`tmq`.`EvaluationTypeId`
LEFT JOIN `tblmstconfiguration` `tmc` ON `tmc`.`Value`=`tmq`.`AnswerTypeId`
WHERE `tmc`.`Key` = 'AnswerType'
ORDER BY `tmq`.`QuestionId`
ERROR - 2018-12-17 15:13:00 --> Query error: Unknown column 'tmq.EvaluationTypeId' in 'on clause' - Invalid query: SELECT `tmq`.`QuestionId`, COALESCE(tmet.EvaluationTypeName, "All (Common for all Evaluation)") as EvaluationType, `tmq`.`QuestionText`, `tmc`.`DisplayText` as `QuestionType`, `tmq`.`IsActive`, (SELECT COUNT(tea.EvaluationAnswerId) FROM tblevaluationanswer as tea WHERE tmq.QuestionId=tea.QuestionId) as isdisabled
FROM `tblmstquestion` `tmq`
LEFT JOIN `tblmstevaluationtype` `tmet` ON `tmet`.`EvaluationTypeId`=`tmq`.`EvaluationTypeId`
LEFT JOIN `tblmstconfiguration` `tmc` ON `tmc`.`Value`=`tmq`.`AnswerTypeId`
WHERE `tmc`.`Key` = 'AnswerType'
ORDER BY `tmq`.`QuestionId`
