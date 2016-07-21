<?php
class flowbillClassModel extends Model
{
	public function initModel()
	{
		$this->settable('flow_bill');
	}
	
	public function getrecord($uid, $lx, $page, $limit)
	{
		$where	= 'uid='.$uid.'';
		$isdb	= 0;
		//未通过
		if($lx=='flow_wtg'){
			$where .= ' and `nstatus`=2';
		}
		
		if($lx=='flow_dcl'){
			$where .= ' and `status`=0';
		}
		
		//已完成
		if($lx=='flow_ywc'){
			$where .= ' and `status`=1';
		}
		
		//待办
		if($lx=='daiban_daib' || $lx=='daiban_def'){
			$where	= '`status`=0 and '.$this->rock->dbinstr('nowcheckid', $uid);
			$isdb	= 1;
		}
		
		//经我处理
		if($lx=='daiban_jwcl'){
			$where	= $this->rock->dbinstr('allcheckid', $uid);
		}
		
		if($lx=='daiban_myxia'){
			$ss 	= $this->rock->dbinstr('superid', $uid);
			$where	= "uid in(select id from `[Q]admin` where $ss)";
		}
		
		$arr 	= $this->getlimit('`isdel`=0 and '.$where, $page,'*','`optdt` desc', $limit);
		$rows 	= $arr['rows'];
		$srows	= array();
		$modeids= '0';
		foreach($rows as $k=>$rs)$modeids.=','.$rs['modeid'].'';
		$modearr= array();
		if($modeids!='0'){
			$moders = m('flow_set')->getall("`id` in($modeids)",'id,num,name,summary');
			foreach($moders as $k=>$rs)$modearr[$rs['id']] = $rs;
		}
		$statsss	= explode(',','待处理,已审核,处理不通过');
		$statsss1	= explode(',','blue,green,red');
		foreach($rows as $k=>$rs){
			$modename	= $rs['modename'];
			$summary	= '';
			$modenum 	= '';
			$statustext	= '记录不存在';
			$statuscolor= '#888888';
			if(isset($modearr[$rs['modeid']])){
				$mors 	= $modearr[$rs['modeid']];
				$modename 	= $mors['name'];
				$summary 	= $mors['summary'];
				$modenum 	= $mors['num'];
				
				$rers 		= $this->db->getone('[Q]'.$rs['table'].'', $rs['mid']);
				$summary	= $this->rock->reparr($summary, $rers);
				if($rers){
					$statustext  = $statsss[$rers['status']];
					$statuscolor = $statsss1[$rers['status']];
					if($rers['isturn']==0){
						$statustext  = '待提交';
						$statuscolor = '#ff6600';
					}
				}else{
					$this->update('isdel=1', $rs['id']);
				}
			}
			
			$title 		= '['.$rs['optname'].']'.$modename.'';
			$cont 		= '申请人：'.$rs['optname'].'<br>单号：'.$rs['sericnum'].'';
			$cont.='<br>申请日期：'.$rs['applydt'].'';
			if(!isempt($summary))$cont.='<br>摘要：'.$summary.'';
			if(!isempt($rs['nstatustext']))$cont.='<br>状态：'.$rs['nstatustext'].'';
			if(!isempt($rs['checksm']))$cont.='<br>处理说明：'.$rs['checksm'].'';
			
			$menusub 			= array();
			if($rs['uid']==$uid && $rs['status']!=1){
				$menusub[] = array('name'=>'删除','color'=>'red','lx'=>'del', 'modenum'=>$modenum);
			}
			
			$ischeck	= 0;
			$nowcheckid = ','.$rs['nowcheckid'].',';
			if(contain($nowcheckid, ','.$uid.','))$ischeck = 1;
			if($isdb==1 || $ischeck==1){
				$menusub[] = array('name'=>'通过','color'=>'green','lx'=>'check','status'=>1,'notsm'=>1, 'modenum'=>$modenum);
				$menusub[] = array('name'=>'不通过','color'=>'red','lx'=>'check','status'=>2, 'modenum'=>$modenum);
			}
			
			$srows[]= array(
				'title' => $title,
				'cont' 	=> $cont,
				'id' 	=> $rs['mid'],
				'optdt' => $rs['optdt'],
				'statustext' 	=> $statustext,
				'statuscolor' 	=> $statuscolor,
				'modenum'		=> $modenum,
				'modename'		=> $modename,
				'menusub'		=> $menusub
			);
		}
		
		$arr['rows'] 	= $srows;
		
		return $arr;
	}
}