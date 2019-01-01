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
    public function getAllEvaluation() {
        $data=array();
        $data['evaluations']=$this->GenerateEvaluation_model->getAllEvaluation();	
        $data['status']=$this->GenerateEvaluation_model->get_invimsg();	
		echo json_encode($data);
    }
    public function getReportingEmployee($id = NULL) {
		
      if (!empty($id)) {
        $data = $this->GenerateEvaluation_model->getReportingEmployee($id);
        echo json_encode($data);			
      }
    }
    public function getEvaluationById($evaluationId=null)
	{	
		if(!empty($evaluationId)) {
			$data=[];
			$data=$this->GenerateEvaluation_model->getEvaluationById($evaluationId);
			echo json_encode($data);
		}
    }
    public function statusChange() {
		$post_data = json_decode(trim(file_get_contents('php://input')), true);	
		if ($post_data) {
			$result = $this->GenerateEvaluation_model->statusChange($post_data);
			if($result) {
				echo json_encode('success');	
			}						
		}		
	}
    
    public function revokeEvaluation() {
		$post_revoke= json_decode(trim(file_get_contents('php://input')), true);		

		if ($post_revoke)
		 {
			if($post_revoke['evaluationid'] > 0){
				$result = $this->GenerateEvaluation_model->revokeEvaluation($post_revoke);
				if($result) {
					echo json_encode("Delete successfully");
					}
		 	}
		} 
    }
    public function revokeEvaluator() {
		$post_revoke= json_decode(trim(file_get_contents('php://input')), true);		

		if ($post_revoke)
		 {
			if($post_revoke['EvaluatorId'] > 0){
				$result = $this->GenerateEvaluation_model->revokeEvaluator($post_revoke);
				if($result) {
					echo json_encode("Delete successfully");
					}
		 	}
		} 
    }
    public function getEvaluators() {
		$post_data= json_decode(trim(file_get_contents('php://input')), true);
		if ($post_data)
		{
			$data=$this->GenerateEvaluation_model->getEvaluators($post_data);			
			echo json_encode($data);
		}
				
    }
    public function getNewEvaluators() {
		$post_data= json_decode(trim(file_get_contents('php://input')), true);
		if ($post_data)
		{
			$data=$this->GenerateEvaluation_model->getNewEvaluators($post_data);			
			echo json_encode($data);
		}
				
    }
    public function addPostEvaluation() {
        $post_evaluation = json_decode(trim(file_get_contents('php://input')), true);	
        if ($post_evaluation) {
            $result = $this->GenerateEvaluation_model->addPostEvaluation($post_evaluation);
            if($result){
                $config['protocol'] = 'smtp';
                $config['smtp_host'] = 'ssl://smtp.googlemail.com';
                $config['smtp_port'] = '465';
                $config['smtp_user'] = 'myopeneyes3937@gmail.com';
                $config['smtp_pass'] = 'W3lc0m3@2019';  //sender's password
                $config['mailtype'] = 'html';
                $config['charset'] = 'iso-8859-1';
                $config['newline']="\r\n";
                $config['wordwrap'] = 'TRUE';
                $dashboardpath = BASE_URL.'/dashboard/';

                $this->db->select('u.EmailAddress');
                $this->db->where('u.UserId',$post_evaluation['EvaluatorId']);
                $data = $this->db->get('tbluser as u');
                $row = $data->result()[0];
                $email = $row->EmailAddress;

                $subject = $post_evaluation['UserName']."'s Post-Employee evaluation";

                $message = '
                <table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #333333; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto; width:600px">
                <tbody>
                    <tr>
                        <td style="background-color:#fff; background:#fff; padding:10px 10px 5px 10px; text-align:center"><img alt="" style="width:130px" src="https://devbyopeneyes.com/emailer_images/oess.png" /></td>
                    </tr>
                    <tr>
                        <td style="border-width:0; padding:20px 10px 10px 10px; text-align:center">
            
                        <p style="color:#000; font-size: 18px; line-height: 18px; font-weight: bold; padding: 0; margin: 0 0 10px;">Please provide feedback for below employee.</p>
                        
                        <p style="color:#ff0000; font-size: 14px; line-height:20px; padding: 0; margin:20px 0;">Please consider this feedback is as post evaluation meeting for future data references.</p>
            
                        <table border="0" cellpadding="0" cellspacing="0" style="margin:20px 0; width:100%; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto;">
                            <tbody>
                                <tr>
                                    <td style="padding:5px; text-align:right; width:35%">Employee Name</td>
                                    <td style="padding:5px; text-align:center; width:4%">:</td>
                                    <td style="padding:5px; text-align:left; width:48%">'.$post_evaluation['UserName'].'</td>
                                </tr>
                                <tr>
                                    <td style="padding:5px; text-align:right; width:35%">Evaluation Type:</td>
                                    <td style="padding:5px; text-align:center; width:4%">:</td>
                                    <td style="padding:5px; text-align:left; width:48%">'.$post_evaluation['EvaluationTypeName'].'</td>
                                </tr>
                            </tbody>
                        </table>
                        <p style="color:#000; font-size: 14px; line-height:20px; padding: 0; margin:20px 0 0;">Use the button below to give evaluation:</p>
                        </td>
                    </tr>
                    <tr>
                        <td style="border-width:0; padding:0; text-align:center; vertical-align:middle">
                        <table border="0" cellpadding="0" cellspacing="0" style="border:0; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto">
                            <tbody>
                                <tr>
                                    <td style="background-color:#0061AF; background:#0061AF; border-radius:4px; border-width:0; clear:both; color:#ffffff; font-size:14px; line-height:13px; opacity:1; padding:10px; text-align:center; text-decoration:none; width:130px"><a href="'.$dashboardpath.'" style="color:#fff; text-decoration:none;">Give Evaluation</a></td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="border-width:0; padding:20px 10px 10px 10px; text-align:center; vertical-align:middle">
                            <p style="color:#777; font-size: 12px; line-height:20px; padding: 0; margin: 0 0 10px; text-align: left;">If you&rsquo;re having trouble with the button above, copy and paste the URL below into your web browser. <a href="'.$dashboardpath.'" style="cursor:pointer;">click here</a></p>
                        </td>
                    </tr>
                    <tr>
                        <td style="background-color:#a6ce39; background:#a6ce39; border-top:1px solid #cccccc; color:#000; font-size:13px; padding:7px; text-align:center">Copyright &copy; 2018 OpenEyes Software Solutions</td>
                    </tr>
                </tbody>
            </table>
                ';

            $this->email->initialize($config); 
            $this->email->from('info@theopeneyes.com','OpenEyes Software Solutions Pvt. Ltd');
            $this->email->to($email);
            $this->email->subject($subject);
            $this->email->message($message);
            if($this->email->send()){
               // return true;
            }else{
               // return false;
            }  
                echo json_encode($result);
            }
           
        }

    }
    public function generate_Evaluation() {
      $post_generate = json_decode(trim(file_get_contents('php://input')), true);	
      if ($post_generate) {
          //$result = $this->GenerateEvaluation_model->generate_Evaluation($post_generate);
          if($post_generate['EvaluationId']>0) {
            $result = $this->GenerateEvaluation_model->regenerate_Evaluation($post_generate);
          }
          else{
            $result = $this->GenerateEvaluation_model->generate_Evaluation($post_generate);
          }

          if($result) {
            // $evaluationId=$result;
            // $this->db->select('u.FirstName,u.MiddleName,u.LastName,u.EmailAddress,et.EvaluationTypeName,e.EvaluationDate,e.EvaluationDescription');
            // $this->db->join('tbluser u','u.UserId=e.UserId','left');
            // $this->db->join('tblmstevaluationtype et','et.EvaluationTypeId=e.EvaluationTypeId','left');
			// $this->db->where('e.EvaluationId',$evaluationId);
            // $data = $this->db->get('tblmstempevaluation as e');
			// foreach($data->result() as $row) {
            //     $firstname = $row->FirstName;
            //     $lastname = $row->LastName;
            //     $middlename = $row->MiddleName;
            //     $email = $row->EmailAddress;
            //     $evaluationtypename = $row->EvaluationTypeName;
            //     $evaluationdate = $row->EvaluationDate;
            //     $description = $row->EvaluationDescription;
			// }
            //config email settings
            $config['protocol'] = 'smtp';
            $config['smtp_host'] = 'ssl://smtp.googlemail.com';
            $config['smtp_port'] = '465';
            $config['smtp_user'] = 'myopeneyes3937@gmail.com';
            $config['smtp_pass'] = 'W3lc0m3@2019';  //sender's password
            $config['mailtype'] = 'html';
            $config['charset'] = 'iso-8859-1';
            $config['newline']="\r\n";
            $config['wordwrap'] = 'TRUE';
            $dashboardpath = BASE_URL.'/dashboard/';

            $this->db->select('et.EvaluationTypeName');
                $this->db->where('et.EvaluationTypeId',$post_generate['EvaluationTypeId']);
                $data1 = $this->db->get('tblmstevaluationtype as et');
                $row1 = $data1->result()[0];
                    $evaluationtypename = $row1->EvaluationTypeName;

            if(count($post_generate['EvaluatorsId'])>0){
                $this->db->select('u.FirstName,u.MiddleName,u.LastName,u.EmailAddress');
                $this->db->where('u.UserId',$post_generate['UserId']);
                $data = $this->db->get('tbluser as u');
                $row = $data->result()[0];
               
                    $firstname = $row->FirstName;
                    $lastname = $row->LastName;
                    $middlename = $row->MiddleName;
                    $path = BASE_URL;
            foreach($post_generate['EvaluatorsId'] as $id){
                $this->db->select('u.EmailAddress');
                $this->db->where('u.UserId',$id);
                $data1 = $this->db->get('tbluser as u');
                $row1 = $data1->result()[0];
               
                    $email = $row1->EmailAddress;

                    if($post_generate['UserNote'] == null) {
                        $UserNote = 'Not mentioned!';
                    } else {
                        $UserNote = $post_generate['UserNote'];
                    }
                    if($post_generate['EvaluatorNote'] == null) {
                        $EvaluatorNote = 'Not mentioned!';
                    } else {
                        $EvaluatorNote = $post_generate['EvaluatorNote'];
                    }

                    if($id==$post_generate['UserId']){
                        $subject = 'Self-Employee evaluation';
                        $message = '

                        <table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #333333; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto; width:600px">
                            <tbody>
                                <tr>
                                    <td style="background-color:#fff; background:#fff; padding:10px 10px 5px 10px; text-align:center"><img alt="" style="width:130px" src="https://devbyopeneyes.com/emailer_images/oess.png" /></td>
                                </tr>
                                <tr>
                                    <td style="border-width:0; padding:20px 10px 10px 10px; text-align:center">

                                    <p style="color:#000; font-size: 18px; line-height: 18px; font-weight: bold; padding: 0; margin: 0 0 10px;">Congratulations! Please give feedback for below evaluation.</p>

                                    <table border="0" cellpadding="0" cellspacing="0" style="margin:20px 0; width:100%; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto;">
                                        <tbody>
                                            <tr>
                                                <td style="padding:5px; text-align:right; width:35%">Evaluation Type</td>
                                                <td style="padding:5px; text-align:center; width:4%">:</td>
                                                <td style="padding:5px; text-align:left; width:48%">'.$evaluationtypename.'</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:5px; text-align:right; width:35%">Scheduled Evaluation Date</td>
                                                <td style="padding:5px; text-align:center; width:4%">:</td>
                                                <td style="padding:5px; text-align:left; width:48%">'.$post_generate['EvaluationDate'].'</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:5px; text-align:right; width:35%">Note</td>
                                                <td style="padding:5px; text-align:center; width:4%">:</td>
                                                <td style="padding:5px; text-align:left; width:48%">'.$UserNote.'</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <p style="color:#000; font-size: 14px; line-height:20px; padding: 0; margin:20px 0 0;">Use the button below to give evaluation:</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-width:0; padding:0; text-align:center; vertical-align:middle">
                                    <table border="0" cellpadding="0" cellspacing="0" style="border:0; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto">
                                        <tbody>
                                            <tr>
                                                <td style="background-color:#0061AF; background:#0061AF; border-radius:4px; border-width:0; clear:both; color:#ffffff; font-size:14px; line-height:13px; opacity:1; padding:10px; text-align:center; text-decoration:none; width:130px"><a href="'.$dashboardpath.'" style="color:#fff; text-decoration:none;">Give Evaluation</a></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-width:0; padding:20px 10px 10px 10px; text-align:center; vertical-align:middle">
                                        <p style="color:#777; font-size: 12px; line-height:20px; padding: 0; margin: 0 0 10px; text-align: left;">If you&rsquo;re having trouble with the button above, copy and paste the URL below into your web browser. <a href="'.$dashboardpath.'" style="cursor:pointer;">click here</a></p>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background-color:#a6ce39; background:#a6ce39; border-top:1px solid #cccccc; color:#000; font-size:13px; padding:7px; text-align:center">Copyright &copy; 2018 OpenEyes Software Solutions</td>
                                </tr>
                            </tbody>
                        </table>
                        ';
                    }
                    else{
                        $subject = $firstname.' '.$lastname."'s Employee evaluation";
                        $message = '

                        <table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #333333; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto; width:600px">
                            <tbody>
                                <tr>
                                    <td style="background-color:#fff; background:#fff; padding:10px 10px 5px 10px; text-align:center"><img alt="" style="width:130px" src="https://devbyopeneyes.com/emailer_images/oess.png" /></td>
                                </tr>
                                <tr>
                                    <td style="border-width:0; padding:20px 10px 10px 10px; text-align:center">

                                    <p style="color:#000; font-size: 18px; line-height: 18px; font-weight: bold; padding: 0; margin: 0 0 10px;">Please provide feedback for below employee.</p>

                                    <table border="0" cellpadding="0" cellspacing="0" style="margin:20px 0; width:100%; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto;">
                                        <tbody>
                                            <tr>
                                                <td style="padding:5px; text-align:right; width:35%">Employee Name</td>
                                                <td style="padding:5px; text-align:center; width:4%">:</td>
                                                <td style="padding:5px; text-align:left; width:48%">'.$firstname.' '.$lastname.'</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:5px; text-align:right; width:35%">Evaluation Type:</td>
                                                <td style="padding:5px; text-align:center; width:4%">:</td>
                                                <td style="padding:5px; text-align:left; width:48%">'.$evaluationtypename.'</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:5px; text-align:right; width:35%">Scheduled Evaluation Date</td>
                                                <td style="padding:5px; text-align:center; width:4%">:</td>
                                                <td style="padding:5px; text-align:left; width:48%">'.$post_generate['EvaluationDate'].'</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:5px; text-align:right; width:35%">Note</td>
                                                <td style="padding:5px; text-align:center; width:4%">:</td>
                                                <td style="padding:5px; text-align:left; width:48%">'.$EvaluatorNote.'</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <p style="color:#000; font-size: 14px; line-height:20px; padding: 0; margin:20px 0 0;">Use the button below to give evaluation:</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-width:0; padding:0; text-align:center; vertical-align:middle">
                                    <table border="0" cellpadding="0" cellspacing="0" style="border:0; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto">
                                        <tbody>
                                            <tr>
                                                <td style="background-color:#0061AF; background:#0061AF; border-radius:4px; border-width:0; clear:both; color:#ffffff; font-size:14px; line-height:13px; opacity:1; padding:10px; text-align:center; text-decoration:none; width:130px"><a href="'.$dashboardpath.'" style="color:#fff; text-decoration:none;">Give Evaluation</a></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-width:0; padding:20px 10px 10px 10px; text-align:center; vertical-align:middle">
                                        <p style="color:#777; font-size: 12px; line-height:20px; padding: 0; margin: 0 0 10px; text-align: left;">If you&rsquo;re having trouble with the button above, copy and paste the URL below into your web browser. <a href="'.$dashboardpath.'" style="cursor:pointer;">click here</a></p>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background-color:#a6ce39; background:#a6ce39; border-top:1px solid #cccccc; color:#000; font-size:13px; padding:7px; text-align:center">Copyright &copy; 2018 OpenEyes Software Solutions</td>
                                </tr>
                            </tbody>
                        </table>
                    ';
                    }
            // $config['protocol']='mail';
            // $config['smtp_host']='vps40446.inmotionhosting.com';
            // $config['smtp_port']='587';
            // $config['smtp_user']=$smtpEmail;
            // $config['smtp_pass']=$smtpPassword;

            // $config['protocol']='smtp';
            // $config['smtp_host']='smtpout.secureserver.net';
            // $config['smtp_port']='80';
            // $config['smtp_user']='info@theopeneyes.com';
            // $config['smtp_pass']='W3lc0m3@2018';

            $this->email->initialize($config); 
            $this->email->from('info@theopeneyes.com','OpenEyes Software Solutions Pvt. Ltd');
            $this->email->to($email);
            $this->email->subject($subject);
            $this->email->message($message);
            if($this->email->send()){
               // return true;
            }else{
               // return false;
            }  
                
            }
        }
            echo json_encode($post_generate);	
          }	
        							
      }		
    }	
}
?>