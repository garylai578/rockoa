<?php
/**
*	应用统计
*/
class agentModel extends Model
{
	public $agentnum	= '';
	public $agentid		= '0';
	public $modeid		= 3;
	public $page		= 1;
	public $limit		= 10;
	public $user_id		= 0;
	public $agentrs;
	public $moders;
	
	public function getdatas($uid, $lx, $p){}
	public function menuopts($uid, $mid, $lx, $sm=''){}
	
	public function gettotal()
	{
		return array(
			'stotal' => 0,
			'titles' => ''
		);
	}
	
	public function getagentinfor($num)
	{
		$this->agentnum = $num;
		$this->agentrs	= m('im_group')->getone("`num`='$num'");
		$this->moders	= m('flow_set')->getone("`num`='$num'");
		if($this->agentrs){
			$this->agentid = $this->agentrs['id'];
		}
		if($this->moders){
			$this->modeid = $this->moders['id'];
		}
	}
	
	public function menuopt($uid, $num, $mid, $lx, $sm='')
	{
		$this->getagentinfor($num);
		$modenum = $this->rock->post('modenum', $num);
		$msg 	 = 'ok';
		$cname 	 = $this->rock->post('changename');
		$cnameid = $this->rock->post('changenameid');
		$cgdate  = $this->rock->post('changedate');
		if(substr($lx,0,3)=='log'){
			$statusname	= $this->rock->post('statusname');
			$name		= str_replace('.','',$this->rock->post('name'));
			$actname 	= $this->rock->post('actname', $name);
			$status		= (int)$this->rock->post('status','1');
			if($status==0)$status=1;
			if(!isempt($cname)){
				if(!isempt($sm))$sm.=',';
				$sm.=''.$name.':'.$cname.'';
			}
			m('flow')->addlog($modenum, $mid, $actname, array(
				'explain' 	=> $sm,
				'statusname'=> $statusname,
				'status'	=> $status,
				'color'		=> $this->rock->post('statuscolor')
			));
		}
		if($lx=='del'){
			$msg 	= m('flow')->opt('deletebill', $modenum, $mid, $sm);
		}
		if($lx=='check'){
			$status	 = (int)$this->rock->post('status');
			$msg 	 = m('flow')->opt('check', $modenum, $mid, $status, $sm);
			if(contain($msg,'成功'))$msg = 'ok';
		}
		$gmsg = $this->menuopts($uid, $mid, $lx, $sm);
		if(!isempt($gmsg))$msg = $gmsg;
		return $msg;
	}
	
	
	public function getdata($uid, $num, $lx, $page)
	{
		$this->getagentinfor($num);
		$rows	= array();
		$this->page 	= $page;
		$this->user_id 	= $uid;
		$narr 	= $this->getdatas($uid, $lx, $page);
		$arr 	= array(
			'wdtotal' 	=> 0,
			'event'		=> $lx,
			'num'		=> $num,
			'rows'		=> $rows,
			'page'		=> $page,
			'limit'		=> $this->limit,
			'agentid'	=> $this->agentid,
			'count'		=> 0,
			'maxpage'	=> 0
		);
		if(is_array($narr))foreach($narr as $k=>$v)$arr[$k]=$v;
		return $arr;
	}
	
	
}