<?php

class GenerateEvaluation_model extends CI_Model
 {	
	public function getUsers() {
        $this->db->select('u.UserId as value,u.RoleId,u.JobTitleId,u.LineManagerId,CASE
		WHEN u.RoleId = 1 THEN CONCAT(u.FirstName," ",u.LastName," ","(Admin)")
		WHEN u.RoleId = 2 THEN CONCAT(u.FirstName," ",u.LastName," ","(HR)")
		ELSE CONCAT(u.FirstName," ",u.LastName)
		END as label,u.MiddleName,u.EmployeeId,u.EmailAddress,u.IsActive');
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
	public function getEvaluationById($evaluationId=Null)
	{
	  if($evaluationId)
	  {
		$result=$this->db->query("SELECT e.EvaluationId,(SELECT COUNT(ee.EvaluatorId) FROM tblmstempevaluator ee WHERE ee.EvaluationId=e.EvaluationId and ee.EvaluatorId=e.UserId) as self,e.UserId,e.EvaluationTypeId,e.EvaluationDate,e.EvaluationDescription,e.IsActive,
		GROUP_CONCAT(ee.EvaluatorId) evalutor FROM tblmstempevaluation as e INNER JOIN tblmstempevaluator as ee on find_in_set(ee.EvaluationId, e.EvaluationId) > 0  Where e.EvaluationId=".$evaluationId." GROUP BY e.EvaluationId;");
		 $evaluation_data= array();
		 $array = json_decode(json_encode($result->result()), True);
		 foreach($array as $row)
		 {
			$row['evalutor']=explode(",",$row['evalutor']);
			$evaluation_data=$row;
		 }
		 return $evaluation_data;
	  }
	  else
	  {
		  return false;
	  }
	}
	public function revokeEvaluation($post_revoke) {
		try{
		if($post_revoke) {
				$evaluation_data = array(
					'StatusId' => 3,
					'UpdatedBy' => $post_revoke['UserId'],
					'UpdatedOn' => date('y-m-d H:i:s')
				);
				$this->db->where('EvaluationId',$post_revoke['evaluationid']);
				$res = $this->db->update('tblmstempevaluator',$evaluation_data);
				$db_error = $this->db->error();
					if (!empty($db_error) && !empty($db_error['code'])) { 
						throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
						return false; // unreachable return statement !!!
					}
				if($res) {
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
		public function revokeEvaluator($post_revoke) {
			try{
			if($post_revoke) {
					$evaluation_data = array(
						'StatusId' => 3,
						'UpdatedBy' => $post_revoke['UserId'],
						'UpdatedOn' => date('y-m-d H:i:s')
					);
					$this->db->where('EvaluatorId',$post_revoke['EvaluatorId']);
					$res = $this->db->update('tblmstempevaluator',$evaluation_data);
					$db_error = $this->db->error();
						if (!empty($db_error) && !empty($db_error['code'])) { 
							throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
							return false; // unreachable return statement !!!
						}
					if($res) {
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
	public function getAllEvaluation() {
		$this->db->select('CONCAT(u.FirstName," ",u.LastName) as Name,jt.JobTitleName,e.EvaluationId,e.UserId,e.EvaluationTypeId,e.EvaluationDate,e.EvaluationDescription,et.EvaluationTypeName');
		$this->db->join('tblmstevaluationtype et','et.EvaluationTypeId=e.EvaluationTypeId','left');
		//$this->db->join('tblmstempevaluator ee','(ee.EvaluationId=e.EvaluationId) AND (ee.EvaluatorId=e.UserId)','left');
		$this->db->join('tbluser u','u.UserId=e.UserId','left');
		$this->db->join('tblmstjobtitle jt','jt.JobTitleId=u.JobTitleId','left');
		$this->db->order_by('e.EvaluationId','asc');
		//$this->db->group_by('e.EvaluationId');
		$result = $this->db->get('tblmstempevaluation as e');	
		$res = array();
		if($result->result()) {
			$res = $result->result();
		}
		return $res;
	}
	public function getEvaluators($post_data) {
		$this->db->select('CONCAT(u.FirstName," ",u.LastName) as Name,jt.JobTitleName,ee.EmployeeEvaluatorId,ee.EvaluatorId,ee.StatusId');
		$this->db->join('tbluser u','u.UserId=ee.EvaluatorId','left');
		$this->db->join('tblmstjobtitle jt','jt.JobTitleId=u.JobTitleId','left');
		$this->db->where('ee.EvaluationId',$post_data['EvaluationId']);
		$this->db->where('ee.EvaluatorId!=',$post_data['UserId']);
		$this->db->order_by('ee.EmployeeEvaluatorId','asc');
		//$this->db->group_by('ee.EvaluationId');
		$result = $this->db->get('tblmstempevaluator as ee');	
		$res = array();
		if($result->result()) {
			$res = $result->result();
		}
		return $res;
	}
	public	function get_invimsg()
	{
		try{
		$this->db->select('ConfigurationId,Key,Value,DisplayText');
		$this->db->where('Key','EvaluationStatus');
		$this->db->where('Value','0');
		$result1=$this->db->get('tblmstconfiguration');
		$db_error = $this->db->error();
				if (!empty($db_error) && !empty($db_error['code'])) { 
					throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
					return false; // unreachable return statement !!!
				}
		
		$this->db->select('ConfigurationId,Key,Value,DisplayText');
		$this->db->where('Key','EvaluationStatus');
		$this->db->where('Value','1');
		$result2 = $this->db->get('tblmstconfiguration');
		$db_error = $this->db->error();
				if (!empty($db_error) && !empty($db_error['code'])) { 
					throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
					return false; // unreachable return statement !!!
				}
		$this->db->select('ConfigurationId,Key,Value,DisplayText');
		$this->db->where('Key','EvaluationStatus');
		$this->db->where('Value','2');
		$result3 = $this->db->get('tblmstconfiguration');
		$db_error = $this->db->error();
				if (!empty($db_error) && !empty($db_error['code'])) { 
					throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
					return false; // unreachable return statement !!!
				}
		$this->db->select('ConfigurationId,Key,Value,DisplayText');
		$this->db->where('Key','EvaluationStatus');
		$this->db->where('Value','3');
		$result4 = $this->db->get('tblmstconfiguration');
		$db_error = $this->db->error();
				if (!empty($db_error) && !empty($db_error['code'])) { 
					throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
					return false; // unreachable return statement !!!
				}
		foreach($result1->result() as $row) {
			$res['pending'] = $row->DisplayText;
		}
		foreach($result2->result() as $row) {
			$res['submitted'] = $row->DisplayText;
		}
		foreach($result3->result() as $row) {
			$res['inprogress'] = $row->DisplayText;
		}
		foreach($result4->result() as $row) {
			$res['revoked'] = $row->DisplayText;
		}
		return $res;
	}
	catch(Exception $e){
		trigger_error($e->getMessage(), E_USER_ERROR);
		return false;
	}
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
			$EvaluationDate = strtotime($post_generate['EvaluationDate']);
				$generate_data = array(
					'UserId' =>  trim($post_generate['UserId']),
					'EvaluationTypeId' =>  trim($post_generate['EvaluationTypeId']),
					'EvaluationDate' =>  date('Y-m-d H:i:s', $EvaluationDate),
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
					// if(trim($post_generate['Check'])==1){
					// 	array_push($post_generate['EvaluatorsId'],$post_generate['UserId']);
					// }
					foreach($post_generate['EvaluatorsId'] as $id){
					$evaluator_data = array(
						'EvaluationId' =>  $evaluationid,
						'EvaluatorId' =>  $id,
						'StatusId' =>  0,
						'IsActive' =>  $IsActive,
						'CreatedBy' => trim($post_generate['CreatedBy']),
						'CreatedOn' => date('y-m-d H:i:s'),
						'UpdatedBy' => trim($post_generate['UpdatedBy']),
						'UpdatedOn' => date('y-m-d H:i:s')
					);
					$res = $this->db->insert('tblmstempevaluator',$evaluator_data);
					$db_error = $this->db->error();
					if (!empty($db_error) && !empty($db_error['code'])) { 
						throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
						return false; // unreachable return statement !!!
					}
				}
					return $evaluationid;
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
	public function regenerate_Evaluation($post_generate) {
		try{
		if($post_generate) {
			if(trim($post_generate['IsActive'])==1){
				$IsActive = true;
			} else {
				$IsActive = false;
			}
			$EvaluationDate = strtotime($post_generate['EvaluationDate']);
				$generate_data = array(
					'UserId' =>  trim($post_generate['UserId']),
					'EvaluationTypeId' =>  trim($post_generate['EvaluationTypeId']),
					'EvaluationDate' =>  date('Y-m-d H:i:s', $EvaluationDate),
					'EvaluationDescription' =>  trim($post_generate['EvaluationDescription']),
					'IsActive' =>  $IsActive,
					'UpdatedBy' => trim($post_generate['UpdatedBy']),
					'UpdatedOn' => date('y-m-d H:i:s'),
				);
				$this->db->where('EvaluationId',trim($post_generate['EvaluationId']));
				$res = $this->db->update('tblmstempevaluation',$generate_data);
				$db_error = $this->db->error();
				if (!empty($db_error) && !empty($db_error['code'])) { 
					throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
					return false; // unreachable return statement !!!
				}
				if($res) {
					//$evaluationid = $this->db->insert_id();
					$this->db->where('EvaluationId',$post_generate['EvaluationId']);
					$res = $this->db->delete('tblmstempevaluator');

					if(trim($post_generate['Check'])==1){
						array_push($post_generate['EvaluatorsId'],$post_generate['UserId']);
					}
					foreach($post_generate['EvaluatorsId'] as $id){
					$evaluator_data = array(
						'EvaluationId' =>  $post_generate['EvaluationId'],
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
					return $post_generate['EvaluationId'];
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