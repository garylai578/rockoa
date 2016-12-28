<?php
class sjoinClassModel extends Model
{
	
	//获取用户所在组Id
	public function getgroupid($uid)
	{
		$gasql	= " ( id in( select `sid` from `[Q]sjoin` where `type`='ug' and `mid`='$uid') or id in( select `mid` from `[Q]sjoin` where `type`='gu' and `sid`='$uid') )";
		$gsql	= "select `id` from `[Q]group` where $gasql ";
		$rows 	= $this->db->getall($gsql);
		$ids 	= '0';
		foreach($rows as $k=>$rs)$ids.=','.$rs['id'].'';
		return $ids;
	}
	
	//获取权限菜单id
	public function getmenuid($uid)
	{
		$gid 	= $this->getgroupid($uid);
		$whe1 	= "select `sid` from `[Q]sjoin` where ((`type`='um' and `mid`='$uid')";
		$whe2	= "select `mid` from `[Q]sjoin` where ((`type`='mu' and `sid`='$uid')";
		if($gid != '0'){
			$whe1.="  or (`type`='gm' and `mid` in($gid)) ";
			$whe2.="  or (`type`='mg' and `sid` in($gid)) ";
		}
		$whe1.= ')';
		$whe2.= ')';
		
		$ids 	= '0';
		$rows	= $this->db->getall($whe1);
		foreach($rows as $k=>$rs)$ids.=','.$rs['sid'].'';
		
		$rows	= $this->db->getall($whe2);
		foreach($rows as $k=>$rs)$ids.=','.$rs['mid'].'';
		return $ids;
	}
	
	/**
	*	查看菜单权限
	*/	
	public function getuserext($uid, $type=0)
	{
		$guid 	= '-1';
		if($type==1)return $guid;
		$guid	= '[0]';
		$mid 	= $this->getmenuid($uid);
		$arss	= $this->db->getall("select `id`,`pid`,(select `pid` from `[Q]menu` where `id`=a.`pid`)as `mpid` from `[Q]menu` a where (`status` =1 and `id` in($mid)) or (`status` =1 and `ispir`=0) order by `sort`");
		foreach($arss as $ars){
			$guid	.= ',['.$ars['id'].']';
			$bpid	 = $ars['pid'];
			$bmpid	 = $ars['mpid'];
			if(!contain($guid, '['.$bpid.']')){
				$guid.=',['.$bpid.']';
			}
			if(!isempt($bmpid)){
				if(!contain($guid, '['.$bmpid.']')){
					$guid.=',['.$bmpid.']';
				}
			}
		}
		return $guid;
	}
}