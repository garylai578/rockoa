<?php
/**
*	此文件是流程模块【finlai.来源票管理】对应控制器接口文件。
*/ 
class mode_finlaiClassAction extends inputAction{
	
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

    /**
     * 录入界面中“合同号/订单号”的数据来源，需要在“表单元素管理”里的合同选择中设置：字段元素类型是“下拉框”，数据源是本函数的名称
     * @return array
     */
    public function hetongdata()
    {
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
}	
			