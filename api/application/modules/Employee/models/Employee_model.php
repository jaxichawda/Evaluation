<?php

class Employee_model extends CI_Model {

	public function addEmployee($post_Employee)
	{	
		try{
			if($post_Employee) {
					$this->db->select('UserId,EmailAddress');
					$this->db->where('EmailAddress',trim($post_Employee['EmailAddress']));
					$this->db->limit(1);
					$this->db->from('tbluser');
					$query = $this->db->get();
					
					if ($query->num_rows() != 1) {
						if($post_Employee['IsActive']==1) {
							$IsActive = true;
						} else {
							$IsActive = false;
						}
						if(isset($post_Employee['MiddleName']) && !empty($post_Employee['MiddleName'])) {
							$MiddleName = $post_Employee['MiddleName'];
						}	else {
							$MiddleName = '';
						}
						if(isset($post_Employee['EmployeeId']) && !empty($post_Employee['EmployeeId'])) {
							$EmployeeId = $post_Employee['EmployeeId'];
						}	else {
							$EmployeeId = '';
						}
						if(isset($post_Employee['LineManagerId']) && !empty($post_Employee['LineManagerId'])) {
							$LineManagerId = $post_Employee['LineManagerId'];
						}	else {
							$LineManagerId = '';
						}
						$employee_data=array(
						"RoleId"=>trim($post_Employee['RoleId']),
						"JobTitleId"=>trim($post_Employee['JobTitleId']),
						"LineManagerId"=>$LineManagerId,
						"FirstName"=>trim($post_Employee['FirstName']),
						"MiddleName"=>$MiddleName,
						"LastName"=>trim($post_Employee['LastName']),
						"EmployeeId"=>$EmployeeId,
						"EmailAddress"=>trim($post_Employee['EmailAddress']),
						"Password"=>md5(trim($post_Employee['Password'])),
						"IsActive"=>$IsActive,
						"CreatedBy" => trim($post_Employee['CreatedBy']),
						"CreatedOn" =>date('y-m-d H:i:s')
						);
						$res=$this->db->insert('tbluser',$employee_data);
						$UserId = $this->db->insert_id();
						$db_error = $this->db->error();
						if (!empty($db_error) && !empty($db_error['code'])) { 
							throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
							return false; // unreachable return statement !!!
						}
						if($res) {
							return $UserId;
						} else {
							return false;
						}
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
	public function getAllEmployee()
	{
		try{
			$this->db->select('tu.UserId, tmur.RoleName, tmjt.JobTitleName, tu.FirstName, tu.MiddleName, tu.LastName, tu.EmployeeId, tu.EmailAddress, tu.IsActive, CONCAT (tuu.FirstName, " ", tuu.LastName) as LineManager, (SELECT COUNT(tmee.EmployeeEvaluatorId) FROM tblmstempevaluator as tmee WHERE tu.UserId=tmee.EvaluatorId) as isdisabled');
			$this->db->from('tbluser tu');
			$this->db->join('tblmstuserrole tmur', 'tu.RoleId = tmur.RoleId', 'LEFT');
			$this->db->join('tblmstjobtitle tmjt', 'tu.JobTitleId = tmjt.JobTitleId', 'LEFT');
			$this->db->join('tbluser tuu', 'tuu.UserId=tu.LineManagerId', 'LEFT');
			$result = $this->db->get();
			$db_error = $this->db->error();
					if (!empty($db_error) && !empty($db_error['code'])) { 
						throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
						return false; // unreachable return statement !!!
					}
			$res=array();
			if($result->result())
			{
				$res=$result->result();
			}
			return $res;
		}catch(Exception $e){
			trigger_error($e->getMessage(), E_USER_ERROR);
			return false;
		}	
	}
	public function getAllJobTitle() 
	{
		try{
			$this->db->select('JobTitleId, JobTitleName');
			$this->db->where('IsActive',1);
			$this->db->order_by('JobTitleName','asc');
			$result = $this->db->get('tblmstjobtitle');
			$db_error = $this->db->error();
					if (!empty($db_error) && !empty($db_error['code'])) { 
						throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
						return false; // unreachable return statement !!!
					}
			$res=array();
			if($result->result())
			{
				$res=$result->result();
			}
			return $res;
		}catch(Exception $e){
			trigger_error($e->getMessage(), E_USER_ERROR);
			return false;
		}
	}
	public function getAllRole() 
	{
		try{
			$this->db->select('RoleId, RoleName');
			$this->db->where('IsActive',1);
			$this->db->where('RoleName !=','Admin');
			$this->db->order_by('RoleName','asc');
			$result = $this->db->get('tblmstuserrole');
			$db_error = $this->db->error();
					if (!empty($db_error) && !empty($db_error['code'])) { 
						throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
						return false; // unreachable return statement !!!
					}
			$res=array();
			if($result->result())
			{
				$res=$result->result();
			}
			return $res;
		}catch(Exception $e){
			trigger_error($e->getMessage(), E_USER_ERROR);
			return false;
		}
	}
	public function getAllLineManager() 
	{
		try{
			$this->db->select('UserId as LineManagerId, FirstName, LastName');
			$this->db->where('IsActive',1);
			$this->db->order_by('FirstName','asc');
			$result = $this->db->get('tbluser');
			$db_error = $this->db->error();
					if (!empty($db_error) && !empty($db_error['code'])) { 
						throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
						return false; // unreachable return statement !!!
					}
			$res=array();
			if($result->result())
			{
				$res=$result->result();
			}
			return $res;
		}catch(Exception $e){
			trigger_error($e->getMessage(), E_USER_ERROR);
			return false;
		}
	}

	public function editEmployee($post_Employee) 
	{
		try{
			if($post_Employee['IsActive']==1) {
				$IsActive = true;
			} else {
				$IsActive = false;
			}
			if($post_Employee) {
				$employee_data = array(
				"RoleId"=>trim($post_Employee['RoleId']),
				"JobTitleId"=>trim($post_Employee['JobTitleId']),
				"LineManagerId"=>trim($post_Employee['LineManagerId']),
				"FirstName"=>trim($post_Employee['FirstName']),
				"MiddleName"=>trim($post_Employee['MiddleName']),
				"LastName"=>trim($post_Employee['LastName']),
				"EmployeeId"=>trim($post_Employee['EmployeeId']),
				"EmailAddress"=>trim($post_Employee['EmailAddress']),
				"IsActive"=>$IsActive,
				"UpdatedBy" => trim($post_Employee['UpdatedBy']),
				"UpdatedOn" =>date('y-m-d H:i:s')
				);
				$this->db->where('UserId',trim($post_Employee['UserId']));
				$res = $this->db->update('tbluser',$employee_data);
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
			}
			else {
				return false;
			}
		}catch(Exception $e){
			trigger_error($e->getMessage(), E_USER_ERROR);
			return false;
		}	
	}
	public function getById($userId=Null)
	{
	  if($userId)
	  {
		 $this->db->select('tu.UserId, tu.RoleId, tu.JobTitleId, tu.LineManagerId, tu.FirstName, tu.MiddleName, tu.LastName, tu.EmployeeId, tu.EmailAddress, tu.IsActive');
		 $this->db->where('tu.UserId',$userId);
		 $result=$this->db->get('tbluser tu');
		 $employee_data= array();
		 foreach($result->result() as $row)
		 {
			$employee_data=$row;
			
		 }
		 return $employee_data;
	  }
	  else
	  {
		  return false;
	  }
	}
	public function isActiveChange($post_data) {
		try{
			if($post_data) {
				if(trim($post_data['IsActive'])==1){
					$IsActive = true;
				} else {
					$IsActive = false;
				}
				$data = array(
					'IsActive' => $IsActive,
					'UpdatedBy' => trim($post_data['UpdatedBy']),
					'UpdatedOn' => date('y-m-d H:i:s'),
				);			
				$this->db->where('UserId',trim($post_data['UserId']));
				$res = $this->db->update('tbluser',$data);
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
		}catch(Exception $e){
			trigger_error($e->getMessage(), E_USER_ERROR);
			return false;
		}
	}
	public function deleteEmployee($post_Employee) {
		try{
			if($post_Employee) 
			{
				$id=$post_Employee['id'];
				$this->db->where('UserId',$post_Employee['id']);
				$res = $this->db->delete('tbluser');
				$db_error = $this->db->error();
				if (!empty($db_error) && !empty($db_error['code'])) { 
					throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
					return false; // unreachable return statement !!!
				}
			}else {
				return false;
			}
		}catch(Exception $e){
			trigger_error($e->getMessage(), E_USER_ERROR);
			return false;
		}
	}
}
