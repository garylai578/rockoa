<?php
/**
*	此文件是流程模块【finfybx.费用报销】对应接口文件。
*	可在页面上创建更多方法如：public funciton testactAjax()，用js.getajaxurl('testact','mode_finfybx|input','flow')调用到对应方法
*/

class mode_finfybxClassAction extends inputAction{

    protected function savebefore($table, $arr, $id, $addbo){
        $paytype  = $arr['paytype'];
        $cardid = $arr['cardid'];
        $openbank = $arr['openbank'];
        $fullname = $arr['buyer'];
        if($paytype=="银行转账"){
            if($cardid == "")
                return "收款账户不能为空";
            else if($openbank =="")
                return "开户行不能为空";
            else if($fullname == "")
                return "收款人全称不能为空";
        }
	}

    /**
     * @param $table 数据库表名称
     * @param $arr 表单数据
     * @param $id  费用报销的id
     * @param $addbo
     */
	protected function saveafter($table, $arr, $id, $addbo){
	    //取消合同清单的加载-2018.2.26
 /*       //更新合同清单中的已采购数量
	    $mid 	= $arr['project'];        //合同id
        if(!$mid)
            return;
        $subtables[] = $this->getsubtabledata("0");
        foreach($subtables as $k=>$rs){
            for($j=0; $j< sizeof($rs); ++$j){
                $buy = $rs[$j]['num'];              //本次采购数量
                if(!$buy || $buy == 0)
                    continue;
                $listid = $rs[$j]['listid'];        //采购项id
                $getBuyNums = m('cus2fybx')->getone('fybxid='.$id.' and '.'cusid='.$mid.' and listid='.$listid.'', "buynums")['buynums'];
                if(!$getBuyNums){//如果是空，则表示第一次添加，将相关数据写入数据库
                    $insVal['cusid'] = $mid;
                    $insVal['listid'] = $listid;
                    $insVal['fybxid'] = $id;
                    $insVal['buynums'] = $buy;
                    m('cus2fybx')->insert($insVal);
                    $buys = m('custractlist')->getone('id='.$listid, "buynums");
                    $total = $buy + $buys['buynums'];
                    m('custractlist')->update("`buynums`='$total'","`id`=$listid");
                }elseif($getBuyNums != $buy){//如果是后续修改的，则更新采购数量
                    m('cus2fybx')->update("`buynums`='$buy'","`fybxid`=$id and `cusid`=$mid and `listid`=$listid");
                    $buys = m('custractlist')->getone('id='.$listid, "buynums");
                    $total = $buys['buynums'] - $getBuyNums + $buy;
                    m('custractlist')->update("`buynums`='$total'","`id`=$listid");
                }
            }
        }*/
	}
	
	public function getlastAjax()
	{
		$rs = m('fininfom')->getone("`uid`='$this->adminid' and `type`<3 order by `optdt` desc",'paytype,cardid,openbank,fullname');
		if(!$rs)$rs='';
		$this->returnjson($rs);
	}

	public function hetongdata(){
        $mid  = (int)$this->get('mid','0');
        $where 	= '`isover`=0 or `id`='.$mid.'';
        $rows = m('custract')->getrows($where, 'id,custid,custname,money,num,project');
        $arr  = array();
        foreach($rows as $k=>$rs){
            $arr[] = array(
                'value' => $rs['id'],
                'name' 	=> '('.$rs['num'].')'.$rs['custname'].'-'.$rs['project'],
            );
        }
        return $arr;
    }

    public function listchangeAjax(){
        $mid 	= (int)$this->get('ractid');
        $rows = m('custractlist')->getall('mid='.$mid.'', "id,sort,name,unit,num,price,money,buynums,remark", "sort");
        $this->returnjson($rows);
    }

    public function getDetailAjax() {
        $start = $this->get('dt1');
        $end = $this->get('dt2');
        $where='status=1 and `category` is not null  and type=0 ';
        if($start && $start !='')
            $where .= " and `applydt`>='".$start."' ";
        if($end && $end != '')
            $where .= " and `applydt`<='".$end."' ";
        $rows = m('fininfom')->getall($where,'id,optname,applydt,projectName,category,money,paydt,paytype,cardid,openbank,buyer,`explain`','optname');
        $this->returnjson($rows);
    }

    /**公共读取数据之后处理，展示列数。这里进行了重写，用于抄机通知的过滤。
     * @param $table 表名
     * @param $rows  从表中查询出的数据
     * @return arr 需要展示的数据
     */
    public function storeaftershow($table, $rows){
        $arr = parent::storeaftershow($table, $rows);
        $moneys = 0.00;
        foreach ($rows as $k=>$v){
            $moneys += $v['money'];
        }
        $total = array('money'=>number_format($moneys,2),'base_name'=>"合计");
        array_push($arr['rows'], $total);
        return $arr;
    }
}

			