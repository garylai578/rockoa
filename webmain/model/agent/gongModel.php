<?php
/**
	通知公告的
*/
class agent_gongClassModel extends agentModel
{
	
	public function gettotal()
	{
		$stotal	= $this->getwdtotal($this->adminid);
		$titles	= '';
		return array('stotal'=>$stotal,'titles'=> $titles);
	}
	
	public function getwdtotal($uid)
	{
		$ydid 	= m('log')->getread('infor', $uid);
		$where	= "id not in($ydid)";
		$meswh	= m('admin')->getjoinstr('receid', $uid);
		$where .= $meswh;
		$stotal	= m('infor')->rows($where);
		return $stotal;
	}
	
	public function getdatas($uid, $lx, $page)
	{
		$where 	= '1=1';
		$ydid 	= m('log')->getread('infor', $uid);
		if($lx=='wexx'){
			$where= "id not in($ydid)";
		}
		
		$meswh	= m('admin')->getjoinstr('receid', $uid);
		$where .= $meswh;
		
		$ydarr	= explode(',', $ydid);
		$arr 	= m('infor')->getlimit($where, $page,'`id`,`title`,`optdt`,`typename`','`optdt` desc', $this->limit);
		$rows 	= $arr['rows'];
		foreach($rows as $k=>$rs){
			$rows[$k]['title'] = '['.$rs['typename'].']'.$rs['title'].'';
			
			if(!in_array($rs['id'], $ydarr)){
				$rows[$k]['statustext'] 	= '未读';
				$rows[$k]['statuscolor'] 	= '#ED5A5A';
			}else{
				$rows[$k]['ishui']			= 1;
			}
		}
		$arr['rows'] 	= $rows;
		$arr['stotal'] 	= array(
			'weidu' => $this->getwdtotal($uid)
		);
		return $arr;
	}
}