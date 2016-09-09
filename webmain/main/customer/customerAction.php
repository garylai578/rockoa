<?php
class customerClassAction extends Action
{
	public function customerbefore($table)
	{
		$lx 	= $this->post('atype');
		$key 	= $this->post('key');
		$zt 	= $this->post('zt');
		$uid 	= $this->adminid;
		$where	= 'and uid='.$uid.'';
		if($lx=='my'){
			
		}

		if($zt!='')$where.=" and status='$zt'";
		if(!isempt($key))$where.=" and (`name` like '%$key%' or `unitname` like '%$key%')";

		return array(
			'where' => $where,
			'fields'=> 'id,name,status,laiyuan,isgys,optname,unitname,shate,tel',
			'order' => 'status desc,optdt desc'
		);
	}
	
	
}