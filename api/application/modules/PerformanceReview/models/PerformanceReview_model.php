<?php

class PerformanceReview_model extends CI_Model {
    public function getAllQuestionData($post_data)
	{
		try{
            if($post_data)
	        { 
            $this->db->select('ee.EmployeeEvaluatorId');
            $this->db->where('ee.EmployeeEvaluatorId',$post_data['Id']);
            $this->db->where('ee.EvaluatorId',$post_data['UserId']);
            $getUser=$this->db->get('tblmstempevaluator ee');
            if ($getUser->num_rows() == 1) 
				{

            $this->db->select('ea.EvaluationAnswerId,ea.EmployeeEvaluatorId,ea.AnswerText,ea.Comments,q.QuestionId,q.QuestionText, q.AnswerTypeId, q.IsActive');
            $this->db->join('tblmstquestion q','q.QuestionId=ea.QuestionId','left');
            $this->db->where('ea.EmployeeEvaluatorId',$post_data['Id']);
            $this->db->where('q.IsActive',1);
            $query=$this->db->get('tblevaluationanswer ea');
            
            //$res=array();
            if($query->result())
            {
                $result = $query->result();
                $res2 = array();
                    $j = -1;
                    for($i=0; $i<$query->num_rows(); $i++) {
                        $query_ans = array();
                        $this->db->select('o.QuestionOptionId, o.QuestionId, o.OptionValue');
                        $this->db->where('o.QuestionId',$result[$i]->QuestionId);
                        $query_ans=$this->db->get('tblquestionoptions o');
                        
                        if($i==0 || $i%4==0){
                            $res = array();
                            $j++;
                        }					
                        $result[$i]->answer = $query_ans->result();				
						array_push($res,$result[$i]);			
						$res2[$j]['row'] = $res;
                    }
                    return $res2;
            }
            else
            {
                return false;
            }
        }
        else{
        return 'error';
        }
    }
		}catch(Exception $e){
			trigger_error($e->getMessage(), E_USER_ERROR);
			return false;
		}	
    }
    public function getEvaluationStatus($post_data)
	{
	  if($post_data)
	  {
        $this->db->select('ee.StatusId,e.UserId,CONCAT(u.FirstName," ",u.LastName) as Name');
        $this->db->join('tblmstempevaluation e','e.EvaluationId=ee.EvaluationId','left');
        $this->db->join('tbluser u','u.UserId=e.UserId','left');
            $this->db->where('ee.EmployeeEvaluatorId',$post_data['Id']);
            $result=$this->db->get('tblmstempevaluator ee');
		
          $res = array();
          foreach($result->result() as $row) {
              $res = $row;
          }
          return $res;
        }
    }
    public function insertPerformance($PerformanceData)
	{	
                    foreach($PerformanceData as $data){
                        foreach($data['row'] as $value){
                        if ($value['AnswerText'] == null)
                        $AnswerText = null;
                            else
                        $AnswerText = $value['AnswerText'];

                        if ($value['Comments'] == null)
                        $Comments = null;
                            else
                        $Comments = $value['Comments'];
                        //$child = $data['child'];
                            $data1=array(
                                "EmployeeEvaluatorId"=>$value['EmployeeEvaluatorId'],
                                "QuestionId"=>$value['QuestionId'],
                                "AnswerText"=>$AnswerText,
                                "Comments"=>$Comments,
                                "IsActive"=>1,
                                "UpdatedOn"=>date('y-m-d H:i:s')
                                );	
                                $this->db->where('EvaluationAnswerId',trim($value['EvaluationAnswerId']));
                                $res1=$this->db->update('tblevaluationanswer',$data1);
                            }
                    } 
                    $result=$this->db->query("update tblmstempevaluator set StatusId=1 where EmployeeEvaluatorId=".$value['EmployeeEvaluatorId']);
                    return true;
                    
    }
    public function saveAsDraft($PerformanceData)
	{	   
					foreach($PerformanceData as $data){
                        foreach($data['row'] as $value){
                        if ($value['AnswerText'] == null)
                        $AnswerText = null;
                            else
                        $AnswerText = $value['AnswerText'];

                        if ($value['Comments'] == null)
                        $Comments = null;
                            else
                        $Comments = $value['Comments'];
						//$child = $data['child'];
							$data1=array(
								"EmployeeEvaluatorId"=>$value['EmployeeEvaluatorId'],
								"QuestionId"=>$value['QuestionId'],
                                "AnswerText"=>$AnswerText,
                                "Comments"=>$Comments,
								"IsActive"=>1,
								"UpdatedOn"=>date('y-m-d H:i:s')
                                );	
                                $this->db->where('EvaluationAnswerId',trim($value['EvaluationAnswerId']));
                                $res1=$this->db->update('tblevaluationanswer',$data1);
                            }
                    } 
                    //$result=$this->db->query("update tblmstempevaluator set StatusId=1 where EmployeeEvaluatorId=".$data['EmployeeEvaluatorId']);
                    return true;
                    
	}
}
?>