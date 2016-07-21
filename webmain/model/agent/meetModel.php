<?php
class agent_meetClassModel extends agentModel
{
	
	private $joinwhere='';
	
	public function initModel()
	{
		$this->dtobj 		= c('date');
	}
	
	//今日会议
	public function getstotal($uid, $dt)
	{
		if($this->joinwhere=='')$this->joinwhere	= m('admin')->getjoinstr('joinid', $uid);
		$where 	= "`status`=1 and `type`=0 and `startdt` like '$dt%' and joinid is not null $this->joinwhere and `state`<2";
		$sto 	= m('meet')->rows($where);
		return $sto;
	}
	
	public function gettotal()
	{
		$stotal = $this->getstotal($this->adminid, $this->rock->date);
		
		return array('stotal'=>$stotal,'titles'=>'');
	}
	
	public function getdatas($uid, $lx, $page)
	{
		$row = array();
		$dt  = $this->rock->date;
		
		if($this->joinwhere=='')$this->joinwhere	= m('admin')->getjoinstr('joinid', $uid);
		
		if($lx=='week'){
			$warr = $this->dtobj->getweekarr($dt);
			foreach($warr as $dts){
				$rows = $this->getweek($dts, $uid);
				$row  = array_merge($row, $rows);
			}
		}else{
			$row 		= $this->getweek($dt, $uid);
		}
		$arr['rows'] 	= $row;
		$arr['stotal'] 	= array(
			'today' => $this->getstotal($uid, $dt)
		);
		return $arr;
	}
	
	public function getweek($dt, $uid)
	{
		
		$row		= array();	
		$hyarra 	= array('正常','会议中','结束','取消');
		$hyarrb 	= array('green','blue','#ff6600','#888888');
		$week 		= $this->dtobj->cnweek($dt);
		$now 		= $this->rock->now;
		$time 		= time();
		$dbs 		= m('meet');
		$rows 		= $dbs->getrows("`status`=1 and `type`=0 and `startdt` like '$dt%' and joinid is not null $this->joinwhere",'hyname,title,optid,startdt,enddt,state,joinname,optname,id','`startdt` asc');
		if($rows)$row[] = array(
			'showtype' 	=> 'line',
			'title'		=> ''.$dt.'(周'.$week.')的会议'
		);
		foreach($rows as $k=>$rs){
			$menusub= array();
			$zt 	= $rs['state'];
			$nzt 	= $zt;
			$stime 	= strtotime($rs['startdt']);
			$etime 	= strtotime($rs['enddt']);
			if($zt < 2){
				if($etime<$time){
					$nzt = 2;
				}else if($stime>$time){
					$nzt = 0;
				}else{
					$nzt = 1;
				}
			}
			$rows[$k]['statustext'] 	= $hyarra[$nzt];
			$rows[$k]['statuscolor'] 	= $hyarrb[$nzt];
			$cont 	= '会议室：'.$rs['hyname'].'';
			$cont 	.= '<br>发起人：'.$rs['optname'].'';
			if(!$this->isempt($rs['joinname']))$cont.= '<br>参会人：'.$rs['joinname'].'';
			$rows[$k]['cont'] 			= $cont;
			if($nzt>1){
				$rows[$k]['ishui']		= 1;
			}
			$rows[$k]['optdt'] = substr($rs['startdt'],11).'至'.substr($rs['enddt'],11);
			unset($rows[$k]['startdt']);
			unset($rows[$k]['enddt']);
			unset($rows[$k]['joinname']);
			unset($rows[$k]['optname']);
			unset($rows[$k]['hyname']);
			
			if($nzt < 2){
				if($rs['optid']==$uid){
					if($nzt==0){
						$menusub[] = array('name'=>'删除','color'=>'red','lx'=>'del');
						$menusub[] = array('name'=>'取消会议','lx'=>'log_cancel','state'=>3);
					}
					if($nzt==1){
						$menusub[] = array('name'=>'结束会议','lx'=>'log_end','state'=>2);
					}
				}
			}
			$rows[$k]['menusub']= $menusub;
			$row[] = $rows[$k];
			
			if($zt != $nzt)$dbs->update('state='.$nzt.'', $rs['id']);
		}
		return $row;
	}
}