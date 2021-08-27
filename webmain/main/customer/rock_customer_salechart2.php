<?php if(!defined('HOST'))die('not access');?>
<!--script-- >
    $(document).ready(function(){
        {params}
        var atype=params.atype,month=js.now('Y-m');
        var a = $('#view_{rand}').bootstable({
            tablename:'saleproducts2',params:{'atype':atype,'month':month},fanye:atype=='all',celleditor:true,//允许编辑单元格，在jquery-bootstable.js中定义
            modedir:'{mode}:{dir}',storebeforeaction:'',
            columns:[{
                text:'所属公司',dataIndex:'company'
            },{
                text:'客户',dataIndex:'cusname'
            },{
                text:'金额',dataIndex:'totalMoneys'
            },{
                text:'总成本合计',dataIndex:'totalCost'
            },{
                text:'备注',dataIndex:'remark'
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
                var s=get('key_{rand}').value, startdt = get('start_{rand}').value, enddt = get('end_{rand}').value, key2=get('key2_{rand}').value;
                a.setparams({key:s,'key2':key2,'startdt':startdt,'enddt':enddt},true);
            },
            searchbtn2:function(){
                this.search({});
            },
            init:function(){
                $('#key_{rand}').keyup(function(e){
                    if(e.keyCode==13)c.searchbtn2();
                });
                $('#key2_{rand}').keyup(function(e){
                    if(e.keyCode==13)c.searchbtn2();
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

<?php
/*$mid = 1; // 该菜单的id，这里是1。菜单名和id都是手工添加的！！！
$rs = m('sjoin')->getrows('mid='.$mid.' and type="other"', 'sid');
$ids = array();
foreach($rs as $k=>$v){
    array_push($ids, $v['sid']);
}
$userid = $_SESSION[QOM.'adminid'];
*/?>

<script type="text/javascript" src="webmain/task/mode/modeview.js"></script>

<script>
    var num = 0;
    $(document).ready(function(){
        {params}
        var now = new Date(); //当前日期
        var nowMonth = now.getMonth(); //当前月
        var nowYear = now.getFullYear(); //当前年
        //本月的开始时间
        var monthStartDate = new Date(nowYear, nowMonth, 1);
        showdata(monthStartDate, now);
    });

    function showdata(startdt, enddt, companykey, custkey) {
        var url = js.getajaxurl('getSaleChart2','customer','main');

        var userid="<?php echo $_SESSION[QOM.'adminid'];?>";

        js.ajax(url, {userid:userid, startdt: startdt, enddt:enddt, companykey:companykey, custkey:custkey}, function (a){
            if(!a.length)
                alert("没有销售数据，请重新选择日期！");
            var  moneys=0.0, totalCost=0.0;
            for(j = 0 ,num=a.length; j < num; ++j) {
                var ids = a.ids;
                var str = "<tr oi='0' dataid='undefined' style=''>" + "<input type='hidden' id='pid_"+j+"' value='"+(a[j].id)+"'>" +
                    "<td fields='choose;'style='' row='0' cell='0' align='center'><input type='checkbox' id='choose_"+j+"' /></td>" +
                    "<td align='right' width='40'>"+(j+1)+"</td>" +
                    "<td style='' row='0' cell='1' align='center' id='company_"+j+"'>"+(a[j].company)+"</td>" +
                    "<td style='' row='0' cell='2' align='center' id='custname_"+j+"'>"+a[j].cusname+"</td>" +
                    "<td style='' row='0' cell='3' align='center' id='totalMoneys_"+j+"'>"+a[j].totalMoneys+"</td>" +
                    "<td style='' row='0' cell='4' align='center' id='totalcost_"+j+"'>"+(a[j].totalCost?a[j].totalCost:"")+"</td>";
                    a[j].totalMoneys = a[j].totalMoneys?a[j].totalMoneys:0.0;
                    a[j].totalCost = a[j].totalCost?a[j].totalCost:0.0;

                str += "<td style='' row='0' cell='5' align='center' id='remark_"+j+"'>"+(a[j].remark?a[j].remark:"")+"</td>";
                $("#salechat2body").append(str);

                moneys = parseFloat(moneys) + parseFloat(a[j].totalMoneys);
                totalCost = parseFloat(totalCost) + parseFloat(a[j].totalCost);
            }
            var str = "<tr><td colspan='1' align='center'>合计</td><td/><td/><td/><td align='center'>"
                +moneys+"</td><td align='center'>"+totalCost.toFixed(2)+"</td><td/></tr>";
            $("#salechat2body").append(str);
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

    function searchbtn2(){
        var start = document.getElementById('start_{rand}').value;
        var end = document.getElementById('end_{rand}').value;
        var companykey= document.getElementById('companykey_{rand}').value;
        var custkey= document.getElementById('custkey_{rand}').value;
        var salechat2body = document.getElementById("salechat2body");
        salechat2body.remove();
        $("#salechat2table").append("<tbody id='salechat2body'></tbody>");
        showdata(start, end, companykey, custkey);
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

</script>

<div>
    <table width="100%">
        <tr>
            <td style="padding-right:10px">
                <button class="btn btn-default" click="reload" type="button"><i class="icon-refresh"></i></button>
            </td>
            <td nowrap>日期&nbsp;</td>
            <td>
                <input onclick="js.datechange(this,'date')" style="width:110px" readonly class="form-control datesss" id="start_{rand}" value="<?php echo date('Y-m-01', strtotime(date('Y-m-d'))); ?>" >
            </td>
            <td>&nbsp;至&nbsp;</td>
            <td align="left">
                <input onclick="js.datechange(this,'date')" style="width:110px" readonly class="form-control datesss" id="end_{rand}" value="<?php echo date('Y-m-d'); ?>" >
            </td>
            <td>&nbsp;&nbsp;</td>
            <td>
                <input class="form-control" style="width:200px" id="companykey_{rand}"   placeholder="公司关键字">
            </td>
            <td>&nbsp;&nbsp;</td>
            <td>
                <input class="form-control" style="width:200px" id="custkey_{rand}"   placeholder="客户关键字">
            </td>
            <td style="padding-left:10px">
                <div style="width:85px" class="btn-group">
                    <button class="btn btn-default" onclick="javascript:searchbtn2()" type="button">搜索</button><button class="btn btn-default" id="downbtn_{rand}" type="button" style="padding-left:8px;padding-right:8px"><i class="icon-angle-down"></i></button>
                </div>
            </td>
            <td  width="90%" style="padding-left:10px">

            </td>
            <td align="right" nowrap>
                <button class="btn btn-default" onclick="javascript:exportExcel('salechat2table')" type="button">导出当前页</button>
            </td>
        </tr>
    </table>

</div>
<div class="blank10"></div>
<div id="view_{rand}"></div>
<div style="position:relative;" id="tablebody_{rand}">
    <table id="salechat2table" class="table table-striped table-bordered table-hover" style="margin:0px">
        <thead>
        <tr>
            <th nowrap=""><div lfields="choose" align="center"><input type='checkbox' id='chooseAll' onclick="javascript:chooseAll()"/>&nbsp;全选</div></th>
            <th nowrap=""><div lfields="index" align="center">序号</div></th>
            <th nowrap=""><div lfields="company" align="center">所属公司</div></th>
            <th nowrap=""><div lfields="cusname" align="center">客户</div></th>
            <th nowrap=""><div lfields="money" align="center">销售总金额</div></th>
            <th nowrap=""><div lfields="money" align="center">总成本</div></th>
            <th nowrap=""><div lfields="remark" align="center">备注</div></th></tr></thead>
        <tbody id="salechat2body"></tbody>
    </table></div>
<!--div class="tishi">系统是以收付款单上是所属日期算对应月份统计的，当月已收金额是收款时间是当月的统计。</div-->
