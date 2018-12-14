<?php

class PerformanceReview_model extends CI_Model {
    public function getAllQuestionData()
	{
		try{
            $this->db->select('q.QuestionId, q.Questiontext, q.AnswerTypeId, q.IsActive');
            $this->db->where('q.IsActive',1);
            $result=$this->db->get('tblmstquestion q');
            
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
		}catch(Exception $e){
			trigger_error($e->getMessage(), E_USER_ERROR);
			return false;
		}	
	}
}
?>