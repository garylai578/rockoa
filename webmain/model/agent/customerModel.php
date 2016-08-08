<?php
class agent_customerClassModel extends agentModel
{
	
	public function gettotal()
	{
		$stotal	= $this->gettotalss($this->adminid);
		$titles	= '';
		return array('stotal'=>$stotal,'titles'=> $titles);
	}
	
	public function gettotalss($uid)
	{
		$to = 0;
		return $to;
	}
	

	public function getdatas($uid, $lx, $page)
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
		
		$arr 	= m('customer')->getlimit($where, $page,'`id`,`name`,`unitname`,`optname`,`uid`,`optdt`,`laiyuan`,`tel`,`status`,`shate`','`status` desc,`optdt` desc', $this->limit);
		$rows 	= $arr['rows'];
		$arows	= array();
		foreach($rows as $k=>$rs){
			$tit	 = $rs['name'];
			if(!isempt($rs['unitname']))$tit.='('.$rs['unitname'].')';
			$cont	 = '来源：'.$rs['laiyuan'].'<br>操作人：'.$rs['optname'].'';
			if(!isempt($rs['shate']))$cont.= '<br>共享给：'.$rs['shate'].'';
			
			$arrc = array(
				'title'		=> $tit,
				'optdt'		=> $rs['optdt'],
				'id'		=> $rs['id'],
				'cont'		=> $cont
			);
			if($rs['status']==0){
				$arrc['statustext']='已停用';
				$arrc['statuscolor']='#888888';
				$arrc['ishui']		=1;
			}
			$arows[] = $arrc;
		}
		
		$arr['rows'] 	= $arows;
		$arr['stotal'] 	= array(
			'gen' => $this->gettotalss($uid)
		);
		return $arr;
	}
}