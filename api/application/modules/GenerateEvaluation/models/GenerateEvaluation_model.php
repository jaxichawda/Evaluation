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
	public function getReportingEmployee($id = NULL) {
		try{
		if($id) {
			
			//$this->db->select('u.LineManagerId,(SELECT uu.FirstName FROM tbluser as uu where uu.UserId=u.LineManagerId) as LineManagerName');
			$this->db->select('uu.UserId,uu.RoleId,uu.JobTitleId,uu.LineManagerId,CONCAT(uu.FirstName," ",uu.LastName) as LineManagerName,uu.MiddleName,uu.EmployeeId,uu.EmailAddress,uu.IsActive');
			$this->db->join('tbluser uu','uu.UserId=u.LineManagerId','inner');
			$this->db->where('u.UserId',$id);
			$result = $this->db->get('tbluser as u');
			$db_error = $this->db->error();
				if (!empty($db_error) && !empty($db_error['code'])) { 
					throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
					return false; // unreachable return statement !!!
				}
			$data = array();
			foreach($result->result() as $row) {
				$data = $row;
			}
			return $data;
			
		} else {
			return false;
		}
	}
	catch(Exception $e){
		trigger_error($e->getMessage(), E_USER_ERROR);
		return false;
	}	
	}
	public function generate_Evaluation($post_generate) {
		try{
		if($post_generate) {
			if(trim($post_generate['IsActive'])==1){
				$IsActive = true;
			} else {
				$IsActive = false;
			}
				$generate_data = array(
					'UserId' =>  trim($post_generate['UserId']),
					'EvaluationTypeId' =>  trim($post_generate['EvaluationTypeId']),
					'EvaluationDate' =>  $post_generate['EvaluationDate'],
					'EvaluationDescription' =>  trim($post_generate['EvaluationDescription']),
					'IsActive' =>  $IsActive,
					'CreatedBy' => trim($post_generate['CreatedBy']),
					'CreatedOn' => date('y-m-d H:i:s'),
					'UpdatedBy' => trim($post_generate['UpdatedBy']),
					'UpdatedOn' => date('y-m-d H:i:s'),
				);
				$res = $this->db->insert('tblmstempevaluation',$generate_data);
				$db_error = $this->db->error();
				if (!empty($db_error) && !empty($db_error['code'])) { 
					throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
					return false; // unreachable return statement !!!
				}
				if($res) {
					$evaluationid = $this->db->insert_id();
					if(trim($post_generate['Check'])==1){
						array_push($post_generate['EvaluatorsId'],$post_generate['UserId']);
					}
					foreach($post_generate['EvaluatorsId'] as $id){
					$evaluator_data = array(
						'EvaluationId' =>  $evaluationid,
						'EvaluatorId' =>  $id,
						'StatusId' =>  0,
						'IsActive' =>  $IsActive,
						'UpdatedBy' => trim($generate_data['UpdatedBy']),
						'UpdatedOn' => date('y-m-d H:i:s')
					);
					$res = $this->db->insert('tblmstempevaluator',$evaluator_data);
					$db_error = $this->db->error();
					if (!empty($db_error) && !empty($db_error['code'])) { 
						throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
						return false; // unreachable return statement !!!
					}
				}
					return true;
				} else {
					return false;
				}
				
		} else {
			return false;
		}
	}
	catch(Exception $e){
		trigger_error($e->getMessage(), E_USER_ERROR);
		return false;
	}
	}
}