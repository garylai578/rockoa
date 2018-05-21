<?php
class customerClassAction extends Action
{
	public function custtotalbefore($table)
	{
		$where 	= '';
		$uid 	= $this->adminid;
		$lx		= $this->post('atype');
		$month	= $this->month = $this->post('month',date('Y-m'));
		$key	= $this->post('key');
		if($lx=='my'){
			$where=' and `id`='.$uid.'';
		}
		if($lx=='down'){
			$s 		= m('admin')->getdownwheres('id', $uid, 0);
			$where 	=' and ('.$s.' or `id`='.$uid.')';
		}
		if($key!=''){
			$where .= m('admin')->getkeywhere($key);
		}
		return array(
			'fields'=> 'id, name, deptname',
			'where'	=> $where,
		);
	}
	
	public function custtotalafter($table,$rows)
	{
		$crm = m('crm');
		foreach($rows as $k=>$rs){
			$rows[$k]['month'] = $this->month;
			$toarr 	= $crm->moneytotal($rs['id'], $this->month);
			
			foreach($toarr as $f=>$v){
				if($v==0)$v='';
				$rows[$k][$f] = $v;
			}
		}
		return array(
			'rows' => $rows
		);
	}
	
	public function custtotalgebefore($table)
	{
		return 'and 1=2';
	}
	
	public function custtotalgeafter($t, $rows)
	{
		$rows 		 = array();
		$crm 		 = m('crm');
		$dtobj		 = c('date');
		$uid		 = $this->post('uid', $this->adminid);
		$urs 		 = m('admin')->getone($uid, 'name,deptname');
		$start		 = $this->post('startdt', date('Y-01'));
		$end		 = $this->post('enddt', date('Y-m'));
		$jgm 		 = $dtobj->datediff('m', $start.'-01', $end.'-01');
		for($i=0; $i<=$jgm; $i++){
			$month 	= $dtobj->adddate($end.'-01', 'm', 0-$i, 'Y-m');
			$arr['month'] 	= $month;
			$arr['name'] 	= $urs['name'];
			$arr['deptname']= $urs['deptname'];
			
			$toarr 	= $crm->moneytotal($uid, $month);
			foreach($toarr as $f=>$v){
				if($v==0)$v='';
				$arr[$f] = $v;
			}
			$rows[]	= $arr;
		}
		
		$barr['rows'] 		= $rows;
		$barr['totalCount'] = count($rows);
		return $barr;
	}
	
	//客户转移
	public function movecustAjax()
	{
		$sid 	= $this->post('sid');
		$toid 	= $this->post('toid');
		if($sid==''||$sid=='')return;
		m('crm')->movetouser($this->adminid, $sid, $toid);
	}
	
	public function retotalAjax()
	{
		m('crm')->custtotal();
	}
	
	
	//批量添加客户
	public function addplcustAjax()
	{
		$rows  	= c('html')->importdata('type,name,unitname,laiyuan,linkname,tel,mobile,email,address','type,name');
		$oi 	= 0;
		$db 	= m('customer');
		foreach($rows as $k=>$rs){
			$rs['adddt']	= $this->now;
			$rs['optdt']	= $this->now;
			$rs['status']	= 1;
			$rs['uid']		= $this->adminid;
			$rs['createid']		= $this->adminid;
			$rs['optname']		= $this->adminname;
			$rs['createname']	= $this->adminname;
			$db->insert($rs);
			$oi++;
		}
		backmsg('','成功导入'.$oi.'条数据');
	}
	
	//分配客户
	public function distcustAjax()
	{
		$sid 	= $this->post('sid','0');
		$sname 	= $this->post('sname');
		$snid 	= $this->post('snid');
		$lx 	= $this->post('lx');
		$uarr['uid'] 	 = 0;
		$uarr['optname'] = '';
		if($lx==1 && $snid!='' && $sname!=''){
			$uarr['uid'] 	 = $snid;
			m('crm')->update($uarr, "`id` in($sid)");
		}
		if($lx==0){
			m('crm')->update($uarr, "`id` in($sid)");
		}
		echo 'ok';
	}

	//销售报表在加载前执行的动作
    public function salechartbefore($table)
    {
        $ids = array('1', '2', '5'); //有权查看成本信息的员工id
        $where = '';
        $uid = $this->adminid;
        $lx	= $this->post('atype');
        $start = $this->post('startdt', date('Y-01'));
        $end = $this->post('enddt', date('Y-m'));
        $key = $this->post('key');
        $key2 = $this->post('key2');
        $status = $this->post('status');
        if($lx=='my'){
            $where=' and `id`='.$uid.'';
        }
        if($lx=='down'){
            $s 		= m('admin')->getdownwheres('id', $uid, 0);
            $where 	=' and ('.$s.' or `id`='.$uid.')';
        }

        if($key!=''){
            $where .= 'and `product` like "%'.$key.'%"';    //调用adminModel.php中的getkeywhere()方法
        }
        if(in_array($uid, $ids))
            $fileds = 'mid,product,unit,num,price,money,costnum,costprice,costmoney,remark,othercost,totalcost';
        else
            $fileds = 'mid,product,unit,num,price,money,remark';
        return array(
//            'fields'=> 'company,date,cusname,dept,paydate',
            'fields'=> $fileds,
            'where'	=> $where,
            'key2' => $key2,
            'startdt' => $start,
            'enddt' => $end,
            'status' => $status,
        );
    }

    //销售报表在加载前执行的动作
    public function getSaleChartAjax()
    {
        $rows="";
        $ids = array('1', '2', '5'); //todo 有权查看成本信息的员工id，需要从页面中获取
        $saleWhere = '';
        $saleFields = 'id, company, cusname, dept, date, listid, paydate, applydt';
        $productFields = 'product,unit,num,price,money,remark';
        $uid = $this->get('userid');
/*        $start = $this->get('startdt', date('Y-01'));
        $end = $this->get('enddt', date('Y-m'));*/
                $start = $this->get('startdt');
                $end = $this->get('enddt');
        $key = $this->get('key');
        $key2 = $this->get('key2');
        $status = $this->get('status');

        if(in_array($uid, $ids)) {
            $productFields = 'product,unit,num,price,money,costnum,costprice,costmoney,remark,othercost,totalcost';
        }

        if($key2 != ''){
            $saleWhere = '(`cusname` like "%'.$key2.'%" or `company` like "%'.$key2.'%") ';
        }
        if($status == 1) {        //已收款
            if($key2 != '')
                $saleWhere .= " and ";
            $saleWhere .= ' `paydate` is not null ';
        }
        elseif($status == 2) {
            if($key2 != '')
                $saleWhere .= " and ";
            $saleWhere .= ' `paydate` is null ';
        }

        $rs = m("salelist")->getrows($saleWhere, $saleFields, " `date` desc");
        //根据输入的日期筛选，删除不符合条件的数据
        foreach ($rs as $k=>$v) {
            if ($v) {
                if (isset($start) && $start != "") {
                    $start .= "-01";
                    if ($v['applydt'] < $start) {
                        unset($rs[$k]);
                        continue;
                    } else {
                        if (isset($end) && $end != "") {
                            $end .= "-31";
                            if ($v['applydt'] > $end) {
                                unset($rs[$k]);
                                continue;
                            }
                        }
                    }
                }
            }
        }
        //获取该销售单的产品列表
        foreach ($rs as $k=>$v) {
            if ($v) {
                $productWhere = '';
                $mid = $v['id'];
                $productWhere .= '`mid`='.$mid.' ';
                if($key!=''){
                    $productWhere .= ' and `product` like "%'.$key.'%" ';
                }
                $products = m("saleproducts")->getrows($productWhere, $productFields);
                foreach ($products as $kk=>$vv) {
                    $rows[] = array_merge($rs[$k], $products[$kk]);
                }
            }
        }

        echo json_encode($rows);
    }
}

