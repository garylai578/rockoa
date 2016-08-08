<?php
class agent_flowClassModel extends agentModel
{
	public function initModel()
	{
		$this->settable('flow_bill');
	}
	
	public function gettotal()
	{
		$stotal	= $this->getwdtotal($this->adminid);
		$titles	= '';
		return array('stotal'=>$stotal,'titles'=> $titles);
	}
	
	public function getwdtotal($uid)
	{
		$stotal	= $this->rows("`uid`='$uid' and `status`=2");
		return $stotal;
	}
	
	public function getdatas($uid, $lx, $page)
	{
		$arr 	= m('flowbill')->getrecord($uid, $this->agentnum.'_'.$lx, $page, $this->limit);
		$arr['stotal'] 	= array(
			'mywtg' => $this->getwdtotal($uid)
		);
		return $arr;
	}
}