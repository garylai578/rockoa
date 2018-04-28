<?php if(!defined('HOST'))die('not access');?>
<script >
    $(document).ready(function(){
        {params}
        var atype=params.atype,month=js.now('Y-m');
        var a = $('#view_{rand}').bootstable({
            tablename:'saleproducts',params:{'atype':atype,'month':month},fanye:atype=='all',celleditor:true,//允许编辑单元格，在jquery-bootstable.js中定义
            modedir:'{mode}:{dir}',storebeforeaction:'salechartbefore',
            columns:[{
                text:'所属公司',dataIndex:'company'
            },{
                text:'日期',dataIndex:'date'
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
            },{
                text:'成本单价',dataIndex:'costprice'
            },{
                text:'成本数量',dataIndex:'costnum'
            },{
                text:'成本金额',dataIndex:'costmoney'
            },{
                text:'其他成本',dataIndex:'othercost'
            },{
                text:'总成本',dataIndex:'totalcost'
            },{
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
                var s=get('key_{rand}').value, startdt = get('start_{rand}').value, enddt = get('end_{rand}').value;
                a.setparams({key:s,'startdt':startdt,'enddt':enddt},true);
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
                <input class="form-control" style="width:200px" id="key_{rand}"   placeholder="部门/人员">
            </td>
            <td style="padding-left:10px">
                <button class="btn btn-default" click="search" type="button">搜索</button>
            </td>
            <td  width="90%" style="padding-left:10px">

            </td>
            <td align="right" nowrap>
                <button class="btn btn-default" id="xiang_{rand}" click="view" disabled type="button">详情</button> &nbsp;
                <button class="btn btn-default" click="daochu,1" type="button">导出</button>
            </td>
        </tr>
    </table>

</div>
<div class="blank10"></div>
<div id="view_{rand}"></div>
<div class="tishi">系统是以收付款单上是所属日期算对应月份统计的，当月已收金额是收款时间是当月的统计。</div>
