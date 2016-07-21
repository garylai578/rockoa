<?php
class upgradeClassAction extends Action
{
	private $updatekey 	= 'aHR0cDovL3hoODI5LmNvbS8:';
	private $updatekeys = 'aHR0cDovLzEyNy4wLjAuMS9hcHAvcm9ja3hpbmh1d2ViLw::';
	
	public function initAction()
	{
		if(getconfig('systype')=='dev')$this->updatekey = $this->updatekeys;
		$this->updatekey = $this->jm->base64decode($this->updatekey);
	}
	
	private function getupurl($act, $can=array())
	{
		$url = $this->updatekey;
		$url.= 'api.php?a='.$act.'';
		$url.= '&host='.$this->jm->base64encode(HOST).'&version='.VERSION.'&rnd='.time().'';
		foreach($can as $k=>$v)$url.='&'.$k.'='.$v.'';
		return $url;
	}
	
	public function dataAjax()
	{
		$cont 	= c('curl')->getfilecont($this->getupurl('mode'));
		$rows  	= array();
		if($cont!=''){
			$barr  	= json_decode($cont, true);
			$grows 	= $barr['data'];
			foreach($grows as $k=>$rs){
				$id = $rs['id'];
				
				$rows[] = array(
					'id' 	=> $id,
					'name' 	=> $rs['name'],
					'explain' 	=> $rs['explain'],
					'updatedt' 	=> $rs['updatedt'],
					'view' 	=> '<a href="'.$this->updatekey.'view_'.$rs['num'].'.html" target="_blank" class="a">介绍</a>'
				);
			}
		}
		

		$arr['rows'] = $rows;
		$this->returnjson($arr);
	}
}