<?php

class Remaining_model extends CI_Model {
	
	public function getEvaluation($remaining)
	{
		$result = $this->db->query('
		select ee.EvaluatorId, e.UserId, e.EvaluationDate,et.EvaluationTypeName,u.FirstName,u.LastName, uu.EmailAddress
		from tblmstempevaluation as e
		left join  tblmstempevaluator as ee 
		on (e.EvaluationId=ee.EvaluationId) 
		left join tblmstevaluationtype as et 
		on (e.EvaluationTypeId=et.EvaluationTypeId)
		LEFT join tbluser as uu
		on (uu.UserId=ee.EvaluatorId)
		LEFT join tbluser as u
		on (u.UserId=e.UserId)
		WHERE ee.StatusId!=1 && DATE(e.EvaluationDate) = "'.$remaining.'"
		;');

		$res = array();
          	if($result->result()) {
              	$res = $result->result();
          	}
        return $res;
	}
}
