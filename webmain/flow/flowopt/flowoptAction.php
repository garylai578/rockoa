<?php
class flowoptClassAction extends Action
{
	public function addlogAjax()
	{
		$sm 	= $this->post('sm');
		$mid 	= (int)$this->post('mid');
		$modenum= $this->post('modenum');
		$name 	= $this->post('name');
		$zt 	= $this->post('zt');
		$ztid 	= $this->post('ztid','1');
		m('flow')->addlog($modenum, $mid,$name,array(
			'explain' 		=> $sm,
			'statusname' 	=> $zt,
			'status' 		=> $ztid
		));
		$this->showreturn('ok');
	}
	
	public function delflowAjax()
	{
		$mid 	= (int)$this->post('mid');
		$modenum= $this->post('modenum');
		$sm 	= $this->post('sm');
		$msg 	= m('flow')->opt('deletebill', $modenum, $mid, $sm);
		if($msg != 'ok')$this->showreturn('', $msg, 201);
		$this->showreturn('ok');
	}
	
	public function checkAjax()
	{
		$mid 	= (int)$this->post('mid');
		$zt 	= (int)$this->post('zt');
		$modenum= $this->post('modenum');
		$sm 	= $this->post('sm');
		$msg 	= m('flow')->opt('check', $modenum, $mid, $zt, $sm);
		
		backmsg('', $msg);
	}
}