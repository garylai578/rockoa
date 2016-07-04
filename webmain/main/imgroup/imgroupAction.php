<?php
class imgroupClassAction extends Action
{
	public function groupusershow($table)
	{
		$s 		= 'and 1=2';
		$gid 	= $this->post('gid','0');
		if($gid>0){
			$s = " and id in(select uid from [Q]im_groupuser where `gid`='$gid')";
		}
		return array(
			'where' => $s,
			'fields'=> 'id,user,name,deptname'
		);
	}
	
	public function groupafter($table, $rows)
	{
		
		foreach($rows as $k=>$rs){
			$gid = $rs['id'];
			$s 	 = "`gid`='$gid'";
			$rows[$k]['utotal'] = $this->db->rows('[Q]im_groupuser', $s);
		}
		return array('rows'=>$rows);
	}
	
	public function saveuserAjax()
	{
		$gid 	= $this->post('gid','0');
		$sid 	= $this->post('sid','0');
		$dbs 	= m('im_groupuser');
		$dbs->delete("`gid`='$gid' and `uid` in($sid)");
		$this->db->insert('[Q]im_groupuser','`gid`,`uid`', "select '$gid',`id` from `[Q]admin` where `id` in($sid)", true);
		echo 'success';
	}
	
	public function deluserAjax()
	{
		$gid 	= $this->post('gid','0');
		$sid 	= $this->post('sid','0');
		$dbs 	= m('im_groupuser');
		$dbs->delete("`gid`='$gid' and `uid`='$sid'");
		echo 'success';
	}
}