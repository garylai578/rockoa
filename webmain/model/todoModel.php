<?php
class todoClassModel extends Model
{
	/**
		添加通知
	*/
	public function add($uid, $title, $mess, $arrs=array())
	{
		$arr['title']	= $title;
		$arr['mess']	= $mess;
		$arr['status']	= '0';
		$arr['optdt']	= $this->rock->now;
		$arr['tododt']	= $this->rock->now;
		foreach($arrs as $k=>$v)$arr[$k] = $v;
		$uid	= ''.$uid.'';
		$suid	= explode(',', $uid);
		foreach($suid as $suids){
			$arr['uid']	= $suids;
			$this->insert($arr);
		}
	}
	
	/**
		添加唯一的通知
	*/
	public function addtz($uid, $title, $mess, $table='', $mid='', $tododt='')
	{
		$where = '';
		if($table != '')$where = " and `table`='$table'";
		if($mid != '')$where .= " and `mid`='$mid'";
		if($where != ''){
			$this->delete("`uid` in($uid) and `status`=0 $where");
		}
		$arr 	= array(
			'table'	=> $table,
			'mid'	=> $mid
		);
		if(!$this->isempt($tododt))$arr['tododt'] = $tododt;
		$this->add($uid, $title, $mess, $arr);
	}
}