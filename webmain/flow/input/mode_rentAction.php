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

        //在抄表的同时新增租机成本：先获取最近一次抄表时间，如果没有录入租机成本，则新增。
        $sub_totals0 = $_POST['sub_totals0'] - 1;
        if($sub_totals0 >= 0){
            $lastcheckdt = $_POST['checkdt0_'.$sub_totals0];
            if($lastcheckdt == "" && ($sub_totals0 >= 1))
                $lastcheckdt = $_POST['checkdt0_'.($sub_totals0-1)];
            //把设备损耗作为成本，在抄机的同时计入
            if($lastcheckdt!= "" && $arr['wastage'] > 0){
                //如果还没有记录过，则插入
                $sort = m('rentcost')->getone("`mid`=".$id, "sort", "sort desc")['sort'];
                $row = m('rentcost')->getone("`mid`=".$id." and `remark`='根据设备损耗自动生成' ", "checkdt", "checkdt desc");
                if($row['checkdt'] != $lastcheckdt){
                    if($sort=="")
                        $sort = 0;
                    else
                        $sort++;
                    $cost = array(
                        'mid' => $id,
                        'sort' => $sort,
                        'checkdt' => $lastcheckdt,
                        'costname' => '设备损耗',
                        'num' => 1,
                        'price' => $arr['wastage'],
                        'total' => $arr['wastage'],
                        'remark' => '根据设备损耗自动生成',
                    );
                    //如果有空记录，则更新
                    $isFirstRec = m('rentcost')->getone("`mid`=".$id." and checkdt is null ", "*");
                    if($isFirstRec){
                        m('rentcost')->update($cost, "`id`=".$isFirstRec["id"]);
                    }else {
                        $rid = m('rentcost')->insert($cost);
                    }
                }
            }
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
            $interval = round(($lastdt-$today)/3600/24);    //计算下次抄机时间距离现在的天数
            //如果距离提醒超过5天的，删除，不进行提醒。
            if($state != "在用" || $interval > 5) {
                unset($rows[$j]);
            }
        }

        $barr['rows'] = array_values($rows); //需要重新排序后前端才能显示出来，否则会出现显示不了的情况。但由于是对当前查询结果的处理，所以如果全部删除的话，该页为空
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

    public function getDetailAjax() {
        $start = $this->get('dt1');
        $end = $this->get('dt2');
        $where 	= "";
        if(!isempt($start))
            $where .=" and checkdt>='".$start."'";
        if(!isempt($end))
            $where .= " and checkdt<='".$end."'";

        $sql = 'select a.id, a.`custname` as `name`, sum(b.`remainder`) as value, sum(c.`cost`) as cost from `[Q]rent` a left join (select max(checkdt) as checkdt, mid, sum(remainder) as remainder from `[Q]rentdetail` where 1=1 ' . $where . ' group by `mid`) b on b.`mid`= a.`id` left join ' . '(select mid, checkdt, sum(total) as cost from `[Q]rentcost` where 1=1 ' . $where . ' group by `mid`) c on c.`mid`=a.`id` ' . ' group by a.`custname`';

        $rowa 	= array("暂无数据");
        $rowa[] = array(
            'name' 	=> '暂无数据',
            'value' => 0,
            'bili'	=> ''
        );
        $rows 	= $this->db->getall($sql);
        $total	= 0;
        $totalCost = 0;
        if($rows){
            foreach($rows as $k=>$rs) {
                $total += floatval($rs['value']);
                $totalCost += floatval($rs['cost']);
            }
            if($total>0)
                foreach($rows as $k=>$rs) {
                    $rows[$k]['bili'] = $this->rock->number($rs['value'] * 100 / $total) . '%';
                }
            if(count($rows)>1)
                $rows[] = array('name' 	=> '合计','value' => $total, 'cost' => $totalCost, 'bili'	=> '');
        }else{
            $rows = $rowa;
        }

        $this->returnjson($rows);
    }

    /**
     * 获取租机报表的汇总信息
     */
    public function getRentDetailAjax() {
        $start = $this->get('startdt');
        $end = $this->get('enddt');
        $where 	= "";
        if(!isempt($start))
            $where .=" and checkdt>='".$start."'";
        if(!isempt($end))
            $where .= " and checkdt<='".$end."'";

        // 搜索出rent表的id，客户名称，部门，品牌，型号，基本月租，rentdetail表的id，超量金额，抄表日期
        $sql = 'select a.id, a.`custname` as `name`, a.dept, a.brand, a.model, a.rental, (b.`id`) as detailID, b.exceedingmoney, b.checkdt  from `[Q]rent` a left join (select id, mid, exceedingmoney, checkdt from `[Q]rentdetail` where 1=1 ' . $where . ') b on b.`mid`= a.`id` where b.`id` is not null';

        $rows 	= $this->db->getall($sql);
        if($rows){
            foreach($rows as $k=>$rs) {
                $id = $rs['id'];
                $firstDate = date("Y-m-01", strtotime($rs['checkdt']));
                $lastDate = date("Y-m-d", strtotime("$firstDate +1 month -1 day "));
                $where = "mid=$id and checkdt >= '$firstDate' and checkdt <= '$lastDate' ";
                $sql2 = "select sum(total) as costTotal from  `[Q]rentcost` where $where group by mid";
                $cost = $this->db->getall($sql2);
                if($cost)
                    $rows[$k]['costTotal'] = $cost[0]['costTotal'];
                else
                    $rows[$k]['costTotal'] = 0;
            }
        }else{
//            $rows = array("");
        }

        echo json_encode($rows);
    }

    /**
     * 获取租机报表的详细信息，包括张数和耗材
     */
    public function getDebitNoteAjax() {
        $start = $this->get('startdt');
        $end = $this->get('enddt');
        $where 	= "";
        if(!isempt($start))
            $where .=" and checkdt>='".$start."'";
        if(!isempt($end))
            $where .= " and checkdt<='".$end."'";

        // 搜索出抄表记录明细
        $sql = 'select a.id as `rent_id`, (b.`id`) as detail_id, a.`custname` as `客户名称`, a.dept as `部门`, a.brand as `设备品牌`, a.model as `设备型号`, b.checkdt as `抄表日期`, a.priceb as `黑色单价`, b.exceedingnum as `黑色超量数`, a.pricec as `彩色单价`,  b.exceedingnumc as `彩色超量数`, b.exceedingmoney as `超量租金`, a.rental as `月租金`, (a.rental+b.exceedingmoney) as `合计应收`  from `[Q]rent` a left join (select id, mid, exceedingnum,exceedingnumc,exceedingmoney, checkdt from `[Q]rentdetail` where checkdt is not NULL ' . $where . ') b on b.`mid`= a.`id` where b.`id` is not null order by a.custname, a.dept';
        $rows = $this->db->getall($sql);
        echo json_encode($rows);
    }

    /**
     * 创建(导出)Excel数据表格到模板中
     * @param  array   $list        要导出的数组格式的数据
     * @param  string  $filename    导出的Excel表格数据表的文件名
     * @param  array   $indexKey    $list数组中与Excel表格表头$header中每个项目对应的字段的名字(key值)
     * @param  string  $custname    客户名称，会搜索是否有以客户名称命名的模板，没有的话会调用通用模板
     * 比如: $indexKey与$list数组对应关系如下:
     *     $indexKey = array('id','username','sex','age');
     *     $list = array(array('id'=>1,'username'=>'YQJ','sex'=>'男','age'=>24));
     */
    protected function exportExcel($list,$filename,$indexKey=array(), $custname){
        require_once ROOT_PATH . '/include/PHPExcel/IOFactory.php';
        require_once ROOT_PATH . '/include/PHPExcel.php';
        require_once ROOT_PATH . '/include/PHPExcel/Writer/Excel2007.php';

        $header_arr = array('A','B','C','D','E','F','G','H','I','J','K','L','M', 'N','O','P','Q','R','S','T','U','V','W','X','Y','Z');

        //$objPHPExcel = new PHPExcel();                        //初始化PHPExcel(),不使用模板
        //加载excel文件,设置模板
        $custTemplate = ROOT_PATH.'/web/template/'.iconv("utf-8", "gbk", $custname).'-template.xls';  //系统编码是utf8，文件系统编码是gbk
        $stTemplate = ROOT_PATH.'/web/template/checkbill.xls';       //默认模板

/*        $dir = ROOT_PATH.'/web/template/';
        if (is_dir($dir)){
            if ($dh = opendir($dir)){
                while (($file = readdir($dh)) !== false){
                    $e=mb_detect_encoding($file, array('UTF-8', 'GBK','gb2312'));
                    echo "filename:" . $file . ", e:".$e."<br>";
                }
                closedir($dh);
            }
        }*/

/*        $e=mb_detect_encoding($custname, array('UTF-8', 'GBK','gb2312'));
        echo "<br>e:".$e;*/

        if(file_exists($custTemplate)) {
            $objPHPExcel = PHPExcel_IOFactory::load($custTemplate);
//            echo("<br>i am here! cust:" . $custname . ", tmp:" . $custTemplate . " .lai . ");
        }
        else {
            $objPHPExcel = PHPExcel_IOFactory::load($stTemplate);
        }

        $objWriter = new PHPExcel_Writer_Excel5($objPHPExcel);  //设置保存版本格式

        //接下来就是写数据到表格里面去
        $objActSheet = $objPHPExcel->getActiveSheet();
        $objActSheet->setCellValue('A3',  "客户名称：".$custname);
        $i = 5;
        foreach ($list as $row) {
            foreach ($indexKey as $key => $value){
                //这里是设置单元格的内容
                $objActSheet->setCellValue($header_arr[$key].$i,$row[$value]);
            }
            $i++;
        }

        // 保存至本地Excel表格
        $file = iconv("utf-8", "gbk", $filename);
//        echo("<br>filename:".$filename.', file:'.$file." . ");
        $objWriter->save($file);   //系统编码是utf8，文件系统编码是gbk，用这个
//        $objWriter->save($filename);   //系统编码是utf8，文件系统编码也是utf8，用这个

        /* // 2.接下来当然是下载这个表格了，在浏览器输出就好了
         header("Pragma: public");
         header("Expires: 0");
         header("Cache-Control:must-revalidate, post-check=0, pre-check=0");
         header("Content-Type:application/force-download");
         header("Content-Type:application/vnd.ms-execl");
         header("Content-Type:application/octet-stream");
         header("Content-Type:application/download");;
         header('Content-Disposition:attachment;filename="'.$filename.'.xls"');
         header("Content-Transfer-Encoding:binary");
         $objWriter->save('php://output');*/
    }

    /**
     * 获取租机报表的详细信息，按照模板导出所需报表excel
     */
    public function getModelNoteAjax(){
        $downloadFiles = array();
        $start = $this->get('startdt');
        $end = $this->get('enddt');
        $where 	= "";
        if(!isempt($start))
            $where .=" and checkdt>='".$start."'";
        if(!isempt($end))
            $where .= " and checkdt<='".$end."'";

        // 搜索出抄表记录明细
        $sql = 'select a.id as `rent_id`, (b.`id`) as detail_id, a.`custname` as `custname`, a.dept as `dept`, a.brand as `设备品牌`, a.model as `设备型号`, b.checkdt as `checkdt`, a.priceb as `priceb`, b.exceedingnum as `exceedingnum`, a.pricec as `pricec`,  b.exceedingnumc as `exceedingnumc`, b.exceedingmoney as `超量租金`, a.rental as `rental`, (a.rental+b.exceedingmoney) as `合计应收`  from `[Q]rent` a left join (select id, mid, exceedingnum,exceedingnumc,exceedingmoney, checkdt from `[Q]rentdetail` where checkdt is not NULL ' . $where . ') b on b.`mid`= a.`id` where b.`id` is not null order by a.custname, a.dept';
        $rows = $this->db->getall($sql);
        if($rows){
            $custname='';
            $list = array();
            $indexKey = array('date','dept','product','unit','num','price','total','remark');
            foreach($rows as $k=>$rs) {
                if($custname == ''){
                    $custname = $rs['custname'];
                }elseif($custname != $rs['custname']){ //如果是不同公司
                    //先导出已有数据
                    $filename = "web/download/".$custname.'.xls';
                    $this->exportExcel($list, $filename, $indexKey, $custname);
                    array_push($downloadFiles, $filename);
                    //然后重置相关变量
                    $custname = $rs['custname'];
                    $list = array();
                }
                // 封装需要导出的内容。
                array_push($list, array('date'=>$rs['checkdt'], 'dept'=>$rs['dept'], 'product'=>'复印机租金','unit'=>'台','num'=>'1','price'=>$rs['rental'],'total'=>$rs['rental'],'remark'=>''));
                if($rs['exceedingnum'] != 0) {
                    $priceb = $rs['exceedingnum'] * $rs['priceb'];
                    if($priceb > 0)
                        array_push($list, array('date'=>'', 'dept'=>'', 'product'=>'黑色超出张数','unit'=>'张','num'=>$rs['exceedingnum'],'price'=>$rs['priceb'],'total'=>$priceb,'remark'=>''));
                }
                if($rs['exceedingnumc'] != 0) {
                    $pricec = $rs['exceedingnumc'] * $rs['pricec'];
                    if($pricec > 0)
                        array_push($list, array('date'=>'', 'dept'=>'', 'product'=>'彩色超出张数','unit'=>'张','num'=>$rs['exceedingnumc'],'price'=>$rs['pricec'],'total'=>$pricec,'remark'=>''));
                }
            }
            //导出最后一条数据
            $filename = "web/download/".$custname.'.xls';
            $this->exportExcel($list, $filename, $indexKey, $custname);
            array_push($downloadFiles, $filename);
        }

        // 生成压缩包
        if($downloadFiles != ''){
            $zipname = "web/download/zujibaobiao.zip";
            if(file_exists($zipname))
                unlink($zipname);
            $zip = new ZipArchive();
            $zip->open($zipname,ZipArchive::CREATE);   //打开压缩包
            foreach($downloadFiles as $file){
//                setlocale(LC_ALL, 'zh_CN.GBK'); // 必须要设置环境，否则下面的basename()方法获取不到正确的中文名，导致压缩失败
                $file = iconv("utf-8", "gbk", $file); //系统编码是utf8，文件系统编码是gbk，用这个
                //系统编码是utf8，文件系统编码也是utf8，直接压缩
                $zip->addFile($file);   //向压缩包中添加文件
            }
            $zip->close();  //关闭压缩包
            // 删除excel文件
            foreach ($downloadFiles as $file) {
                $file = iconv("utf-8", "gbk", $file); //系统编码是utf8，文件系统编码是gbk，用这个
                unlink($file);
            }
        }
        echo json_encode(array("filename"=>$zipname));
    }
}	
			