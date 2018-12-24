<?php
defined('BASEPATH') OR exit('No direct script access allowed');
header("Access-Control-Allow-Origin: *");
header('Access-Control-Allow-Headers: *');
header('Content-Type: application/json');


class Remaining extends CI_Controller {

	public function __construct() {
	
		parent::__construct();
		
		$this->load->model('Remaining_model');
		
	}
	
	public function sendReminder()
	{  
		$currentdate = new DateTime();
		$remaining1=date('Y-m-d',strtotime('+1Day'));
		$remaining7=date('Y-m-d',strtotime('+7Day'));

		$config['protocol'] = 'smtp';
		$config['smtp_host'] = 'ssl://smtp.googlemail.com';
		$config['smtp_port'] = '465';
		$config['smtp_user'] = 'myopeneyes3937@gmail.com';
		$config['smtp_pass'] = 'W3lc0m3@2018';  //sender's password
		$config['mailtype'] = 'html';
		$config['charset'] = 'iso-8859-1';
		$config['newline']="\r\n";
		$config['wordwrap'] = 'TRUE';
		$dashboardpath = BASE_URL.'/dashboard/';
		
		$result = $this->Remaining_model->getEvaluation($remaining1);
		if($result){
			foreach ($result as $row) {

				$email = $row->EmailAddress;
				$name = $row->FirstName." ".$row->LastName;
				$evaluationtypename = $row->EvaluationTypeName;
				$evaluationdate = $row->EvaluationDate;
				$evaluatorid = $row->EvaluatorId;
				$userid = $row->UserId;
				if($evaluatorid==$userid){
					$evaluatortype = '0';
				} else {
					$evaluatortype = '1';
				} 

				if($evaluatortype=='0'){
					$subject = 'Self-Employee evaluation - Reminder';
					$message = '
					<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #333333; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto; width:600px">
						<tbody>
							<tr>
								<td style="background-color:#fff; background:#fff; padding:10px 10px 5px 10px; text-align:center"><img alt="" style="width:130px" src="https://devbyopeneyes.com/emailer_images/oess.png" /></td>
							</tr>
							<tr>
								<td style="border-width:0; padding:20px 10px 10px 10px; text-align:center">

								<p style="color:#000; font-size: 18px; line-height: 18px; font-weight: bold; padding: 0; margin: 0 0 10px;">Reminder! You have one day to give your below evaluation.</p>

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
											<td style="padding:5px; text-align:left; width:48%">'.$evaluationdate.'</td>
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
				}else{
					$subject = $name."'s Employee evaluation - Reminder";
					$message = '
					<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #333333; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto; width:600px">
						<tbody>
							<tr>
								<td style="background-color:#fff; background:#fff; padding:10px 10px 5px 10px; text-align:center"><img alt="" style="width:130px" src="https://devbyopeneyes.com/emailer_images/oess.png" /></td>
							</tr>
							<tr>
								<td style="border-width:0; padding:20px 10px 10px 10px; text-align:center">

								<p style="color:#000; font-size: 18px; line-height: 18px; font-weight: bold; padding: 0; margin: 0 0 10px;">Reminder! You have one day to give evaluation for below employee.</p>

								<table border="0" cellpadding="0" cellspacing="0" style="margin:20px 0; width:100%; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto;">
									<tbody>
										<tr>
											<td style="padding:5px; text-align:right; width:35%">Employee Name</td>
											<td style="padding:5px; text-align:center; width:4%">:</td>
											<td style="padding:5px; text-align:left; width:48%">'.$name.'</td>
										</tr>
										<tr>
											<td style="padding:5px; text-align:right; width:35%">Evaluation Type:</td>
											<td style="padding:5px; text-align:center; width:4%">:</td>
											<td style="padding:5px; text-align:left; width:48%">'.$evaluationtypename.'</td>
										</tr>
										<tr>
											<td style="padding:5px; text-align:right; width:35%">Scheduled Evaluation Date</td>
											<td style="padding:5px; text-align:center; width:4%">:</td>
											<td style="padding:5px; text-align:left; width:48%">'.$evaluationdate.'</td>
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
				
				$this->email->initialize($config); 
				$this->email->from('info@theopeneyes.com','OpenEyes Software Solutions Pvt. Ltd');
				$this->email->to($email);
				$this->email->subject($subject);
				$this->email->message($message);
				$this->email->send();
				
				echo json_encode('Success');
			}
		}
		else {
			echo "No data available";
		}
		
		$result = $this->Remaining_model->getEvaluation($remaining7);
		if($result){
			foreach ($result as $row) {

				$email = $row->EmailAddress;
				$name = $row->FirstName." ".$row->LastName;
				$evaluationtypename = $row->EvaluationTypeName;
				$evaluationdate = $row->EvaluationDate;
				$evaluatorid = $row->EvaluatorId;
				$userid = $row->UserId;
				if($evaluatorid==$userid){
					$evaluatortype = '0';
				} else {
					$evaluatortype = '1';
				}
				
				if($evaluatortype=='0'){
					$subject = 'Self-Employee evaluation - Reminder';
					$message = '
					<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #333333; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto; width:600px">
						<tbody>
							<tr>
								<td style="background-color:#fff; background:#fff; padding:10px 10px 5px 10px; text-align:center"><img alt="" style="width:130px" src="https://devbyopeneyes.com/emailer_images/oess.png" /></td>
							</tr>
							<tr>
								<td style="border-width:0; padding:20px 10px 10px 10px; text-align:center">

								<p style="color:#000; font-size: 18px; line-height: 18px; font-weight: bold; padding: 0; margin: 0 0 10px;">Reminder! You have 7 days to give your below evaluation.</p>

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
											<td style="padding:5px; text-align:left; width:48%">'.$evaluationdate.'</td>
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
				}else{
					$subject = $name."'s Employee evaluation - Reminder";
					$message = '
					<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #333333; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto; width:600px">
						<tbody>
							<tr>
								<td style="background-color:#fff; background:#fff; padding:10px 10px 5px 10px; text-align:center"><img alt="" style="width:130px" src="https://devbyopeneyes.com/emailer_images/oess.png" /></td>
							</tr>
							<tr>
								<td style="border-width:0; padding:20px 10px 10px 10px; text-align:center">

								<p style="color:#000; font-size: 18px; line-height: 18px; font-weight: bold; padding: 0; margin: 0 0 10px;">Reminder! You have 7 days to give evaluation for below employee.</p>

								<table border="0" cellpadding="0" cellspacing="0" style="margin:20px 0; width:100%; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto;">
									<tbody>
										<tr>
											<td style="padding:5px; text-align:right; width:35%">Employee Name</td>
											<td style="padding:5px; text-align:center; width:4%">:</td>
											<td style="padding:5px; text-align:left; width:48%">'.$name.'</td>
										</tr>
										<tr>
											<td style="padding:5px; text-align:right; width:35%">Evaluation Type:</td>
											<td style="padding:5px; text-align:center; width:4%">:</td>
											<td style="padding:5px; text-align:left; width:48%">'.$evaluationtypename.'</td>
										</tr>
										<tr>
											<td style="padding:5px; text-align:right; width:35%">Scheduled Evaluation Date</td>
											<td style="padding:5px; text-align:center; width:4%">:</td>
											<td style="padding:5px; text-align:left; width:48%">'.$evaluationdate.'</td>
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
				
				$this->email->initialize($config); 
				$this->email->from('info@theopeneyes.com','OpenEyes Software Solutions Pvt. Ltd');
				$this->email->to($email);
				$this->email->subject($subject);
				$this->email->message($message);
				$this->email->send();
				
				echo json_encode('Success');
			}
		}
    }
}
