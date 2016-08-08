<?php
class modeClassModel extends Model
{
	public function initModel()
	{
		$this->settable('flow_set');
	}
	public function getmodearr()
	{
		$arr = $this->getall('id>0','`id`,`num`,`name`,`table`,`type`','sort');
		foreach($arr as $k=>$rs){
			$arr[$k]['name'] = ''.$rs['id'].'.'.$rs['name'].'('.$rs['num'].')';
		}
		return $arr;
	}
}