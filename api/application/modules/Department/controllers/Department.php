<?php
defined('BASEPATH') OR exit('No direct script access allowed');
header("Access-Control-Allow-Origin: *");
header('Access-Control-Allow-Headers: *');
header('Content-Type: application/json');

class Department extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('Department_model');
	}
	public function getAllDepartment()
	{
		$data=$this->Department_model->getAllDepartment();
		echo json_encode($data);
	}
	public function isActiveChange() {
		$post_data = json_decode(trim(file_get_contents('php://input')), true);	
		if ($post_data) {
			$result = $this->Department_model->isActiveChange($post_data);
			if($result) {
				echo json_encode('success');	
			}						
		}		
	}	
}
