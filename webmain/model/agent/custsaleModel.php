<?php
class agent_custsaleClassModel extends agentModel
{
	
	public function gettotal()
	{
		$stotal	= $this->gettotalss($this->adminid);
		$titles	= '';
		return array('stotal'=>$stotal,'titles'=> $titles);
	}
	
	public function gettotalss($uid)
	{
		$to = m('custsale')->rows('`uid`='.$uid.' and `state`=0');
		return $to;
	}
	

	public function getdatas($uid, $lx, $page)
	{
		$arows 	= array();
		$where 	= '`uid`='.$uid.' and `state`=0';
		if($lx=='saleycj'){
			$where 	= '`uid`='.$uid.' and `state`=1';
		}
		if($lx=='saleyds'){
			$where 	= '`uid`='.$uid.' and `state`=2';
		}
		if($lx=='saleall'){
			$where 	= '`uid`='.$uid.'';
		}
		
		$statea	= c('array')->strtoarray('跟进中|blue,已成交|green,已丢失|#888888');
		$arr 	= m('custsale')->getlimit($where, $this->page,'*','`state`,`optdt` desc', $this->limit);
		$rows 	= $arr['rows'];
		$arows	= array();
		foreach($rows as $k=>$rs){
			$tit	 = $rs['custname'];
			$cont	 = '来源：'.$rs['laiyuan'].'<br>销售人：'.$rs['optname'].'<br>申请日期：'.$rs['applydt'].'';
			if(!isempt($rs['explain']))$cont.='<br>说明：'.$rs['explain'].'';
			if($rs['money']>0)$cont.='<br>金额：'.$rs['money'].'';
			if(!isempt($rs['dealdt']))$cont.='<br>成交时间：'.$rs['dealdt'].'';
			$state 	 = $rs['state'];
			$ztarr	 = $statea[$state];
			$arrc = array(
				'title'		=> $tit,
				'optdt'		=> $rs['optdt'],
				'id'		=> $rs['id'],
				'cont'		=> $cont,
				'statustext'=> $ztarr[0],
				'statuscolor'=> $ztarr[1]
			);
			if($state==2){
				$arrc['ishui'] = 1;
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