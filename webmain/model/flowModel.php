<?php
class flowClassModel extends Model
{
	public $flow = null;
	private function initflow($num,$mid)
	{
		$this->flow = m('flow:'.$num.'');
		$this->flow->initdata($num, $mid);
	}
	
	public function opt($act,$num,$mid,$cs1='',$cs2='',$cs3='',$cs4='')
	{
		$this->initflow($num, $mid);
		return $this->flow->$act($cs1, $cs2, $cs3, $cs4);
	}
	
	public function getdatalog($num, $mid, $lx)
	{
		return $this->opt('getdatalog', $num, $mid, $lx);
	}
	
	public function submit($num, $mid, $na='', $sm='')
	{
		return $this->opt('submit', $num, $mid, $na, $sm);
	}
	
	public function getdataedit($num, $mid)
	{
		return $this->opt('getdataedit', $num, $mid);
	}
	
	public function addlog($num, $mid,$na,$barr=array())
	{
		$darr = array(
			'name' 			=> $na
		);
		foreach($barr as $k=>$v)$darr[$k]=$v;
		return $this->opt('addlog', $num, $mid, $darr);
	}
}