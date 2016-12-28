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
			if($state==0 && $rs['price']>0)$view.=',<a href="'.$wet.'view_'.$rs['num'].'.html" target="_blank" style="color:red">去购买</a>';
			$rows[] = array(
				'id' 	=> $id,
				'name' 	=> $rs['name'],
				'price' => $rs['price'],
				'isaz'  => $rs['isaz'],
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
		$barr	= c('xinhu')->getdata('getinstallfile',array('id'=>$id,'sysnum'=>$this->keyss,'key'=>$key));
		if($barr['code']!=200)showreturn('',$barr['msg'],201);
		$data 	= $barr['data'];
		$mrs 	= $data['rs'];
		$rows 	= $data['rows'];
		$uparr  = array();
		$huira  = $this->gethuiarr($id);
		foreach($rows as $k=>$rs){
			$file 	= $rs['filepath'];
			$bo 	= true;
			if(file_exists($file)){
				$_size = filesize($file);
				if($_size == $rs['filesize'])$bo = false;
			}
			if($rs['isup']==1)$bo = true;
			if(isset($huira[$rs['id']]))$bo = false;
			if($bo){
				$uparr[] = $rs;
			}
		}
		if(!$uparr){
			$this->upsueecc($id, $mrs['updatedt'], $key);
		}
		showreturn($uparr);
	}
	private function upsueecc($id, $updatedt, $key)
	{
		$where  = "`type`=0 and `mid`='$id'";
		$db 	= m('chargems');
		if($db->rows($where)==0)$where='';
		$db->record(array(
			'type' 		=> 0,
			'mid'  		=> $id,
			'modeid'  	=> $id,
			'updatedt'  => $updatedt,
			'optdt' 	=> $this->now,
			'key'		=> $this->jm->encrypt($key)
		),$where);
	}
	public function shengjianssAjax()
	{
		$mid 	= (int)$this->post('id');
		$fileid	= (int)$this->post('fileid');
		$key 	= $this->post('key');
		$oi 	= $this->post('oii');
		$len 	= $this->post('lens');
		$barr	= c('xinhu')->getdata('getinstallfileid',array('fid'=>$fileid,'sysnum'=>$this->keyss,'key'=>$key));
		if($barr['code'] != 200)exit($barr['msg']);
		$data 	= $barr['data'];
		$type 	= $data['type'];
		$filepath = $data['filepath'];
		$fcont 	= $this->jm->base64decode($data['content']);
		if($fcont != ''){
			if($type==1){
				$bmsg = m('beifen')->updatefabric($fcont);
				if($bmsg != 'ok')exit($bmsg);
			}
			if($type==9){
				$this->rock->createdir($filepath);
				@$bo = file_put_contents($filepath, $fcont);
				if(!$bo)exit('无法写入：'.$filepath.'');
			}
		}
		if($oi+1 == $len){
			$this->upsueecc($mid, $data['updatedt'], $key);
		}
		echo 'ok';
	}
	
	private function shengjifile($frs, $key, $modeid)
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
			'modeid'  	=> $modeid,
			'updatedt'  => $frs['updatedt'],
			'optdt' 	=> $this->now,
		),$where);
	}
	
	
	public function tontbudataAjax()
	{
		$lx = (int)$this->get('lx');
		$barr	= c('xinhu')->getdata('getaneydata', array('lx'=>$lx));
		if($barr['code']!=200)exit($barr['msg']);
		$data 	= $barr['data'];
		if($lx==0)$this->tonbbumenu($data['menu']);
		if($lx==1)$this->tonbbumode($data['mode']);
		if($lx==2)$this->tonbbuying($data['yydata']);
		if($lx==3)$this->tonbbutask($data['task']);
		
		echo '同步完成';
	}
	
	//同步菜单
	private function tonbbumenu($data)
	{
		$db = m('menu');
		foreach($data as $k=>$rs){
			$id = $rs['id'];
			if($db->rows('id='.$id.'')>0){
				$db->update($rs, 'id='.$id.'');
			}else{
				$db->insert($rs);
			}
		}
	}
	
	//同步模块
	private function tonbbumode($data)
	{
		$db 	= m('flow_set');
		$db1 	= m('flow_element');
		$db2 	= m('flow_menu');
		$db3 	= m('flow_extent');
		$db5 	= m('flow_course');
		foreach($data as $num=>$arr){
			$modeid 	= (int)$db->getmou('id', "`num`='$num'");
			$flow_set 	= $arr['flow_set'];
			$isadd		= false;
			if($modeid==0){
				$modeid = $db->insert($flow_set);
				$isadd	= true;
			}else{
				$db->update(array(
					'summary' => $flow_set['summary'],
					'summarx' => $flow_set['summarx']
				), $modeid);
			}
			
			//字段
			$flow_element= $arr['flow_element'];
			foreach($flow_element as $k1=>$rs1){
				$rs1['mid'] = $modeid;
				$where 		= "`mid`='$modeid' and `fields`='".$rs1['fields']."'";
				if($db1->rows($where)==0){
					$db1->insert($rs1);
				}else{
					unset($rs1['name']);
					$db1->update($rs1, $where);
				}
			}
			
			//权限
			$flow_extent= $arr['flow_extent'];
			foreach($flow_extent as $k3=>$rs3){
				$rs3['modeid'] = $modeid;
				$sid  = $rs3['id'];
				if($db3->rows('id='.$sid.'')>0){
					$db3->update($rs3, 'id='.$sid.'');
				}else{
					$db3->insert($rs3);
				}
			}
			
			//操作菜单
			$flow_menu= $arr['flow_menu'];
			foreach($flow_menu as $k2=>$rs2){
				$rs2['setid'] = $modeid;
				$sid  = $rs2['id'];
				if($db2->rows('id='.$sid.'')>0){
					$db2->update($rs2, 'id='.$sid.'');
				}else{
					$db2->insert($rs2);
				}
			}
			
			//审核步骤
			if($isadd && isset($arr['flow_course'])){
				$flow_course = $arr['flow_course'];
				foreach($flow_course as $k5=>$rs5){
					$rs5['setid'] = $modeid;
					$db5->insert($rs5);
				}
			}
		}
	}
	
	//同步应用
	private function tonbbuying($data)
	{
		$db 	= m('im_group');
		$dbs 	= m('im_menu');
		foreach($data as $k=>$yydata){
			$rs 	= $yydata['data'];
			$menu 	= $yydata['menu'];
			$name 	= $rs['name'];
			unset($rs['id']);
			$where 	= "`name`='$name' and `type`=2";
			if(!isempt($rs['num']))$where 	= "`num`='".$rs['num']."' and `type`=2";
			if($db->rows($where)==0){
				$mid = $db->insert($rs);
				$this->addyymenu($menu, $dbs, $mid, 0);
			}else{
				$mid = (int)$db->getmou('id', $where);
				$db->update(array(
					'face' 		=> $rs['face'],
					'url' 		=> $rs['url'],
					'name' 		=> $rs['name'],
					'iconfont' 	=> $rs['iconfont'],
					'iconcolor' => $rs['iconcolor'],
					'explain' 	=> $rs['explain'],
				),$where);
				$this->addyymenu($menu, $dbs, $mid, 0);
			}
		}
	}
	private function addyymenu($menu, $dbs, $mid, $pid)
	{
		$ssid = '0';
		foreach($menu as $k1=>$rs1){
			unset($rs1['id']);
			$menusub	 = false;
			if(isset($rs1['menusub'])){
				$menusub = $rs1['menusub'];
				unset($rs1['menusub']);
			}
			$rs1['mid'] = $mid;
			$rs1['pid'] = $pid;
			$where 		= "`name`='".$rs1['name']."' and `pid`='$pid' and `mid`='$mid'";
			$sid 		= (int)$dbs->getmou('id', $where);
			if($sid == 0){
				$where  = '';
			}
			$dbs->record($rs1, $where);
			if($sid==0)$sid = $this->db->insert_id();
			if($menusub)$this->addyymenu($menusub, $dbs, $mid, $sid);
			$ssid .= ','.$sid.'';
		}
		$dbs->delete("pid='$pid' and `mid`='$mid' and `id` not in($ssid)");
	}
	
	//同步计划任务
	private function tonbbutask($data)
	{
		$db 	= m('task');
		foreach($data as $k=>$rs){
			$where 		= "`url`='".$rs['url']."'";
			$sid 		= (int)$db->getmou('id', $where);
			if($sid == 0){
				$where  = '';
			}else{
				unset($rs['todoid']);
				unset($rs['todoname']);
			}
			unset($rs['id']);
			unset($rs['state']);
			unset($rs['lastdt']);
			$db->record($rs, $where);
		}
	}
	
	public function delmodelAjax()
	{
		$id = (int)$this->post('id');
		m('chargems')->delete("`modeid`='$id' and `type`<>2 and `modeid`>0");
		$this->showreturn('');
	}
	
	
	//更新文件对比显示
	public function datadubiAjax()
	{
		$id = (int)$this->get('id');
		$barr	= c('xinhu')->getdata('getinstallfile',array('id'=>$id,'sysnum'=>$this->keyss));
		if($barr['code']!=200)showreturn('',$barr['msg'],201);
		$data 	= $barr['data'];
		$mrs 	= $data['rs'];
		$rows 	= $data['rows'];
		$uparr  = array();
		foreach($rows as $k=>$rs){
			$file 	= $rs['filepath'];
			$bo 	= true;
			$zt 	= 'add';
			if(file_exists($file)){
				$_size = filesize($file);
				if($_size == $rs['filesize'])$bo = false;
				$zt = 'edit';
			}
			if($rs['type']==1)$zt = '';
			if($rs['isup']==1)$bo = true;
			if($bo){
				$rs['zt']= $zt;
				$uparr[] = $rs;
			}
		}
		$huira = $this->gethuiarr($id);
		foreach($uparr as $k=>$rs1){
			$ishui = 0;
			if(isset($huira[$rs1['id']]))$ishui = 1;
			$uparr[$k]['ishui'] = $ishui;
		}
		$this->returnjson(array('rows'=>$uparr));
	}
	
	private function gethuiarr($id)
	{
		$hurs  = m('chargems')->getall("`modeid`='$id' and `type`=2",'mid');
		$huira = array();
		foreach($hurs as $k2=>$rs2)$huira[$rs2['mid']] = 1;
		return $huira;
	}
	
	//忽略更新文件
	public function hullueAjax()
	{
		$id = (int)$this->post('id');
		$lx = (int)$this->post('lx');
		$sid = $this->post('sid');
		$db  = m('chargems');
		$db->delete("`modeid`='$id' and `mid` in($sid) and `type`=2");
		$sad = explode(',', $sid);
		if($lx==0)foreach($sad as $sids){
			$db->insert(array(
				'optdt' 	=> $this->now,
				'type' 		=> 2,
				'mid' 		=> $sids,
				'modeid' 	=> $id
			));
		}
		echo 'ok';
	}
}