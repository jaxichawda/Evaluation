<?php
defined('BASEPATH') OR exit('No direct script access allowed');
// header("Access-Control-Allow-Origin: *");
// header('Access-Control-Allow-Headers: *');
// header('Content-Type: application/json');

class Dashboard extends CI_Controller {
    public function __construct() {
	
		parent::__construct();
		
		$this->load->model('Dashboard_model');
		
    }
    public function getEvaluationsById($UserId=null)
	{	
		if(!empty($UserId)) {
			$data=[];
			$data=$this->Dashboard_model->getEvaluationsById($UserId);
			echo json_encode($data);
		}
	}
	public function insertQuestions()
	{	
		$post_data= json_decode(trim(file_get_contents('php://input')), true);
		if ($post_data)
		{
			$data=$this->Dashboard_model->insertQuestions($post_data);
			echo json_encode($data);
		}
		
	}
	public function reviewById($EmployeeEvaluatorId=null)
	{	
		if(!empty($EmployeeEvaluatorId)) {
			$data=[];
			$data=$this->Dashboard_model->reviewById($EmployeeEvaluatorId);
			echo json_encode($data);
		}
	}
}
?>