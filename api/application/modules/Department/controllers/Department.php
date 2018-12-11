<?php
defined('BASEPATH') OR exit('No direct script access allowed');
header("Access-Control-Allow-Origin: *");
header('Access-Control-Allow-Headers: *');
header('Content-Type: application/json');

class Department extends CI_Controller {

	public function addDepartment()
	{
		$post_Department = json_decode(trim(file_get_contents('php://input')), true);
		if ($post_Department) {
			if($post_Department['DepartmentId']>0) {
				$result = $this->Department_model->editDepartment($post_Department);
				if($result) {
					echo json_encode($post_Department);	
				}	
			}
			else {
				$result = $this->Department_model->addDepartment($post_Department); 
				if($result) {
					echo json_encode($post_Department);	
				}	
			}		
		}
	}
	public function getById($departmentId=null)
	{	
		if(!empty($departmentId)) {
			$data=[];
			$data=$this->Department_model->getById($departmentId);
			echo json_encode($data);
		}
	}
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
	public function deleteDepartment() {
		$post_Department = json_decode(trim(file_get_contents('php://input')), true);		

		if ($post_Department)
		 {
			if($post_Department['id'] > 0){
				$result = $this->Department_model->deleteDepartment($post_Department);
				if($result) {
					echo json_encode("Delete successfully");
				}
		 	}
		} 	
	}
}
