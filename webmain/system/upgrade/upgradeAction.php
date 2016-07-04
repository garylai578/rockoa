<?php
class upgradeClassAction extends Action
{
	public function dataAjax()
	{
		$arr['rows'] = array();
		$this->returnjson($arr);
	}
}