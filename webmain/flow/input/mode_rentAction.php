<?php
/**
*	此文件是流程模块【rent.租机登记】对应控制器接口文件。
*/ 
class mode_rentClassAction extends inputAction{
	
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
        // 自动设置租机编号:当前时间
        $rs = m('rent')->getone("`id`=".$id, "rentnum");
        if($rs['rentnum'] == null){
            $rentnum = date("Ymdhms");
            $arr['rentnum'] = $rentnum;
            m('rent')->update("`rentnum`=".$rentnum, "`id`=".$id);
        }

        // 设置默认提醒(参考mode_remindAction的方法），
        $rs = m('flow_remind')->getone("`mid`=".$id);
        if(!$rs){
            $nextdt = date("Y-m-d",strtotime("+".$arr['interval']." month", strtotime($arr['startdt']))); //下次抄机时间
            $day = explode("-",  date("Y-m-d", strtotime("-5 day", strtotime($arr['startdt']))))[2]; //提前5天进行提醒

            $remind = array(
                'modenum' => 'rent',
                'mid' => $id,
                'explain' => "抄机提醒 ：下次抄机时间是".$nextdt,
                'startdt' => $arr['startdt'],
                'enddt' => $arr['enddt'],
                'rate' => 'm',
                'recename' => '唐祖林', //todo 全部发给唐祖林。后续可以在操作菜单中修改
                'receid' => 'u14',      //u+唐祖林的id
                'rateval' => $day.' 10:30:00',
                'ratecont' => '每月 '.$day.' 10:30:00',
                'status' => '1',
                'optdt'=> date('Y-m-d h:m:s'),
                'optname'=>'管理员',
                'uid' => '1',
                'table'=>'rent'
            );
            $rid = m('flow_remind')->insert($remind);
        }
	}

    //客户名称的数据来源
    public function selectcust()
    {
        $rows = m('crm')->getCustomer("");
        return $rows;
    }

    //客户名称的数据来源
    public function selectdept()
    {
        $rows = m('crm')->getDept($_GET['param']);
        return $rows;
    }

    /** 公共读取数据之后处理，展示列数。这里进行了重写，用于抄机通知的过滤。
     * @param $table 表名
     * @param $rows  从表中查询出的数据，查询语句在webmain/model/flow/rentModel.php中的flowbillwhere定义
     * @return array 需要展示的数据
     */
    public function storeaftershow($table, $rows)
    {
        $barr = parent::storeaftershow($table, $rows); // 先调用父类的该方法，获取默认展示的数据
        $pnum = $_GET['pnum'];                          // 获取菜单url的pnum值
        if($pnum != 'remind')                           // 如果不是抄机通知页面，返回默认数据
            return $barr;
        $rows = $barr['rows'];                          // 从表中查询出的数据
        for ($j=0, $len = sizeof($rows); $j<$len; ++$j){
            $today = strtotime(date("Y-m-d"));
            $lastdt = strtotime($rows[$j]['nextdt']);
            $state = $rows[$j]['state'];
            $interval = round(($lastdt-$today)/3600/24);    //计算上次抄机时间距离现在的天数
            //如果距离提醒超过5天的，删除，不进行提醒。
            if($state != "在用" || $interval > 5) {
                unset($rows[$j]);
            }
        }
        $barr['rows'] = $rows;
        return $barr;
    }

    public function getRentRemindAjax(){
        $rs['mid'] = $this->post('mid');
        $rows = m('rentdetail')->getrows("`mid`=".$rs['mid'], "checkdt, thisnum, thisnumc", "id desc");
        if($rs) {
            $rs['lastnum'] = $rows[0]['thisnum'];
            $rs['lastnumc'] = $rows[0]['thisnumc'];
            $rs['lastdt'] = $rows[0]['checkdt'];
        }
        echo json_encode($rs);
    }

}	
			