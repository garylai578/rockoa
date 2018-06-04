<?php
/**
*	此文件是流程模块【salelist.销售单】对应控制器接口文件。
*/ 
class mode_salelistClassAction extends inputAction{
	
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
        //根据客户的折扣率，更新每个产品的其他成本（=销售金额×折扣率）
        $discount = m('customer')->getone("id=".$arr['custid'], 'discount')['discount'];
        $products = m('saleproducts')->getall("mid=".$id);
        foreach($products as $k=>$rs){
            $money = $rs['money'];          //产品销售金额
            $othercost = $money * $discount;
            m('saleproducts')->update("`othercost`='$othercost'","`id`=".$rs['id']);
        }
	}

	//客户名称的数据来源
    public function selectcust()
    {
        $rows = m('crm')->getmycust($this->adminid, $this->rock->arrvalue($this->rs, 'custid'));
        return $rows;
    }

    //公司名称的数据来源
    public function selectcompany()
    {
        $rows = m('crm')->getCompany($this->rock->arrvalue($this->rs, 'companyid'));
        return $rows;
    }


}	
			