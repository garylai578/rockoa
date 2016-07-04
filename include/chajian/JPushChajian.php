<?php 
/**
	极光推送
*/
include_once(ROOT_PATH.'/include/JPush/JPush.php');
class JPushChajian extends Chajian{
	
	private $app_key 		= '2ba342572f3210fe10ccb4ce';
	private $master_secret 	= '764a5273accdce9d1c8b6d0a';
	
	protected function initChajian()
	{
		if($this->contain(HOST,'.com')){
			$this->app_key 			= '77f160baa366a5f3c63df96b';
			$this->master_secret 	= '16ab997c1fdd1cfbcebf278c';
		}
	}
	
	public function send($uid, $title='', $cont='')
	{
		if($uid=='')return false;
		$client = new JPush($this->app_key, $this->master_secret);
		$obj 	= $client->push()->setPlatform('android');
		$where 	= "id in($uid) and ";
		if($uid=='all'){
			$where='';
		}else{
			if($this->contain($uid,'u') || $this->contain($uid,'d')){
				$uid = m('admin')->gjoin($uid);
				if($uid=='')return false;
				$where 	= "id in($uid) and ";
			}
		}
		
		$rows 	= m('logintoken')->getrows("`uid` in(select id from `[Q]admin` where $where `status`=1 and `apptx`=1) and `cfrom` in ('appandroid','appios') and `online`=1",'token');
		$alias 	= array();
		foreach($rows as $k=>$rs){
			$alias[] = $rs['token'];
		}
		if(!$alias)return false;
		$obj->addAlias($alias);
		
			//$obj->addAllAudience();
		$result	= $obj
			->setNotificationAlert($cont)
			->addAndroidNotification($cont, $title, 1, array())
			//->addIosNotification($cont, null, JPush::DISABLE_BADGE, true, 'iOS category',array())
			->send();
		$msg = json_encode($result);	
		$this->rock->debugs(json_encode($alias).$msg, 'jpush');	
		return $result;
	}
}