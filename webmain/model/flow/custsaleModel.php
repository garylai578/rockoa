<?php

class flow_custsaleClassModel extends flowModel
{
	protected function flowinit(){
		$this->statearr		 = c('array')->strtoarray('跟进中|blue,已成交|green,已丢失|#888888');
	}
	
	protected function flowchangedata(){
		$this->rs['stateid'] = $this->rs['state'];
		$zt = $this->statearr[$this->rs['state']];
		$this->rs['state']	 = '<font color="'.$zt[1].'">'.$zt[0].'</font>';
	}
	
	protected function flowoptmenu($ors, $crs)
	{
		$zt  = $ors['statusvalue'];
		$num = $ors['num'];
		if($num=='ztqh'){
			$sarr['state'] = $zt;
			if($zt==1)$sarr['dealdt'] = $this->rock->now;	
			$this->update($sarr, $this->id);
		}
		
		if($num=='zhuan'){
			$cname 	 = $crs['cname'];
			$cnameid = $crs['cnameid'];
			$this->update(array(
				'uid' 		=> $cnameid,
				'optname' 	=> $cname
			), $this->id);
			$this->push($cnameid, '客户销售', ''.$this->adminname.'将一个客户【{custname}】的一个销售单转移给你');
		}	
	}
	
	protected function flowprintrows($rows)
	{
		foreach($rows as $k=>$rs){
			$zt = $this->statearr[$rs['state']];
			$rows[$k]['state']		= '<font color="'.$zt[1].'">'.$zt[0].'</font>';;
		}
		return $rows;
	}
}