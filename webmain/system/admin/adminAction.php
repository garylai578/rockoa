<?php
class adminClassAction extends Action
{
	public function loadadminAjax()
	{
		$id = (int)$this->get('id',0);
		$data = m('admin')->getone($id);
		if($data){
			$data['pass']='';
		}
		$arr['data'] = $data;
		
		$this->returnjson($arr);
	}

	public function beforeshow($table)
	{
		$fields = 'id,name,user,deptname,type,status,tel,workdate,ranking,superman,loginci,sex,tel,sort,face';
		return array('fields'=>$fields);
	}
	
	public function publicbeforesave($table, $cans, $id)
	{
		$user = $cans['user'];
		$msg  = '';	
		if(m($table)->rows("`user`='$user' and `id`<>'$id'")>0)$msg ='用户名['.$user.']已存在';
		$rows = array();
		if($msg == ''){
			$did  = $cans['deptid'];
			$sup  = $cans['superid'];
			
			$rows = m($table)->getpath($did, $sup);
		}
		$arr = array('msg'=>$msg, 'rows'=>$rows);
		return $arr;
	}
	
	public function publicaftersave($table, $cans, $id)
	{
		m($table)->record(array('superman'=>$cans['name']), "`superid`='$id'");
	}
	
	public function updatedataAjax()
	{
		$rows	= $this->db->getall("select id,name,deptid,superid,deptpath,superpath,deptname,superman from `[Q]admin` where `status`=1 order by `sort`");
		$total	= $this->db->count;
		$cl		= 0;
		$db     = m('admin');
		foreach($rows as $k=>$rs){
			$nrs	= $db->getpath($rs['deptid'], $rs['superid']);
			if($nrs['deptpath'] != $rs['deptpath'] || $nrs['deptname'] != $rs['deptname'] || $nrs['superpath'] != $rs['superpath'] || $nrs['superman'] != $rs['superman']){
				$db->record($nrs, "`id`='".$rs['id']."'");
				$cl++;
			}
		}
		echo '总'.$total.'条记录,更新了'.$cl.'条';
	}
}