<?php
class runtAction extends ActionNot
{
	public $runid = 0;
	public function initAction()
	{
		$this->runid	= $this->get('runid','0');
		$this->display 	= false;
	}
}