<?php
class viewClassModel extends Model
{
	private $modeid = 0;
	
	public function initModel()
	{
		$this->settable('flow_extent');
		$this->addb = m('admin');
	}
	
	private function getursss($mid, $uid=0)
	{
		if($uid==0)$uid = $this->adminid;
		$this->urs 	= $this->db->getone('[Q]admin',$uid, 'id,name,deptpath,deptid,`type`');
		if(is_numeric($mid)){
			$this->modeid	= $mid;
		}else{
			$this->modrs	= $this->db->getone('[Q]flow_set'," (`id`='$mid' or `num`='$mid')");
			if($this->modrs)$this->modeid = $this->modrs['id'];
		}
	}
	
	public function viewwhere($mid, $uid=0)
	{
		$this->getursss($mid, $uid);
		//$type = $this->urs['type'];
		//if($type==1)return 'and 1=1';
		return $this->getsswhere(0);
	}
	
	//是否有新增权限
	public function isadd($mid, $uid=0)
	{
		$this->getursss($mid, $uid);
		$bo  = false;
		$type = $this->urs['type'];
		if($type==1)return true;
		$bo  = $this->getsswhere(1);
		return $bo;
	}
	
	//是否有编辑数据权限
	public function editwhere($mid, $uid=0)
	{
		$this->getursss($mid, $uid);
		return $this->getsswhere(2);
	}
	
	//是否有删除数据权限
	public function deletewhere($mid, $uid=0)
	{
		$this->getursss($mid, $uid);
		return $this->getsswhere(3);
	}
	
	private function getsswhere($type)
	{
		$mid	= $this->modeid;
		$where 	= $this->addb->getjoinstr('receid', $this->urs);
		$uid	= $this->urs['id'];
		$rows 	= $this->getall('`type`='.$type.' and `modeid`='.$mid.' and `status`=1 '.$where.'','wherestr');
		$wehs	= array();
		if($type==1){
			return $this->db->count>0;
		}
		foreach($rows as $k=>$rs){
			$sw = $this->rock->jm->base64decode($rs['wherestr']);
			if($sw=='{receid}'){
				$sw = $this->addb->getjoinstr('receid', $this->urs, 1);
			}
			if($sw=='{allsuper}'){
				$sw = "uid in(select `id` from `[Q]admin` where instr(superpath,'[$uid]')>0)";
			}
			if($sw=='{super}'){
				$sw1= $this->rock->dbinstr('superid',$uid);
				$sw = "uid in(select `id` from `[Q]admin` where $sw1)";
			}
			if($sw=='all'){
				return ' and 1=1';
			}
			if(!$this->isempt($sw)){
				$sw 	= str_replace(array('{uid}','{date}','{now}'), array($uid, "'".$this->rock->date."'","'".$this->rock->now."'"), $sw);
				$sw 	= '('.$sw.')';
				$wehs[] = $sw;
			}
		}
		$s = join(' or ', $wehs);
		if($s!=''){
			$s = ' and ('.$s.')';
		}else{
			$s = ' and 1=2';
		}
		return $s;
	}
}