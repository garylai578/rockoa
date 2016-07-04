<?php
class sysClassAction extends runtAction
{
	//数据备份
	public function beifenAction()
	{
		m('beifen')->start();
		echo 'success';
	}
}