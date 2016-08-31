<?php
class scheduleClassModel extends Model
{
	public function getlistdata($uid, $startdt, $enddt)
	{
		$arr 		= array();
		$dtobj		= c('date');
		$jg			= $dtobj->datediff('d', $startdt, $enddt)+1;
		$sql 		= "select id,title,enddt,startdt,rate,rateval from `[Q]schedule` where `uid`='$uid' and `status`=1 and `startdt`<'$enddt 23:59:59' and (`enddt` is null or `enddt`>'$startdt')";
		$rows 		= $this->db->getall($sql);
		foreach($rows as $k=>$rs){
			$endtime = 2999999999;
			if(!isempt($rs['enddt']))$endtime = strtotime($rs['enddt']);
			$rows[$k]['endtime'] 	= $endtime;
			$rows[$k]['starttime'] 	= strtotime($rs['startdt']);
			$rows[$k]['time']  		= explode('-', date('Y-m-d-H-i-s', $rows[$k]['starttime']));
		}
		for($i=0;$i<$jg; $i++){
			if($i==0)$dt= $startdt;
			if($i>0)$dt = $dtobj->adddate($dt,'d', 1);
			$dttime = strtotime($dt);
			$dta	= explode('-', $dt);
			$_d 	= (int)$dta[2];
			$nw 	= (int)date('w', $dttime);
			$row 	= array();
			foreach($rows as $k=>$rs){
				$rate = $rs['rate'];
				$ratev= ','.$rs['rateval'].',';
				if($rs['endtime']<$dttime)continue;
				$dts  = $rs['time'];
				$time = '';
				if($rate=='d'){
					$time = ''.$dt.' '.$dts[3].':'.$dts[4].':00';
				}else if($rate=='m'){
					if(contain($ratev,','.$_d.',')){
						$time = ''.$dt.' '.$dts[3].':'.$dts[4].':00';
					}
				}else if($rate=='w'){
					if(contain($ratev,','.$nw.',')){
						$time = ''.$dt.' '.$dts[3].':'.$dts[4].':00';
					}
				}else{
					if(contain($rs['startdt'], $dt))$time=$rs['startdt'];
				}
				if($time!=''){
					$row[]=array('id'=>$rs['id'],'title'=>$rs['title'],'time'=>$time);
				}
			}
			$arr[$dt] = $row;
		}
		return $arr;
	}
	
}