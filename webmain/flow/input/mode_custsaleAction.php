<?php

class mode_custsaleClassAction extends inputAction{
	
	public function selectcust()
	{
		$uid 	= $this->adminid;
		$s		= $this->rock->dbinstr('shateid', $uid);
		$rows = m('customer')->getrows("`status`=1 and (uid='$uid' or $s)",'id as value,name');

		
		return $rows;
	}
}	
			