<?php
class flow_vcardClassModel extends flowModel
{

	protected function flowbillwhere($uid, $lx)
	{
		$where 	= '`uid`='.$uid.'';
		$key 	= $this->rock->post('key');
		$gname 	= $this->rock->post('gname');
		if(!isempt($gname))$where.=" and `gname`='$gname'";
		if(!isempt($key))$where.=" and (`name` like '%$key%' or `unitname` like '%$key%' or `mobile` like '%$key%' or `gname` = '$key')";
	
		return array(
			'where' => 'and '.$where,
			'fields'=> '`id`,`name`,`tel`,`mobile`,`email`,`unitname`,`optdt`,`address`,`gname`,`sort`'
		);
	}
	
	//替换
	public function flowrsreplace($rs, $lx=0)
	{
		if($lx==2){
			if(!isempt($rs['mobile']))$rs['mobile']='<a href="tel:'.$rs['mobile'].'">'.$rs['mobile'].'</a>';
			if(!isempt($rs['tel']))$rs['tel']='<a href="tel:'.$rs['tel'].'">'.$rs['tel'].'</a>';
		}
		return $rs;
	}
}