<?php
defined('BASEPATH') OR exit('No direct script access allowed');
header("Access-Control-Allow-Origin: *");
header('Access-Control-Allow-Headers: *');
header('Content-Type: application/json');

class PerformanceReview extends CI_Controller {
    public function __construct() {
	
		parent::__construct();
		
		$this->load->model('PerformanceReview_model');
		
    }
    public function getAllQuestionData($Id=null)
	{
        if(!empty($Id)) {
        $data=[];
		$data['QuestionData']=$this->PerformanceReview_model->getAllQuestionData($Id);
		$data['EvaluationStatus']=$this->PerformanceReview_model->getEvaluationStatus($Id);
        echo json_encode($data);
        }
    }
    public function insertPerformance()
	{  
		$post_data = json_decode(trim(file_get_contents('php://input')), true);
		if ($post_data) 
			{
                $result = $this->PerformanceReview_model->insertPerformance($post_data); 
			
					if($result)
					{
						echo json_encode($post_data); 
						
					}	
            }
    }
    public function saveAsDraft()
	{  
		$post_data = json_decode(trim(file_get_contents('php://input')), true);
		if ($post_data) 
			{
                $result = $this->PerformanceReview_model->saveAsDraft($post_data); 
			
					if($result)
					{
						echo json_encode($post_data); 
						
					}	
            }
    }
}
?>