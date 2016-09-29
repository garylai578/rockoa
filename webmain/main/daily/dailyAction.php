<?php
class dailyClassAction extends Action
{


	public function dailyafter($table, $rows)
	{
		$flow 	= m('flow')->initflow('daily');
		$log 	= m('log');
		foreach($rows as $k=>$rs){
			$rows[$k]['type']		= $flow->typearr[$rs['type']];
			$rows[$k]['content']	= str_replace("\n",'<br>', $rs['content']);
			$zt = $log->isread('daily', $rs['id'], $this->adminid);
			$status = 1;
			if($zt>0)$status=0;
			$rows[$k]['status']		= $status;
			$dt 	= $rs['dt'];
			if($rs['type']!=0 && !isempt($rs['enddt'])){
				$dt.='<br><font color="#aaaaaa">'.$rs['enddt'].'</font>';
			}
			$rows[$k]['dt']		= $dt;
		}
		return array('rows'=>$rows);
	}
}