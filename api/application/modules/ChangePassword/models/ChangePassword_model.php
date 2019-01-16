<?php

class ChangePassword_model extends CI_Model {

	public function changeNewPassword($post_password) {
		if($post_password) {
				$this->db->select('UserId,Password,EmailAddress,FirstName');				
				$this->db->where('UserId',trim($post_password['UserId']));
				$this->db->where('Password',md5(trim($post_password['Password'])));
				$this->db->limit(1);
				$this->db->from('tbluser');
				$query = $this->db->get();
				
				if ($query->num_rows() == 1) {
					$password_data = array(
						'Password'=>md5($post_password['NewPassword']),
						'UpdatedBy' => trim($post_password['UserId']),
						'UpdatedOn' => date('y-m-d H:i:s')
					);
					$this->db->where('UserId',trim($post_password['UserId']));
					$res = $this->db->update('tbluser',$password_data);
					if($res) {
						$log_data = array(
							'UserId' => trim($post_password['UserId']),
							'Module' => 'Password',
							'Activity' =>'Change Password after Login'
						);
						$log = $this->db->insert('tblactivitylog',$log_data);
						return true;
					} else {
						return false;
					}
				} else {
					return false;
				}
		} else {
				return false;
		}	
	}	
	public function forgotPassword($post_pass) 
	{
	try{
		if($post_pass)
		{
				$this->db->select('UserId,EmailAddress,ForgotPasswordCode');				
				$this->db->where('EmailAddress',trim($post_pass['EmailAddress']));
				//$this->db->where('Status',0);
				$this->db->limit(1);
				$this->db->from('tbluser');
				$query = $this->db->get();
				
				if ($query->num_rows() == 1) 
				{
					$pass_data = array(
						//'Status' =>0,
						'ForgotPasswordCode' =>$post_pass['ForgotPasswordCode'],
						'UpdatedOn' => date('y-m-d H:i:s')
					);
					
					$this->db->where('EmailAddress',trim($post_pass['EmailAddress']));
					$res = $this->db->update('tbluser',$pass_data);
					$db_error = $this->db->error();
					if (!empty($db_error) && !empty($db_error['code'])) { 
						throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);
						return false; // unreachable return statement !!!
					}
					if($res)
					{
						$pass = array();
						
						foreach($query->result() as $row) {
							$pass = $row;
						}
						$log_data = array(
							'UserId' => $query->result()[0]->UserId,
							'Module' => 'Password',
							'Activity' =>'Send Password reset Link'
						);
						$log = $this->db->insert('tblactivitylog',$log_data);

						return $query->result()[0]->UserId;

					}else
					{
						return false;
					}
				
				} 
				else
				{
					return false;
				}
				
		} 
		else
		{
				return false;
		}
				
		}			
		catch(Exception $e){
			trigger_error($e->getMessage(), E_USER_ERROR);
			return false;
		}			
	
	}
	public function resetPassword($post_pass) 
	{
		if($post_pass)
		{
			
			$pass_data = array(
				'Password' =>md5(trim($post_pass['NewPassword'])),
				'ForgotPasswordCode' =>'',
				'UpdatedOn' => date('y-m-d H:i:s')
				
			);
			
			$this->db->where('UserId',trim($post_pass['UserId']));
			//$this->db->where('Status',0);
			$res = $this->db->update('tbluser',$pass_data);
			
			if($res) {
				$log_data = array(
					'UserId' => trim($post_pass['UserId']),
					'Module' => 'Password',
					'Activity' =>'Reset Password without Login'
				);
				$log = $this->db->insert('tblactivitylog',$log_data);
				return true;
			} else {
				return false;
			}
			
				
		} 
		else
		{
				return false;
		}	
	}
	public function reset_passlink2($post_passlink) 
	{
		if($post_passlink)
		{
			
				$this->db->select('UserId,ForgotPasswordCode');				
				$this->db->where('UserId',trim($post_passlink['UserId']));
				//$this->db->where('EmailAddress',$post_pass['EmailAddress']);
				$this->db->where('ForgotPasswordCode',trim($post_passlink['ForgotPasswordCode']));
				$this->db->limit(1);
				$this->db->from('tbluser');
			    $query= $this->db->get();
			
				
				if ($query->num_rows() == 1) 
				{
					return true;
				} 
				else
				{
					return false;
				}
				
				
		} 
		else
		{
				return false;
		}	
	}

}
