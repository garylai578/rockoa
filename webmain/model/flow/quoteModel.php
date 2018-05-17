<?php
/**
 * Created by PhpStorm.
 * User: laiguanhui
 * Date: 2018/5/10
 * Time: 10:37
 */
class flow_quoteClassModel extends flowModel
{
    protected function flowoptmenu($ors, $arrs)
    {
        //复制报价单
        if($ors['num']=='copy'){
            $quoteid = $this->rs['id'];
            if($quoteid){
                $row = m('quote')->getone("`id`=$quoteid");
                if($row){
                    unset($row['id']);
                    $row['status']="复制于：".date("Y-m-d");
                    $mid = m('quote')->insert($row);
                    $products = m('products')->getrows("`mid`=$quoteid");
                    foreach($products as $k=>$v){
                        unset($v['id']);
                        $v['mid'] = $mid;
                        m('products')->insert($v);
                    }
                }
            }
        }
    }
}