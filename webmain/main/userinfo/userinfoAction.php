<?php
class userinfoClassAction extends Action
{
	public function userinfobefore($table)
	{
		$table = '`[Q]admin` a left join `[Q]userinfo` b on a.id=b.id';
		$s 		= '';
		$key 	= $this->post('key');
		if($key!=''){
			$s = " and (a.`name` like '%$key%' or a.`user` like '%$key%' or a.`ranking` like '%$key%' or a.`deptname` like '%$key%') ";
		}
		return array(
			'table' => $table,
			'where'	=> $s,
			'fields'=> 'a.name,a.deptname,a.id,a.status,a.ranking,b.id as ids,b.dkip,b.dkmac,b.iskq,b.isdwdk'
		);
	}
	
	public function userinfoafter($table, $rows)
	{
		$db = m($table);
		foreach($rows as $k=>$rs){
			if(isempt($rs['ids'])){
				$db->insert(array(
					'id' 		=> $rs['id'],
					'name' 		=> $rs['name'],
					'deptname' 	=> $rs['deptname'],
					'ranking' 	=> $rs['ranking']
				));
			}
		}
		return array('rows'=>$rows);
	}
	
	public function userinfobeforeabc($table)
	{
		$s 		= '';
		$key 	= $this->post('key');
		if($key!=''){
			$s = " and (`name` like '%$key%' or `ranking` like '%$key%' or `deptname` like '%$key%') ";
		}
		return array(
			'where'	=> $s,
			'fields'=> 'id,name,deptname,ranking,state,tel,sex,mobile,workdate,quitdt'
		);
	}
	
	public function userinfoafterabc($table, $rows)
	{
		$statearr = m('flow:userinfo')->statearr;
		foreach($rows as $k=>$rs){
			$rows[$k]['state'] = $statearr[$rs['state']];
		}
		return array('rows'=>$rows);
	}
}