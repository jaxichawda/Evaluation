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
}
?>