<?php

class flow_meetClassModel extends flowModel
{
	public function initModel()
	{
		$this->hyarra 	= array('正常','会议中','结束','取消');
		$this->hyarrb 	= array('green','blue','#ff6600','#888888');
	}
	
	public function getstatezt($zt)
	{
		return '<font color="'.$this->hyarrb[$zt].'">'.$this->hyarra[$zt].'</font>';
	}
	
	protected function flowsubmit($na, $sm)
	{
		$cont  = '{optname}发起会议预定从{startdt}→{enddt},在{hyname},主题:{title}';
		$this->push($this->rs['joinid'], '会议', $cont);
	}
	
	protected function flowaddlog($a)
	{
		$actname = $a['name'];
		if($actname == '取消会议'){
			$this->push($this->rs['joinid'], '会议', ''.$this->adminname.'取消会议【{title}】{startdt}→{enddt}');
			$this->update('`state`=3', $this->id);
		}
		if($actname == '结束会议'){
			$this->update('`state`=2', $this->id);
		}
	}
}