<?php
class viewClassAction extends Action
{
	public function loaddataAjax()
	{
		$id = (int)$this->get('id');
		
		$arr['data'] = m('flow_extent')->getone($id);
		$arr['modearr'] = m('flow_set')->getall('1=1','id,num,name','sort');
		echo json_encode($arr);
	}
	
	public function afterstroesss($table,$rows)
	{
		foreach($rows as $k=>$rs){
			$rows[$k]['modeid'] = $this->db->getmou('[Q]flow_set','name',$rs['modeid']);
		}
		return array(
			'rows'=>$rows,
			'modearr' => m('flow_set')->getall('1=1','id,num,name','sort')
		);
	}
}