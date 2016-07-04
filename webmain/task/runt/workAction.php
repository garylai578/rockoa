<?php
class workClassAction extends runtAction
{
	public function todoAction()
	{
		$dbs  	= m('work');
		$todo 	= m('todo');
		$dt 	= $this->date;
		$now 	= $this->now;
		$rows 	= $dbs->getrows("`status`=1 and `txdt` like '$dt%' and `state`<>1",'*', 'startdt asc');

		if($rows)foreach($rows as $k=>$rs){
			$mess = ''.$rs['title'].'('.$this->statearr[$rs['state']].')';
			$todo->addtz($rs['distid'], $rs['type'], $mess, 'work', $rs['id'], $rs['txdt']);
		}
		
		//到期前几天提醒今日到期
		$startdt	= $this->now;
		$odt 		= c('date');
		$enddt		= $odt->adddate($startdt, 'd', 30);
		$rows 		= $dbs->getrows("`status`=1 and `state`<>1 and `enddt`>='$startdt' and `enddt`<='$enddt'",'*', 'startdt asc');
		if($rows)foreach($rows as $k=>$rs){
			$jgen 	= $odt->datediff('d', $startdt, $rs['enddt']);
			$earrs	= explode(' ', $rs['enddt']);
			$dqday0 = $rs['dqday0'];
			$dqday1 = $rs['dqday1'];
			if($this->isempt($dqday1))$dqday1 = $earrs[1];
			if($dqday0>=$jgen){
				$str1 = '，将在'.$jgen.'天后到期';
				if($jgen==0)$str1 = '，今日到期';
				$mess = ''.$rs['title'].'('.$this->statearr[$rs['state']].')'.$str1.'';
				$txdt = $dt.' '.$dqday1;
				$todo->addtz($rs['distid'], $rs['type'], $mess, 'work', $rs['id'], $txdt);
			}
		}
			
		echo 'success';
	}
}