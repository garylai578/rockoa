<?php
/**
*	客户.合同管理
*/
class mode_custractClassAction extends inputAction{
	
	
	public function selectcust()
	{
		$rows = m('crm')->getmycust($this->adminid, $this->rock->arrvalue($this->rs, 'custid'));
		return $rows;
	}
	
	
	
	
	public function selectsale()
	{
		$rows = m('crm')->getmysale($this->adminid, (int)$this->get('mid'));
		$arr  = array();
		foreach($rows as $k=>$rs){
			$arr[] = array(
				'value' => $rs['id'],
				'name' 	=> '['.$rs['laiyuan'].']'.$rs['custname'],
			);
		}
		return $arr;
	}
	
	public function salechangeAjax()
	{
		$saleid = (int)$this->get('saleid');
		$cars 	= m('custsale')->getone($saleid, 'id,custid,custname,money,laiyuan');
		$this->returnjson($cars);
	}
	
	protected function savebefore($table, $arr, $id, $addbo){
		
	}
	
	
	protected function saveafter($table, $arr, $id, $addbo){
		m('crm')->ractmoney($id); //计算未收/付款
		$saleid = (int)$arr['saleid'];
		$dbs 	= m('custsale');
		$dbs->update('htid=0', "`htid`='$id'");
		if($saleid > 0){
			$dbs->update('htid='.$id.'', "`id`='$saleid'");
		}

		//更新客户的合同数量和合同金额
        $custid = (int)$arr['custid'];
        $rows = m('custract')->getall('custid='.$custid.'', "`money`");
		$htnums = 0;
		$sum = 0;
        foreach($rows as $k=>$rs){
            $sum += $rs['money'];
            $htnums++;
        }
        if($sum >0 || $htnums >0){
            $uarr			= array();
            $uarr['htshu'] 	= $htnums;
            $uarr['moneyz']= $sum;
            $dbs = m('customer');
            $result = $dbs->update($uarr, 'id='.$custid.'');
        }
	}
	
	public function remoneyAjax()
	{
		m('crm')->custractupzt();
	}
}	
			