<?php
class flow_customerClassModel extends flowModel
{
	protected function flowinit(){
		$this->statearr		 = c('array')->strtoarray('停用|#888888,启用|green');
	}
	
	protected function flowchangedata(){
		$this->rs['statusid'] = $this->rs['status'];
		$zt = $this->statearr[$this->rs['status']];
		$this->rs['status']	 = '<font color="'.$zt[1].'">'.$zt[0].'</font>';
	}
	
	protected function flowprintrows($rows)
	{
		foreach($rows as $k=>$rs){
			$zt = $this->statearr[$rs['status']];
			$rows[$k]['status']		= '<font color="'.$zt[1].'">'.$zt[0].'</font>';;
		}
		return $rows;
	}
	
	//是否有查看权限
	protected function flowisreadqx()
	{
		$bo = false;
		$shateid = ','.$this->rs['shateid'].',';
		if(contain($shateid,','.$this->adminid.','))$bo=true;
		return $bo;
	}
	
	protected function flowgetfields($lx)
	{
		$arr = array();
		if($this->uid==$this->adminid){
			$arr['mobile'] 		= '手机号';
			$arr['tel'] 		= '电话';
			$arr['email'] 		= '邮箱';
			$arr['routeline'] 	= '交通路线';
		}
		return $arr;
	}

	
	protected function flowoptmenu($ors, $crs)
	{
		$zt  = $ors['statusvalue'];
		$num = $ors['num'];
		if($num=='ztqh'){
			$this->update('`status`='.$zt.'', $this->id);
		}
		
		if($num=='shate'){
			$cname 	 = $crs['cname'];
			$cnameid = $crs['cnameid'];
			$this->update(array(
				'shateid' 	=> $cnameid,
				'shate' 	=> $cname,
			), $this->id);
			$this->push($cnameid, '客户管理', ''.$this->adminname.'将一个客户【{name}】共享给你');
		}	
	}
	
	protected function flowbillwhere($uid, $lx)
	{
		$where 	= '`uid`='.$uid.' and `status`=1';
		if($lx=='myty'){
			$where 	= '`uid`='.$uid.' and `status`=0';
		}
		if($lx=='myall'){
			$where 	= '`uid`='.$uid.'';
		}
		if($lx=='gxgw'){
			$where	= $this->rock->dbinstr('shateid', $uid);
		}
		if($lx=='mygx'){
			$where 	= '`uid`='.$uid.' and `shateid` is not null';
		}
		return array(
			'where' => 'and '.$where,
			'order' => 'status desc,optdt desc'
		);
	}
}