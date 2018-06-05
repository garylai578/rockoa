<?php if(!defined('HOST'))die('not access');?>
<!--script-- >
    $(document).ready(function(){
        {params}
        var atype=params.atype,month=js.now('Y-m');
        var a = $('#view_{rand}').bootstable({
            tablename:'saleproducts',params:{'atype':atype,'month':month},fanye:atype=='all',celleditor:true,//允许编辑单元格，在jquery-bootstable.js中定义
            modedir:'{mode}:{dir}',storebeforeaction:'salechartbefore',
            columns:[{
                text:'所属公司',dataIndex:'company'
            },{
                text:'销售日期',dataIndex:'date'
            },{
                text:'客户',dataIndex:'cusname'
            },{
                text:'部门',dataIndex:'dept'
            },{
                text:'单号',dataIndex:'listid'
            },{
                text:'产品名称',dataIndex:'product'
            },{
                text:'单位',dataIndex:'unit'
            },{
                text:'单价',dataIndex:'price'
            },{
                text:'数量',dataIndex:'num'
            },{
                text:'金额',dataIndex:'money'
            },<?php
/*                $ids = array('1', '2', '5'); //有权查看成本信息的员工id
                if(in_array($_SESSION[QOM.'adminid'], $ids)) //只有有权限的人员才能查看成本相关的字段
                    echo "{
                text:'成本单价',dataIndex:'costprice'
            },{
                text:'成本数量',dataIndex:'costnum'
            },{
                text:'成本金额',dataIndex:'costmoney'
            },{
                text:'其他成本',dataIndex:'othercost'
            },{
                text:'总成本',dataIndex:'totalcost'
            },";
                */?>
                {
                text:'备注',dataIndex:'remark'
            },{
                text:'收款日期',dataIndex:'paydate',
//                editor:true                  //允许编辑单元格，在mode/bootstrapplugin/jquery-bootstable.js中定义
            }],
            load:function(a){
                c.loadcharts();
            },
            itemclick:function(){
                btn(false);
            },
            beforeload:function(){
                btn(true);
            }
        });

        function btn(bo){
            get('xiang_{rand}').disabled = bo;
        }

        var myChart=false;
        var c = {
            reload:function(){
                a.reload();
            },
            daochu:function(){
                a.exceldown();
            },
            search:function(){
                //通过POST将参数传递到后台：customerAction
                var s=get('key_{rand}').value, startdt = get('start_{rand}').value, enddt = get('end_{rand}').value, key2=get('key2_{rand}').value, status=get('selstatus_{rand}').value;
                a.setparams({key:s,'key2':key2,'startdt':startdt,'enddt':enddt,'status':status},true);
            },
            searchbtn:function(){
                this.search({});
            },
            init:function(){
                $('#key_{rand}').keyup(function(e){
                    if(e.keyCode==13)c.searchbtn();
                });
                $('#key2_{rand}').keyup(function(e){
                    if(e.keyCode==13)c.searchbtn();
                });
                this.initpage();
            },
            initpage:function(){

            },
            view:function(){
                var d=a.changedata;
                addtabs({num:'custfintotal'+d.id+'',url:'main,customer,totalge,uid='+d.id+'',icons:'bar-chart',name:''+d.name+'的年度统计'});
            },
            loadcharts:function(){
                if(atype!='down')return;
                /*                if(!myChart){
                 $('#view_{rand}').after('<div class="blank20"></div><div id="main_show{rand}" style="width:98%;height:500px;"></div>');
                 myChart = echarts.init(get('main_show{rand}'));
                 }*/
                var rows = a.getData('rows'),i,len=rows.length,v;
                var xAxis=[],data=[];
                for(i=0;i<len;i++){
                    xAxis.push(rows[i].name);
                    v = rows[i].shou_moneyz;if(v=='')v=0;
                    data.push(parseFloat(v));
                }

                var mon = get('month_{rand}').value;
                var option = {
                    title: {
                        text: ''+mon+'月份应收金额图表',
                        left: 'center'
                    },
                    tooltip: {},
                    legend: {
                        data:['应收金额']
                    },
                    xAxis: {
                        data: xAxis
                    },
                    yAxis: {type : 'value'},
                    series: [{
                        name: '金额',
                        type: 'bar',
                        data: data
                    }]
                };
                myChart.setOption(option);

            }
        };
        js.initbtn(c);
        $('#month_{rand}').val(month);
    });
</script-->
<script type="text/javascript" src="webmain/task/mode/modeview.js"></script>

<script>
    var num = 0;
    $(document).ready(function(){
        {params}
        showdata();
    });

    function showdata(startdt, enddt, key, key2, status) {
        var url = js.getajaxurl('getSaleChart','customer','main');

        var userid="<?php echo $_SESSION[QOM.'adminid'];?>";

        js.ajax(url, {userid:userid, startdt: startdt, enddt:enddt, key:key, key2:key2, status:status}, function (a){
            if(!a.length)
                alert("没有销售数据！");
            for(j = 0 ,num=a.length; j < num; ++j) {
                var ids = a.ids;
                var str = "<tr oi='0' dataid='undefined' style=''>" + "<input type='hidden' id='pid_"+j+"' value='"+(a[j].id)+"'>" +
                    "<td fields='choose;'style='' row='0' cell='0' align='center'><input type='checkbox' id='choose_"+j+"' /></td>" +
                    "<td align='right' width='40'>"+(j+1)+"</td>" +
                    "<td style='' row='0' cell='1' align='center' id='company_"+j+"'>"+(a[j].company)+"</td>" +
                    "<td style='' row='0' cell='2' align='center' id='date_"+j+"'>"+(a[j].date?a[j].date:"")+"</td>" +
                    "<td style='' row='0' cell='3' align='center' id='custname_"+j+"'>"+a[j].cusname+"</td>" +
                    "<td style='' row='0' cell='4' align='center' id='dept_"+j+"'>"+a[j].dept+"</td>" +
                    "<td style='' row='0' cell='5' align='center' id='listid_"+j+"'>"+a[j].listid+"</td>" +
                    "<td style='' row='0' cell='6' align='center' id='product_"+j+"'>"+a[j].product+"</td>" +
                    "<td style='' row='0' cell='7' align='center' id='unit_"+j+"'>"+a[j].unit+"</td>" +
                    "<td style='' row='0' cell='8' align='center' id='price_"+j+"'>"+a[j].price+"</td>" +
                    "<td style='' row='0' cell='9' align='center' id='num_"+j+"'>"+a[j].num+"</td>" +
                    "<td style='' row='0' cell='10' align='center' id='money_"+j+"'>"+a[j].money+"</td>";
                if(contains(ids, userid)){
                    str += "<td style='' row='0' cell='11' align='center' id='costprice_"+j+"'>"+(a[j].costprice?a[j].costprice:"")+"</td>" +
                        "<td style='' row='0' cell='12' align='center' id='costnum_"+j+"'>"+(a[j].costnum?a[j].costnum:"")+"</td>" +
                        "<td style='' row='0' cell='13' align='center' id='costmoney_"+j+"'>"+(a[j].costmoney?a[j].costmoney:"")+"</td>" +
                        "<td style='' row='0' cell='14' align='center' id='othercost_"+j+"'>"+a[j].othercost+"</td>" +
                        "<td style='' row='0' cell='15' align='center' id='totalcost_"+j+"'>"+(a[j].totalcost?a[j].totalcost:"")+"</td>";
                }
                str += "<td style='' row='0' cell='16' align='center' id='remark_"+j+"'>"+(a[j].remark?a[j].remark:"")+"</td>" +
                    "<td style='' row='0' cell='17' align='center' id='paydate_"+j+"'>"+(a[j].paydate?a[j].paydate:"")+"</td>";
                $("#salechattbody").append(str);
            }
        },'get,json'); //不要忘记加最后'get,json'这个参数，否则系统会认为是字符串，而不是json数据。调试这个花了半天时间。
    }

    function contains(arr, obj) {
        var i = arr.length;
        while (i--) {
            if (arr[i] == obj) {
                return true;
            }
        }
        return false;
    }

    function searchbtn(){
        var start = document.getElementById('start_{rand}').value;
        var end = document.getElementById('end_{rand}').value;
        var key = document.getElementById('key_{rand}').value;
        var key2= document.getElementById('key2_{rand}').value;
        var status = document.getElementById('selstatus_{rand}').value;
        var salechatbody = document.getElementById("salechattbody");
        salechatbody.remove();
        $("#salechattable").append("<tbody id='salechattbody'></tbody>");
        showdata(start, end, key, key2, status);
    }

    function chooseAll(){
        var selAll = document.getElementById("chooseAll").checked;
        if(selAll){
            for(var j = 0; j < num; ++j){
                document.getElementById('choose_'+j).checked = true;
            }
        }else{
            for(var j = 0; j < num; ++j){
                document.getElementById('choose_'+j).checked = false;
            }
        }
    }
    
    function createCheckbill() {
        var selected="";
        var company = "";
        var custname = "";
        for(var j = 0; j < num; ++j){
            if(document.getElementById('choose_'+j).checked){
                var selCompany = document.getElementById('company_'+j).textContent;
                var selCustName =  document.getElementById('custname_'+j).textContent;
                if(company==""){
                    company = selCompany;
                    custname = selCustName;
                }else if(company != selCompany || custname != selCustName){
                    alert("所选的产品属于不同的客户或者属于不同的公司，请重新选择！");
                    return;
                }
                selected = selected + "" + document.getElementById('pid_'+j).value + ",";
            }
        }
        if(selected.length<=0) {
            alert("请先选择产品！");
            return;
        }
        selected = selected.substring(0, selected.length-1);
        var url = js.getajaxurl('createCheckbill','customer','main');
        js.ajax(url, {selected:selected}, function (a){
            if(a.success==1){
                alert("已经生成对账单，请在对账单报表中查看！");
            }else{
                alert("生成对账单失败，请重新尝试或者联系管理员！");
            }
        },'get,json');
    }
</script>

<div>
    <table width="100%">
        <tr>
            <td style="padding-right:10px">
                <button class="btn btn-default" click="reload" type="button"><i class="icon-refresh"></i></button>
            </td>
            <td style="padding-right:10px">
                <div style="width:120px" class="input-group">
                    <input readonly placeholder="月份从" class="form-control" id="start_{rand}" >
                    <span class="input-group-btn">
				<button onclick="return js.selectdate(this,'start_{rand}','month')" class="btn btn-default" type="button"><i class="icon-calendar"></i></button>
			</span>
                </div>
            </td>
            <td nowrap>至&nbsp; </td>
            <td>
                <div style="width:120px" class="input-group">
                    <input readonly class="form-control" id="end_{rand}" >
                    <span class="input-group-btn">
				<button onclick="return js.selectdate(this,'end_{rand}','month')" class="btn btn-default" type="button"><i class="icon-calendar"></i></button>
			</span>
                </div>
            </td>
            <td>&nbsp;&nbsp;</td>
            <td>
                <input class="form-control" style="width:200px" id="key2_{rand}"   placeholder="客户或所属公司关键字">
            </td>
            <td>&nbsp;&nbsp;</td>
            <td>
                <input class="form-control" style="width:200px" id="key_{rand}"   placeholder="产品关键字">
            </td>
            <td style="padding-left:10px"><select class="form-control" style="width:120px" id="selstatus_{rand}"><option value="">-全部状态-</option><option style="color:green" value="1">已收款</option><option style="color:red" value="2">未收款</option></select></td>
            <td style="padding-left:10px">
                <div style="width:85px" class="btn-group">
                    <button class="btn btn-default" onclick="javascript:searchbtn()" type="button">搜索</button><button class="btn btn-default" id="downbtn_{rand}" type="button" style="padding-left:8px;padding-right:8px"><i class="icon-angle-down"></i></button>
                </div>
            </td>
            <td  width="90%" style="padding-left:10px">

            </td>
            <td align="right" nowrap>
                <button class="btn btn-default" onclick="javascript:createCheckbill()" type="button">生成对账单</button>
            </td>
        </tr>
    </table>

</div>
<div class="blank10"></div>
<div id="view_{rand}"></div>
<div style="position:relative;" id="tablebody_{rand}">
    <table id="salechattable" class="table table-striped table-bordered table-hover" style="margin:0px">
        <thead><tr><th nowrap=""><div lfields="choose" align="center"><input type='checkbox' id='chooseAll' onclick="javascript:chooseAll()"/>&nbsp;全选</div></th><th nowrap=""><div lfields="index" align="center">序号</div></th><th nowrap=""><div lfields="company" align="center">所属公司</div></th><th nowrap=""><div lfields="date" align="center">销售日期</div></th><th nowrap=""><div lfields="cusname" align="center">客户</div></th><th nowrap=""><div lfields="dept" align="center">部门</div></th><th nowrap=""><div lfields="listid" align="center">单号</div></th><th nowrap=""><div lfields="product" align="center">产品名称</div></th><th nowrap=""><div lfields="unit" align="center">单位</div></th><th nowrap=""><div lfields="price" align="center">单价</div></th><th nowrap=""><div lfields="num" align="center">数量</div></th><th nowrap=""><div lfields="money" align="center">金额</div></th>
            <?php
            $mid = 1; // 该菜单的id，这里是1。菜单名和id都是手工添加的！！！
            $rs = m('sjoin')->getrows('mid='.$mid.' and type="other"', 'sid');
            $ids = array();
            foreach($rs as $k=>$v){
                array_push($ids, $v['sid']);
            }
            $userid = $_SESSION[QOM.'adminid'];
            if(in_array($userid, $ids))
             echo "<th nowrap=''><div lfields='costprice' align='center'>成本单价</div></th><th nowrap=''><div lfields='costnum' align='center'>成本数量</div></th><th nowrap=''><div lfields='costmoney' align='center'>成本金额</div></th><th nowrap=''><div lfields='othercost' align='center'>其他成本</div></th><th nowrap=''><div lfields='totalcost' align='center'>总成本</div></th>";
            ?>
            <th nowrap=""><div lfields="remark" align="center">备注</div></th><th nowrap=""><div lfields="paydate" align="center">收款日期</div></th></tr></thead>
        <tbody id="salechattbody"></tbody>
    </table></div>
<!--div class="tishi">系统是以收付款单上是所属日期算对应月份统计的，当月已收金额是收款时间是当月的统计。</div-->
