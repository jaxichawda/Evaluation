<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

ERROR - 2018-12-14 18:48:13 --> Invalid query: 
ERROR - 2018-12-14 18:48:38 --> Query error: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SELECT
			  GROUP_CONCAT(DISTINCT
				CONCAT(
				  'max(case when col = ''',' at line 2 - Invalid query: SET @sql = NULL;
			SELECT
			  GROUP_CONCAT(DISTINCT
				CONCAT(
				  'max(case when col = ''',
				  col,
				  ''' then value end) as `', 
				  col, '`')
			  ) INTO @sql
			FROM
			(
			  select concat('Employee', `EmployeeEvaluatorId`) col
			  from tblmstempevaluator  where EvaluationId = 21
			)a;
								 
			
			SET @sql = CONCAT('SELECT a.QuestionId,b.QuestionText, ', @sql, ' 
							  from
							  (
								select QuestionId,EmployeeEvaluatorId, concat(''Employee'', `EmployeeEvaluatorId`) col,  AnswerText value
								from tblevaluationanswer 
							  ) a left join tblmstquestion b on a.QuestionId = b.QuestionId
								  left join tblmstempevaluator c on a.EmployeeEvaluatorId = c.EmployeeEvaluatorId
								  where c.EvaluationId = 21
							  group by a.QuestionId');
			
			PREPARE stmt FROM @sql;
			EXECUTE stmt;
			DEALLOCATE PREPARE stmt;
ERROR - 2018-12-14 18:49:15 --> Query error: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SELECT
			  GROUP_CONCAT(DISTINCT
				CONCAT(
				  'max(case when col = ''',' at line 2 - Invalid query: SET @sql = NULL;
			SELECT
			  GROUP_CONCAT(DISTINCT
				CONCAT(
				  'max(case when col = ''',
				  col,
				  ''' then value end) as `', 
				  col, '`')
			  ) INTO @sql
			FROM
			(
			  select concat('Employee', `EmployeeEvaluatorId`) col
			  from tblmstempevaluator  where EvaluationId = 21
			)a;
								 
			
			SET @sql = CONCAT('SELECT a.QuestionId,b.QuestionText, ', @sql, ' 
							  from
							  (
								select QuestionId,EmployeeEvaluatorId, concat(''Employee'', `EmployeeEvaluatorId`) col,  AnswerText value
								from tblevaluationanswer 
							  ) a left join tblmstquestion b on a.QuestionId = b.QuestionId
								  left join tblmstempevaluator c on a.EmployeeEvaluatorId = c.EmployeeEvaluatorId
								  where c.EvaluationId = 21
							  group by a.QuestionId');
			
			PREPARE stmt FROM @sql;
			EXECUTE stmt;
			DEALLOCATE PREPARE stmt;
ERROR - 2018-12-14 19:35:29 --> Query error: Commands out of sync; you can't run this command now - Invalid query: SELECT a.EvaluatorId, CONCAT(b.FirstName,' ',b.LastName) FROM tblmstempevaluator a left join tbluser b on a.EvaluatorId=b.UserId WHERE EvaluationId=21
ERROR - 2018-12-14 19:35:49 --> Query error: Commands out of sync; you can't run this command now - Invalid query: SELECT a.EvaluatorId, CONCAT(b.FirstName,' ',b.LastName) FROM tblmstempevaluator a left join tbluser b on a.EvaluatorId=b.UserId WHERE EvaluationId=21
ERROR - 2018-12-14 19:55:10 --> Query error: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'NULL' at line 1 - Invalid query: call getReport1('22')
ERROR - 2018-12-14 19:56:51 --> Query error: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'NULL' at line 1 - Invalid query: call getReport1('22')
