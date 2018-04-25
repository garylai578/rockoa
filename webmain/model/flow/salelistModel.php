<?php

/**
 * Created by PhpStorm.
 * User: laiguanhui
 * Date: 2018/4/25
 * Time: 11:14
 */
class flow_salelistClassModel extends flowModel
{

/*    public function check($zt, $sm='', $lx=0){
        //更新销售单的成本信息
        $cost_pids = $this->rock->post('cfields_costids');//产品的id集合
        if($cost_pids!=null) {
            $pids = explode("_", $cost_pids);
            for ($j = 0; $j < sizeof($pids)-1; ++$j) {
                $costupdates["costprice"] = $this->rock->post('cfields_costprice0_'.$j);//产品成本单价
                $costupdates["costnum"] = $this->rock->post('cfields_costnum0_'.$j);//产品成本数量
                $costupdates["costmoney"] = $this->rock->post('cfields_costmoney0_'.$j);//产品成本金额
                m("saleproducts")->update($costupdates, 'id='.$pids[$j]);
            }
        }
        parent::check($zt, $sm, $lx);
    }*/
}