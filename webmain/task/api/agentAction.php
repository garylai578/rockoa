<?php 
class agentClassAction extends apiAction
{
	public function dataAction()
	{
		$agentarr			= m('reim')->getagent($this->adminid);
		$arr['agentjson']	= json_encode($agentarr);
		$this->showreturn($arr);
	}
}