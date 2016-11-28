<?php
class menuClassAction extends Action
{

	public function dataAjax()
	{
		$this->rows	= array();
		$this->getmenu(0, 1);
		echo json_encode(array(
			'totalCount'=> 0,
			'rows'		=> $this->rows
		));
	}
	
	private function getmenu($pid, $oi)
	{
		$db		= m('menu');
		$menu	= $db->getall("`pid`='$pid' order by `sort`",'*');
		foreach($menu as $k=>$rs){
			$sid			= $rs['id'];
			$rs['level']	= $oi;
			$rs['stotal']	= $db->rows("`pid`='$sid'");
			
			$this->rows[] 	= $rs;
			$this->getmenu($sid, $oi+1);
		}
	}
}