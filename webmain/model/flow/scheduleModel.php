<?php
class flow_scheduleClassModel extends flowModel
{

	protected function flowinit(){
		$this->ratearr		 = array('d'=>'天','w'=>'周','m'=>'月');
	}
	
	protected function flowchangedata(){
		$rate = $this->rs['rate'];
		if(isset($this->ratearr[$rate])){
			$this->rs['rate'] = '每'.$this->ratearr[$rate];
		}
		$txsj = (int)$this->rs['txsj'];
		$str  = '不提醒';
		if($txsj==1)$str  = '提醒';
		$this->rs['txsj']= $str;
	}
	
	protected function flowprintrows($rows)
	{
		foreach($rows as $k=>$rs){
			$rate = $rs['rate'];
			if(isset($this->ratearr[$rate])){
				$rate = '每'.$this->ratearr[$rate];
			}
			
			$rows[$k]['rate'] = $rate;
		}
		return $rows;
	}
}