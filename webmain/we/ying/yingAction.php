<?php 
class yingClassAction extends ActionNot{
	
	public function initAction()
	{
		$this->mweblogin(0, true);
	}
	
	public function defaultAction()
	{
		$num = $this->get('num');
		$arr = m('reim')->getagent(0, "and `num`='$num'");
		if(!$arr)exit('sorry not found agent['.$num.']!');
		$rs  = $arr[0];
		$this->title = $rs['name'];
		$yyurl 	= ''.P.'/we/ying/yingyong/'.$num.'.html';
		if(!file_exists($yyurl))$yyurl='';
		$yyurljs 	= ''.P.'/we/ying/yingyong/'.$num.'.js';
		if(!file_exists($yyurljs))$yyurljs='';
		$this->assign('arr', $rs);
		$this->assign('yyurl', $yyurl);
		$this->assign('yyurljs', $yyurljs);
	}
	
	public function locationAction()
	{
		$this->title = '考勤定位';
		$arr 	= m('waichu')->getoutrows($this->date,$this->adminid);
		$this->assign('rows', $arr);
		$dt 	= $this->rock->date;
		$dwarr	= m('location')->getrows("uid='$this->adminid' and `optdt` like '$dt%'",'optdt,label,id','`id` desc');
		$this->assign('dwarr', $dwarr);
		$kqrs 	= m('kaoqin')->dwdkrs($this->adminid, $this->date);
		$this->assign('kqrs', $kqrs);
	}
}