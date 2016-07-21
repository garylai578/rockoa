<?php
class agent_customerClassModel extends agentModel
{
	
	public function gettotal()
	{
		$stotal	= $this->gettotalss($this->adminid);
		$titles	= '';
		return array('stotal'=>$stotal,'titles'=> $titles);
	}
	
	public function gettotalss($uid)
	{
		$to = m('custsale')->rows('`uid`='.$uid.' and `state`=0');
		return $to;
	}
	

	public function getdatas($uid, $lx, $page)
	{
		if($lx=='def' || substr($lx,0,4)=='sale')return $this->getsaledata($uid, $lx);
		
		$where 	= '`uid`='.$uid.' and `status`=1';
		if($lx=='myty'){
			$where 	= '`uid`='.$uid.' and `status`=0';
		}
		if($lx=='myall'){
			$where 	= '`uid`='.$uid.'';
		}
		if($lx=='gxgw'){
			$where	= $this->rock->dbinstr('shateid', $uid);
		}
		if($lx=='mygx'){
			$where 	= '`uid`='.$uid.' and `shateid` is not null';
		}
		
		$arr 	= m('customer')->getlimit($where, $page,'`id`,`name`,`unitname`,`optname`,`uid`,`optdt`,`laiyuan`,`tel`,`status`,`shate`','`status` desc,`optdt` desc', $this->limit);
		$rows 	= $arr['rows'];
		$arows	= array();
		foreach($rows as $k=>$rs){
			$tit	 = $rs['name'];
			if(!isempt($rs['unitname']))$tit.='('.$rs['unitname'].')';
			$cont	 = '来源：'.$rs['laiyuan'].'<br>操作人：'.$rs['optname'].'';
			
			$menusub = array();
			if($rs['uid']==$uid){
				$cont.= '<br>电话：'.$rs['tel'].'';
				$menusub[] = array('name'=>'＋添加拜访记录','actname'=>'拜访记录','lx'=>'log');
				if($rs['status']==0){
					$menusub[] = array('name'=>'启用','statusname'=>'启用','color'=>'green','actname'=>'状态切换','lx'=>'log_status','stateabc'=>1);
				}else{
					$menusub[] = array('name'=>'共享给...','lx'=>'log_change_gx','changetype'=>'changeusercheck');
					$menusub[] = array('name'=>'停用','statusname'=>'停用','statuscolor'=>'#888888','actname'=>'状态切换','lx'=>'log_status','stateabc'=>0);
				}
			}
			if(!isempt($rs['shate']))$cont.= '<br>共享给：'.$rs['shate'].'';
			
			$arrc = array(
				'menusub'	=> $menusub,
				'title'		=> $tit,
				'optdt'		=> $rs['optdt'],
				'id'		=> $rs['id'],
				'cont'		=> $cont
			);
			if($rs['status']==0){
				$arrc['statustext']='已停用';
				$arrc['statuscolor']='#888888';
				$arrc['ishui']		=1;
			}
			$arows[] = $arrc;
		}
		
		$arr['rows'] 	= $arows;
		$arr['stotal'] 	= array(
			'gen' => $this->gettotalss($uid)
		);
		return $arr;
	}
	
	private function getsaledata($uid, $lx)
	{
		$arows 	= array();
		$where 	= '`uid`='.$uid.' and `state`=0';
		if($lx=='saleycj'){
			$where 	= '`uid`='.$uid.' and `state`=1';
		}
		if($lx=='saleyds'){
			$where 	= '`uid`='.$uid.' and `state`=2';
		}
		if($lx=='saleall'){
			$where 	= '`uid`='.$uid.'';
		}
		
		$statea	= c('array')->strtoarray('跟进中|blue,已成交|green,已丢失|#888888');
		
		$arr 	= m('custsale')->getlimit($where, $this->page,'*','`state`,`optdt` desc', $this->limit);
		$rows 	= $arr['rows'];
		$arows	= array();
		foreach($rows as $k=>$rs){
			$menusub = array();
			$tit	 = $rs['custname'];
			$cont	 = '来源：'.$rs['laiyuan'].'<br>销售人：'.$rs['optname'].'<br>申请日期：'.$rs['applydt'].'';
			if(!isempt($rs['explain']))$cont.='<br>说明：'.$rs['explain'].'';
			if($rs['money']>0)$cont.='<br>金额：'.$rs['money'].'';
			if(!isempt($rs['dealdt']))$cont.='<br>成交时间：'.$rs['dealdt'].'';
			$state 	 = $rs['state'];
			$ztarr	 = $statea[$state];
			if($rs['uid']==$uid){
				$menusub[] = array('name'=>'＋添加跟进','modenum'=>'custsale','actname'=>'跟进','lx'=>'log');
				
				foreach($statea as $k1=>$rs1){
					if($k1 != $state){
						$menusub[] = array('name'=>'标为'.$rs1[0].'','modenum'=>'custsale','statuscolor'=>$rs1[1],'color'=>$rs1[1],'actname'=>'状态切换','statusname'=>''.$rs1[0].'','stateabc'=>$k1,'lx'=>'log_statussale');
					}
				}
				
				if($state==0){
					$menusub[] = array('name'=>'转移给...','modenum'=>'custsale','lx'=>'log_change','changetype'=>'changeuser');
				}
				if($state!=1){
					$menusub[] = array('name'=>'删除','modenum'=>'custsale','color'=>'red','lx'=>'del');
				}
			}
			$arrc = array(
				'menusub'	=> $menusub,
				'title'		=> $tit,
				'optdt'		=> $rs['optdt'],
				'id'		=> $rs['id'],
				'cont'		=> $cont,
				'statustext'=> $ztarr[0],
				'statuscolor'=> $ztarr[1],
				'modenum'	=> 'custsale',
				'modename'	=> '销售单',
			);
			if($state==2){
				$arrc['ishui'] = 1;
			}
			$arows[] = $arrc;
		}
		
		$arr['rows'] 	= $arows;
		$arr['stotal'] 	= array(
			'gen' => $this->gettotalss($uid)
		);
		return $arr;
	}
	
	public function menuopts($uid, $mid, $lx, $sm='')
	{
		$state = $this->rock->post('stateabc','0');
		if($lx=='log_statussale'){
			$sarr['state'] = $state;
			if($state==1)$sarr['dealdt'] = $this->rock->now;
			m('custsale')->update($sarr, $mid);
		}
		if($lx=='log_status'){
			m('customer')->update('`status`='.$state.'', $mid);
		}
	}
}