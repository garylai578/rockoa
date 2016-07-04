<?php
class flow_dailyClassModel extends flowModel
{
	protected function flowchangedata(){
		$this->rs['content'] 	= str_replace("\n",'<br>', $this->rs['content']);
		$this->rs['plan'] 		= str_replace("\n",'<br>', $this->rs['plan']);
		$typearr = explode(',','日报,周报,月报,年报');
		$this->rs['type'] 		= $typearr[$this->rs['type']];
	}
}