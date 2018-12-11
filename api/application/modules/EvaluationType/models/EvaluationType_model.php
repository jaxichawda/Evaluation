<?php

class EvaluationType_model extends CI_Model {

	public function addEvaluationType($post_EvaluationType)
	{	
		try{
			if($post_EvaluationType) {
				if($post_EvaluationType['IsActive']==1) {
					$IsActive = true;
				} else {
					$IsActive = false;
				}
				$evaluationtype_data=array(
				"EvaluationTypeName"=>trim($post_EvaluationType['EvaluationTypeName']),
				"IsActive"=>$IsActive,
				"CreatedBy" => trim($post_EvaluationType['CreatedBy']),
				"CreatedOn" =>date('y-m-d H:i:s')
				);
				$res=$this->db->insert('tblmstevaluationtype',$evaluationtype_data);
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

	public function editEvaluationType($post_EvaluationType) 
	{
		try{
			if($post_EvaluationType['IsActive']==1) {
				$IsActive = true;
			} else {
				$IsActive = false;
			}
			if($post_EvaluationType) {
				$evaluationtype_data = array(
				"EvaluationTypeName"=>trim($post_EvaluationType['EvaluationTypeName']),
				"IsActive"=>$IsActive,
				"UpdatedBy" => trim($post_EvaluationType['UpdatedBy']),
				"UpdatedOn" =>date('y-m-d H:i:s')
				);
				$this->db->where('EvaluationTypeId',trim($post_EvaluationType['EvaluationTypeId']));
				$res = $this->db->update('tblmstevaluationtype',$evaluationtype_data);
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
	public function getById($evaluationtypeId=Null)
	{
	  if($evaluationtypeId)
	  {
		 $this->db->select('tmet.EvaluationTypeId, tmet.EvaluationTypeName, tmet.IsActive');
		 $this->db->where('tmet.EvaluationTypeId',$evaluationtypeId);
		 $result=$this->db->get('tblmstevaluationtype tmet');
		 $evaluationtype_data= array();
		 foreach($result->result() as $row)
		 {
			$evaluationtype_data=$row;
			
		 }
		 return $evaluationtype_data;
		 
	  }
	  else
	  {
		  return false;
	  }
	}
	public function getAllEvaluationType()
	{
		try{
			$this->db->select('tmet.EvaluationTypeId, tmet.EvaluationTypeName, tmet.IsActive, (SELECT COUNT(tmee.EvaluationId) FROM tblmstempevaluation as tmee WHERE tmet.EvaluationTypeId=tmee.EvaluationTypeId) as isdisabled');
			$result = $this->db->get('tblmstevaluationtype tmet');
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
				$this->db->where('EvaluationTypeId',trim($post_data['EvaluationTypeId']));
				$res = $this->db->update('tblmstevaluationtype',$data);
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
	public function deleteEvaluationType($post_EvaluationType) {
		try{
			if($post_EvaluationType) 
			{
				$id=$post_EvaluationType['id'];
				$this->db->where('EvaluationTypeId',$post_EvaluationType['id']);
				$res = $this->db->delete('tblmstevaluationtype');
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
