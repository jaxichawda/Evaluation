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
              $evaluationId=$result;
            $this->db->select('u.FirstName,u.MiddleName,u.LastName,u.EmailAddress,et.EvaluationTypeName,e.EvaluationDate,e.EvaluationDescription');
            $this->db->join('tbluser u','u.UserId=e.UserId','left');
            $this->db->join('tblmstevaluationtype et','et.EvaluationTypeId=e.EvaluationTypeId','left');
			$this->db->where('e.EvaluationId',$evaluationId);
            $data = $this->db->get('tblmstempevaluation as e');
			foreach($data->result() as $row) {
                $firstname = $row->FirstName;
                $lastname = $row->LastName;
                $middlename = $row->MiddleName;
                $email = $row->EmailAddress;
                $evaluationtypename = $row->EvaluationTypeName;
                $evaluationdate = $row->EvaluationDate;
                $description = $row->EvaluationDescription;
			}
            //config email settings
            $config['protocol'] = 'smtp';
            $config['smtp_host'] = 'ssl://smtp.googlemail.com';
            $config['smtp_port'] = '465';
            $config['smtp_user'] = 'myopeneyes3937@gmail.com';
            $config['smtp_pass'] = 'W3lc0m3@2018';  //sender's password
            $config['mailtype'] = 'html';
            $config['charset'] = 'iso-8859-1';
            $config['newline']="\r\n";
            $config['wordwrap'] = 'TRUE';
            if(trim($post_generate['Check'])==1){
              $path = BASE_URL;
        $message = '
        <table style="font-family:Lucida Grande,Lucida Sans Unicode, Lucida Sans, DejaVu Sans, Verdana, sans-serif; font-size:16px; border:2px solid #ccc; line-height:22px; color:#000; width:700px; margin:0 auto;" cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td>
                    <table cellpadding="0" cellspacing="0" border="0" style="width:100%; margin:0 auto;">
                        <tr>
                            <td>
                                <table cellpadding="0" cellspacing="0" border="0" style="padding: 10px 10px 0 10px; width:100%; margin:0 auto;">
                                    <tr>
                                        <td><img src="'.$path.'/assets/images/emaillogo.png" alt="" style="width: 100px;" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding:10px 0 20px 0; text-align:center;">
                                <table align="center" cellpadding="0" cellspacing="0" border="0" style="width:70%; margin:auto; background: rgba(255,255,255,0.8); text-align: center;">
                                    <tr>
                                        <td style="padding:20px 10px 10px 10px; font-size: 25px; font-weight: bold; color:#0061af;">Give Your Evaluation:</td>
                                    </tr>
                                    <tr>
                                        <td style="padding:10px;">Below are the details:</td>
                                    </tr>
                                    <tr>
                                        <th>Evaluation Type:</th><td>'.$evaluationtypename.'</td>
                                        
                                        
                                    </tr>
                                    <tr>
                                        <th>Date:</th><td>'.$evaluationdate.'</td>
                                    </tr>
                                    <tr>
                                        <th>Description:</th><td>'.$description.'</td>
                                    </tr>
                                    <tr>
                                        <td style="padding:5px 10px 20px; text-align:center; font-size:14px; line-height:20px;">
                                        Please do not hesitate to contact us in case of any queries or need further information.
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                <table cellpadding="0" cellspacing="0" border="0" style="width:100%; margin:0 auto; font-size:13px; line-height:13px; border-top: 2px solid #ccc;">
                    <tr>
                    <td style="padding: 5px 10px; text-align: center; background:#fff;"><img src="'.$path.'/assets/images/microsoft.png" style="width: 165px; vertical-align: middle;" alt="" /></td>
                    <td style="padding: 10px; background:#b0cb1f;">
                        <table cellpadding="0" cellspacing="0" border="0" style="width:100%; margin:0 auto;">
                            <tr>
                                <td><a href="tel:+91 256.298.3937" style="color: #000; text-decoration: none;"><img style="width: 20px; height: 20px; vertical-align: text-bottom;" src="'.$path.'/assets/images/phone.png" alt="" /> +91.265.298.EYES</a></td>
                                <td><a href="mailto:info@theopeneyes.com" style="color: #000; text-decoration: none;"><img src="'.$path.'/assets/images/email.png" style="width: 20px; height: 20px; vertical-align: text-bottom;" alt="" /> info@theopeneyes.com</a></td>
                                <td> <a href="http://www.theopeneyes.com" target="_blank" style="color: #000; text-decoration: none;"><img src="'.$path.'/assets/images/world.png" style="width: 20px; height: 20px; vertical-align: text-bottom;" alt="" /> www.theopeneyes.com</a></td>
                            </tr>
                        </table>
                    </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="background:#0061af; padding: 15px; text-align: center; color: #fff;">Washington DC | Sterling VA | Vadodara, India</td>
                    </tr>
                </table>
                </td>
            </tr>
        </table>
        <p style="font-family:Calibri,sans-serif; font-size:16px">Thank you,<br><strong>OpenEyes Software Solutions Pvt. Ltd</strong></p>
        ';
            
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
            $this->email->subject('Employee Evaluation');
            $this->email->message($message);
            if($this->email->send()){
               // return true;
            }else{
                //return false;
            }  
            }
            foreach($post_generate['EvaluatorsId'] as $id){
                $this->db->select('u.FirstName,u.MiddleName,u.LastName,u.EmailAddress');
                $this->db->where('u.UserId',$id);
                $data = $this->db->get('tbluser as u');
                foreach($data->result() as $row) {
                    $evaluatorfirstname = $row->FirstName;
                    $evaluatorlastname = $row->LastName;
                    $evaluatormiddlename = $row->MiddleName;
                    $evaluatoremail = $row->EmailAddress;

                    $path = BASE_URL;
        $message = '
        <table style="font-family:Lucida Grande,Lucida Sans Unicode, Lucida Sans, DejaVu Sans, Verdana, sans-serif; font-size:16px; border:2px solid #ccc; line-height:22px; color:#000; width:700px; margin:0 auto;" cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td>
                    <table cellpadding="0" cellspacing="0" border="0" style="width:100%; margin:0 auto;">
                        <tr>
                            <td>
                                <table cellpadding="0" cellspacing="0" border="0" style="padding: 10px 10px 0 10px; width:100%; margin:0 auto;">
                                    <tr>
                                        <td><img src="'.$path.'/assets/images/emaillogo.png" alt="" style="width: 100px;" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding:10px 0 20px 0; text-align:center;">
                                <table align="center" cellpadding="0" cellspacing="0" border="0" style="width:70%; margin:auto; background: rgba(255,255,255,0.8); text-align: center;">
                                    <tr>
                                        <td style="padding:20px 10px 10px 10px; font-size: 25px; font-weight: bold; color:#0061af;">Give Evaluation for below employee:</td>
                                    </tr>
                                    <tr>
                                        <td style="padding:10px;">Below are the details:</td>
                                    </tr>
                                    <tr>
                                        <th>Employee Name:</th><td>'.$firstname." ".$lastname.'</td>
                                    </tr>
                                    <tr>
                                        <th>Evaluation Type:</th><td>'.$evaluationtypename.'</td>
                                        
                                    </tr>
                                    <tr>
                                        <th>Date:</th><td>'.$evaluationdate.'</td>
                                    </tr>
                                    <tr>
                                        <th>Description:</th><td>'.$description.'</td>
                                    </tr>
                                    <tr>
                                        <td style="padding:5px 10px 20px; text-align:center; font-size:14px; line-height:20px;">
                                        Please do not hesitate to contact us in case of any queries or need further information.
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                <table cellpadding="0" cellspacing="0" border="0" style="width:100%; margin:0 auto; font-size:13px; line-height:13px; border-top: 2px solid #ccc;">
                    <tr>
                    <td style="padding: 5px 10px; text-align: center; background:#fff;"><img src="'.$path.'/assets/images/microsoft.png" style="width: 165px; vertical-align: middle;" alt="" /></td>
                    <td style="padding: 10px; background:#b0cb1f;">
                        <table cellpadding="0" cellspacing="0" border="0" style="width:100%; margin:0 auto;">
                            <tr>
                                <td><a href="tel:+91 256.298.3937" style="color: #000; text-decoration: none;"><img style="width: 20px; height: 20px; vertical-align: text-bottom;" src="'.$path.'/assets/images/phone.png" alt="" /> +91.265.298.EYES</a></td>
                                <td><a href="mailto:info@theopeneyes.com" style="color: #000; text-decoration: none;"><img src="'.$path.'/assets/images/email.png" style="width: 20px; height: 20px; vertical-align: text-bottom;" alt="" /> info@theopeneyes.com</a></td>
                                <td> <a href="http://www.theopeneyes.com" target="_blank" style="color: #000; text-decoration: none;"><img src="'.$path.'/assets/images/world.png" style="width: 20px; height: 20px; vertical-align: text-bottom;" alt="" /> www.theopeneyes.com</a></td>
                            </tr>
                        </table>
                    </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="background:#0061af; padding: 15px; text-align: center; color: #fff;">Washington DC | Sterling VA | Vadodara, India</td>
                    </tr>
                </table>
                </td>
            </tr>
        </table>
        <p style="font-family:Calibri,sans-serif; font-size:16px">Thank you,<br><strong>OpenEyes Software Solutions Pvt. Ltd</strong></p>
        ';
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
            $this->email->to($evaluatoremail);
            $this->email->subject('Employee Evaluation');
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