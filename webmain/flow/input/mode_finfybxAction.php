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
        $fullname = $arr['fullname'];
        if($paytype=="银行转账"){
            if($cardid == "")
                return "收款账户不能为空";
            else if($openbank =="")
                return "开户行不能为空";
            else if($fullname == "")
                return "收款人全称不能为空";
        }
	}
	
	
	protected function saveafter($table, $arr, $id, $addbo){
		
	}
	
	public function getlastAjax()
	{
		$rs = m('fininfom')->getone("`uid`='$this->adminid' and `type`<3 order by `optdt` desc",'paytype,cardid,openbank,fullname');
		if(!$rs)$rs='';
		$this->returnjson($rs);
	}
}	
			