<?php
defined('BASEPATH') OR exit('No direct script access allowed');
header("Access-Control-Allow-Origin: *");
header('Access-Control-Allow-Headers: *');
header('Content-Type: application/json');

class Question extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('Question_model');
	}
	public function addQuestion()
	{
		$post_Question = json_decode(trim(file_get_contents('php://input')), true);
		$qa=$post_Question['question'];

		if ($post_Question) {
			if($qa['QuestionId'] > 0) {
				$result = $this->Question_model->editQuestion($post_Question);
				if($result) {
					echo json_encode($post_Question);	
				}	
			}
			else {
				$result = $this->Question_model->addQuestion($post_Question); 
				if($result) {
					echo json_encode($post_Question);	
				}	
			}		
		}
	}
	public function getAllQuestionType()
	{
		$data=$this->Question_model->getAllQuestionType();
		echo json_encode($data);
	}
	public function getAllEvaluationType()
	{
		$data=$this->Question_model->getAllEvaluationType();
		echo json_encode($data);
	}
	public function getAllEvaluatorType()
	{
		$data=$this->Question_model->getAllEvaluatorType();
		echo json_encode($data);
	}
	public function getById($QuestionId=null)
	{	
		if(!empty($QuestionId)) {
			$data=[];
			$data['question']=$this->Question_model->getById($QuestionId);
			$data['option']=$this->Question_model->getOptionById($QuestionId);
			//$data=$this->Question_model->getById($QuestionId);
			echo json_encode($data);
		}
	}
	public function getAllQuestion()
	{
		$data=$this->Question_model->getAllQuestion();
		echo json_encode($data);
	}
	public function isActiveChange() {
		$post_data = json_decode(trim(file_get_contents('php://input')), true);	
		if ($post_data) {
			$result = $this->Question_model->isActiveChange($post_data);
			if($result) {
				echo json_encode('success');	
			}						
		}		
	}	
	public function deleteQuestion() {
		$post_Question = json_decode(trim(file_get_contents('php://input')), true);	
		if ($post_Question)
		 {
			if($post_Question['id'] > 0){
				$result = $this->Question_model->deleteQuestion($post_Question);
				if($result) {
					echo json_encode("Delete successfully");
				}
		 	}
		} 	
	}
}
