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
	public $agentrs;
	public $moders;
	
	public function getdatas($uid, $lx, $p){}
	
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
	
	public function getdata($uid, $num, $lx, $page)
	{
		$this->getagentinfor($num);
		$rows	= array();
		$this->page = $page;
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