<?php
class agent_daibanClassModel extends agentModel
{
	public function initModel()
	{
		$this->settable('flow_bill');
	}
	
	public function gettotal()
	{
		$stotal	= $this->getdbtotal($this->adminid);
		$titles	= '';
		return array('stotal'=>$stotal,'titles'=> $titles);
	}
	
	public function getdbtotal($uid)
	{
		$sws	= $this->rock->dbinstr('nowcheckid', $uid);
		$stotal	= $this->rows("`isdel`=0 and `status`=0 and $sws");
		return $stotal;
	}
	
	public function getdatas($uid, $lx, $page)
	{
		$arr 	= m('flowbill')->getrecord($uid, $this->agentnum.'_'.$lx, $page, $this->limit);
		$arr['stotal'] 	= array(
			'daiban' => $this->getdbtotal($uid)
		);
		return $arr;
	}
}