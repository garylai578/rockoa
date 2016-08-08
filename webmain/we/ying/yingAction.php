<?php 
class yingClassAction extends ActionNot{
	
	public function initAction()
	{
		$this->mweblogin();
	}
	
	public function defaultAction()
	{
		$num = $this->get('num');
		$arr = m('reim')->getagent(0, "and `num`='$num'");
		if(!$arr)exit('sorry!');
		$rs  = $arr[0];
		$this->title = $rs['name'];
		$yyurl 	= ''.P.'/we/ying/yingyong/'.$num.'.html';
		if(!file_exists($yyurl))$yyurl='';
		$this->assign('arr', $rs);
		$this->assign('yyurl', $yyurl);
	}
}