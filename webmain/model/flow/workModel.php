<?php
class flow_workClassModel extends flowModel
{
	public $statearr = array();
	protected function flowchangedata(){
		$this->rs['explain'] = str_replace("\n", '<br>', $this->rs['explain']);
		$this->statearr		 = explode(',','待执行,已完成,执行中,中止');
		$this->rs['stateid'] = $this->rs['state'];
		$this->rs['state']	 = $this->statearr[$this->rs['state']];
	}
	
	protected function flowdatalog($arr)
	{
		$isaddlog	= 0;
		$distid 	= ','.$this->rs['distid'].',';
		$zt 		= $this->rs['stateid'];
		if($this->contain($distid, ','.$this->adminid.',') && ($zt==0||$zt==2)){
			$isaddlog = 1;
		}
		$arr['isaddlog'] = $isaddlog;
		$arr['state'] 	 = $this->rs['stateid'];
		return $arr;
	}
	
	protected function flowsubmit($na, $sm)
	{
		$this->push($this->rs['distid'], '任务', '[{type}]{title}');
	}
	
	protected function flowaddlog($a)
	{
		if($a['name']=='进度报告'){
			$state 	= $a['status'];
			$arr['state'] = $state;
			$cont = ''.$this->adminname.'添加【[{type}]{title}】的任务进度,说明:'.$a['explain'].'';
			if($state=='1')$cont='【[{type}]{title}】任务'.$this->adminname.'已完成';
			$this->push($this->rs['optid'], '任务', $cont);
			$this->update($arr, $this->id);
		}
		if($a['name']=='指派给'){
			$cname 	 = $this->rock->post('changename');
			$cnameid = $this->rock->post('changenameid');
			$state = '0';
			$arr['state'] 	= $state;
			$arr['distid'] 	= $cnameid;
			$arr['dist'] 	= $cname;
			$this->update($arr, $this->id);
			$this->push($cnameid, '任务', ''.$this->adminname.'指派任务[{type}]{title}给你');
		}
	}
}