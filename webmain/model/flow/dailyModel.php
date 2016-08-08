<?php
class flow_dailyClassModel extends flowModel
{
	protected function flowchangedata(){
		$this->rs['content'] 	= str_replace("\n",'<br>', $this->rs['content']);
		$this->rs['plan'] 		= str_replace("\n",'<br>', $this->rs['plan']);
		$typearr = explode(',','日报,周报,月报,年报');
		$this->rs['type'] 		= $typearr[$this->rs['type']];
	}
	
	protected function flowgetoptmenu($opt)
	{
		$to = m('log')->isread($this->mtable, $this->id);
		return $to<=0;
	}
	
	protected function flowoptmenu($ors, $crs)
	{
		$table 	= $this->mtable;
		$mid	= $this->id;
		$uid	= $this->adminid;
		$lx 	= $ors['num'];
		$log 	= m('log');
		if($lx=='yd'){
			$log->addread($table, $mid, $uid);
		}
		if($lx=='allyd'){
			$ydid  = $log->getread($table, $uid);	
			$where = m('view')->viewwhere($this->modeid, $uid);
			$where = "((1=1 $where) or (`uid`='$uid') )";
			$where = "`id` not in($ydid) and $where";
			
			$rows 	= m($table)->getrows($where,'id');
			foreach($rows as $k=>$rs)$log->addread($table, $rs['id'], $uid);
		}
	}
	
	
	protected function flowprintrows($rows)
	{
		$arrs = explode(',','日报,周报,月报,年报');
		foreach($rows as $k=>$rs){
			$rows[$k]['plan_style']		= 'text-align:left';
			$rows[$k]['content']		= str_replace("\n",'<br>', $rs['content']);
			$rows[$k]['plan']			= str_replace("\n",'<br>', $rs['plan']);
			$rows[$k]['type']			= $arrs[$rs['type']];
		}
		return $rows;
	}
	
}