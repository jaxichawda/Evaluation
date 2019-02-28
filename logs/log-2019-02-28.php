<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

ERROR - 2019-02-28 11:29:55 --> Query error: Table 'evaluation.tblmstempevaluator' doesn't exist - Invalid query: select ee.EmployeeEvaluatorId,ee.EvaluationId,ee.EvaluatorId,ee.StatusId,ee.EvaluatorType,e.UserId,e.EvaluationTypeId,e.ExpirationDate,e.EvaluationDate,et.EvaluationTypeName,u.FirstName,u.LastName from tblmstempevaluator as ee left join tblmstempevaluation as e on (e.EvaluationId=ee.EvaluationId) left join tblmstevaluationtype as et on (e.EvaluationTypeId=et.EvaluationTypeId)
          LEFT join tbluser as u on (u.UserId=e.UserId) where ee.EvaluatorId=1
          ORDER BY CASE WHEN e.UserId=1 THEN e.UserId END DESC
