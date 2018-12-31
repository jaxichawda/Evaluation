<?php

defined('BASEPATH') OR exit('No direct script access allowed');
use \Firebase\JWT\JWT;

class ChangePassword extends CI_Controller {


	public function __construct() {
	
		parent::__construct();
		
		$this->load->model('ChangePassword_model');
		include APPPATH . 'vendor/firebase/php-jwt/src/JWT.php';
		
	}
	public function changeNewPassword() {			
		$post_password = json_decode(trim(file_get_contents('php://input')), true);		
		if ($post_password) {					
			$result = $this->ChangePassword_model->changeNewPassword($post_password);
			if($result)	{
				echo json_encode('success');
			} else {					
				echo json_encode("Incorrect Password");
			}								
		}
	}
	public function forgotPassword()
		{				 		
		$post_pass = json_decode(trim(file_get_contents('php://input')), true);		
		if ($post_pass)
			{
				$post_pass['ResetPasswordCode']=mt_rand(100000, 999999);
				
				$result = $this->ChangePassword_model->forgotPassword($post_pass);
				if($result)
				{	
					 $userId=$result;
					 $data['UserId']=$userId;
					 $data['ResetPasswordCode']=$post_pass['ResetPasswordCode'];
					 $data['EmailAddress']=$post_pass['EmailAddress'];

					 $this->db->select('FirstName,LastName,EmailAddress');
						$this->db->where('UserId',$userId);
						$result = $this->db->get('tbluser');	
						foreach($result->result() as $row) {
							$FirstName = $row->FirstName;
							$LastName = $row->LastName;
							$EmailAddress = $row->EmailAddress;
						}
						$config['protocol'] = 'smtp';
						$config['smtp_host'] = 'ssl://smtp.googlemail.com';
						$config['smtp_port'] = '465';
						$config['smtp_user'] = 'myopeneyes3937@gmail.com';
						$config['smtp_pass'] = 'W3lc0m3@2019';  //sender's password
						$config['mailtype'] = 'html';
						$config['charset'] = 'iso-8859-1';
						$config['newline']="\r\n";
						$config['wordwrap'] = 'TRUE';

						$path = BASE_URL.'/reset-password/'.JWT::encode($data,"MyGeneratedKey","HS256");
						$message = '
						<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #333333; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto; width:600px">
						<tbody>
							<tr>
								<td style="background-color:#fff; background:#fff; padding:10px 10px 5px 10px; text-align:center"><img alt="" style="width:130px" src="https://devbyopeneyes.com/emailer_images/oess.png" /></td>
							</tr>
							<tr>
								<td style="border-width:0; padding:20px 10px 10px 10px; text-align:center">
									<p style="color:#000; font-size: 25px; line-height: 25px; font-weight: bold;padding: 0; margin: 0 0 10px;"><strong>Forgot</strong></p>
									<p style="color:#000; font-size: 18px; line-height: 18px; font-weight: bold; padding: 0; margin: 0 0 10px;">Your Password?</p>
									<p style="color:#000; font-size: 14px; line-height:20px; padding: 0; margin: 0 0;">Not to worry, we got you! Let&#39;s get you a new password.</p>
								</td>
							</tr>
							<tr>
								<td style="border-width:0; padding:0; text-align:center; vertical-align:middle">
								<table border="0" cellpadding="0" cellspacing="0" style="border:0; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto">
									<tbody>
										<tr>
											<td style="background-color:#0061AF; background:#0061AF; border-radius:4px; border-width:0; clear:both; color:#ffffff; font-size:14px; line-height:13px; opacity:1; padding:10px; text-align:center; text-decoration:none; width:130px"><a href="'.$path.'" style="color:#fff; text-decoration:none;">Reset Password</a></td>
										</tr>
									</tbody>
								</table>
								</td>
							</tr>
							<tr>
								<td style="border-width:0; padding:20px 10px 10px 10px; text-align:center; vertical-align:middle">
									<p style="color:#777; font-size: 14px; line-height:20px; padding: 0; margin: 0 0 25px;">If you did not request a password reset, please ignore this email.</p>
									<p style="color:#777; font-size: 12px; line-height:20px; padding: 0; margin: 0 0 10px; text-align: left;">If you&rsquo;re having trouble with the button above, copy and paste the URL below into your web browser. <a href="'.$path.'" style="cursor:pointer;">click here</a></p>
								</td>
							</tr>
							<tr>
								<td style="background-color:#a6ce39; background:#a6ce39; border-top:1px solid #cccccc; color:#000; font-size:13px; padding:7px; text-align:center">Copyright &copy; 2018 OpenEyes Software Solutions</td>
							</tr>
						</tbody>
					</table>';
					$this->email->initialize($config); 
					$this->email->from('info@theopeneyes.com','OpenEyes Software Solutions Pvt. Ltd');
					$this->email->to($EmailAddress);
					$this->email->subject('Employee Evaluation - Password Reset Request');
					$this->email->message($message);
					if($this->email->send()){
					// return true;
					}else{
					// return false;
					}  
					echo json_encode('Success');	
					}
					else{
						echo json_encode("Code duplicate");
					}
				}
			}
		public function resetPassword()
		{				 		
		$post_pass = json_decode(trim(file_get_contents('php://input')), true);		
		if ($post_pass)
			{
				$result = $this->ChangePassword_model->resetPassword($post_pass);
				if($result)
				{	
					$userId=$post_pass['UserId'];
					
					 $this->db->select('FirstName,LastName,EmailAddress');
						$this->db->where('UserId',$userId);
						$result = $this->db->get('tbluser');	
						foreach($result->result() as $row) {
							$FirstName = $row->FirstName;
							$LastName = $row->LastName;
							$EmailAddress = $row->EmailAddress;
						}
						$config['protocol'] = 'smtp';
						$config['smtp_host'] = 'ssl://smtp.googlemail.com';
						$config['smtp_port'] = '465';
						$config['smtp_user'] = 'myopeneyes3937@gmail.com';
						$config['smtp_pass'] = 'W3lc0m3@2018';  //sender's password
						$config['mailtype'] = 'html';
						$config['charset'] = 'iso-8859-1';
						$config['newline']="\r\n";
						$config['wordwrap'] = 'TRUE';

						$loginpath = BASE_URL.'/login/';
						$forgotpath = BASE_URL.'/forgot-password/';
						$message = '
						<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #333333; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto; width:600px">
							<tbody>
								<tr>
									<td style="background-color:#fff; background:#fff; padding:10px 10px 5px 10px; text-align:center"><img alt="" style="width:130px" src="https://devbyopeneyes.com/emailer_images/oess.png" /></td>
								</tr>
								<tr>
									<td style="border-width:0; padding:10px 10px 10px 10px; text-align:center">
										<p style="color:#000; font-size: 25px; line-height: 25px; font-weight: bold;padding: 0; margin: 0 0 10px;"><strong>Password Reset!</strong></p>
										<p style="color:#000; font-size: 18px; line-height: 18px; font-weight: bold; padding: 0; margin: 0 0 10px;">Your new password has been set.</p>
										<p style="color:#000; font-size: 14px; line-height:20px; padding: 0; margin: 0 0;">Use the button below to access your account:</p>
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
										<p style="color:#777; font-size: 14px; line-height:20px; padding: 0; margin: 0 0 25px;">If the changes described above are accurate, no further action is needed. If anything doesn&#39;t look right, follow the link below to make changes: <a href="'.$forgotpath.'">Restore password</a></p>
										<p style="color:#777; font-size: 14px; line-height:20px; padding: 0; margin: 0 0 25px;">If you have any questions, you can reply to this email and it will go right to them.</p>
										<p style="color:#777; font-size: 12px; line-height:20px; padding: 0; margin: 0 0 10px; text-align: left;">If you&rsquo;re having trouble with the button above, copy and paste the URL below into your web browser. <a href="'.$loginpath.'" style="cursor:pointer;">click here</a></p>
									</td>
								</tr>
								<tr>
									<td style="background-color:#a6ce39; background:#a6ce39; border-top:1px solid #cccccc; color:#000; font-size:13px; padding:7px; text-align:center">Copyright &copy; 2018 OpenEyes Software Solutions</td>
								</tr>
							</tbody>
						</table>';
					$this->email->initialize($config); 
					$this->email->from('info@theopeneyes.com','OpenEyes Software Solutions Pvt. Ltd');
					$this->email->to($EmailAddress);
					$this->email->subject('Employee Evaluation - Password has been Changed');
					$this->email->message($message);
					if($this->email->send()){
					// return true;
					}else{
					// return false;
					}  
					echo json_encode('Success');	
					}
					else{
						echo json_encode("Code duplicate");
					}
				}
			}
		public function resetpasslink2()
		{				
		$post_passlink = json_decode(trim(file_get_contents('php://input')), true);		
		if ($post_passlink)
			{
				
			
				$result = $this->ChangePassword_model->reset_passlink2($post_passlink);
				
				if($result)
				{
						echo json_encode('Success');
				}	
				else
				{
					
					echo json_encode('fail');
				}
										
			}
		
		}
}

