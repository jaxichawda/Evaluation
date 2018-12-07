<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class GenerateEvaluation extends CI_Controller {


    public function __construct() {
	
		parent::__construct();
		
		$this->load->model('GenerateEvaluation_model');
		
    }
    public function getData() {
		$data=array();
        $data['users']=$this->GenerateEvaluation_model->getUsers();	
        $data['evaluationtypes']=$this->GenerateEvaluation_model->getEvaluationTypes();		
		echo json_encode($data);
    }
}
?>