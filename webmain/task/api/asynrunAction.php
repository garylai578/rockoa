<?php
class asynrunClassAction extends apiAction
{
	public function initAction()
	{
		$this->display= false;
	}
	
	public function indexAction()
	{
		$runtime = $this->get('runtime');
		$this->rock->debugs('hehe:'.time().','.$runtime.'','yibu');
	}
	
	public function wxchattbAction()
	{
		$id   = (int)$this->get('id');
		m('weixin:chat')->chattongbu($id);
	}
}