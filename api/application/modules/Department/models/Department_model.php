<?php

class Department_model extends CI_Model {

	public function addDepartment($post_Department)
	{	
		try{
			if($post_Department) {
				if($post_Department['IsActive']==1) {
					$IsActive = true;
				} else {
					$IsActive = false;
				}
				$department_data=array(
				"DepartmentName"=>trim($post_Department['DepartmentName']),
				"IsActive"=>$IsActive,
				"CreatedBy" => trim($post_Department['CreatedBy']),
				"CreatedOn" =>date('y-m-d H:i:s')
				);
				$res=$this->db->insert('tblmstdepartment',$department_data);
				$db_error = $this->db->error();
				if (!empty($db_error) && !empty($db_error['code'])) { 
					throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
					return false; // unreachable return statement !!!
				}
				if($res) {
					$log_data = array(
						'UserId' => trim($post_Department['CreatedBy']),
						'Module' => 'Department',
						'Activity' =>'Add Department - '.$post_Department['DepartmentName']
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

	public function editDepartment($post_Department) 
	{
		try{
			if($post_Department['IsActive']==1) {
				$IsActive = true;
			} else {
				$IsActive = false;
			}
			if($post_Department) {
				$department_data = array(
				"DepartmentName"=>trim($post_Department['DepartmentName']),
				"IsActive"=>$IsActive,
				"UpdatedBy" => trim($post_Department['UpdatedBy']),
				"UpdatedOn" =>date('y-m-d H:i:s')
				);
				$this->db->where('DepartmentId',trim($post_Department['DepartmentId']));
				$res = $this->db->update('tblmstdepartment',$department_data);
				$db_error = $this->db->error();
				if (!empty($db_error) && !empty($db_error['code'])) { 
					throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
					return false; // unreachable return statement !!!
				}
				if($res) {
					$log_data = array(
						'UserId' => trim($post_Department['UpdatedBy']),
						'Module' => 'Department',
						'Activity' =>'Update Department - '.$post_Department['DepartmentName']
					);
					$log = $this->db->insert('tblactivitylog',$log_data);
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
	public function getById($departmentId=Null)
	{
	  if($departmentId)
	  {
		 $this->db->select('tmd.DepartmentId, tmd.DepartmentName, tmd.IsActive');
		 $this->db->where('tmd.DepartmentId',$departmentId);
		 $result=$this->db->get('tblmstdepartment tmd');
		 $department_data= array();
		 foreach($result->result() as $row)
		 {
			$department_data=$row;
		 }
		 return $department_data;
	  }
	  else
	  {
		  return false;
	  }
	}
	public function getAllDepartment()
	{
		try{
			$this->db->select('tmd.DepartmentId, tmd.DepartmentName, tmd.IsActive, (SELECT COUNT(tmjt.JobId) FROM tblmstjob as tmjt WHERE tmjt.DepartmentId=tmd.DepartmentId) as isdisabled');
			$result = $this->db->get('tblmstdepartment tmd');
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
				$this->db->where('DepartmentId',trim($post_data['DepartmentId']));
				$res = $this->db->update('tblmstdepartment',$data);
				$db_error = $this->db->error();
				if (!empty($db_error) && !empty($db_error['code'])) { 
					throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
					return false; // unreachable return statement !!!
				}
				if($res) {
					$log_data = array(
						'UserId' => trim($post_data['UpdatedBy']),
						'Module' => 'Department',
						'Activity' =>'Update Department Active Status - '.$post_data['DepartmentName']
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
	public function deleteDepartment($post_Department) {
		try{
			if($post_Department) 
			{
				$id=$post_Department['id'];
				$this->db->where('DepartmentId',$post_Department['id']);
				$res = $this->db->delete('tblmstdepartment');
				$db_error = $this->db->error();
				if (!empty($db_error) && !empty($db_error['code'])) { 
					throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
					return false; // unreachable return statement !!!
				}
				if($res) {
					$log_data = array(
						'UserId' => $post_Department['Userid'],
						'Module' => 'Department',
						'Activity' =>'Delete Department - '.$post_Department['Name'].' (Id - '.$post_Department['id'].')'
					);
					$log = $this->db->insert('tblactivitylog',$log_data);
					return true;
				} else {
					return false;
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
