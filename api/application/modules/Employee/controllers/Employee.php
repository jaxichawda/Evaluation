<?php
defined('BASEPATH') OR exit('No direct script access allowed');
header("Access-Control-Allow-Origin: *");
header('Access-Control-Allow-Headers: *');
header('Content-Type: application/json');

class Employee extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('Employee_model');
	}
	public function addEmployee()
	{
		$post_Employee = json_decode(trim(file_get_contents('php://input')), true);
		if ($post_Employee) {
			$chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
			$password = "";
			for ($i = 0; $i < 8; $i++) {
				$password .= $chars[mt_rand(0, strlen($chars)-1)];
			}
			$post_Employee['Password']= $password;

			if($post_Employee['UserId']>0) {
				$result = $this->Employee_model->editEmployee($post_Employee);
				if($result) {
					echo json_encode($post_Employee);	
				}	
			}
			else {
				$result = $this->Employee_model->addEmployee($post_Employee); 
				if($result) {
					$UserId=$result;
					$this->db->select('tu.UserId, CONCAT(tu.FirstName, " ", tu.LastName) as EmployeeName, tu.EmailAddress, CONCAT (tuu.FirstName, " ", tuu.LastName) as LineManager');
					$this->db->join('tbluser tuu', 'tuu.UserId=tu.LineManagerId', 'LEFT');
					$this->db->where('tu.UserId',$UserId);
					$data = $this->db->get('tbluser as tu');
					foreach($data->result() as $row) {
						$EmployeeName = $row->EmployeeName;
						$EmployeeEmail = $row->EmailAddress;
						$LineManager = $row->LineManager;
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
														<td style="padding:20px 10px 10px 10px; font-size: 25px; font-weight: bold; color:#0061af;">'.$EmployeeName.', Welcome to OpenEyes Software Solutions</td>
													</tr>
													<tr>
														<td style="padding:10px;">Below are the login details:</td>
													</tr>
													<tr>
														<th>Login Id:</th><td>'.$EmployeeEmail.'</td>
													</tr>
													<tr>
														<th>Password:</th><td>'.$password.'</td>
													</tr>
													<tr>
														<th>Your Reporter:</th><td>'.$LineManager.'</td>
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
					$this->email->initialize($config); 
					$this->email->from('info@theopeneyes.com','OpenEyes Software Solutions Pvt. Ltd');
					$this->email->to($EmployeeEmail);
					$this->email->subject('Employee Evaluation');
					$this->email->message($message);
					if($this->email->send()){
					// return true;
					}else{
						//return false;
					}
					echo json_encode($post_Employee);
				}	
			}		
		}
	}
	public function getAllEmployee()
	{
		$data=$this->Employee_model->getAllEmployee();
		echo json_encode($data);
	}
	public function getById($userId=null)
	{	
		if(!empty($userId)) {
			$data=[];
			$data=$this->Employee_model->getById($userId);
			echo json_encode($data);
		}
	}
	public function getAllJobTitle()
	{
		$data=$this->Employee_model->getAllJobTitle();
		echo json_encode($data);
	}
	public function getAllRole()
	{
		$data=$this->Employee_model->getAllRole();
		echo json_encode($data);
	}
	public function getAllLineManager()
	{
		$data=$this->Employee_model->getAllLineManager();
		echo json_encode($data);
	}
	public function isActiveChange() {
		$post_data = json_decode(trim(file_get_contents('php://input')), true);	
		if ($post_data) {
			$result = $this->Employee_model->isActiveChange($post_data);
			if($result) {
				echo json_encode('success');	
			}						
		}		
	}	
	public function deleteEmployee() {
		$post_Employee = json_decode(trim(file_get_contents('php://input')), true);	
		if ($post_Employee)
		 {
			if($post_Employee['id'] > 0){
				$result = $this->Employee_model->deleteEmployee($post_Employee);
				if($result) {
					echo json_encode("Delete successfully");
				}
		 	}
		} 	
	}
}
