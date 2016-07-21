<?php

class mode_goodsClassAction extends inputAction{
	
	public function getgoodstype()
	{
		$rowss  = $this->option->getdata('goodstype');
		$rows	= array();
		foreach($rowss as $k=>$rs){
			$rows[] = array(
				'name' => $rs['name'],
				'value' => $rs['id'],
			);
			$rowsa = $this->option->getdata($rs['id']);
			if($rowsa)foreach($rowsa as $k1=>$rs1){
				$rows[] = array(
					'name' => '	&nbsp;	&nbsp; ├'.$rs1['name'],
					'value' => $rs1['id'],
				);
			}
		}
		return $rows;
	}
}	
			