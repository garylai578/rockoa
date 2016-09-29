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
	
	private function getwdtotal($uid)
	{
		$stotal	= $this->rows("`uid`='$uid' and `status`=2");
		return $stotal;
	}
	
	protected function agentdata($uid, $lx)
	{
		$arr 	= m('flowbill')->getrecord($uid, $this->agentnum.'_'.$lx, $this->page, $this->limit);
		return $arr;
	}
	
	protected function agenttotals($uid)
	{
		return array(
			'mywtg' => $this->getwdtotal($uid)
		);
	}
}