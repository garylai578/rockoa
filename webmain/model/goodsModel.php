<?php
class goodsClassModel extends Model
{
	public function setstock($id='')
	{
		$where = '';
		if($id!='')$where=' and `aid` in('.$id.')';
		$sql = 'SELECT sum(count)stock,aid FROM `[Q]goodss` where `status` in(0,1) '.$where.' GROUP BY aid';
		$rows= $this->db->getall($sql);
		foreach($rows as $k=>$rs){
			$this->update(array(
				'stock' => $rs['stock']
			), $rs['aid']);
		}
	}
}