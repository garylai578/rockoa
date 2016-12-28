<?php 

class weixinClassAction extends apiAction{

	public function getsignAction()
	{
		$url = $this->getvals('url');
		$arr = m('weixin:signjssdk')->getsignsdk($url);
		$this->showreturn($arr);
	}
	
	public function addlocationAction()
	{
		$now 				= $this->rock->now;
		$uid				= $this->adminid;
		$type 				= (int)$this->post('type');
		$arr['location_x']	= $this->post('location_x');
		$arr['location_y']	= $this->post('location_y');
		$arr['scale']		= (int)$this->post('scale');
		$arr['precision']	= (int)$this->post('precision');
		$arr['label']		= $this->getvals('label');
		$arr['explain']		= $this->getvals('sm');
		$arr['optdt']		= $now;
		$arr['uid']			= $uid;
		m('location')->insert($arr);
		if($type==1){
			$dkdt 	= $now;
			$ip		= $this->rock->ip;
			$this->db->record('[Q]kqdkjl',array(
				'dkdt' 	=> $dkdt,
				'uid'	=> $uid,
				'optdt'	=> $now,
				'address'=> $arr['label'],
				'lat'=> $arr['location_x'],
				'lng'=> $arr['location_y'],
				'accuracy'=> $arr['precision'],
				'ip'	=> $ip,
				'type'	=> 2
			));
			$dt = substr($dkdt, 0, 10);
			m('kaoqin')->kqanay($uid, $dt);
		}
		$this->showreturn(array('now'=>$now));
	}
}