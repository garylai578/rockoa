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
		$statearr		 = explode(',','待执行,已完成,执行中,中止');
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
			$ismy = 0;
			$distid = ','.$rs['distid'].',';
			if(contain($distid,','.$uid.',')){
				$ismy = 1;
			}
			$state	= $rs['state'];
			
			$menusub 				= array();
			if($rs['optid']==$uid && $state!=1){
				$menusub[] = array('name'=>'删除','color'=>'red','lx'=>'del');
			}
			if($ismy==1 && $state!=1){
				$menusub[] = array('name'=>'标为执行中','actname'=>'进度报告','statuscolor'=>'#ff6600','statusname'=>'执行中','status'=>2,'lx'=>'log');
				$menusub[] = array('name'=>'标已完成','color'=>'green','actname'=>'进度报告','statusname'=>'已完成','status'=>1,'lx'=>'log');
				if($state!=3)$menusub[] = array('name'=>'终止任务','actname'=>'进度报告','statusname'=>'中止','statuscolor'=>'#888888','status'=>3,'lx'=>'log');
				
				$menusub[] = array('name'=>'指派给...','lx'=>'log_change','changetype'=>'changeuser');
			}

			$srows[] = array(
				'cont'		=> $cont,
				'title'		=> $rs['title'],
				'optdt'		=> $rs['optdt'],
				'menusub'	=> $menusub,
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