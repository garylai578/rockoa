<?php 
class loginClassAction extends apiAction
{
	public function checkAction()
	{
		$adminuser	= str_replace(' ','',$this->rock->jm->base64decode($this->post('user')));
		$adminpass	= $this->rock->jm->base64decode($this->post('pass'));
		$arr 		= m('login')->start($adminuser, $adminpass);
		if(is_array($arr)){
			$arrs = array(
				'uid' 	=> $arr['uid'],
				'name' 	=> $arr['name'],
				'user'	=> $arr['user'],
				'ranking'	=> $arr['ranking'],
				'deptname'  => $arr['deptname'],
				'face'  	=> $arr['face'],
				'apptx'  	=> $arr['apptx'],
				'token'  	=> $arr['token']
			);
			
			$uid 	= $arr['uid'];
			$name 	= $arr['name'];
			$user 	= $arr['user'];
			$token 	= $arr['token'];
			$this->rock->savesession(array(
				QOM.'adminid'	=> $uid,
				QOM.'adminname'	=> $name,
				QOM.'adminuser'	=> $user,
				QOM.'admintoken'=> $token
			));
			$this->showreturn($arrs);
		}else{
			$this->showreturn('', $arr, 201);
		}
	}
	
	public function loginexitAction()
	{
		m('login')->exitlogin();
		$this->showreturn('');
	}
}