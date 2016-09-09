<?php
class upgradeClassAction extends Action
{
	public function initAction()
	{
		$this->keyss = $this->option->getval('systemnum');
		if(isempt($this->keyss)){
			$rnd  	= md5(str_shuffle('abcedfghijk').rand(1000,9999));
			$this->option->setval('systemnum', $rnd);
			$this->keyss = $rnd;
		}
	}
	
	public function dataAjax()
	{
		$xinhu	= c('xinhu');
		$db 	= m('chargems');
		$wet	= $xinhu->getwebsite();
		$barr	= $xinhu->getdata('mode');
		if($barr['code']!=200)exit($barr['msg']);
		$rows  	= array();
		foreach($barr['data'] as $k=>$rs){
			$id = $rs['id'];
			$state  = 0;
			$key	= '';
			$ors 	= $db->getone("`type`=0 and `mid`='$id'");
			if($ors){
				$state = 1;
				if($rs['updatedt']>$ors['updatedt'])$state=2;
				$key= $ors['key'];
			}
			$view = '<a href="'.$wet.'view_'.$rs['num'].'.html" target="_blank" class="a">介绍</a>';
			if($state==0 && $rs['price']>0)$view.=',<a href="http://www.rockoa.com/view_xinhu'.$rs['num'].'.html" target="_blank" style="color:red">去购买</a>';
			$rows[] = array(
				'id' 	=> $id,
				'name' 	=> $rs['name'],
				'price' => $rs['price'],
				'explain' 	=> $rs['explain'],
				'updatedt' 	=> $rs['updatedt'],
				'key'		=> $key,
				'view' 	=> $view,
				'opt'	=> $state
			);
		}
		$arr['rows'] = $rows;
		$this->returnjson($arr);
	}
	
	public function shengjianAjax()
	{
		$id 	= $this->post('id');
		$key 	= $this->post('key');
		$barr	= c('xinhu')->getdata('getinstall',array('id'=>$id,'sysnum'=>$this->keyss,'key'=>$key));
		if($barr['code']!=200)exit($barr['msg']);
		$data 	= $barr['data'];
		$mrs 	= $data['rs'];
		$rows 	= $data['rows'];
		foreach($rows as $k=>$rs){
			$this->shengjifile($rs, $key);
		}
		$where  = "`type`=0 and `mid`='$id'";
		$db 	= m('chargems');
		if($db->rows($where)==0)$where='';
		$db->record(array(
			'type' 		=> 0,
			'mid'  		=> $id,
			'updatedt'  => $mrs['updatedt'],
			'optdt' 	=> $this->now,
			'key'		=> $this->jm->encrypt($key)
		),$where);
		echo 'ok';
	}
	private function shengjifile($frs, $key)
	{
		$fid 	= $frs['id'];
		$where  = "`type`=1 and `mid`='$fid'";
		$db 	= m('chargems');
		$ors 	= $db->getone($where);
		if($ors){
			if($frs['updatedt']<=$ors['optdt'])return;
		}else{
			$where = '';
		}
		$barr	= c('xinhu')->getdata('getfileinstall',array('id'=>$fid,'sysnum'=>$this->keyss,'key'=>$key));
		if($barr['code']!=200)exit($barr['msg']);
		$fcont 	= $this->jm->base64decode($barr['data']);
		if(isempt($fcont))return;
		$mkdir	= 'upload/'.date('Y-m');
		if($frs['type']==0){
			if(!is_dir($mkdir))mkdir($mkdir);
			$filemy = $mkdir.'/install'.time().rand(1000,9999).'.zip';
			file_put_contents($filemy, $fcont);
			$bmsg = c('zip')->unzip($filemy,'./');
			unlink($filemy);
			if($bmsg != 'ok')exit($bmsg);
		}
		if($frs['type']==1){
			$bmsg = m('beifen')->updatefabric($fcont);
			if($bmsg != 'ok')exit($bmsg);
		}
		$db->record(array(
			'type' 		=> 1,
			'mid'  		=> $fid,
			'updatedt'  => $frs['updatedt'],
			'optdt' 	=> $this->now,
		),$where);
	}
}