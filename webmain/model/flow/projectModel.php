<?php
class flow_projectClassModel extends flowModel
{

	protected function flowinit()
	{
		$this->statearr		 = c('array')->strtoarray('待执行|blue,已完成|green,执行中|#ff6600,终止|#888888');
	}
	
	protected function flowchangedata(){
		$this->rs['stateid'] = $this->rs['state'];
		$zt = $this->statearr[$this->rs['state']];
		$this->rs['state']	 = '<font color="'.$zt[1].'">'.$zt[0].'</font>';
	}
	
	protected function flowprintrows($rows)
	{
		foreach($rows as $k=>$rs){
			$zt = $this->statearr[$rs['state']];
			$rows[$k]['state']		= '<font color="'.$zt[1].'">'.$zt[0].'</font>';;
		}
		return $rows;
	}
	

	
	protected function flowaddlog($a)
	{
		if($a['name']=='进度报告'){
			$state 	= $a['status'];
			$arr['state'] = $state;
			$this->update($arr, $this->id);
		}
	}
	
	//显示操作菜单判断
	protected function flowg1221etoptmenu($num)
	{
		$fuzeid 	= $this->rs['fuzeid'];
		$runuserid 	= $this->rs['runuserid'];
		$where 		= m('admin')->gjoin($fuzeid.','.$runuserid, 'ud', $blx='where');
		$where 		= 'id='.$this->adminid.' and ('.$where.')';
		$bo 		= true;
		if(m('admin')->rows($where)==0)$bo=false;
		return $bo;
	}
}