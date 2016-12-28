<?php
class flow_kqdkjlClassModel extends flowModel
{
	public function initModel()
	{
		$this->dateobj = c('date');
		$this->typearr = explode(',','在线打卡,考勤机,手机定位,手动添加,异常添加,数据导入,接口导入');
	}
	
	/**
	*	用户显示展示
	*/
	protected function flowbillwhere($uid, $lx)
	{
		$where 	= 'and `uid`='.$uid.'';
		$key	= $this->rock->post('key');
		
		if(!isempt($key))$where.= " and `dkdt` like '$key%'";
	
		return array(
			'where' => $where,
			'fields'=> '`dkdt`,`ip`,`mac`,`type`,`explain`',
			'order' => '`id` desc'
		);
	}
	
	//替换
	public function flowrsreplace($rs)
	{
		$week 		= $this->dateobj->cnweek($rs['dkdt']);
		$rs['week'] = $week;
		$rs['type'] = $this->typearr[$rs['type']];
		if($week=='六' || $week=='日')$rs['ishui']= 1;
		return $rs;
	}
}