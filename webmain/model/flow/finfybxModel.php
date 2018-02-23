<?php
class flow_finfybxClassModel extends flowModel
{
/*    //审核完成处理
    protected function flowcheckfinsh($zt){
        //如果是增值税专用发票，则在抵票列表中增加相应记录
        if($zt == 1 and $this->rs['openpiaotype'] == "增值税专用发票"){
            $dipiao = array_slice($this->rs, 0, 34);
            $dipiao['type'] = 8;
            $dipiao['status'] = 0;
            unset($dipiao['id']);
            m('fininfom')->insert($dipiao);
        }
    }*/

}