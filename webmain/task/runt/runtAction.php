<?php
class runtAction extends ActionNot
{
	public $runid = 0;
	public $runrs;
	public function initAction()
	{
		$this->runid	= $this->get('runid','0');
		$this->runrs	= m('task')->getone($this->runid);
		$this->display 	= false;
	}
}
class runtClassAction extends runtAction
{
	public function runAction()
	{
		$mid	= (int)$this->get('mid','0');
		m('task')->baserun($mid);
		echo 'success';
	}
	public function getlistAction()
	{
		$dt 	= $this->get('dt', $this->date);
		$barr 	= m('task')->getlistrun($dt);
		$this->option->setval('systaskrun', $this->now);
		$this->returnjson($barr);
	}
}