<?php
class totalsClassModel extends Model
{
	//首页统计的
	public function gettotals($uid)
	{
		$optdt 	= $this->rock->now;
		$arr 	= array();
		
		$todo			= m('todo')->rows("uid='$uid' and `status`=0 and `tododt`<='$optdt'");
		$arr['todo']	= $todo;
		$arr['daiban']	= m('flowbill')->daibanshu($uid);
		return $arr;
	}
}