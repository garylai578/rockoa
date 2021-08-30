<?php
class deptClassAction extends Action
{
	
	
	public function dataAjax()
	{
		$this->rows	= array();
		$this->getdept(0, 1);
		
		echo json_encode(array(
			'totalCount'=> 0,
			'rows'		=> $this->rows
		));
	}
	
	private function getdept($pid, $oi)
	{
		$db		= m('dept');
		$menu	= $db->getall("`pid`='$pid' order by `sort`",'*');
		foreach($menu as $k=>$rs){
			$sid			= $rs['id'];
			$rs['level']	= $oi;
			$rs['stotal']	= $db->rows("`pid`='$sid'");
			$this->rows[] = $rs;
			
			$this->getdept($sid, $oi+1);
		}
	}
	
	public function publicbeforesave($table, $cans, $id)
	{
		$pid 	= (int)$cans['pid'];
		if($pid<=0 && $id != 1)return '上级ID必须大于0';
		if($pid!=0 && $id == 1)return '顶级禁止修改上级ID';
		if($pid!=0 && m($table)->rows('id='.$pid.'')==0)return '上级ID不存在';
		return '';
	}
	
	public function publicaftersave($table, $cans, $id)
	{
		$name 	= $cans['name'];
		$db 	= m('admin');
		$db->update("deptname='$name'", "`deptid`=$id");
		$db->updateinfo();
	}
	
	public function deptuserdataAjax()
	{
		$type 	= $this->request('changetype');
		$val 	= $this->request('value');
		$pid	= 0;
		$rows	= $this->getdeptmain($pid, $type, ','.$val.',');
		echo json_encode($rows);
	}
	
	private function getdeptmain($pid, $type, $val)
	{
		$sql	= $this->stringformat('select `id`,`name` from `?0` where `pid`=?1 order by `sort`', array($this->T('dept'), $pid));
		$arr	= $this->db->getall($sql);
		$rows	= array();
		foreach($arr as $k=>$rs){
			$children		= $this->getdeptmain($rs['id'], $type, $val);
			$uchek			= $this->contain($type, 'check');
			$expanded		= false;
			if($this->contain($type, 'user')){
				$sql	= $this->stringformat('select `id`,`name`,`sex`,`ranking`,`deptname` from `?0` where `deptid`=?1 and `status`=1 order by `sort`', array($this->T('admin'), $rs['id']));			
				$usarr	= $this->db->getall($sql);
				foreach($usarr as $k1=>$urs){
					$usarr[$k1]['leaf'] = true;
					$usarr[$k1]['uid']  = $urs['id'];
					$usarr[$k1]['id']   = 'u'.$urs['id'];
					$usarr[$k1]['type'] = 'u';
					$usarr[$k1]['icons'] = 'user';
					if($uchek){
						$bo = false;
						if($this->contain($type, 'dept')){
							$bo = $this->contain($val, $usarr[$k1]['id']);
						}else{
							$bo = $this->contain($val, $usarr[$k1]['uid']);
						}
						$usarr[$k1]['checked']=$bo;
						if(!$expanded)$expanded = $bo;
					}	
				}
				$children= array_merge($children, $usarr);
			}
			if($pid==0)$expanded = true;
			$ars['children']= $children;
			$ars['name'] 	= $rs['name'];
			$ars['id'] 		= 'd'.$rs['id'];
			$ars['did'] 	= $rs['id'];
			$ars['type'] 	= 'd';
			$ars['expanded'] = $expanded;
			
			if($this->contain($type, 'dept')){
				if($uchek){
					$bo = false;
					if($this->contain($type, 'user')){
						$bo = $this->contain($val, $ars['id']);
					}else{
						$bo = $this->contain($val, $ars['did']);
					}
					$ars['checked']=$bo;
				}	
			}
			$rows[]	= $ars;
		}
		return $rows;
	}
	
	public function deptuserjsonAjax()
	{
		$udarr 		= m('dept')->getdeptuserdata();
		$userarr 	= $udarr['uarr'];
		$deptarr 	= $udarr['darr'];

		/*// 增加自定义组别的显示
        $rows = m('flow_cname')->getall("`pid`=0 and `num` is not null",'num,name,checkid,checkname','`sort`');
        $id = 112010; //自定义开始的id，避免和原有的id重复
        foreach($rows as $k=>$rs){
            $usersID = explode(",", $rs['checkid']);
            $ntotal = $stotal = count($usersID);
            $pid = $sort = 0;
            $name = $rs['name'];
            $group = array('id'=>$id, 'name'=>$name,'pid'=> $pid, 'sort'=>$sort, 'stotal'=>$stotal, 'ntotal'=>$ntotal);
            array_push($deptarr,$group); //把组增加到数组中
            for($j=0; $j < $ntotal; ++$j){
                $fields = '`id`,`name`,`deptid`,`deptname`,`deptpath`,`deptallname`,`mobile`,`ranking`,`tel`,`face`,`sex`,`email`,`pingyin`';
                $result = m('admin')->getone("`id`=$usersID[$j] and `status`=1",$fields);
                $py   = c('pingyin');
                $result['face'] = m('admin')->getface($result['face']);
                if(isempt($result['pingyin'])){
                    $result['pingyin'] = $py->get($result['name'],1);
                }
                $result['deptid'] = $id;    //把人员的从属部门id修改为组的id
                foreach($result as $k=>$v)
                    if($v==null)
                        $result[$k] = '';
                array_push($userarr,$result);   //把人员信息增加到数组里
            }
            $id++;
        }*/
		
		$arr['deptjson']	= json_encode($deptarr);
		$arr['userjson']	= json_encode($userarr);
		$this->showreturn($arr);
	}
}