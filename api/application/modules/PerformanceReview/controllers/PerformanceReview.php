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
		$data=$this->PerformanceReview_model->getAllQuestionData($Id);
        echo json_encode($data);
        }
	}
}
?>