<?php
class flowModel extends Model
{
	public $modenum;
	public $id;
	public $moders;
	public $modeid;
	public $modename;
	public $sericnum;
	public $rs;
	public $urs;
	public $mwhere;
	public $mtable;
	public $uname;
	public $uid		= 0;
	public $isflow	= 0;
	
	protected function flowchangedata(){}
	protected function flowdeletebill($sm){}
	protected function flowsubmit($na, $sm){}
	protected function flowaddlog($arr){}
	protected function flowdatalog($arr){}
	protected function flowcheckbefore($zt, $sm){}
	protected function flowcheckafter($zt, $sm){}
	protected function flowcheckfinsh(){}
	protected function flowgetfields(){}
	protected function flowisreadqx(){return false;}
	
	public function echomsg($msg)
	{
		if(isajax()){
			showreturn('', $msg, 201);
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
		$this->isflow	= (int)$this->moders['isflow'];
		$this->settable($table);
		$this->mwhere	= "`table`='$table' and `mid`='$id'";
		$this->mtable	= $table;
		$this->rs 		= $this->getone($id);
		$this->uname	= '';
		
		if(!$this->rs)$this->echomsg('not found record');
		$this->rs['base_name'] 		= '';
		$this->rs['base_deptname'] 	= '';
		if(isset($this->rs['uid']))$this->uid = $this->rs['uid'];
		if(!isset($this->rs['applydt']))$this->rs['applydt'] = '';
		if(!isset($this->rs['status']))$this->rs['status']	 = 1;
		if($this->uid==0 && isset($this->rs['optid']))$this->uid = $this->rs['optid'];
		$this->urs 		= $this->db->getone('[Q]admin',$this->uid,'id,name,deptid,deptname,ranking,superid,superpath,superman');
		if($this->isempt($this->rs['applydt'])&&isset($this->rs['optdt']))$this->rs['applydt']=substr($this->rs['optdt'],0,10);
		if($this->urs){
			$this->drs		= $this->db->getone('[Q]dept',"`id`='".$this->urs['deptid']."'");
			$this->uname	= $this->urs['name'];
			$this->rs['base_name']		= $this->uname;
			if($this->drs){
				$this->rs['base_deptname']	= $this->drs['name'];
			}
		}
		$this->sericnum	= '';
		$this->billrs 	= $this->db->getone('[Q]flow_bill', $this->mwhere);
		if($this->billrs){
			$this->sericnum = $this->billrs['sericnum'];
		}
		$this->viewmodel= m('view');
		$this->isreadqx();

		$this->rssust	= $this->rs;
		$this->flowchangedata();
		
		$this->rs['base_modename']	= $this->modename;
		$this->rs['base_sericnum']	= $this->sericnum;
		$this->rs['base_summary']	= $this->rock->reparr($this->moders['summary'], $this->rs);
	}
	
	public function isreadqx()
	{
		$bo = false;
		if($this->uid==$this->adminid && $this->adminid>0)$bo=true;
		if(!$bo && $this->isflow==1){
			if($this->billrs){
				$allcheckid = $this->billrs['allcheckid'];
				if(contain(','.$allcheckid.',',','.$this->adminid.','))$bo = true;
			}
			if(!$bo){
				if(contain($this->urs['superpath'],'['.$this->adminid.']'))$bo = true;
			}
		}
		if(!$bo)$bo = $this->flowisreadqx();
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
		if($bo==0 && $this->isflow==1){
			if($this->billrs && $this->uid == $this->adminid){
				if($this->billrs['nstatus']==0 || $this->billrs['nstatus']==2){
					$bo = 1;
				}
			}
		}
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
		if($bo==0 && $this->isflow==1){
			if($this->billrs && $this->uid == $this->adminid){
				if($this->billrs['nstatus']==0 || $this->billrs['nstatus']==2){
					$bo = 1;
				}
			}
		}
		if($bo==0){
			$where 	= $this->viewmodel->deletewhere($this->modeid, $this->adminid);
			$tos 	= m($this->mtable)->rows("`id`='$this->id'  $where ");
			if($tos>0)$bo=1;
		}
		return $bo;
	}
	
	
	public function getfields($lx=0)
	{
		$fields = array();
		$farr 	= $this->db->getrows('[Q]flow_element',"`mid`='$this->modeid' and `iszb`=0 and `iszs`=1",'`fields`,`name`','sort,id');
		foreach($farr as $k=>$rs)$fields[$rs['fields']] = $rs['name'];
		$fters	= $this->flowgetfields($lx);
		if(is_array($fters))$fields = array_merge($fields, $fters);
		return $fields;
	}
	
	/**
	*	读取展示数据
	*	$lx 0pc, 1移动
	*/
	public function getdatalog($lx=0)
	{
		m('log')->addread($this->mtable, $this->id);
		$arr['modename'] = $this->modename;
		$arr['imodeid'] 	 = $this->modeid;
		$arr['modenum']  = $this->modenum;
		$arr['mid']  	 = $this->id;
		$contview 	 	 = '';
		$path 			 = ''.P.'/flow/view/vie'.$lx.'_'.$this->modenum.'.html';
		$fstr	= m('file')->getstr($this->mtable, $this->id,1);
		if($fstr != ''){
			$this->rs['file_content'] 	= $fstr;
		}
		if(isset($this->rs['explain']))$this->rs['explain'] = str_replace("\n",'<br>', $this->rs['explain']);
		if(isset($this->rs['content']))$this->rs['content'] = str_replace("\n",'<br>', $this->rs['content']);
		if(file_exists($path)){
			$contview 	 = file_get_contents($path);
			$contview 	 = $this->rock->reparr($contview, $this->rs);
		}
		if($this->isempt($contview)){
			$_fields		 = array();
			if($this->isflow==1){
				$_fields['base_sericnum'] 	= '单号';
				$_fields['base_name'] 		= '申请人';
				$_fields['base_deptname'] 	= '申请人部门';
			}
			$fields			 = array_merge($_fields, $this->getfields($lx));
			if($lx==0)foreach($fields as $k=>$rs){$this->rs[''.$k.'_style'] = 'width:75%';break;}
			if($fstr!='')$fields['file_content'] 			= '相关文件';
			$contview 	= c('html')->createtable($fields, $this->rs);
			$contview 	= '<div align="center">'.$contview.'</div>';
		}
		$arr['contview'] = $contview;
		$arr['readarr']	 = m('log')->getreadarr($this->mtable, $this->id);
		$arr['logarr']	 = $this->getlog();
		$arr['isedit'] 	 = $this->iseditqx();
		$arr['isdel'] 	 = $this->isdeleteqx();
		$arr['isflow'] 	 = $this->isflow;
		$arr['flowinfor']= array();
		if($this->isflow==1)$arr['flowinfor']= $this->getflowinfor();

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
		$arr['isflow'] 	= $this->isflow;
		$arr['user'] 	= $this->urs;
		$arr['status'] 	= $this->rs['status'];
		$arr['filers'] 	= m('file')->getfile($this->mtable,$this->id);
		return $arr;
	}
	
	/*
	*	读取流程信息
	*/
	public function getflowinfor()
	{
		$ischeck = 0;
		$str	 = '';
		$arr 	 = $this->getflow();
		$nowcheckid = ','.$arr['nowcheckid'].',';
		if(contain($nowcheckid, ','.$this->adminid.',')){
			$ischeck = 1;
		}
		$logarr = $this->getlog();
		$nowcur = $this->nowcourse;
		$sarr['ischeck'] 		= $ischeck;
		$sarr['nowcourse'] 		= $nowcur;
		$sarr['nstatustext'] 	= $arr['nstatustext'];
		if($this->rs['status']==2)$sarr['nstatustext'].=',<font color="#AB47F7">待提交人处理</font>';
		$loglen 				= count($logarr);
		foreach($logarr as $k=>$rs){
			$rs = $logarr[$loglen-$k-1];
			if($rs['courseid']>0){
				$sty = '';
				$col = $rs['color'];
				if($str!='')$str.=' → ';
				$str.='<span style="'.$sty.'">'.$rs['actname'].'('.$rs['name'].'<font color="'.$col.'">'.$rs['statusname'].'</font>)</span>';
			}
		}
		foreach($this->flowarr as $k=>$rs){
			if($rs['ischeck']==0){
				$sty = 'color:#888888';
				if($rs['isnow']==1)$sty='font-weight:bold;color:#800000';
				if($str!='')$str.=' <font color=#888888>→</font> ';
				$str.='<span style="'.$sty.'">'.$rs['name'].'('.$rs['checkname'].')</span>';
			}
		}
		$sarr['flowcoursestr'] 	= $str;
		
		$actstr	= ',通过,不通过';
		if(isset($nowcur['courseact']) ){
			$actstrt = $nowcur['courseact'];
			if(!isempt($actstrt))$actstr = ','.$actstrt;
		}
		$act 	= c('array')->strtoarray($actstr);
		foreach($act as $k=>$as1)if($k>0 && $as1[0]==$as1[1])$act[$k][1]='';
		$sarr['courseact'] 		= $act;
		$nowstatus				= $this->rs['status'];
		$sarr['nowstatus']		= $nowstatus;
		return $sarr;
	}
	
	private $getlogrows = array();
	public function getlog()
	{
		if($this->getlogrows)return $this->getlogrows;
		$rows = $this->db->getrows('[Q]flow_log',$this->mwhere, '`checkname` as `name`,`checkid`,`name` as actname,`optdt`,`explain`,`statusname`,`courseid`,`color`','`id` desc');
		$uids = '';
		$dts  = c('date');
		foreach($rows as $k=>$rs){
			$uids.=','.$rs['checkid'].'';
			$col = $rs['color'];
			if(isempt($col))$col='green';
			if(contain($rs['statusname'],'不'))$col='red';
			$rows[$k]['color'] = $col;
			$rows[$k]['optdt'] = $dts->stringdt($rs['optdt'], 'G(周w) H:i:s');
		}
		if($uids!=''){
			$rows = m('admin')->getadmininfor($rows, substr($uids, 1), 'checkid');
		}
		$this->getlogrows = $rows;
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
		$isturn	 = 1;
		if($na=='保存')$isturn	= 0;
		$this->addlog(array(
			'name' 		=> $na,
			'explain' 	=> $sm
		));
		if($this->isflow == 1){
			$marr['isturn'] = $isturn;
			$marr['status'] = 0;
			$this->update($marr, $this->id);
			$farr = $this->getflow();
			$farr['status'] = 0;
			$this->savebill($farr);
			if($isturn == 1){
				$this->nexttodo($farr['nowcheckid'],'submit');
			}
		}
		$this->flowsubmit($na, $sm);
	}
	
	/*
	*	获取流程
	*/
	public function getflow($sbo=false)
	{
		$rows  	= $this->db->getrows('[Q]flow_course', "`setid`='$this->modeid' and `status`=1" ,'*', '`sort`,id asc');
		$this->flowarr 	= array();
		$allcheckid 	= $nowcheckid 	=  $nowcheckname  = $nstatustext = '';
		$allcheckids	= array();
		$nstatus 		= $this->rs['status'];
		$this->nowcourse	= array();
		$this->nextcourse	= array();
		$this->flowisend	= 0;
		
		$curs 	= $this->db->getrows('[Q]flow_log',"$this->mwhere and `courseid`>0",'checkid,checkname,courseid,`valid`,`status`,`statusname`,`name`','id desc');
		$cufss  =  $ztnas	= array();
		foreach($curs as $k=>$rs){
			$_su = ''.$rs['courseid'].'_'.$rs['checkid'].'';
			if($rs['valid']==1 && $rs['status']==1){
				$cufss[$_su] = 1;
			}
			if(!in_array($rs['checkid'], $allcheckids))$allcheckids[] = $rs['checkid'];
			if($nstatustext=='' && $rs['courseid']>0){
				$nstatustext = ''.$rs['checkname'].''.$rs['statusname'].'';
				$nstatus	 = $rs['status'];
			}
			$ztnas[$rs['courseid']] = ''.$rs['checkname'].''.$rs['statusname'].'';
		}
		$nowstep = $zongsetp  = -1;
		$isend 	 = 0;
		foreach($rows as $k=>$rs){
			$checkwhere = $rs['where'];
			$checkshu 	= $rs['checkshu'];
			
			if(!$this->isempt($checkwhere)){
				$to = $this->rows("`id`='$this->id' and $checkwhere");
				if($to==0)continue;
			}
			
			$zongsetp++;
			$uarr 		= $this->getcheckname($rs);
			$checkid	= $uarr[0];
			$checkname	= $uarr[1];
			$ischeck 	= 0;
			$checkids	= $checknames = '';
			
			if(!$this->isempt($checkid)){
				$checkida 	= explode(',', $checkid);
				$checkidna 	= explode(',', $checkname);
				$nowshu		= 0;
				$_chid		= $_chna	= '';
				foreach($checkida as $k1=>$chkid){
					$_su = ''.$rs['id'].'_'.$chkid.'';
					if(!in_array($chkid, $allcheckids))$allcheckids[] = $chkid;
					if(isset($cufss[$_su])){
						$nowshu++;
					}else{
						$_chid.=','.$chkid.'';
						$_chna.=','.$checkidna[$k1].'';
					}
				}
				if($_chid!='')$_chid = substr($_chid, 1);
				if($_chna!='')$_chna = substr($_chna, 1);
				
				if($_chid==''){
					$ischeck	= 1;
				}else{
					if($checkshu>0&&$nowshu>=$checkshu)$ischeck	= 1;
				}
				$checkids 	= $_chid;
				$checknames = $_chna;
			}
			
			
			
			$rs['ischeck'] 		= $ischeck;
			$rs['islast'] 		= 0;
			$rs['checkid'] 		= $checkid;
			$rs['checkname'] 	= $checkname;
			$rs['nowcheckid'] 	= $checkids;
			$rs['nowcheckname'] = $checknames;
			$rs['isnow'] 		= 0;
			
			if($ischeck==0 && $nowstep==-1){
				$rs['isnow']= 1;
				$nowstep = $zongsetp;
				$this->nowcourse = $rs;
				$nowcheckid		 = $checkids;
				$nowcheckname	 = $checknames;
			}
			
			$this->flowarr[]= $rs;
		}
		if($zongsetp>-1)$this->flowarr[$zongsetp]['islast']=1;
		if($nowstep == -1){
			$isend = 1;
		}else{
			$nstatustext 	= '待'.$nowcheckname.'处理';
		}
		$this->flowisend 	= $isend;
		$allcheckid			= join(',', $allcheckids);
		$arrbill['allcheckid'] 		= $allcheckid;
		$arrbill['nowcheckid'] 		= $nowcheckid;
		$arrbill['nowcheckname']	= $nowcheckname;
		$arrbill['nstatustext']		= $nstatustext;
		$arrbill['nstatus']			= $nstatus;
		if($sbo)$this->getflowsave($arrbill);
		return $arrbill;
	}
	
	public function getflowsave($sarr)
	{
		m('flow_bill')->update($sarr, $this->mwhere);
	}
	
	//获取审核人
	private function getcheckname($crs)
	{
		$type	= $crs['checktype'];
		$cuid 	= $name = '';
		
		if(!$this->isempt($crs['num'])){
			$uarr	= $this->flowcheckname($crs['num']);
			if(is_array($uarr)){
				if(!$this->isempt($uarr[0]))return $uarr;
			}
		}

		if($type=='super'){
			$cuid = $this->urs['superid'];
			$name = $this->urs['superman'];
		}
		if($type=='dept' || $type=='super'){
			if($this->isempt($cuid)){
				$cuid = $this->drs['headid'];
				$name = $this->drs['headman'];
			}
		}
		if($type=='apply'){
			$cuid = $this->urs['id'];
			$name = $this->urs['name'];
		}
		if($type=='user'){
			$cuid = $crs['checktypeid'];
			$name = $crs['checktypename'];
		}
		if($type=='rank'){
			$rank = $crs['checktypename'];
			if(!$this->isempt($rank)){
				$rnurs	= $this->db->getrows('[Q]admin',"`status`=1 and `ranking`='$rank'",'id,name','sort');
				foreach($rnurs as $k=>$rns){
					$cuid.=','.$rns['id'].'';
					$name.=','.$rns['name'].'';
				}
				if($cuid != ''){
					$cuid = substr($cuid, 1);
					$name = substr($name, 1);
				}
			}
		}
		$cuid	= $this->rock->repempt($cuid);
		$name	= $this->rock->repempt($name);
		return array($cuid, $name);
	}
	
	/**
		创建单号
	*/
	public function createnum()
	{
		$num = $this->moders['sericnum'];
		if($num=='无'||$this->isempt($num))$num='TM-Ymd-';
		$apdt 	= str_replace('-','',$this->rs['applydt']);
		$num	= str_replace('Ymd',$apdt,$num);
		return $this->db->sericnum($num,'[Q]flow_bill');
	}
	public function savebill($oarr=array())
	{
		$dbs = m('flow_bill');
		$whes= $this->mwhere;
		$biid= (int)$dbs->getmou('id', $whes);
		$arr = array(
			'table' => $this->mtable,
			'mid' 	=> $this->id,
			'optdt' => $this->rock->now,
			'optname' 	=> $this->adminname,
			'optid' 	=> $this->adminid,
			'modeid'  	=> $this->modeid,
			'isdel'		=> '0',
			'nstatus'	=> $this->rs['status'],
			'applydt'	=> $this->rs['applydt'],
			'modename'  => $this->modename
		);
		foreach($oarr as $k=>$v)$arr[$k]=$v;
		if($biid==0){
			$arr['uid'] 	= $this->uid;
			$arr['sericnum']= $this->createnum();
			$whes			= '';
			$this->sericnum	= $arr['sericnum'];
		}
		$dbs->record($arr, $whes);
		return $arr;
	}
	
	public function nexttodo($nuid, $type, $sm='', $act='')
	{
		$cont	= '';
		$gname	= '流程待办';
		if($type=='submit' || $type=='next'){
			$cont = '您有['.$this->adminname.']的['.$this->modename.',单号:'.$this->sericnum.']需要处理';
		}
		//退回
		if($type == 'nothrough'){
			$cont = '您提交['.$this->modename.',单号:'.$this->sericnum.']'.$this->adminname.'处理['.$act.']，原因:['.$sm.']';
			$gname= '流程申请';
		}
		if($type == 'finish'){
			$cont = '您提交的['.$this->modename.',单号:'.$this->sericnum.']已全部处理完成';
		}
		if($cont!='')$this->push($nuid, $gname, $cont);
	}
	
	/**
	*	处理
	*/
	public function check($zt, $sm='')
	{
		if($this->rs['status']==1)$this->echomsg('流程已处理完成,无需操作');
		$arr 	 	= $this->getflow();
		$flowinfor 	= $this->getflowinfor();
		if($flowinfor['ischeck']==0){
			$this->echomsg('当前是['.$arr['nowcheckname'].']处理');
		}
		$barr 		= $this->flowcheckbefore($zt, $sm);
		
		$nowcourse	= $this->nowcourse;
		$courseact 	= $flowinfor['courseact'];
		$act 		= $courseact[$zt];
		$this->addlog(array(
			'courseid' 	=> $nowcourse['id'],
			'name' 		=> $nowcourse['name'],
			'status'	=> $zt,
			'statusname'=> $act[0],
			'color'		=> $act[1],
			'explain'	=> $sm
		));
		$uparr		= array();
		$bsarr 	 	= $this->getflow();
		if($zt==1){
			$nextcheckid = $bsarr['nowcheckid'];
			$uparr['status'] 	= 0;
			$bsarr['status'] 	= 0;
			$this->nexttodo($nextcheckid, 'next', $sm, $act[0]);
		}else{
			$bsarr['status'] 	= $zt;
			$uparr['status'] 	= $zt;
			$this->nexttodo($this->uid, 'nothrough', $sm, $act[0]);
		}
		$this->flowcheckafter($zt, $sm);
		
		$bsarr['nstatus'] = $zt;
		$bsarr['checksm'] = $sm;
		
		if($this->flowisend==1){
			$uparr['status'] = $zt;
			$bsarr['status'] = $zt;
			$this->nexttodo($this->uid, 'finish', $sm);
			$this->flowcheckfinsh();;
		}
		
		if($uparr){
			$this->update($uparr, $this->id);
			foreach($uparr as $k=>$v)$this->rs[$k]=$v;
		}
		$this->getflowsave($bsarr);
		return '处理成功';
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
		m('file')->delfiles($this->mtable, $this->id);
		m('flow_bill')->delete($this->mwhere);
		$this->delete($this->id);
		$this->flowdeletebill($sm);
		return 'ok';
	}
}