<?php

class Dashboard_model extends CI_Model {
    public function getEvaluationsById($UserId=Null)
	{
	  if($UserId)
	  {
        $result = $this->db->query('select ee.EmployeeEvaluatorId,ee.EvaluationId,ee.EvaluatorId,ee.StatusId,e.UserId,e.EvaluationTypeId,e.EvaluationDate,e.EvaluationDescription,et.EvaluationTypeName,u.FirstName,u.LastName from tblmstempevaluator as ee left join tblmstempevaluation as e on (e.EvaluationId=ee.EvaluationId) left join tblmstevaluationtype as et on (e.EvaluationTypeId=et.EvaluationTypeId)
          LEFT join tbluser as u on (u.UserId=e.UserId) where ee.EvaluatorId='.$UserId);
		
          $res = array();
          if($result->result()) {
              $res = $result->result();
          }
          return $res;
        }
    }
    public function insertQuestions($Id=Null)
	{
	  if($Id)
	  {      
        $result1 = $this->db->query("INSERT INTO tblevaluationanswer (EmployeeEvaluatorId, QuestionId) SELECT ".$Id.",QuestionId FROM tblmstquestion");
        
        if($result1) {
            return true; 
        }
        else{
            return false;
        }
        
    }
}
}
?>