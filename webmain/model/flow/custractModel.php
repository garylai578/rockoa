<?php

class flow_custractClassModel extends flowModel
{
	public function initModel(){
		$this->typearr		= array('收款合同','付款合同');
		$this->typesarr		= array('收','付');
		$this->statearr		= c('array')->strtoarray('待生效|blue,生效中|green,已过期|#888888');
		$this->dtobj		= c('date');
		$this->crmobj		= m('crm');
	}

	
	public function flowrsreplace($rs){
		$type 		= $rs['type'];
		$rs['type'] = $this->typearr[$type];
		$statetext	= '';
		$dt 		= $this->rock->date;
		$htstatus	= 0;
		if($rs['startdt']>$dt){
			$statetext='待生效';
		}else if($rs['startdt']<=$dt && $rs['enddt']>=$dt){
			$jg = $this->dtobj->datediff('d', $dt, $rs['enddt']);
			$statetext='<font color=green>生效中</font><br><font color=#888888>'.$jg.'天过期</font>';
			if($jg==0)$statetext='<font color=green>今日到期</font>';
			$htstatus = 1;
		}else if($rs['enddt']<$dt){
			$statetext='<font color=#888888>已过期</font>';
			$rs['ishui'] 	= 1;
			$htstatus = 2;
		}
		$rs['statetext']	= $statetext;
		$nrss	 			= $this->crmobj->ractmoney($rs);
		$ispay 				= $nrss[0];
		$moneys 			= $nrss[1];
		$dsmoney			= '';
		$ts 				= $this->typesarr[$type];
		if($ispay==1){
			$dsmoney		= '<font color=green>已全部'.$ts.'款</font>';
		}else{
			$dsmoney		= '待'.$ts.'<font color=#ff6600>'.$moneys.'</font>';
		}
		$rs['moneys']		= $dsmoney;
		$rs['htstatus']		= $htstatus;
		return $rs;
	}
	
	protected function flowbillwhere($uid, $lx)
	{
		
		$month	= $this->rock->post('dt');
		$where 	= '';
		if($month!=''){
			$where =" and `signdt` like '$month%'";
		}
	
		
		return array(
			'where' => $where,
			'order' => '`optdt` desc',
			'orlikefields' => 'custname'
		);
	}

    //是否有查看权限
    protected function flowisreadqx()
    {
        $bo = false;
        $shateid = ','.$this->rs['shateid'].',';
        if(contain($shateid,','.$this->adminid.','))$bo=true;
        return $bo;
    }

	protected function flowoptmenu($ors, $arrs)
	{
		//创建待收付款单
		if($ors['num']=='cjdaishou'){
			$moneys 		= m('crm')->getmoneys($this->rs['id']);
			$money			= $this->rs['money'] - $moneys;
			if($money > 0){
				$arr['htid'] 	= $this->rs['id'];
				$arr['htnum'] 	= $this->rs['num'];
				$arr['uid'] 	= $this->rs['uid'];
				$arr['custid'] 	= $this->rs['custid'];
				$arr['custname']= $this->rs['custname'];
				$arr['dt']		= $this->rock->date;
				$arr['optdt'] 	= $this->rock->now;
				$arr['createdt']= $this->rock->now;
				$arr['optname'] = $this->adminname;
				$arr['createname']= $this->adminname;
				$arr['createid']  = $this->adminid;
				$arr['optid'] 	= $this->adminid;
				$arr['type'] 	= $this->rs['type'];
				$arr['explain'] = $arrs['sm'];
				$arr['money'] 	= $money;
				m('custfina')->insert($arr);
			}
		}

        //共享
        if($ors['num']=='shate'){
            $cname 	 = $arrs['cname'];
            $cnameid = $arrs['cnameid'];
            $this->update(array(
                'shateid' 	=> $cnameid,
                'shate' 	=> $cname,
            ), $this->id);
            $this->push($cnameid, '客户管理', ''.$this->adminname.'将一个客户【{name}】共享给你');
        }

        //取消共享
        if($ors['num']=='unshate'){
            $this->update(array(
                'shateid' 	=> '',
                'shate' 	=> '',
            ), $this->id);
        }
    }
	
	
	/**
	*	客户合同到期提醒
	*/
	public function custractdaoqi()
	{
		$dt 	= $this->rock->date;
		$rows 	= $this->getall("status=1 and `enddt` is not null and `enddt`>='$dt'",'uid,num,custname,enddt','`uid`');
		$txlist = m('option')->getval('crmtodo','0,3,7,15,30');//提醒的时间
		$txarr 	= explode(',', $txlist);
		$dtobj 	= c('date');
		$txrows = array();
		foreach($rows as $k=>$rs){
			$jg = $dtobj->datediff('d', $dt, $rs['enddt']);
			$uid= $rs['uid'];
			if(in_array($jg, $txarr)){
				$strs = ''.$jg.'天后('.$rs['enddt'].')';
				if($jg==1)$strs='明天';
				if($jg==0)$strs='今天';
				if(!isset($txrows[$uid]))$txrows[$uid]='';
				$txrows[$uid] .= '客户['.$rs['custname'].']的[合同:'.$rs['num'].']将在'.$strs.'到期;';
			}
		}
		foreach($txrows as $uid=>$cont){
			$this->push($uid, '客户,CRM', $cont, '客户合同到期提醒');
		}
	}
}