<?php
class optionClassModel extends Model
{
	/**
		获取选项
	*/
	public function getval($num, $dev='', $lx=0)
	{
		$val= '';
		$rs = $this->getone("`num`='$num'", '`name`,`value`');
		if($rs){
			if($lx==0)$val=$rs['value'];
			if($lx==1)$val=$rs['name'];
		}
		if($this->rock->isempt($val))$val=$dev;
		return $val;
	}
	
	public function getdata($num, $whe='')
	{
		if(!is_numeric($num)){
			$id  = (int)$this->getmou('id', "`num`='$num'");
			if($id == 0)$id = -1;
		}else{
			$id = $num;
		}
		return $this->getall("`pid`='$id' and `valid`=1 $whe order by `sort`,`id`");
	}
	
	public function getmnum($num)
	{
		return $this->getdata($num);
	}
	
	public function setval($num, $val='')
	{
		$where = "`num`='$num'";
		if($this->rows($where)==0)$where='';
		$this->record(array(
			'num'	=> $num,
			'value'	=> $val,
			'optdt'	=> $this->rock->now
		), $where);
	}
}