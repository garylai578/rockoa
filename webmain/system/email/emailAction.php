<?php
class emailClassAction extends Action
{
	public function savebeforecog($table, $cans)
	{
		$emailpass	= $this->post('emailpass');
		if(!isempt($emailpass)){
			$cans['emailpass'] = $this->jm->encrypt($emailpass);
		}
		return array(
			'rows' => $cans
		);
	}
	
	public function testsendAjax()
	{
		$id 	= (int)$this->post('id');
		$msg 	= m('email')->sendmail_test($id);
		echo $msg;
	}
}