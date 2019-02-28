<?php

class EvaluationReport_model extends CI_Model
 {	
	
	public function getEmployeeData($evaluationId=Null) {
		if($evaluationId) {
			$this->db->select('u.UserId, CONCAT(u.FirstName," ",u.LastName) as EmployeeName');
			$this->db->join('tbluser u','u.UserId=e.UserId','left');
			$this->db->where('e.EvaluationId',$evaluationId);
			$result = $this->db->get('tblmstempevaluation as e');
			foreach($result->result() as $row){
				$res = $row;
			}
			return $res;
		} else {
			return false;
		}
	}
	
	public function getCommonEvaluationEmployee($evaluationId=Null) {
		if($evaluationId) {
			$this->db->select('a.EvaluatorId, CONCAT(b.FirstName," ",b.LastName) as name');
			$this->db->join('tblmstempevaluator a','a.EmployeeEvaluatorId=ea.EmployeeEvaluatorId','left');
			$this->db->join('tblmstempevaluation ee','ee.EvaluationId=a.EvaluationId','left');
			$this->db->join('tbluser b','a.EvaluatorId=b.UserId','left');
			$this->db->order_by('ea.EmployeeEvaluatorId','asc');
			$this->db->group_by('ea.EmployeeEvaluatorId');
			$this->db->where('a.EvaluationId',$evaluationId);
			
			$result = $this->db->get('tblevaluationanswer as ea');	
			$db_error = $this->db->error();
					if (!empty($db_error) && !empty($db_error['code'])) { 
						throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
						return false; // unreachable return statement !!!
					}
			$res = array();
			if($result->result()) {
				$res = $result->result();
			}
			return $res;
		} else {
			return false;
		}
	}

	public function getCommonEvaluationReport($evaluationId=Null) {
		if($evaluationId) {
			$this->db->select('ea.QuestionId,q.QuestionText,q.AnswerTypeId');
			$this->db->join('tblmstempevaluator a','a.EmployeeEvaluatorId=ea.EmployeeEvaluatorId','left');
			$this->db->join('tblmstempevaluation ee','ee.EvaluationId=a.EvaluationId','left');
			$this->db->join('tblmstquestion q','q.QuestionId=ea.QuestionId','left');
			$this->db->group_by('ea.QuestionId');
			$this->db->order_by('ea.QuestionId','asc');
			$this->db->where('q.EvaluatorTypeId','1,2');
			//$this->db->where('ee.UserId!=a.EvaluatorId');
			$this->db->where('a.EvaluationId',$evaluationId);
			$result = $this->db->get('tblevaluationanswer as ea');	
			$res = array();	
			$result = json_decode(json_encode($result->result()), True);
			foreach($result as $row) {
				$this->db->select('ea.EmployeeEvaluatorId,ea.QuestionId,ea.AnswerText,
				(SELECT ROUND(AVG(tea.AnswerText)) as EvaluatorAvg FROM tblevaluationanswer tea 
                LEFT JOIN tblmstquestion tmq
				ON tmq.QuestionId = tea.QuestionId
				LEFT JOIN tblmstempevaluator tmee
                ON tmee.EmployeeEvaluatorId = tea.EmployeeEvaluatorId
                WHERE tmq.AnswerTypeId=2 && 
				tea.QuestionId=ea.QuestionId &&
				tmee.EvaluationId = '.$evaluationId.'
                )
            as EvaluatorAvg');
				$this->db->join('tblmstempevaluator a','a.EmployeeEvaluatorId=ea.EmployeeEvaluatorId','left');
				$this->db->join('tblmstempevaluation ee','ee.EvaluationId=a.EvaluationId','left');
				$this->db->order_by('ea.EmployeeEvaluatorId','asc');
				//$this->db->where('ee.UserId!=a.EvaluatorId');
				$this->db->where('ea.QuestionId',$row['QuestionId']);
				$this->db->where('a.EvaluationId',$evaluationId);
				$result_child = $this->db->get('tblevaluationanswer as ea');
				$row['child'] = $result_child->result();
				array_push($res,$row);
			}
			return $res;
		} else {
			return false;
		}
	}
	
	public function getEvaluatorEvaluationEmployee($evaluationId=Null) {
		if($evaluationId) {
			$this->db->select('a.EvaluatorId, CONCAT(b.FirstName," ",b.LastName) as name');
			$this->db->join('tblmstempevaluator a','a.EmployeeEvaluatorId=ea.EmployeeEvaluatorId','left');
			$this->db->join('tblmstempevaluation ee','ee.EvaluationId=a.EvaluationId','left');
			$this->db->join('tbluser b','a.EvaluatorId=b.UserId','left');
			$this->db->order_by('ea.EmployeeEvaluatorId','asc');
			$this->db->group_by('ea.EmployeeEvaluatorId');
			$this->db->where('ee.UserId!=a.EvaluatorId');
			$this->db->where('a.EvaluationId',$evaluationId);
			
			$result = $this->db->get('tblevaluationanswer as ea');	
			$db_error = $this->db->error();
					if (!empty($db_error) && !empty($db_error['code'])) { 
						throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
						return false; // unreachable return statement !!!
					}
			$res = array();
			if($result->result()) {
				$res = $result->result();
			}
			return $res;
		} else {
			return false;
		}
	}

	public function getEvaluatorEvaluationReport($evaluationId=Null) {
		if($evaluationId) {
			$this->db->select('ea.QuestionId,q.QuestionText,q.AnswerTypeId');
			$this->db->join('tblmstempevaluator a','a.EmployeeEvaluatorId=ea.EmployeeEvaluatorId','left');
			$this->db->join('tblmstempevaluation ee','ee.EvaluationId=a.EvaluationId','left');
			$this->db->join('tblmstquestion q','q.QuestionId=ea.QuestionId','left');
			$this->db->group_by('ea.QuestionId');
			$this->db->order_by('ea.QuestionId','asc');
			$this->db->where('q.EvaluatorTypeId',2);
			$this->db->where('ee.UserId!=a.EvaluatorId');
			$this->db->where('a.EvaluationId',$evaluationId);
			$result = $this->db->get('tblevaluationanswer as ea');	
			$res = array();	
			$result = json_decode(json_encode($result->result()), True);
			foreach($result as $row) {
				$this->db->select('ea.EmployeeEvaluatorId,ea.QuestionId,ea.AnswerText,
				(SELECT ROUND(AVG(tea.AnswerText)) as EvaluatorAvg FROM tblevaluationanswer tea 
                LEFT JOIN tblmstquestion tmq
                ON tmq.QuestionId = tea.QuestionId
                WHERE tmq.AnswerTypeId=2 && 
                tea.QuestionId=ea.QuestionId 
                )
            as EvaluatorAvg');
				$this->db->join('tblmstempevaluator a','a.EmployeeEvaluatorId=ea.EmployeeEvaluatorId','left');
				$this->db->join('tblmstempevaluation ee','ee.EvaluationId=a.EvaluationId','left');
				$this->db->order_by('ea.EmployeeEvaluatorId','asc');
				
				$this->db->where('ee.UserId!=a.EvaluatorId');
				$this->db->where('ea.QuestionId',$row['QuestionId']);
				$this->db->where('a.EvaluationId',$evaluationId);
				$result_child = $this->db->get('tblevaluationanswer as ea');
				$row['child'] = $result_child->result();
				array_push($res,$row);
			}
			return $res;
		} else {
			return false;
		}
	}

	public function getEmployeeEvaluationEmployee($evaluationId=Null) {
		if($evaluationId) {
			$this->db->select('a.EvaluatorId, CONCAT(b.FirstName," ",b.LastName) as name');
			$this->db->join('tblmstempevaluator a','a.EmployeeEvaluatorId=ea.EmployeeEvaluatorId','left');
			$this->db->join('tblmstempevaluation ee','ee.EvaluationId=a.EvaluationId','left');
			$this->db->join('tbluser b','a.EvaluatorId=b.UserId','left');
			$this->db->order_by('ea.EmployeeEvaluatorId','asc');
			$this->db->group_by('ea.EmployeeEvaluatorId');
			$this->db->where('ee.UserId=a.EvaluatorId');
			$this->db->where('a.EvaluationId',$evaluationId);
			
			$result = $this->db->get('tblevaluationanswer as ea');	
			$db_error = $this->db->error();
					if (!empty($db_error) && !empty($db_error['code'])) { 
						throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
						return false; // unreachable return statement !!!
					}
			$res = array();
			if($result->result()) {
				$res = $result->result();
			}
			return $res;
		} else {
			return false;
		}
	}

	public function getEmployeeEvaluationReport($evaluationId=Null) {
		if($evaluationId) {
			$this->db->select('ea.QuestionId,q.QuestionText');
			$this->db->join('tblmstempevaluator a','a.EmployeeEvaluatorId=ea.EmployeeEvaluatorId','left');
			$this->db->join('tblmstempevaluation ee','ee.EvaluationId=a.EvaluationId','left');
			$this->db->join('tblmstquestion q','q.QuestionId=ea.QuestionId','left');
			$this->db->group_by('ea.QuestionId');
			$this->db->order_by('ea.QuestionId','asc');
			$this->db->where('ee.UserId=a.EvaluatorId');
			$this->db->where('q.EvaluatorTypeId',1);
			$this->db->where('a.EvaluationId',$evaluationId);
			$result = $this->db->get('tblevaluationanswer as ea');	
			$res = array();	
			$result = json_decode(json_encode($result->result()), True);
			foreach($result as $row) {
				$this->db->select('ea.EmployeeEvaluatorId,ea.QuestionId,ea.AnswerText');
				$this->db->join('tblmstempevaluator a','a.EmployeeEvaluatorId=ea.EmployeeEvaluatorId','left');
				$this->db->join('tblmstempevaluation ee','ee.EvaluationId=a.EvaluationId','left');
				$this->db->order_by('ea.EmployeeEvaluatorId','asc');
				$this->db->where('ee.UserId=a.EvaluatorId');
				$this->db->where('ea.QuestionId',$row['QuestionId']);
				$this->db->where('a.EvaluationId',$evaluationId);
				$result_child = $this->db->get('tblevaluationanswer as ea');
				$row['child'] = $result_child->result();
				array_push($res,$row);
			}
			return $res;
		} else {
			return false;
		}
	}
	
}