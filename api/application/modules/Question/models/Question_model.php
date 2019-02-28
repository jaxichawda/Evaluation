<?php

class Question_model extends CI_Model {

	public function addQuestion($post_Question)
	{	
		try{
			if($post_Question) {

				$question=$post_Question['question']; //store question in question
				$option=$post_Question['option']; //store mcq options in option

				//add question
				if($question['IsActive']==1) {
					$IsActive = true;
				} else {
					$IsActive = false;
				}

				$EvaluationTypeId = implode(',', $question['EvaluationTypeId']);
				$EvaluatorTypeId = implode(',', $question['EvaluatorTypeId']);

				$question_data=array(
				"QuestionText"=>trim($question['QuestionText']),
				"EvaluationTypeId"=>$EvaluationTypeId,
				"EvaluatorTypeId"=>$EvaluatorTypeId,
				"AnswerTypeId"=>trim($question['AnswerTypeId']),
				"IsActive"=>$IsActive,
				"CreatedBy" => trim($question['CreatedBy']),
				"CreatedOn" =>date('y-m-d H:i:s')
				);
				$res=$this->db->insert('tblmstquestion',$question_data);
				$db_error = $this->db->error();
				if (!empty($db_error) && !empty($db_error['code'])) { 
					throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
					return false; // unreachable return statement !!!
				}
				$QuestionId = $this->db->insert_id();
				$QuestionType = trim($question['AnswerTypeId']);
				if(($res) && ($QuestionType == 3)) {
					
					foreach($option as $options) {
						$Option_data = array(
							'QuestionId' => trim($QuestionId),
							'OptionValue' =>trim($options['QueOption']),
							"IsActive"=>1
						);
						$res2 = $this->db->insert('tblquestionoptions',$Option_data);
					}
					if($res2) {
						$log_data = array(
							'UserId' => trim($question['CreatedBy']),
							'Module' => 'Question',
							'Activity' =>'Add Question (QuestionId = '.$QuestionId.')'
						);
						$log = $this->db->insert('tblactivitylog',$log_data);
						return true;
					} else {
						return false;
					}
				}
				elseif($res){
					$log_data = array(
						'UserId' => trim($question['CreatedBy']),
						'Module' => 'Question',
						'Activity' =>'Add Question (QuestionId = '.$QuestionId.')'
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

	public function getAllQuestionType() 
	{
		try{
			$this->db->select('Value as AnswerTypeId, DisplayText as QuestionTypeName');
			$this->db->where('IsActive',1);
			$this->db->where('Key','AnswerType');
			$this->db->order_by('QuestionTypeName','asc');
			$result = $this->db->get('tblmstconfiguration');
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

	public function getAllEvaluationType() 
	{
		try{
			$this->db->select('EvaluationTypeId as value, EvaluationTypeName as label');
			$this->db->where('IsActive',1);
			$this->db->order_by('EvaluationTypeName','asc');
			$result = $this->db->get('tblmstevaluationtype');
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

	public function getAllEvaluatorType() 
	{
		try{
			$this->db->select('Value as value, DisplayText as label');
			$this->db->where('IsActive',1);
			$this->db->where('Key','EvaluatorType');
			$this->db->order_by('label','asc');
			$result = $this->db->get('tblmstconfiguration');
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

	public function editQuestion($post_Question) 
	{
		try{
			if($post_Question) {

				$question=$post_Question['question']; //store question in question
				$option=$post_Question['option']; //store mcq options in option

				//update question
				if($question['IsActive']==1) {
					$IsActive = true;
				} else {
					$IsActive = false;
				}

				$EvaluationTypeId = implode(',', $question['EvaluationTypeId']);
				$EvaluatorTypeId = implode(',', $question['EvaluatorTypeId']);

				$QuestionId = trim($question['QuestionId']);
				$question_data=array(
				"QuestionText"=>trim($question['QuestionText']),
				"EvaluationTypeId"=>$EvaluationTypeId,
				"EvaluatorTypeId"=>$EvaluatorTypeId,
				"AnswerTypeId"=>trim($question['AnswerTypeId']),
				"IsActive"=>$IsActive,
				"UpdatedBy" => trim($question['UpdatedBy']),
			 	"UpdatedOn" =>date('y-m-d H:i:s')
				);
				$this->db->where('QuestionId', $QuestionId);
				$res = $this->db->update('tblmstquestion',$question_data);
				
				$db_error = $this->db->error();
				if (!empty($db_error) && !empty($db_error['code'])) { 
					throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
					return false; // unreachable return statement !!!
				}
				$QuestionType = trim($question['AnswerTypeId']);

				if(($res) && ($QuestionType == 3)) {
					
					$this->db->where('QuestionId', $QuestionId);
					$del = $this->db->delete('tblquestionoptions');

					if($del){
						foreach($option as $options) {
							$Option_data = array(
								'QuestionId' => $QuestionId,
								'OptionValue' =>trim($options['QueOption']),
								"IsActive"=>1
							);
							$res2 = $this->db->insert('tblquestionoptions',$Option_data);
						}
					}
					if($res2) {
						$log_data = array(
							'UserId' => trim($question['UpdatedBy']),
							'Module' => 'Question',
							'Activity' =>'Update Question (QuestionId = '.$QuestionId.')'
						);
						$log = $this->db->insert('tblactivitylog',$log_data);
						return true;
					} else {
						return false;
					}
				}
				elseif($res){
					$log_data = array(
						'UserId' => trim($question['UpdatedBy']),
						'Module' => 'Question',
						'Activity' =>'Update Question (QuestionId = '.$QuestionId.')'
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
	public function getById($QuestionId=Null)
	{
	  if($QuestionId)
	  {
		 $this->db->select('tmq.QuestionId, tmq.EvaluationTypeId, tmq.EvaluatorTypeId, tmq.QuestionText, tmq.AnswerTypeId, tmq.IsActive , (SELECT COUNT(tea.EvaluationAnswerId) FROM tblevaluationanswer as tea WHERE tea.QuestionId='.$QuestionId.') as isdisabled');
		 $this->db->where('tmq.QuestionId',$QuestionId);
		 $result=$this->db->get('tblmstquestion tmq');
		 $question_data= array();
		 foreach($result->result() as $row)
		 {
			$question_data=$row;
			$question_data->EvaluationTypeId = explode(',', $question_data->EvaluationTypeId);
			$question_data->EvaluatorTypeId = explode(',', $question_data->EvaluatorTypeId);
		 }
		 return $question_data;
	  }
	  else
	  {
		  return false;
	  }
	}
	public function getOptionById($QuestionId=Null)
	{
	  if($QuestionId)
	  {
		 $this->db->select('tqo.QuestionOptionId, tqo.QuestionId, tqo.OptionValue as QueOption');
		 $this->db->where('tqo.QuestionId',$QuestionId);
		 $result=$this->db->get('tblquestionoptions tqo');
		 $option_data= array();
		 if($result->result())
		 {
			$option_data=$result->result();
		 }
		 return $option_data;
	  }
	  else
	  {
		  return false;
	  }
	}
	public function getAllQuestion()
	{
		try{
			$this->db->select('tmq.QuestionId, tmq.QuestionText, tmc.DisplayText as QuestionType, tmq.IsActive, (SELECT COUNT(tea.EvaluationAnswerId) FROM tblevaluationanswer as tea WHERE tmq.QuestionId=tea.QuestionId) as isdisabled');
			$this->db->from('tblmstquestion tmq');
			$this->db->join('tblmstconfiguration tmc', 'tmc.Value=tmq.AnswerTypeId', 'LEFT');
			$this->db->where('tmc.Key','AnswerType');
			$this->db->order_by('tmq.QuestionId');
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
				$this->db->where('QuestionId',trim($post_data['QuestionId']));
				$res = $this->db->update('tblmstquestion',$data);
				$db_error = $this->db->error();
				if (!empty($db_error) && !empty($db_error['code'])) { 
					throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
					return false; // unreachable return statement !!!
				}
				if($res) {
					$log_data = array(
						'UserId' => trim($post_data['UpdatedBy']),
						'Module' => 'Question',
						'Activity' =>'Update Question Active Status (QuestionId = '.$post_data['QuestionId'].')'
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
	public function deleteQuestion($post_Question) {
		try{
			if($post_Question) 
			{
				$id=$post_Question['id'];
				$this->db->where('QuestionId',$post_Question['id']);
				$del = $this->db->delete('tblquestionoptions');
				$this->db->where('QuestionId',$post_Question['id']);
				$res = $this->db->delete('tblmstquestion');
				$db_error = $this->db->error();
				if (!empty($db_error) && !empty($db_error['code'])) { 
					throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
					return false; // unreachable return statement !!!
				}
				if($res) {
					$log_data = array(
						'UserId' => $post_Question['Userid'],
						'Module' => 'Question',
						'Activity' =>'Delete Question (QuestionId = '.$post_Question['id'].')'
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
