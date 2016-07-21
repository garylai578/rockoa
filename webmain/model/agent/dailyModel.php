<?php
/**
	工作日报
*/
class agent_dailyClassModel extends agentModel
{
	
	public function gettotal()
	{
		$stotal	= $this->getwdtotal($this->adminid);
		$titles	= '';
		return array('stotal'=>$stotal,'titles'=> $titles);
	}
	
	public function getwdtotal($uid)
	{
		$ydid  	= m('log')->getread('daily', $uid);
		$whe1w 	= m('view')->viewwhere($this->modeid, $uid);
		$where	= "id not in($ydid) $whe1w ";
		$stotal	= m('daily')->rows($where);
		return $stotal;
	}
	
	public function getdatas($uid, $lx, $page)
	{
		$where	= "uid='$uid'";
		$ydid  	= m('log')->getread('daily', $uid);
		$ydarr	= explode(',', $ydid);
		if($lx == 'undall' || $lx=='undwd'){
			$where = m('view')->viewwhere($this->modeid, $uid);
			$where = "1=1 $where";
			if($lx=='undwd')$where = " `id` not in($ydid) and $where";
		}
		$arr 	= m('daily')->getlimit($where, $page,'`id`,`content`,`dt`,`optdt`,`type`,`optname`','`dt` desc', $this->limit);
		
		$rows 	= $arr['rows'];
		$typea 	= explode(',','日报,周报,月报,年报');
		foreach($rows as $k=>$rs){
			$rows[$k]['title'] 	= '['.$rs['optname'].']'.$rs['dt'].'的'.$typea[$rs['type']].'';
			$rows[$k]['cont']	= $rs['content'];
			unset($rows[$k]['content']);
			$menusub 			= array();
			
			if(!in_array($rs['id'], $ydarr)){
				$rows[$k]['statustext'] 	= '未读';
				$rows[$k]['statuscolor'] 	= '#ED5A5A';
				
				$menusub[] = array('name'=>'标已读','lx'=>'yd');
				$menusub[] = array('name'=>'全部标已读','lx'=>'allyd');
			}else{
				$rows[$k]['ishui']			= 1;
			}
			$menusub[] = array('name'=>'点评','lx'=>'log');
			$rows[$k]['menusub']	= $menusub;
		}
		$arr['rows'] 	= $rows;
		$wdstotal		= $this->getwdtotal($uid);
		$arr['stotal'] = array(
			'under' => $wdstotal
		);
		return $arr;
	}
	
	public function menuopts($uid, $mid, $lx, $sm='')
	{
		$log 	= m('log');
		$table  = 'daily';
		if($lx=='yd'){
			$log->addread($table, $mid, $uid);
		}
		if($lx=='allyd'){
			$ydid 	= $log->getread($table, $uid);	
			$where = m('view')->viewwhere($this->modeid, $uid);
			$where = "((1=1 $where) or (`uid`='$uid') )";
			$where = "`id` not in($ydid) and $where";
			
			$rows 	= m($table)->getrows($where,'id');
			foreach($rows as $k=>$rs)$log->addread($table, $rs['id'], $uid);
		}
	}
}