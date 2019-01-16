<?php

class GenerateEvaluation_model extends CI_Model
 {	
	public function getUsers() {
        $this->db->select('u.UserId as value,u.RoleId,u.JobId,u.LineManagerId,CASE
		WHEN u.RoleId = 1 THEN CONCAT(u.FirstName," ",u.LastName," ","(Admin)")
		WHEN u.RoleId = 2 THEN CONCAT(u.FirstName," ",u.LastName," ","(HR)")
		ELSE CONCAT(u.FirstName," ",u.LastName)
		END as label,u.MiddleName,u.EmployeeId,u.EmailAddress,u.IsActive');
		$this->db->order_by('u.FirstName','asc');
		$result = $this->db->get('tbluser as u');	
		$res = array();
		if($result->result()) {
			$res = $result->result();
		}
		return $res;
    }
    public function getEvaluationTypes() {
        $this->db->select('et.EvaluationTypeId,et.EvaluationTypeName,et.IsActive');
		$this->db->order_by('et.EvaluationTypeName','asc');
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
		$result=$this->db->query("SELECT e.EvaluationId,(SELECT COUNT(ee.EvaluatorId) FROM tblmstempevaluator ee WHERE ee.EvaluationId=e.EvaluationId and ee.EvaluatorId=e.UserId) as self,e.UserId,e.EvaluationTypeId,e.ExpirationDate,e.EvaluationDate,e.EmployeeEmailNote,e.EvaluatorEmailNote,e.IsActive,
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

	public function statusChange($post_data) {
		try{
			if($post_data) {
				if(trim($post_data['StatusId'])==1){
					$StatusId = 1;
				} else {
					$StatusId = 2;
				}
				$data = array(
					'StatusId' => $StatusId,
					'UpdatedBy' => $post_data['UpdatedBy'],
					'UpdatedOn' => date('y-m-d H:i:s'),
				);			
				$this->db->where('EmployeeEvaluatorId',trim($post_data['EmployeeEvaluatorId']));
				$res = $this->db->update('tblmstempevaluator',$data);
				$db_error = $this->db->error();
				if (!empty($db_error) && !empty($db_error['code'])) { 
					throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
					return false; // unreachable return statement !!!
				}
				if($res) {
					$log_data = array(
						'UserId' => trim($post_data['UpdatedBy']),
						'Module' => 'Evaluation',
						'Activity' =>'Change Evaluation Status to '.$StatusId.' of EmployeeEvaluatorId = '.$post_data['EmployeeEvaluatorId']
					);
					$log = $this->db->insert('tblactivitylog',$log_data);
					return true;
				} else {
					return false;
				}
			} else {
				return false;
			}	
		}catch(Exception $e){
			trigger_error($e->getMessage(), E_USER_ERROR);
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
					$log_data = array(
						'UserId' => trim($post_revoke['UserId']),
						'Module' => 'Evaluation',
						'Activity' =>'Revoke Evaluation - EvaluationId = '.$post_revoke['evaluationid']
					);
					$log = $this->db->insert('tblactivitylog',$log_data);
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
						$log_data = array(
							'UserId' => trim($post_revoke['UserId']),
							'Module' => 'Evaluation',
							'Activity' =>'Revoke Evaluator - EvaluatorId = '.$post_revoke['EvaluatorId']
						);
						$log = $this->db->insert('tblactivitylog',$log_data);
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
		$this->db->select('CONCAT(u.FirstName," ",u.LastName) as Name,jt.JobTitle,e.EvaluationId,e.UserId,e.EvaluationTypeId,e.ExpirationDate,e.EvaluationDate,e.EmployeeEmailNote,e.EvaluatorEmailNote,e.EvaluationNote,et.EvaluationTypeName');
		$this->db->join('tblmstevaluationtype et','et.EvaluationTypeId=e.EvaluationTypeId','left');
		//$this->db->join('tblmstempevaluator ee','(ee.EvaluationId=e.EvaluationId) AND (ee.EvaluatorId=e.UserId)','left');
		$this->db->join('tbluser u','u.UserId=e.UserId','left');
		$this->db->join('tblmstjob jt','jt.JobId=u.JobId','left');
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
		$this->db->select('CONCAT(u.FirstName," ",u.LastName) as Name,jt.JobTitle,ee.EmployeeEvaluatorId,ee.EvaluatorId,ee.StatusId,ee.EvaluatorType');
		$this->db->join('tbluser u','u.UserId=ee.EvaluatorId','left');
		$this->db->join('tblmstjob jt','jt.JobId=u.JobId','left');
		$this->db->where('ee.EvaluationId',$post_data['EvaluationId']);
		$this->db->order_by('Name','asc');
		$result = $this->db->get('tblmstempevaluator as ee');	
		$res = array();
		if($result->result()) {
			$res = $result->result();
		}
		return $res;
	}

	public function getEvaluationNote($post_data) {
		$this->db->select('ee.EvaluationNote');
		$this->db->where('ee.EvaluationId',$post_data['EvaluationId']);
		$result = $this->db->get('tblmstempevaluation as ee');	
		$res = array();
		foreach($result->result() as $row) {
			$res = $row->EvaluationNote;
		}
		return $res;
	}

	public function addEvaluationNote($post_EvaluationNote)
	{	
		try{
			if($post_EvaluationNote) {
				
				$evaluation_data=array(
				"EvaluationNote"=>trim($post_EvaluationNote['EvaluationNote']),
				"UpdatedBy"=>trim($post_EvaluationNote['UpdatedBy'])
				);
				$this->db->where('EvaluationId',trim($post_EvaluationNote['EvaluationId']));
				$res=$this->db->update('tblmstempevaluation',$evaluation_data);
				$db_error = $this->db->error();
				if (!empty($db_error) && !empty($db_error['code'])) { 
					throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
					return false; // unreachable return statement !!!
				}
				if($res) {
					$log_data = array(
						'UserId' => trim($post_EvaluationNote['UpdatedBy']),
						'Module' => 'Evaluation',
						'Activity' =>'Add Evaluation Note - EvaluationId = '.$post_EvaluationNote['EvaluationId']
					);
					$log = $this->db->insert('tblactivitylog',$log_data);
					return true;
				} else {
					return false;
				}
			}
			else
			{
				return false;
			}
		}catch(Exception $e){
			trigger_error($e->getMessage(), E_USER_ERROR);
			return false;
		}	
	}
	
	public function get_invimsg()
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
			$this->db->select('uu.UserId,uu.RoleId,uu.JobId,uu.LineManagerId,CONCAT(uu.FirstName," ",uu.LastName) as LineManagerName,uu.MiddleName,uu.EmployeeId,uu.EmailAddress,uu.IsActive');
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
			if($post_generate['EmployeeEmailNote'] == null) {
				$EmployeeEmailNote = 'Not mentioned!';
			} else {
				$EmployeeEmailNote = trim($post_generate['EmployeeEmailNote']);
			}
			if($post_generate['EvaluatorEmailNote'] == null) {
				$EvaluatorEmailNote = 'Not mentioned!';
			} else {
				$EvaluatorEmailNote = trim($post_generate['EvaluatorEmailNote']);
			}
			$ExpirationDate = strtotime($post_generate['ExpirationDate']);
			$EvaluationDate = strtotime($post_generate['EvaluationDate']);
				$generate_data = array(
					'UserId' =>  trim($post_generate['UserId']),
					'EvaluationTypeId' =>  trim($post_generate['EvaluationTypeId']),
					'EvaluationDate' =>  date('Y-m-d H:i:s', $EvaluationDate),
					'ExpirationDate' =>  date('Y-m-d H:i:s', $ExpirationDate),
					'EmployeeEmailNote' =>  $EmployeeEmailNote,
					'EvaluatorEmailNote' =>  $EvaluatorEmailNote,
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

					$log_data = array(
						'UserId' => trim($post_generate['CreatedBy']),
						'Module' => 'Evaluation',
						'Activity' =>'Generate Evaluation of UserId = '.$post_generate['UserId'].' (EvaluationId = '.$evaluationid.')'
					);
					$log = $this->db->insert('tblactivitylog',$log_data);
					
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
					if($res) {
						$log_data = array(
							'UserId' => $post_generate['CreatedBy'],
							'Module' => 'Evaluation',
							'Activity' =>'Assign Evaluator (UserId - '.$id.') to Evaluation (EvaluationId - '.$evaluationid.')'
						);
						$log = $this->db->insert('tblactivitylog',$log_data);
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
			if($post_generate['EmployeeEmailNote'] == null) {
				$EmployeeEmailNote = 'Not mentioned!';
			} else {
				$EmployeeEmailNote = trim($post_generate['EmployeeEmailNote']);
			}
			if($post_generate['EvaluatorEmailNote'] == null) {
				$EvaluatorEmailNote = 'Not mentioned!';
			} else {
				$EvaluatorEmailNote = trim($post_generate['EvaluatorEmailNote']);
			}
			$ExpirationDate = strtotime($post_generate['ExpirationDate']);
				$generate_data = array(
					'UserId' =>  trim($post_generate['UserId']),
					'EvaluationTypeId' =>  trim($post_generate['EvaluationTypeId']),
					'ExpirationDate' =>  date('Y-m-d H:i:s', $ExpirationDate),
					'EmployeeEmailNote' =>  $EmployeeEmailNote,
					'EvaluatorEmailNote' =>  $EvaluatorEmailNote,
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

					// if(trim($post_generate['Check'])==1){
					// 	array_push($post_generate['EvaluatorsId'],$post_generate['UserId']);
					// }
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