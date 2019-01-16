<?php
defined('BASEPATH') OR exit('No direct script access allowed');
header("Access-Control-Allow-Origin: *");
header('Access-Control-Allow-Headers: *');
header('Content-Type: application/json');

class JobTitle extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('JobTitle_model');
	}
	public function addJobTitle()
	{
		$post_JobTitle = json_decode(trim(file_get_contents('php://input')), true);
		if ($post_JobTitle) {
			if($post_JobTitle['JobId']>0) {
				$result = $this->JobTitle_model->editJobTitle($post_JobTitle);
				if($result) {
					echo json_encode($post_JobTitle);	
				}	
			}
			else {
				$result = $this->JobTitle_model->addJobTitle($post_JobTitle); 
				if($result) {
					echo json_encode($post_JobTitle);	
				}	
			}		
		}
	}
	public function getAllDepartment()
	{
		$data=$this->JobTitle_model->getAllDepartment();
		echo json_encode($data);
	}
	public function getById($JobId=null)
	{	
		if(!empty($JobId)) {
			$data=[];
			$data=$this->JobTitle_model->getById($JobId);
			echo json_encode($data);
		}
	}
	public function getAllJobTitle()
	{
		$data=$this->JobTitle_model->getAllJobTitle();
		echo json_encode($data);
	}
	public function isActiveChange() {
		$post_data = json_decode(trim(file_get_contents('php://input')), true);	
		if ($post_data) {
			$result = $this->JobTitle_model->isActiveChange($post_data);
			if($result) {
				echo json_encode('success');	
			}						
		}		
	}	
	public function deleteJobTitle() {
		$post_JobTitle = json_decode(trim(file_get_contents('php://input')), true);	
		if ($post_JobTitle)
		 {
			if($post_JobTitle['id'] > 0){
				$result = $this->JobTitle_model->deleteJobTitle($post_JobTitle);
				if($result) {
					echo json_encode("Delete successfully");
				}
		 	}
		} 	
	}
}
