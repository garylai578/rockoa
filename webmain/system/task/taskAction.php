<?php
class taskClassAction extends Action
{

	public function creaefileAjax()
	{
		$rows 	= m('task')->getrows('`status`=1 order by `sort`','`id`,`url`,`type`,`time`,`startdt`');
		$cont 	= json_encode($rows);
		//$this->rock->createtxt(''.PROJECT.'/task/runt/taskconfig.json', $cont);
	}
}