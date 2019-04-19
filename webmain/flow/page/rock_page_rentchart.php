<?php
/**
 *	模块：rent.租机报表
 */
defined('HOST') or die ('not access');
?>
<script type="text/javascript" src="webmain/flow/input/inputjs/mode_finfybx.js"></script>
<script>
    $(document).ready(function(){
        var myChart = [],darr=[];
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
                        text:'比例',dataIndex:'bili'
                    }],
                    load:function(a){
                        c.loadcharts(this.xuhao,this.chatlx);
                    }
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
                        v = rows[i].value;if(v=='')v=0;
                        data.push({value:parseFloat(v),name:rows[i].name});
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
            search:function(){
                var cnas = {
                    'soufields_checkdt_start':get('dt1_{rand}').value,
                    'soufields_checkdt_end':get('dt2_{rand}').value,
                };
                darr[0].setparams(cnas, true);
                darr[1].setparams(cnas, true);
                darr[2].setparams(cnas, true);
                darr[3].setparams(cnas, true);
            }
        };

        darr[0] = $('#view0_{rand}').bootstable(c.getparams(0,'a.`custname`','客户名称','pie'));

        js.initbtn(c);
    });
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
                        <span style="float: right;"><a href="javascript:void(0);" onclick="exportExcel(get('dt1_{rand}').value,get('dt2_{rand}').value)">导出明细</a>&nbsp;&nbsp;&nbsp;&nbsp;</span>
                    </div>
                    <div id="view0_{rand}"></div>
                    <div id="viewchats0_{rand}" style="width:100%;height:250px;border:1px #dddddd solid;border-top:0px"></div>
                </div>

            </td>
        </tr>
    </table>
</div>