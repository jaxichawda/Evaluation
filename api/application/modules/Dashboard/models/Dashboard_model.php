<?php

class Dashboard_model extends CI_Model {
    public function getEvaluationsById($UserId=Null){
	  if($UserId)
	  {
        $result = $this->db->query('select ee.EmployeeEvaluatorId,ee.EvaluationId,ee.EvaluatorId,ee.StatusId,ee.EvaluatorType,e.UserId,e.EvaluationTypeId,e.ExpirationDate,e.EvaluationDate,et.EvaluationTypeName,u.FirstName,u.LastName from tblmstempevaluator as ee left join tblmstempevaluation as e on (e.EvaluationId=ee.EvaluationId) left join tblmstevaluationtype as et on (e.EvaluationTypeId=et.EvaluationTypeId)
          LEFT join tbluser as u on (u.UserId=e.UserId) where ee.EvaluatorId='.$UserId.'
          ORDER BY CASE WHEN e.UserId='.$UserId.' THEN e.UserId END DESC');
		
          $res = array();
          if($result->result()) {
              $res = $result->result();
          }
          return $res;
        }
    }
    public function insertQuestions($post_data) {
	    if($post_data) { 
            $EmployeeEvaluatorId = $post_data['EmployeeEvaluatorId'];
            $EvaluationTypeId = $post_data['EvaluationTypeId'];
            $EvaluatorTypeId = $post_data['EvaluatorTypeId'];
            $CreatedBy = $post_data['CreatedBy'];

            $result1 = $this->db->query(
                "INSERT INTO tblevaluationanswer (EmployeeEvaluatorId, QuestionId, CreatedBy, UpdatedBy) 
                SELECT ".$EmployeeEvaluatorId.",QuestionId,".$CreatedBy.",".$CreatedBy." 
                FROM tblmstquestion 
                where IsActive=1
                && (`EvaluationTypeId` like '%".$EvaluationTypeId.",%' || `EvaluationTypeId` like '%,".$EvaluationTypeId."%' || `EvaluationTypeId` like '".$EvaluationTypeId."')
                && (`EvaluatorTypeId` like '%".$EvaluatorTypeId.",%' || `EvaluatorTypeId` like '%,".$EvaluatorTypeId."%' || `EvaluatorTypeId` like '".$EvaluatorTypeId."')
                ;");
            
            if($result1) {
                $result=$this->db->query("update tblmstempevaluator set StatusId=2 where EmployeeEvaluatorId=".$EmployeeEvaluatorId);
                if($result){
                    $log_data = array(
                        'UserId' => $CreatedBy,
                        'Module' => 'Evaluation',
                        'Activity' =>'Start Evaluation (EmployeeEvaluatorId = '.$EmployeeEvaluatorId.')'
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
    }
public function reviewById($EmployeeEvaluatorId=Null)
	{
        try{
            if($EmployeeEvaluatorId)
	        { 
            $this->db->select('ea.EvaluationAnswerId,ea.EmployeeEvaluatorId,ea.AnswerText,q.QuestionId,q.QuestionText, q.AnswerTypeId, q.IsActive');
            $this->db->join('tblmstquestion q','q.QuestionId=ea.QuestionId','left');
            $this->db->where('ea.EmployeeEvaluatorId',$EmployeeEvaluatorId);
            $this->db->where('q.IsActive',1);
            $result=$this->db->get('tblevaluationanswer ea');
            
            $res=array();
            foreach($result->result() as $row)
            {
                $this->db->select('o.QuestionOptionId, o.QuestionId, o.OptionValue');
                $this->db->where('o.QuestionId',$row->QuestionId);
                $result1=$this->db->get('tblquestionoptions o');
                //$res=$row;
                $row->child=$result1->result();
                array_push($res,$row);
            }
            return $res;
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
}

?>