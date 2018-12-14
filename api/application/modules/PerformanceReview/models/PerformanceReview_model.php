<?php

class PerformanceReview_model extends CI_Model {
    public function getAllQuestionData($Id=Null)
	{
		try{
            if($Id)
	        { 
            $result1 = $this->db->query("INSERT INTO tblevaluationanswer (EmployeeEvaluatorId, QuestionId) SELECT ".$Id.",QuestionId FROM tblmstquestion");
            
            $this->db->select('ea.EvaluationAnswerId,ea.EmployeeEvaluatorId,ea.AnswerText,q.QuestionId,q.QuestionText, q.AnswerTypeId, q.IsActive');
            $this->db->join('tblmstquestion q','q.QuestionId=ea.QuestionId','left');
            $this->db->where('ea.EmployeeEvaluatorId',$Id);
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