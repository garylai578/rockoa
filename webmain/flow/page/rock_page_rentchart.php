<?php
/**
 *	模块：rent.租机报表
 */
defined('HOST') or die ('not access');
?>
<script type="text/javascript" src="webmain/flow/input/inputjs/mode_rent.js"></script>
<script type="text/javascript" src="js/xlsx.full.min.js"></script>
<script>
    $(document).ready(function(){
        var myChart = [],darr=[];
        {params}
        var modenum = 'rent',modename='租机报表',isflow=0,modeid='81',atype = params.atype,pnum=params.pnum;
        var c = {
            getparams:function(xu,tfid,nas,chatlx){
                var cans = {
                    tablename:'todo',url:js.getajaxurl('flowRentTotal','flowopt','flow'),modenum:'rent',
                    params:{atype:'all',total_fields:tfid,total_type:'sum|remainder'},xuhao:xu,chatlx:chatlx,
                    columns:[{
                        text:nas,dataIndex:'name'
                    },{
                        text:'金额',dataIndex:'value'
                    },{
                        text:'成本',dataIndex:'cost'
                    },{
                        text:'比例',dataIndex:'bili'
                    }],
                    load:function(a){
                        c.loadcharts(this.xuhao,this.chatlx);
                    },
                    itemdblclick:function(a){ // 双击触发事件
                        c.dbclick(this.xuhao,this.chatlx);
                    },
                };
                return cans;
            },
            reload:function(o1,lx){
                darr[lx].reload();
            },
            loadcharts:function(oi,tlx){
                if(!tlx)tlx='pie';
                var rows = darr[oi].getData('rows'),i,len=rows.length,v;
                var xAxis=[],data=[];
                for(i=0;i<len;i++){
                    if(rows[i].name!='合计'){
                        xAxis.push(rows[i].name);
                        v = rows[i].value;
                        if(v=='')v=0;
                        cc = rows[i].cost;
                        if(cc=='')cc=0;
                        data.push({value:parseFloat(v),name:rows[i].name,cost:parseFloat(cc)});
                    }
                }

                if(!myChart[oi])myChart[oi] = echarts.init(get('viewchats'+oi+'_{rand}'));
                var option = {
                    title: {
                        text: '',
                        left: 'center'
                    },
                    tooltip : {
                        trigger: 'item',
                        formatter: "{b} : {c}元 ({d}%)"
                    },
                    series: [{
                        name: '金额',
                        type: tlx,
                        data: data
                    }]
                };
                if(tlx!='pie'){
                    option.xAxis={data: xAxis};
                    option.yAxis={type : 'value'};
                }
                myChart[oi].setOption(option);
            },
            dbclick:function(oi,tlx){
                var d=darr[0].changedata;
 /*               var url = js.getajaxurl('getSingleDetailNote','mode_rent|input','flow',{'modeid':'rent'});
                var startdt = document.getElementById('dt1_{rand}').value;
                var enddt = document.getElementById('dt2_{rand}').value;

                js.ajax(url, {rentid:d.id, startdt: startdt, enddt:enddt}, function (a) {
                    if (a.length == 0)
                        alert("没有数据，请重新选择日期后查询！");
                    else { //构建展示页面
                    }
                },'get,json');*/
                var url = 'task.php?a=rent&num='+modenum+'&mid='+d.id+'&startdt='+get('dt1_{rand}').value+'&enddt='+get('dt2_{rand}').value;
                if(modenum.indexOf('?')>-1){url=modenum+'&callback='+'opegs{rand}'+'';}else{url+='&callback='+'opegs{rand}'+'';}
                js.winiframe(modename,url);
            },
            search:function(){
                var cnas = {
                    'soufields_checkdt_start':get('dt1_{rand}').value,
                    'soufields_checkdt_end':get('dt2_{rand}').value,
                };
                darr[0].setparams(cnas, true);
            }
        };

        darr[0] = $('#view0_{rand}').bootstable(c.getparams(0,'a.`custname`','客户名称','pie'));

        js.initbtn(c);
    });

    //导出汇总报表
    function exportDetail(){
        var url = js.getajaxurl('getRentDetail','mode_rent|input','flow',{'modeid':'rent'});
        var startdt = document.getElementById('dt1_{rand}').value;
        var enddt = document.getElementById('dt2_{rand}').value;

        js.ajax(url, {startdt: startdt, enddt:enddt}, function (a){
            if(a.length==0)
                alert("没有数据，请重新选择日期后查询！");
            else{
                //列标题，逗号隔开，每一个逗号就是隔开一个单元格
                var str = 'id,客户名称,部门,品牌,型号,基本月租,rentdetail表的id,超量金额,抄表日期,当月成本\n';
                //增加\t为了不让表格显示科学计数法或者其他格式
                for(var item in a){
                    str += a[item].id + '\t,' + a[item].name + '\t,' + a[item].dept + '\t,' + a[item].brand + '\t,' + a[item].model + '\t,' +
                         a[item].rental + '\t,' + a[item].detailID + '\t,'  + a[item].exceedingmoney + '\t,' + a[item].checkdt + '\t,' + a[item].costTotal + '\t\n';
                }
                //encodeURIComponent解决中文乱码
                var uri = 'data:text/csv;charset=utf-8,\ufeff' + encodeURIComponent(str);
                //通过创建a标签实现
                var link = document.createElement("a");
                link.href = uri;
                //对下载的文件命名
                link.download =  "租机报表汇总.csv";
                document.body.appendChild(link);
                link.click();
                document.body.removeChild(link);
            }
        },'get,json');
    }

    // 导出租机对账单详细信息
    function exportDebitNote() {
        var url = js.getajaxurl('getDebitNote','mode_rent|input','flow',{'modeid':'rent'});
        var startdt = document.getElementById('dt1_{rand}').value;
        var enddt = document.getElementById('dt2_{rand}').value;

        js.ajax(url, {startdt: startdt, enddt:enddt}, function (a){
            if(a.length==0)
                alert("没有数据，请重新选择日期后查询！");
            else{
                var filename = "租机报表明细.xlsx"; //文件名称
                var ws_name = "汇总表"; //Excel第一个sheet的名称
                var wb = XLSX.utils.book_new(), ws = XLSX.utils.json_to_sheet(a);
                XLSX.utils.book_append_sheet(wb, ws, ws_name);  //将数据添加到工作薄

                var cusname='', excelList=[];
                for(var key in a){//遍历json数组时，这么写key为索引
                    if(cusname=='') {
                        wb = XLSX.utils.book_new();
                        cusname = a[key].客户名称;
                        excelList=[['东莞市星河办公设备有限公司',null,null,null,null,null,null,null,null,null],
                            ['对账单',null,null,null,null,null,null,null,null,null], ['客户名称：'+cusname,null,null,null,null,null,null,null,null,null],
                            ['日期', '部门', '产品名称', '单位', '数量', '单价', '含税金额', '不含税金额', '不含税合计金额', '备注']];
                        ws['!merges'] = [
                            // 设置A1-J1的单元格合并
                            {s: {r: 0, c: 0}, e: {r: 0, c: 9}},
                            {s: {r: 1, c: 0}, e: {r: 1, c: 9}},
                            {s: {r: 2, c: 0}, e: {r: 2, c: 9}}
                        ];
                    }
                    else if(cusname != a[key].客户名称){
                        // 先导出已有数据
                        ws = XLSX.utils.aoa_to_sheet(excelList); //Excel第一个sheet的名称
                        XLSX.utils.book_append_sheet(wb, ws, cusname);
                        // 然后重新写入数据
                        cusname = a[key].客户名称;
                        excelList=[['东莞市星河办公设备有限公司',null,null,null,null,null,null,null,null,null],
                            ['对账单',null,null,null,null,null,null,null,null,null], ['客户名称：'+cusname,null,null,null,null,null,null,null,null,null],
                            ['日期', '部门', '产品名称', '单位', '数量', '单价', '含税金额', '不含税金额', '不含税合计金额', '备注']];
                        ws["A1"].s = { font: { sz: 24, bold: true},alignment:{vertical:'center',horizontal:'center'}};
                        ws['!merges'] = [
                            // 设置A1-J1、A2-J2、A3-J3的单元格合并，s-开始，r-行，c-列，e-结束，参考：https://www.cnblogs.com/liuxianan/p/js-excel.html
                            {s: {r: 0, c: 0}, e: {r: 0, c: 9}},
                            {s: {r: 1, c: 0}, e: {r: 1, c: 9}},
                            {s: {r: 2, c: 0}, e: {r: 2, c: 9}}
                        ];
                    }
                    excelList.push([a[key].抄表日期, a[key].部门, '复印机租金', '台', '1', a[key].月租金, a[key].月租金]);
                    if(a[key].黑色超量数 != 0) {
                        var priceb = a[key].黑色超量数 * a[key].黑色单价;
                        excelList.push(['', '', '黑色超出张数', '张', a[key].黑色超量数, a[key].黑色单价, priceb]);
                    }
                    if(a[key].彩色超量数 != 0) {
                        var pricec = a[key].彩色超量数 * a[key].彩色单价;
                        excelList.push(['', '', '彩色超出张数', '张', a[key].彩色超量数, a[key].彩色单价, pricec]);
                    }
                }

                XLSX.writeFile(wb, filename); //导出Excel
            }
        },'get,json');
    }

    // 导出明细报表
    function exporModelNote() {
        var url = js.getajaxurl('getModelNote','mode_rent|input','flow',{'modeid':'rent'});
        var startdt = document.getElementById('dt1_{rand}').value;
        var enddt = document.getElementById('dt2_{rand}').value;

        js.ajax(url, {startdt: startdt, enddt:enddt}, function (a){
            if(a.length==0)
                alert("没有数据，请重新选择日期后查询！");
            else{
                window.open(a.filename);
            }
        },'get,json');
    }

</script>

<div>
    <table width="100%">
        <tr>
            <td nowrap>日期&nbsp;</td>
            <td>
                <input onclick="js.datechange(this,'date')" style="width:110px" readonly class="form-control datesss" id="dt1_{rand}" >
            </td>
            <td>&nbsp;至&nbsp;</td>
            <td align="left">
                <input onclick="js.datechange(this,'date')" style="width:110px" readonly class="form-control datesss" id="dt2_{rand}" >
            </td>
            <td  style="padding-left:10px">
                <button class="btn btn-default" click="search" type="button">统计</button>
            </td>
            <td  style="padding-left:10px">
                <button class="btn btn-default" onclick="javascript:exportDetail()" type="button">导出汇总报表</button>
            </td>
            <td  style="padding-left:10px">
                <button class="btn btn-default" onclick="javascript:exporModelNote()" type="button">导出明细报表</button>
            </td>
            <td width="90%">

            </td>
            <td align="right" nowrap>

            </td>
        </tr>
    </table>

</div>
<div class="blank10"></div>
<div align="left">
    <table  border="0" width="100%" cellspacing="0" cellpadding="0">
        <tr valign="top">

            <td width="50%">
                <div align="left" style="min-width:300px" class="list-group">
                    <div class="list-group-item  list-group-item-info">
                        <i class="icon-bar-chart"></i> 根据客户统计
                        <span style="float:right" ><a click="reload,0"><i class="icon-refresh"></i></a></span>
                        <span style="float: right;"><a href="javascript:void(0);" onclick="exportRentExcel(get('dt1_{rand}').value,get('dt2_{rand}').value)">导出报表</a>&nbsp;&nbsp;&nbsp;&nbsp;</span>
                    </div>
                    <div id="view0_{rand}"></div>
                    <div id="viewchats0_{rand}" style="width:100%;height:250px;border:1px #dddddd solid;border-top:0px"></div>
                </div>

            </td>
        </tr>
    </table>
</div>