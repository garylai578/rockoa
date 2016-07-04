<?php
class optionClassAction extends Action
{
	public function getlistAjax()
	{
		$num	= $this->request('num');
		$db		= m('option');
		$id		= $db->getmou('id', "`num`='$num'");
		$rows	= $db->getall("`pid`='$id' order by `sort`, `id`");
		
		echo json_encode(array(
			'totalCount'=> $this->db->count,
			'rows'		=> $rows,
			'pid'		=> $id
		));
	}
	
	public function getfileAjax()
	{
		$mtype 	= $this->request('mtype');
		$mid 	= $this->request('mid');
		$rows 	= m('file')->getfile($mtype, $mid);
		echo json_encode($rows);
	}
}