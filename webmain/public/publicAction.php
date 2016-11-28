<?php 
class publicClassAction extends ActionNot{
	

	public function testAction()
	{
		$this->display = false;
		//$rows 	= m('emailm')->receemail(1);
		
		//print_r($rows);
		$str = $this->jm->mcrypt_encrypt('hhe');
		echo $str.'<br>';
		//echo $this->jm->mcrypt_decrypts($str).'<br>';
		
		
	
		//$a = m('weixin:chat')->upgchatuser(2, 'diaochan');
		//print_r($a);
		//print_r(m('admin')->getsuperman(8));
		if(class_exists('COM')){
			//$sbc = new COM('rockCls.xinhuClass');
		}else{
			//echo 'we';
		}
		//echo m('weixin:index')->getticket();
		//c('phpjm')->strip('webmain/model/weixin/weixin.php');
		echo ''.$this->now.'<br>';
	}
	
	
}