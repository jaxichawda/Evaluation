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
}
