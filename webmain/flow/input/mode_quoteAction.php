<?php
/**
*	此文件是流程模块【quote.报价单】对应控制器接口文件。
*/ 
class mode_quoteClassAction extends inputAction{

	/**
	*	重写函数：保存前处理，主要用于判断是否可以保存
	*	$table String 对应表名
	*	$arr Array 表单参数
	*	$id Int 对应表上记录Id 0添加时，大于0修改时
	*	$addbo Boolean 是否添加时
	*	return array('msg'=>'错误提示内容','rows'=> array()) 可返回空字符串，或者数组 rows 是可同时保存到数据库上数组
	*/
	protected function savebefore($table, $arr, $id, $addbo){
		
	}
	
	/**
	*	重写函数：保存后处理，主要保存其他表数据
	*	$table String 对应表名
	*	$arr Array 表单参数
	*	$id Int 对应表上记录Id
	*	$addbo Boolean 是否添加时
	*/	
	protected function saveafter($table, $arr, $id, $addbo){
		
	}

	public function selectReceiver(){
        $custid =  $this->rock->arrvalue($this->rs, 'custid');
	    $receiver = m('quote')->getone("`custid`=".$custid, "receiver");
        $row = m('customer')->getone("`id`=".$custid, "linkname, linkname2, linkname3");
        $arr = array();
        if($row) {
            foreach ($row as $k => $v) {
                if($receiver) {
                    if ($v == $receiver['receiver']) {
                        array_push($arr, array("value" => $v, "name" => $v));
                    } else {
                        array_push($arr, array("value" => $v, "name" => $v));
                    }
                }
            }
        }
        return $arr;
    }

    public function selectFrom(){
        $companyid =  $this->rock->arrvalue($this->rs, 'companyid');
        $receiver = m('quote')->getone("`companyid`=".$companyid, "`from`");
        $row = m('company')->getone("`id`=".$companyid, "contacts1, contacts2, contacts3");
        $arr = array();
        if($row) {
            foreach ($row as $k => $v) {
                if ($receiver) {
                    if ($v == $receiver['from']) {
                        array_push($arr, array("value" => $v, "name" => $v));
                    } else {
                        array_push($arr, array("value" => $v, "name" => $v));
                    }
                }
            }
        }
        return $arr;
    }

    //客户名称的数据来源
    public function selectcust(){
        $rows = m('crm')->getmycust($this->adminid, $this->rock->arrvalue($this->rs, 'custid'));
        return $rows;
    }

    //所属公司的数据来源
    public function selectCompany(){
        $this->rock->arrvalue($this->rs, 'companyid');
        $rows = m('company')->getrows("", "id as value, name, id");
        return $rows;
    }

    //选择发件人
    public function selectfromAjax(){
        $companyid =  (int)$this->get('companyid');
        $row = m('company')->getone("`id`=".$companyid, "contacts1, tel1, contacts2, tel2, contacts3,tel3");
        $this->returnjson($row);
    }

    //选择收件人
    public function selecttoAjax(){
        $custid =  (int)$this->get('custid');
        $row = m('customer')->getone("`id`=".$custid, "linkname, tel, linkname2, tel2, linkname3,tel3");
        $this->returnjson($row);
    }

    //选择发件人和收件人
    public function selectCAjax(){
        $companyid =  (int)$this->get('companyid');
        $custid =  (int)$this->get('customerid');
        $row1 = m('company')->getone("`id`=".$companyid, "contacts1, tel1, contacts2, tel2, contacts3,tel3");
        $row2 = m('customer')->getone("`id`=".$custid, "linkname, tel as link1, linkname2, tel2 as link2, linkname3,tel3 as link3");
        $this->returnjson(array_merge($row1, $row2));
    }
}	
			