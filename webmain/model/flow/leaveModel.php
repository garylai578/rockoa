<?php
class flow_leaveClassModel extends flowModel
{
	
	public function flowrsreplace($rs)
	{
		$rs['modenum'] = $this->modenum;
		return $rs;
	}

	protected function flowbillwhere($uid, $lx)
	{
		$key 	= $this->rock->post('key');
		$where 	= "`uid`='$uid' and `kind`='请假'";
		if(!isempt($key))$where.=" and (`kind`='$key' or `qjkind`='$key')";
		
		return array(
			'where' => 'and '.$where,
			'order' => '`optdt` desc'
		);
	}
}