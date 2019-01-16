<?php

class JobTitle_model extends CI_Model {

	public function addJobTitle($post_JobTitle)
	{	
		try{
			if($post_JobTitle) {
				if($post_JobTitle['IsActive']==1) {
					$IsActive = true;
				} else {
					$IsActive = false;
				}
				$jobtitle_data=array(
				"JobTitle"=>trim($post_JobTitle['JobTitle']),
				"DepartmentId"=>trim($post_JobTitle['DepartmentId']),
				"IsActive"=>$IsActive,
				"CreatedBy" => trim($post_JobTitle['CreatedBy']),
				"CreatedOn" =>date('y-m-d H:i:s')
				);
				$res=$this->db->insert('tblmstjob',$jobtitle_data);
				$db_error = $this->db->error();
				if (!empty($db_error) && !empty($db_error['code'])) { 
					throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
					return false; // unreachable return statement !!!
				}
				if($res) {
					$log_data = array(
						'UserId' => trim($post_JobTitle['CreatedBy']),
						'Module' => 'Job Title',
						'Activity' =>'Add Job Title - '.$post_JobTitle['JobTitle']
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

	public function getAllDepartment() 
	{
		try{
			$this->db->select('DepartmentId, DepartmentName');
			$this->db->where('IsActive',1);
			$this->db->order_by('DepartmentName','asc');
			$result = $this->db->get('tblmstdepartment');
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

	public function editJobTitle($post_JobTitle) 
	{
		try{
			if($post_JobTitle['IsActive']==1) {
				$IsActive = true;
			} else {
				$IsActive = false;
			}
			if($post_JobTitle) {
				$jobtitle_data = array(
				"JobTitle"=>trim($post_JobTitle['JobTitle']),
				"DepartmentId"=>trim($post_JobTitle['DepartmentId']),
				"IsActive"=>$IsActive,
				"UpdatedBy" => trim($post_JobTitle['UpdatedBy']),
				"UpdatedOn" =>date('y-m-d H:i:s')
				);
				$this->db->where('JobId',trim($post_JobTitle['JobId']));
				$res = $this->db->update('tblmstjob',$jobtitle_data);
				$db_error = $this->db->error();
				if (!empty($db_error) && !empty($db_error['code'])) { 
					throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
					return false; // unreachable return statement !!!
				}
				if($res) {
					$log_data = array(
						'UserId' => trim($post_JobTitle['UpdatedBy']),
						'Module' => 'Job Title',
						'Activity' =>'Update Job Title - '.$post_JobTitle['JobTitle']
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
	public function getById($JobId=Null)
	{
	  if($JobId)
	  {
		 $this->db->select('tmjt.JobId, tmjt.JobTitle, tmjt.DepartmentId,tmjt.IsActive');
		 $this->db->where('tmjt.JobId',$JobId);
		 $result=$this->db->get('tblmstjob tmjt');
		 $jobtitle_data= array();
		 foreach($result->result() as $row)
		 {
			$jobtitle_data=$row;
			
		 }
		 return $jobtitle_data;
	  }
	  else
	  {
		  return false;
	  }
	}
	public function getAllJobTitle()
	{
		try{
			$this->db->select('tmjt.JobId, tmjt.JobTitle, tmd.DepartmentName, tmjt.IsActive, (SELECT COUNT(tu.UserId) FROM tbluser as tu WHERE tmjt.JobId=tu.JobId) as isdisabled');
			$this->db->from('tblmstjob tmjt');
			$this->db->join('tblmstdepartment tmd', 'tmjt.DepartmentId = tmd.DepartmentId');
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
				$this->db->where('JobId',trim($post_data['JobId']));
				$res = $this->db->update('tblmstjob',$data);
				$db_error = $this->db->error();
				if (!empty($db_error) && !empty($db_error['code'])) { 
					throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
					return false; // unreachable return statement !!!
				}
				if($res) {
					$log_data = array(
						'UserId' => trim($post_data['UpdatedBy']),
						'Module' => 'Job Title',
						'Activity' =>'Update Job Title Active Status - '.$post_data['JobTitle']
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
	public function deleteJobTitle($post_JobTitle) {
		try{
			if($post_JobTitle) 
			{
				$id=$post_JobTitle['id'];
				$this->db->where('JobId',$post_JobTitle['id']);
				$res = $this->db->delete('tblmstjob');
				$db_error = $this->db->error();
				if (!empty($db_error) && !empty($db_error['code'])) { 
					throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
					return false; // unreachable return statement !!!
				}
				if($res) {
					$log_data = array(
						'UserId' => $post_JobTitle['Userid'],
						'Module' => 'Job Title',
						'Activity' =>'Delete Job Title - '.$post_JobTitle['Name'].' (Id - '.$post_JobTitle['id'].')'
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
