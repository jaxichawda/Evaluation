<?php

class GenerateEvaluation_model extends CI_Model
 {	
	public function getUsers() {
        $this->db->select('u.UserId as value,u.RoleId,u.JobTitleId,u.LineManagerId,CONCAT(u.FirstName," ",u.LastName) as label,u.MiddleName,u.EmployeeId,u.EmailAddress,u.IsActive');
		$this->db->order_by('u.UserId','asc');
		$result = $this->db->get('tbluser as u');	
		$res = array();
		if($result->result()) {
			$res = $result->result();
		}
		return $res;
    }
    public function getEvaluationTypes() {
        $this->db->select('et.EvaluationTypeId,et.EvaluationTypeName,et.IsActive');
		$this->db->order_by('et.EvaluationTypeId','asc');
		$result = $this->db->get('tblmstevaluationtype as et');	
		$res = array();
		if($result->result()) {
			$res = $result->result();
		}
		return $res;
    }
}