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
}
