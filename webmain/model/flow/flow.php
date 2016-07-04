<?php
class flowModel extends Model
{
	public $modenum;
	public $id;
	public $moders;
	public $modeid;
	public $modename;
	public $rs;
	public $urs;
	public $mwhere;
	public $mtable;
	public $uid	= 0;
	
	protected function flowchangedata(){}
	protected function flowdeletebill($sm){}
	protected function flowsubmit($na, $sm){}
	protected function flowaddlog($arr){}
	protected function flowdatalog($arr){}
	
	public function echomsg($msg)
	{
		if(isajax()){
			echo json_encode(array('success'=>false,'msg'=>$msg,'data'=>''));
		}else{
			echo $msg;
		}
		exit();
	}
	
	public function initdata($num, $id)
	{
		$this->modenum	= $num;
		$this->id		= (int)$id;
		$this->moders 	= m('flow_set')->getone("`num`='$num'");
		if(!$this->moders)$this->echomsg('not found mode['.$num.']');
		$table 			= $this->moders['table'];
		$this->modeid	= $this->moders['id'];
		$this->modename	= $this->moders['name'];
		$this->settable($table);
		$this->mwhere	= "`table`='$table' and `mid`='$id'";
		$this->mtable	= $table;
		$this->rs 		= $this->getone($id);
		
		if(!$this->rs)$this->echomsg('not found record');
		if(isset($this->rs['uid']))$this->uid = $this->rs['uid'];
		if($this->uid==0 && isset($this->rs['optid']))$this->uid = $this->rs['optid'];
		$this->urs 		= $this->db->getone('[Q]admin',$this->uid,'id,name,deptname,ranking');
		$this->viewmodel= m('view');
		$this->isreadqx();

		$this->rssust	= $this->rs;
		$this->flowchangedata();
	}
	
	public function isreadqx()
	{
		$bo = false;
		if($this->uid==$this->adminid && $this->adminid>0)$bo=true;
		if(!$bo){
			$where 	= $this->viewmodel->viewwhere($this->modeid, $this->adminid);
			$tos 	= m($this->mtable)->rows("`id`='$this->id'  $where ");
			if($tos>0)$bo=true;
		}
		if(!$bo)$this->echomsg('not permissions showdata, mode['.$this->modenum.'.'.$this->modename.']');
	}
	
	public function iseditqx()
	{
		$bo = 0;
		if($bo==0){
			$where 	= $this->viewmodel->editwhere($this->modeid, $this->adminid);
			$tos 	= m($this->mtable)->rows("`id`='$this->id'  $where ");
			if($tos>0)$bo=1;
		}
		return $bo;
	}
	
	public function isdeleteqx()
	{
		$bo = 0;
		if($bo==0){
			$where 	= $this->viewmodel->deletewhere($this->modeid, $this->adminid);
			$tos 	= m($this->mtable)->rows("`id`='$this->id'  $where ");
			if($tos>0)$bo=1;
		}
		return $bo;
	}
	
	
	public function getfields()
	{
		$fields = array();
		$farr 	= $this->db->getrows('[Q]flow_element',"`mid`='$this->modeid' and `iszb`=0 and `iszs`=1",'`fields`,`name`','sort,id');
		foreach($farr as $k=>$rs)$fields[$rs['fields']] = $rs['name'];
		return $fields;
	}
	
	/**
	*	读取展示数据
	*/
	public function getdatalog($lx=0)
	{
		m('log')->addread($this->mtable, $this->id);
		$arr['modename'] = $this->modename;
		$arr['modeid'] 	 = $this->modeid;
		$arr['modenum']  = $this->modenum;
		$arr['mid']  	 = $this->id;
		$contview 	 	 = '';
		$path 			 = ''.P.'/flow/view/vie'.$lx.'_'.$this->modenum.'.html';
		$fstr	= m('file')->getstr($this->mtable, $this->id,1);
		if($fstr != ''){
			$this->rs['file_content'] 	= $fstr;
		}
		
		if(file_exists($path)){
			$contview 	 = file_get_contents($path);
			$contview 	 = $this->rock->reparr($contview, $this->rs);
		}
		if($this->isempt($contview)){
			$fields			 = $this->getfields();
			if($fstr!='')$fields['file_content'] 	= '相关文件';
			$contview = c('html')->createtable($fields, $this->rs);
			$contview = '<div align="center">'.$contview.'</div>';
		}
		$arr['contview'] = $contview;
		$arr['readarr']	 = m('log')->getreadarr($this->mtable, $this->id);
		$arr['logarr']	 = $this->getlog();
		$arr['isedit'] 	 = $this->iseditqx();
		$arr['isdel'] 	 = $this->isdeleteqx();
		$_oarr 			 = $this->flowdatalog($arr);
		if(is_array($_oarr))foreach($_oarr as $k=>$v)$arr[$k]=$v;
		return $arr;
	}
	
	/**
	*	读取编辑数据
	*/
	public function getdataedit()
	{
		$arr['data'] 	= $this->rssust;
		$arr['table'] 	= $this->mtable;
		$arr['modeid'] 	= $this->modeid;
		$arr['isedit'] 	= $this->iseditqx();
		$arr['isflow'] 	= $this->moders['isflow'];
		$arr['user'] 	= $this->urs;
		$arr['filers'] 	= m('file')->getfile($this->mtable,$this->id);
		return $arr;
	}
	
	public function getlog()
	{
		$rows = $this->db->getrows('[Q]flow_log',$this->mwhere, '`checkname` as `name`,`checkid`,`name` as actname,`optdt`,`explain`,`statusname`','`id` desc');
		$uids = '';
		$dts  = c('date');
		foreach($rows as $k=>$rs){
			$uids.=','.$rs['checkid'].'';
			$rows[$k]['optdt'] = $dts->stringdt($rs['optdt'], 'G(周w) H:i');
		}
		if($uids!=''){
			$rows = m('admin')->getadmininfor($rows, substr($uids, 1), 'checkid');
		}
		return $rows;
	}
	
	public function addlog($arr=array(),$fileid='')
	{
		$addarr	= array(
			'table'		=> $this->mtable,
			'mid'		=> $this->id,
			'checkname'	=> $this->adminname, 
			'checkid'	=> $this->adminid, 
			'optdt'		=> $this->rock->now,
			'courseid'	=> '0',
			'status'	=> '1',
			'ip'		=> $this->rock->ip,
			'web'		=> $this->rock->web,
			'modeid'	=> $this->modeid
		);
		foreach($arr as $k=>$v)$addarr[$k]=$v;
		m('flow_log')->insert($addarr);
		$ssid = $this->db->insert_id();
		if($fileid!='')m('file')->addfile($fileid, $this->mtable, $this->id);
		$addarr['id'] = $ssid;
		$this->flowaddlog($addarr);
		return $ssid;
	}
	
	public function submit($na='', $sm='')
	{
		if($na=='')$na='提交';
		$this->addlog(array(
			'name' 		=> $na,
			'explain' 	=> $sm
		));
		$this->flowsubmit($na, $sm);
	}
	
	public function push($receid, $gname, $cont, $title='', $wkal=0)
	{
		if($this->isempt($receid) && $wkal==1)$receid='all';
		if($this->isempt($receid))return false;
		$reim	= m('reim');
		$url 	= ''.URL.'task.php?a=p&num='.$this->modenum.'&mid='.$this->id.'';
		$slx	= 0;
		$pctx	= $this->moders['pctx']; $mctx	= $this->moders['pctx'];
		if($pctx==0 && $mctx==1)$slx=2;
		if($pctx==1 && $mctx==0)$slx=1;
		if($pctx==0 && $mctx==0)$slx=3;
		$cont	= $this->rock->reparr($cont, $this->rs);
		$reim->pushagent($receid, $gname, $cont, $title, $url, $slx);
	}
	
	public function deletebill($sm='')
	{
		$is = $this->isdeleteqx();
		if($is==0)return '无权删除';
		m('flow_log')->delete($this->mwhere);
		m('reads')->delete($this->mwhere);
		$this->flowdeletebill($sm);
		return 'ok';
	}
}