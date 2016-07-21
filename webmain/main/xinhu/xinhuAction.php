<?php
class xinhuClassAction extends Action
{

	
	public function setsaveAjax()
	{
		$this->option->setval('reimhostsystem', $this->post('host'));
		$this->option->setval('reimrecidsystem', $this->post('receid'));
		$this->option->setval('reimpushurlsystem', $this->post('push'));
		$this->backmsg();
	}
	
	public function getsetAjax()
	{
		$arr= array();
		$arr['reimhost']= $this->option->getval('reimhostsystem');
		$arr['reimrecid']= $this->option->getval('reimrecidsystem');
		$arr['reimpushurl']= $this->option->getval('reimpushurlsystem');
		echo json_encode($arr);
	}
	
	public function testsendAjax()
	{
		$msg =  m('reim')->sendpush($this->adminid, $this->adminid,array(
			'cont' 	=> $this->jm->base64encode('测试内容:'.$this->now.''),
			'type' 	=> 'user',
			'optdt' => $this->now,
			'messid' => 0
		));
		if(!$msg)$msg='测试发送失败';
		echo $msg;
	}
	
	
	public function chushuaAjax()
	{
		$myext		= $this->getsession('adminallmenuid');
		if(getconfig('systype')=='demo')exit('演示请勿操作');
		if($myext!='-1'){
			echo '只有管理员才可以用';
		}else{
			$tables		= explode(',', 'daily,file,flow_log,im_history,im_mess,im_messzt,infor,items,log,logintoken,meet,reads,sjoin,work,xhinfor,todo,flow_bill,goodss,goods,customer,custsale');
			$alltabls 	= $this->db->getalltable();
			foreach($tables as $tabs){
				$_tabs 	= ''.PREFIX.''.$tabs.'';
				if(in_array($_tabs, $alltabls)){
					$sql1 = "delete from `$_tabs`";
					$sql2 = "alter table `$_tabs` AUTO_INCREMENT=1";
					$this->db->query($sql1, false);
					$this->db->query($sql2, false);
				}
			}
			echo 'ok';
		}
	}
	
	public function beifenAjax()
	{
		m('beifen')->start();
		echo 'ok';
	}
}