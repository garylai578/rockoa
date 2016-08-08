<?php
class whereClassModel extends Model
{
	
	public function getstrwhere($str, $uid=0)
	{
		if($uid==0)$uid = $this->adminid;
		$str = str_replace(array('{uid}','{now}','{date}'), array($uid, $this->rock->now, $this->rock->date), $str);
		return $str;
	}
	
}