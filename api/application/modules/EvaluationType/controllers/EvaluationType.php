<?php
defined('BASEPATH') OR exit('No direct script access allowed');
header("Access-Control-Allow-Origin: *");
header('Access-Control-Allow-Headers: *');
header('Content-Type: application/json');

class EvaluationType extends CI_Controller {

	public function addEvaluationType()
	{
		$post_EvaluationType = json_decode(trim(file_get_contents('php://input')), true);
		if ($post_EvaluationType) {
			if($post_EvaluationType['EvaluationTypeId']>0) {
				$result = $this->EvaluationType_model->editEvaluationType($post_EvaluationType);
				if($result) {
					echo json_encode($post_EvaluationType);	
				}	
			}
			else {
				$result = $this->EvaluationType_model->addEvaluationType($post_EvaluationType); 
				if($result) {
					echo json_encode($post_EvaluationType);	
				}	
			}		
		}
	}
	public function getById($evaluationtypeId=null)
	{	
		if(!empty($evaluationtypeId)) {
			$data=[];
			$data=$this->EvaluationType_model->getById($evaluationtypeId);
			echo json_encode($data);
		}
	}
	public function __construct()
	{
		parent::__construct();
		$this->load->model('EvaluationType_model');
	}
	public function getAllEvaluationType()
	{
		$data=$this->EvaluationType_model->getAllEvaluationType();
		echo json_encode($data);
	}
	public function isActiveChange() {
		$post_data = json_decode(trim(file_get_contents('php://input')), true);	
		if ($post_data) {
			$result = $this->EvaluationType_model->isActiveChange($post_data);
			if($result) {
				echo json_encode('success');	
			}						
		}		
	}	
	public function deleteEvaluationType() {
		$post_EvaluationType = json_decode(trim(file_get_contents('php://input')), true);		

		if ($post_EvaluationType)
		 {
			if($post_EvaluationType['id'] > 0){
				$result = $this->EvaluationType_model->deleteEvaluationType($post_EvaluationType);
				if($result) {
					echo json_encode("Delete successfully");
				}
		 	}
		} 	
	}
}
