<?php

class flow_custsaleClassModel extends flowModel
{
	
	protected function flowchangedata(){
		$this->statearr		 = c('array')->strtoarray('跟进中|blue,已成交|green,已丢失|#888888');;
		$this->rs['stateid'] = $this->rs['state'];
		$zt = $this->statearr[$this->rs['state']];
		$this->rs['state']	 = '<font color="'.$zt[1].'">'.$zt[0].'</font>';
	}
	
	protected function flowaddlog($a)
	{
		$actname = $a['name'];
		$cname 	 = $this->rock->post('changename');
		$cnameid = $this->rock->post('changenameid');
		if($actname == '转移给'){
			$this->update(array(
				'uid' 		=> $cnameid,
				'optname' 	=> $cname,
			), $this->id);
			$this->push($cnameid, '客户管理', ''.$this->adminname.'将一个客户【{custname}】的一个销售单转移给你');
		}
		
		if($actname == '共享给'){
			$this->update(array(
				'shateid' 	=> $cnameid,
				'shate' 	=> $cname,
			), $this->id);
			$this->push($cnameid, '客户管理', ''.$this->adminname.'将一个客户【{custname}】共享给你');
		}
	}
}