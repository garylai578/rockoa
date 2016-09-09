<?php

class agent_workClassModel extends agentModel
{
	
	public function gettotal()
	{
		$stotal	= $this->getwdtotal($this->adminid);
		$titles	= '';
		return array('stotal'=>$stotal,'titles'=> $titles);
	}
	
	public function getwdtotal($uid)
	{
		$s 	= $this->rock->dbinstr('distid', $uid);
		$to	= m('work')->rows('state in(0,2) and '.$s.'');
		return $to;
	}
	
	public function getdatas($uid, $lx, $page)
	{
		$statearr		 = explode(',','待执行,已完成,执行中,终止');
		$statearrs		 = explode(',','blue,green,#ff6600,#888888');
		
		$where 	= $this->rock->dbinstr('distid', $uid);
		if($lx=='def' || $lx=='wwc'){
			$where.=' and state in(0,2)';
		}
		if($lx=='myall'){
			
		}
		if($lx=='ywc'){
			$where.=' and state=1';
		}
		
		if($lx=='wcj'){
			$where = 'optid='.$uid.'';
		}
		if($lx=='xxrw'){
			$where = '1=2';
		}
		
		$arr 	= m('work')->getlimit($where, $page,'`id`,`title`,`optdt`,`optid`,`type`,`enddt`,`grade`,`dist`,`distid`,`state`,`optname`','`optdt` desc', $this->limit);
		$rows 	= $arr['rows'];
		
		$srows  = array();
		
		foreach($rows as $k=>$rs){
			$cont = '类型：'.$rs['type'].'<br>等级：'.$rs['grade'].'<br>分配给：'.$rs['dist'].'<br>创建者：'.$rs['optname'].'';
			if(!$this->isempt($rs['enddt']))$cont.='<br>截止时间：'.$rs['enddt'].'';
			$state		= $rs['state'];
			$srows[] 	= array(
				'cont'		=> $cont,
				'title'		=> $rs['title'],
				'optdt'		=> $rs['optdt'],
				'id'		=> $rs['id'],
				'statustext'=> $statearr[$state],
				'statuscolor'=> $statearrs[$state],
			);
		}
		
		
		$arr['rows'] 	= $srows;
		$arr['stotal'] 	= array(
			'myrw' => $this->getwdtotal($uid)
		);
		return $arr;
	}
}