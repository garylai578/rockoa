<?php
/**
	信呼团队应用
*/
class agent_xinhuClassModel extends agentModel
{
	public function getdatas($uid, $lx, $page)
	{
		$rows[] = array(
			'title' => '欢迎使用信呼',
			'cont'	=> '官网：http://xinhu.pw/<br>版本：'.VERSION.'',
			'statuscolor' => 'green',
			'statustext'  => '官网'
		);
		$arr['rows'] 	= $rows;
		return $arr;
	}
	
	public function gettotal()
	{
		return array(
			'stotal' => 0,
			'titles' => ''
		);
	}
	
	public function updatedata()
	{
		$url = 'aHR0cDovLzEyNy4wLjAuMS9hcHAvd2Vic2l0ZS8:';
		//$url = 'aHR0cDovL3hoLnJvY2tvYS5jb20v';
		//$cont = c('curl')->geturl();
	}
}