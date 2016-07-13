<?php
class mode_leaveClassAction extends inputAction{

	public function totalAjax()
	{
		$start	= $this->post('stime');
		$end	= $this->post('etime');
		$date	= c('date', true);
		$sj		= $date->datediff('H', $start, $end);
		echo json_encode(array($sj, ''));
	}
}	
			