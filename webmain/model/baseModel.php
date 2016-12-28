<?php
class baseClassModel extends Model
{
	/**
	*	获取异步地址
	*/
	public function getasynurl($m, $a,$can=array())
	{
		$runurl		= getconfig('localurl', URL);
		$key 	 	= getconfig('asynkey');
		if($key!='')$key = md5(md5($key));
		$runurl 	.= 'api.php?m='.$m.'&a='.$a.'&adminid='.$this->adminid.'&asynkey='.$key.'';
		if(is_array($can))foreach($can as $k=>$v)$runurl.='&'.$k.'='.$v.'';
		return $runurl;
	}
}