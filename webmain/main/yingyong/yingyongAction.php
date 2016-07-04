<?php
class yingyongClassAction extends Action
{
	public function getdataAjax()
	{
		$rows = m('im_group')->getall('`type`=2','id,name,face,num,valid','`sort`');
		echo json_encode($rows);
	}
	
	public function loaddataAjax()
	{
		$id = (int)$this->get('id');
		$arr['data'] = m('im_group')->getone($id);
		echo json_encode($arr);
	}
	
	public function beforesave($table, $cans, $id)
	{
		$msg = '';
		$num = $cans['num'];
		if(m($table)->rows("`num`='$num' and `id`<>$id")>0)$msg='编号['.$num.']已存在';
		return array('msg'=>$msg);
	}
	
	
	public function menudataAjax()
	{
		$this->rows	= array();
		$mid		= $this->get('mid');
		$where 	= "and `mid`='$mid'";
		$this->getmenu(0, 1, $where);
		
		echo json_encode(array(
			'totalCount'=> 0,
			'rows'		=> $this->rows
		));
	}
	
	private function getmenu($pid, $oi, $wh='')
	{
		$db		= m('im_menu');
		$menu	= $db->getall("`pid`='$pid' $wh order by `sort`",'*');
		foreach($menu as $k=>$rs){
			$sid			= $rs['id'];
			$rs['level']	= $oi;
			$rs['stotal']	= $db->rows("`pid`='$sid'  $wh ");
			$this->rows[] = $rs;
			
			$this->getmenu($sid, $oi+1, $wh);
		}
	}
}