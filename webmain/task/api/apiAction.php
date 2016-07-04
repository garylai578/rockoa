<?php
class apiAction extends ActionNot
{

	public $userrs;
	public $cfrom		= '';
	public $token		= '';
	
	public function initAction()
	{
		$this->display= false;
		$time 		= time();
		$this->cfrom= $this->request('cfrom');
		$this->token= $this->request('token', $this->admintoken);
		$this->adminid 	 = (int)$this->request('adminid', $this->adminid);
		$this->adminname = '';
		$boss = (M == 'login|api');
		if(!$boss && HOST!='127.0.0.1'){
			if($this->isempt($this->token))$this->showreturn('','token invalid', 299);
			$to = m('logintoken')->rows("`token`='$this->token' and `uid`='$this->adminid'");
			if($to==0)$this->showreturn('','access invalid', 299);
		}
		$this->userrs = m('admin')->getone("`id`='$this->adminid' and `status`=1", '`name`,`user`,`id`,`ranking`,`deptname`,`deptid`');
		if(!$this->userrs && !$boss){
			$this->showreturn('', 'not found user', 203);
		}
		$this->adminname 	= $this->userrs['name'];
		$this->rock->adminid	= $this->adminid;
		$this->rock->adminname 	= $this->adminname;
	}
	
	public function getvals($nae, $dev='')
	{
		$sv = $this->rock->jm->base64decode($this->post($nae));
		if($this->isempt($sv))$sv=$dev;
		return $sv;
	}
}