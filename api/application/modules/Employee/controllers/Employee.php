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
					if($LineManager == ''){
						$LineManager = "Not assigned";
					}

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
					
					$path = BASE_URL;
					$loginpath = BASE_URL.'/login/';

					$message = '
					<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #333333; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto; width:600px">
						<tbody>
							<tr>
								<td style="background-color:#fff; background:#fff; padding:10px 10px 5px 10px; text-align:center"><img alt="" style="width:130px" src="https://devbyopeneyes.com/emailer_images/oess.png" /></td>
							</tr>
							<tr>
								<td style="border-width:0; padding:20px 10px 10px 10px; text-align:center">
								<p style="color:#000; font-size: 25px; line-height: 25px; font-weight: bold;padding: 0; margin: 0 0 10px;">Welcome, <strong>'.$EmployeeName.'!</strong></p>

								<p style="color:#000; font-size: 18px; line-height: 18px; font-weight: bold; padding: 0; margin: 0 0 10px;">Find your login credential for Employee Evaluation below:</p>

								<table border="0" cellpadding="0" cellspacing="0" style="margin:20px 0; width:100%; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto;">
									<tbody>
										<tr>
											<td style="padding:5px; text-align:right; width:35%">Login Id</td>
											<td style="padding:5px; text-align:center; width:4%">:</td>
											<td style="padding:5px; text-align:left; width:48%">'.$EmployeeEmail.'</td>
										</tr>
										<tr>
											<td style="padding:5px; text-align:right; width:35%">Password</td>
											<td style="padding:5px; text-align:center; width:4%">:</td>
											<td style="padding:5px; text-align:left; width:48%">'.$password.'</td>
										</tr>
										<tr>
											<td style="padding:5px; text-align:right; width:35%">Your Line Manager</td>
											<td style="padding:5px; text-align:center; width:4%">:</td>
											<td style="padding:5px; text-align:left; width:48%">'.$LineManager.'</td>
										</tr>
									</tbody>
								</table>
								<p style="color:#000; font-size: 14px; line-height:20px; padding: 0; margin:20px 0 0;">Use the button below to access your account:</p>
								</td>
							</tr>
							<tr>
								<td style="border-width:0; padding:0; text-align:center; vertical-align:middle">
								<table border="0" cellpadding="0" cellspacing="0" style="border:0; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto">
									<tbody>
										<tr>
											<td style="background-color:#0061AF; background:#0061AF; border-radius:4px; border-width:0; clear:both; color:#ffffff; font-size:14px; line-height:13px; opacity:1; padding:10px; text-align:center; text-decoration:none; width:130px"><a href="'.$loginpath.'" style="color:#fff; text-decoration:none;">Login to Account</a></td>
										</tr>
									</tbody>
								</table>
								</td>
							</tr>
							<tr>
								<td style="border-width:0; padding:20px 10px 10px 10px; text-align:center; vertical-align:middle">
									<p style="color:#777; font-size: 12px; line-height:20px; padding: 0; margin: 0 0 10px; text-align: left;">If you&rsquo;re having trouble with the button above, copy and paste the URL below into your web browser. <a href="'.$loginpath.'" style="cursor:pointer;">click here</a></p>
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
				else{
					echo json_encode("Exist User");
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
