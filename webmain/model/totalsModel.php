<?php
class totalsClassModel extends Model
{
	//首页统计的
	public function gettotals($uid)
	{
		$optdt 	= $this->rock->now;
		$arr 	= array();
		$bidb	= m('flowbill');
		
		$todo			= m('todo')->rows("uid='$uid' and `status`=0 and `tododt`<='$optdt'");
		$arr['todo']	= $todo;
		$arr['daiban']	= $bidb->daibanshu($uid);
		$arr['applymy']	= $bidb->applymywgt($uid);
		return $arr;
	}
}