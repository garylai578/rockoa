//流程模块【rent.租机登记】下录入页面自定义js页面,初始函数
function initbodys(){
    $.getScript('js/rmb.js');
    form('totalmoney').readOnly=true;
    $(form('totalmoney')).click(function(){
        cchangtongss();
    });
    addchengesss();

    form('totalcost').readOnly=true;
    $(form('totalcost')).click(function(){
        cchangcost();
    });
}

function addchengesss(){
    if(isedit==0)return;
    $("[name^='exceedingnum0_']").unbind('change').change(function(){
        cchangtongss();
    });
    $("[name^='exceedingnumc0_']").unbind('change').change(function(){
        cchangtongss();
    });
    $("[name^='exceedingmoney0_']").unbind('change').change(function(){
        cchangtongss();
    });
}

/*
 计算超出数，并进行动态更新。
 */
function cchangtongss(){
    var d=c.getsubdata(0);
    var i,len=d.length;
    var moneys=0;
    for(i=0;i<len;i++){
        if(i == 0){
            d[i].lastnum = form('lastnum0_'+i).value = form('exceedingb').value;
            d[i].lastnumc = form('lastnumc0_'+i).value = form('exceedingc').value;
        }else{
            form('lastnum0_'+i).value = d[i-1].thisnum;
            form('lastnumc0_'+i).value = d[i-1].thisnumc;
        }

        if(d[i].checkdt!=''){
            var useNum = d[i].thisnum - d[i].lastnum;
            d[i].exceedingnum = useNum - form('basenumb').value;
            if(d[i].exceedingnum < 0)
                d[i].exceedingnum = 0;
            form('exceedingnum0_'+i).value=d[i].exceedingnum+'';

            useNum = d[i].thisnumc - d[i].lastnumc;
            d[i].exceedingnumc = useNum - form('basenumc').value;
            if(d[i].exceedingnumc < 0)
                d[i].exceedingnumc = 0;
            form('exceedingnumc0_'+i).value=d[i].exceedingnumc+'';

            d[i].exceedingmoney = d[i].exceedingnum * form('priceb').value + d[i].exceedingnumc * form('pricec').value;
            form('exceedingmoney0_'+i).value=d[i].exceedingmoney+'';

            var remainder = js.float(d[i].exceedingmoney + parseFloat(form('rental').value));
            form('remainder0_'+i).value = remainder;
            moneys =  Number(moneys) + Number(remainder);
        }
        form('totalmoney').value = moneys;
    }
}

function cchangcost() {
    var d=c.getsubdata(1);
    var i,len=d.length;
    var moneys=0;
    for(i=0;i<len;i++){
        moneys=moneys+parseFloat(d[i].total);
    }
    form('totalcost').value=js.float(moneys)+'';
}

function changesubmit(){
}
function changesubmitbefore(){
    cchangtongss();
    cchangcost();
}
function eventaddsubrows(){
    cchangtongss();
    addchengesss();
    cchangcost();
}
function eventdelsubrows(){
    cchangtongss();
    cchangcost();
}

function getRentDetail(mid){
    var detail="";
    js.ajax(geturlact("getRentRemind"), {mid:mid}, function (a){
        detail = a;
    },'get,json',"", "", false);
    return detail;
}

/**
 * 租机报表页面，或者单个公司的详细账单信息
 * @param mid
 * @param startdt
 * @param enddt
 * @returns {string}
 */
function getRentDetail2(mid,startdt, enddt) {
    //根据mid获取对账单的相关信息
    var detail="";
    js.ajax(geturlact("getSingleDetailNote"), {rentid:mid,startdt:startdt,enddt:enddt}, function (a){
        detail = a;
    },'get,json',"", "", false);
    return detail;
}

/**
 * 租机报表页面，或者单个公司的详细成本信息
 * @param mid 客户id
 * @param startdt 开始时间
 * @param enddt 结束时间
 */
function getCostDetail(mid, startdt, enddt) {
    //根据mid获取成本的相关信息
    var detail="";
    js.ajax(geturlact("getCostDetailNote"), {rentid:mid,startdt:startdt,enddt:enddt}, function (a){
        detail = a;
    },'get,json',"", "", false);
    return detail;
}

/**
 * 在租机报表中，将详细列表导出为excel
 * @param dt1 开始日期
 * @param dt2 结束日期
 */
function exportRentExcel(dt1, dt2) {
    var url = js.getajaxurl('getDetail','mode_rent|input','flow'); // 调用mode_rentAction.php中的getDetailAjax()方法
    js.ajax(url,{dt1:dt1,dt2:dt2},function(a){
        var str = 'id,客户名称,金额,成本,比例\n';
        //增加\t为了不让表格显示科学计数法或者其他格式
        for(var i = 0 ; i < a.length ; i++ ){
            for(var item in a[i]){
                if(a[i][item]==null)
                    a[i][item]="";
                str+= a[i][item] + '\t ,';
            }
            str+='\n';
        }
        //encodeURIComponent解决中文乱码
        var uri = 'data:text/csv;charset=utf-8,\ufeff' + encodeURIComponent(str);
        //通过创建a标签实现
        var link = document.createElement("a");
        link.href = uri;
        //对下载的文件命名
        link.download =  "租机报表明细.csv";
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
    },'get,json');
    // alert(dt1+'--'+dt2);
}