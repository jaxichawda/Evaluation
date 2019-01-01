<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class EvaluationReport extends CI_Controller {
    
    public function __construct() {
	
		parent::__construct();
		
		$this->load->model('EvaluationReport_model');
		
    }
    public function getCommonReport($evaluationId=null)
	  {	
      if(!empty($evaluationId)) {

              $data['EmployeeData']=$this->EvaluationReport_model->getEmployeeData($evaluationId);
              
              //Common Report
              $data['commonEmployee']=$this->EvaluationReport_model->getCommonEvaluationEmployee($evaluationId);
              $data['commonReport']=$this->EvaluationReport_model->getCommonEvaluationReport($evaluationId);
              //Evaluator Report
              $data['evaluatorEmployee']=$this->EvaluationReport_model->getEvaluatorEvaluationEmployee($evaluationId);
              $data['evaluatorReport']=$this->EvaluationReport_model->getEvaluatorEvaluationReport($evaluationId);
              //Employee Report
              $data['employeeEmployee']=$this->EvaluationReport_model->getEmployeeEvaluationEmployee($evaluationId);
              $data['employeeReport']=$this->EvaluationReport_model->getEmployeeEvaluationReport($evaluationId);

              echo json_encode($data);
      }
    }	
}
?>