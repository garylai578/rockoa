<?php 
class indexreimClassAction extends apiAction
{
	public function indexinitAction()
	{
		$dbs 		= m('reim');
		$deptarr 	= m('dept')->getdata();
		$userarr 	= m('admin')->getuser(1);
		$grouparr 	= $dbs->getgroup($this->adminid);
		$agentarr	= $dbs->getagent($this->adminid);
		$historyarr	= $dbs->gethistory($this->adminid);
		
		$arr['deptjson']	= json_encode($deptarr);
		$arr['userjson']	= json_encode($userarr);
		$arr['groupjson']	= json_encode($grouparr);
		$arr['agentjson']	= json_encode($agentarr);
		$arr['historyjson'] = json_encode($historyarr);
		$arr['config'] 		= $dbs->getreims();
		$arr['loaddt'] 		= $this->now;
		m('login')->uplastdt();
		
		$this->showreturn($arr);
	}
	
	public function ldataAction()
	{
		$loaddt		= $this->rock->jm->base64decode($this->post('loaddt'));
		$type		= $this->post('type','history');
		$dbs 		= m('reim');
		$json		= array();
		if($type=='history')$json = $dbs->gethistory($this->adminid, $loaddt);
		if($type=='group')$json = $dbs->getgroup($this->adminid);
		if($type=='dept')$json 	= m('dept')->getdata();
		if($type=='user')$json 	= m('admin')->getuser();
		if($type=='agent')$json = $dbs->getagent($this->adminid);
		
		$arr['json'] 	= json_encode($json);	
		$arr['loaddt']  = $this->now;
		$arr['type']  	= $type;
		m('login')->uplastdt();
		$this->showreturn($arr);
	}

	
	public function indexupgetAction()
	{
		$historyarr			= m('reim')->gethistory($this->adminid);
		$arr['historyjson'] = json_encode($historyarr);
		m('login')->uplastdt();
		$this->showreturn($arr);
	}
}