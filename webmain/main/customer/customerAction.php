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
		if($lx=='shatemy'){
			$s		= $this->rock->dbinstr('shateid', $uid);
			$where  ='and '.$s.'';
		}
		if($zt!='')$where.=" and status='$zt'";
		if(!isempt($key))$where.=" and (`name` like '%$key%' or `unitname` like '%$key%')";

		return array(
			'where' => $where,
			'fields'=> 'id,name,status,laiyuan,isgys,optname,unitname,shate,tel',
			'order' => 'status desc,optdt desc'
		);
	}
	
	public function custsalebefore($table)
	{
		$lx 	= $this->post('atype');
		$key 	= $this->post('key');
		$zt 	= $this->post('zt');
		$uid 	= $this->adminid;
		$where	= 'and uid='.$uid.'';
		
		if($lx=='my'){
			
		}
		if($zt!='')$where.=" and `state`='$zt'";
		if(!isempt($key))$where.=" and (`custname` like '%$key%')";

		return array(
			'where' => $where,
			'fields'=> 'id,custname,laiyuan,optname,state,money,optdt,createname,`explain`',
			'order' => 'optdt desc'
		);
	}
	
	public function custsaleafter($table, $rows)
	{
		$flow = m('flow:custsale');
		foreach($rows as $k=>$rs){
			$zt = $flow->statearr[$rs['state']];
			$rows[$k]['state'] = '<font color="'.$zt[1].'">'.$zt[0].'</font>';
		}
		return array('rows'=>$rows);
	}
	
}