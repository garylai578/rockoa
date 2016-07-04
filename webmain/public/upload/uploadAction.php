<?php 
class uploadClassAction extends Action{
	
	
	public function getfileAjax()
	{
		$mtype		= $this->request('mtype');
		$mid		= $this->request('mid');
		$rows 		= m('file')->getfiles($mtype, $mid);
		echo json_encode($rows);
	}
	
	public function delfileAjax()
	{
		$id		= $this->request('id');
		m('file')->delfile($id);
	}
	
	public function showAction()
	{
		$id		= (int)$this->get('id','0');
		$this->display = false;
		m('file')->show($id);
	}
}