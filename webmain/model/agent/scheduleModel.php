<?php
class agent_scheduleClassModel extends agentModel
{
	
	private $joinwhere='';
	
	public function initModel()
	{
		$this->dtobj 		= c('date');
	}
	
	public function getstotal($uid, $dt)
	{
		return 0;
	}
	
	public function gettotal()
	{
		$stotal = $this->getstotal($this->adminid, $this->rock->date);
		
		return array('stotal'=>$stotal,'titles'=>'');
	}
	
	public function getdatas($uid, $lx, $page)
	{
		$row 	= array();
		$where	= 'uid='.$uid.'';
		$arr 	= m('schedule')->getlimit($where, $page,'*','optdt desc', $this->limit);
		$rows 	= $arr['rows'];
		$lsar	= array('d'=>'天','w'=>'周','m'=>'月');
		foreach($rows as $k=>$rs){
			$cont	= '时间：'.$rs['startdt'].'';
			if(!isempt($rs['enddt']))$cont .= '<br>截止：'.$rs['enddt'].'';
			if(!isempt($rs['explain']))$cont .= '<br>说明：'.$rs['explain'].'';
			$rate = $rs['rate'];
			if(!isempt($rate)){
				if($lsar[$rate]){
					$cont .= '<br>重复：每'.$lsar[$rate].' '.$rs['rateval'].'';
				}
			}
			$ishui = 0;
			if(!isempt($rs['enddt'])){
				if($rs['enddt']<$this->rock->now)$ishui=1;
			}
			
			$txsj = $rs['txsj'];
			$str  = '不提醒';
			if($txsj==1)$str  = '准点提醒';
			if($txsj>1)$str  = '提前'.$txsj.'分钟提醒';
			$cont .= '<br>提醒：'.$str.'';
			
			$row[] = array(
				'id'	=> $rs['id'],
				'title' => $rs['title'],
				'optdt' => $rs['optdt'],
				'cont'  => $cont,
				'ishui'  => $ishui
			);
		}
		$arr['rows'] 	= $row;
		return $arr;
	}
	
	
}