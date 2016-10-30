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
	
	public function upimgAction()
	{
		$this->display = false;
		$upfile = c('upfile');
		$upfile->initupfile('jpg|png|gif|jpeg','upload|'.date('Y-m').'', 5);
		$upses	= $upfile->up('imgFile');
		if(is_array($upses)){
			$url = $upses['allfilename'];
			$url = str_replace('../' , '', $url);
			$arr = array('error' => 0, 'url' => $url);
		}else{
			$arr = array('error' => 1, 'message' => $upses);
		}
		$this->returnjson($arr);
	}
}