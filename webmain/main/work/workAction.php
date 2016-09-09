<?php
class workClassAction extends Action
{
	public function workbefore($table)
	{
		$lx 	= $this->post('atype');
		$key 	= $this->post('key');
		$zt 	= $this->post('zt');
		$uid 	= $this->adminid;
		$where	= 'and '.$this->rock->dbinstr('distid', $uid).'';
		if($lx=='wwc'){
			$where.=' and state in(0,2)';
		}
		if($lx=='mycj'){
			$where='and optid='.$uid.'';
		}
		if($zt!='')$where.=' and `state`='.$zt.'';
		if(!isempt($key))$where.=" and (`title` like '%$key%' or `type` like '%$key%' or `grade` like '%$key%')";

		return array(
			'where' => $where,
			'fields'=> 'id,type,grade,dist,startdt,title,enddt,state,optname',
			'order' => 'optdt desc'
		);
	}
	
	public function workafter($table,$rows)
	{
		$statearr		 = explode(',','待执行,已完成,执行中,终止');
		$statearrs		 = explode(',','blue,green,#ff6600,#888888');
		foreach($rows as $k=>$rs){
			$zt = $rs['state'];
			$rows[$k]['state'] = '<font color="'.$statearrs[$zt].'">'.$statearr[$zt].'</font>';
		}
		return array('rows'=>$rows);
	}
	
	

	public function projectbefore($table)
	{
		$lx 	= $this->post('atype');
		$key 	= $this->post('key');
		$zt 	= $this->post('zt');
		$uid 	= $this->adminid;
		$where	= 'and optid='.$uid.'';
		
		if($lx=='myzx' || $lx=='wwc'){
			$where = m('admin')->getjoinstr('runuserid', $uid);
		}
		
		if($lx=='wwc'){
			$where.=' and `state` in(0,2)';
		}
		
		if($lx=='myfz'){
			$where	= 'and '.$this->rock->dbinstr('fuzeid', $uid).'';
		}
		
		if($zt!='')$where.=' and `state`='.$zt.'';
		if(!isempt($key))$where.=" and (`title` like '%$key%' or `type` like '%$key%' or `fuze` like '%$key%')";

		return array(
			'where' => $where,
			'fields'=> 'id,type,num,fuze,startdt,title,enddt,state,optname,runuser,progress',
			'order' => 'pid,optdt desc'
		);
	}
	
	public function projectafter($table,$rows)
	{
		$statearr		 = explode(',','待执行,已完成,执行中,终止');
		$statearrs		 = explode(',','blue,green,#ff6600,#888888');
		foreach($rows as $k=>$rs){
			$zt = $rs['state'];
			$rows[$k]['state'] = '<font color="'.$statearrs[$zt].'">'.$statearr[$zt].'</font>';
		}
		return array('rows'=>$rows);
	}	
}