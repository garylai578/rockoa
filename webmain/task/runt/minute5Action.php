<?php 
//访问地址：task.php?m=minute5|runt&a=run
class minute5ClassAction extends runtAction
{
	
	public function runAction()
	{
		$time 	= time();
		$time1 	= $time;
		$time2 	= $time1+5*60;
		$this->dt1	= date('Y-m-d H:i:s', $time1);	
		$this->dt2	= date('Y-m-d H:i:s', $time2);
		
		//$this->worktodo();
		echo 'success';
	}
	
	private function worktodo()
	{
		$rows = m('work')->getrows("`startdt`>='$this->dt1' and `startdt`<='$this->dt2' and `state`=0",'*', 'startdt asc');
		$todo = m('todo');
		if($rows)foreach($rows as $k=>$rs){
			$mess = ''.$rs['title'].'('.$this->statearr[$rs['state']].')';
			$todo->addtz($rs['distid'], $rs['type'], $mess, 'work', $rs['id']);
		}
	}
}