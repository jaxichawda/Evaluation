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
				"JobTitleName"=>trim($post_JobTitle['JobTitleName']),
				"DepartmentId"=>trim($post_JobTitle['DepartmentId']),
				"IsActive"=>$IsActive,
				"CreatedBy" => trim($post_JobTitle['CreatedBy']),
				"CreatedOn" =>date('y-m-d H:i:s')
				);
				$res=$this->db->insert('tblmstjobtitle',$jobtitle_data);
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
				"JobTitleName"=>trim($post_JobTitle['JobTitleName']),
				"DepartmentId"=>trim($post_JobTitle['DepartmentId']),
				"IsActive"=>$IsActive,
				"UpdatedBy" => trim($post_JobTitle['UpdatedBy']),
				"UpdatedOn" =>date('y-m-d H:i:s')
				);
				$this->db->where('JobTitleId',trim($post_JobTitle['JobTitleId']));
				$res = $this->db->update('tblmstjobtitle',$jobtitle_data);
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
	public function getById($jobtitleId=Null)
	{
	  if($jobtitleId)
	  {
		 $this->db->select('tmjt.JobTitleId, tmjt.JobTitleName, tmjt.DepartmentId,tmjt.IsActive');
		 $this->db->where('tmjt.JobTitleId',$jobtitleId);
		 $result=$this->db->get('tblmstjobtitle tmjt');
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
			$this->db->select('tmjt.JobTitleId, tmjt.JobTitleName, tmd.DepartmentName, tmjt.IsActive, (SELECT COUNT(tu.UserId) FROM tbluser as tu WHERE tmjt.JobTitleId=tu.JobTitleId) as isdisabled');
			$this->db->from('tblmstjobtitle tmjt');
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
				$this->db->where('JobTitleId',trim($post_data['JobTitleId']));
				$res = $this->db->update('tblmstjobtitle',$data);
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
	public function deleteJobTitle($post_JobTitle) {
		try{
			if($post_JobTitle) 
			{
				$id=$post_JobTitle['id'];
				$this->db->where('JobTitleId',$post_JobTitle['id']);
				$res = $this->db->delete('tblmstjobtitle');
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
