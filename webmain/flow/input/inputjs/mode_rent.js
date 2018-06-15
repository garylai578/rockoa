//流程模块【rent.租机登记】下录入页面自定义js页面,初始函数
function initbodys(){
    $.getScript('js/rmb.js');
    form('totalmoney').readOnly=true;
    $(form('totalmoney')).click(function(){
        cchangtongss();
    });
    addchengesss();
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
            form('lastnum0_'+i).value = form('exceedingb').value;
            form('lastnumc0_'+i).value = form('exceedingc').value;
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

function changesubmit(){
}
function changesubmitbefore(){
    cchangtongss();
}
function eventaddsubrows(){
    cchangtongss();
    addchengesss();
}
function eventdelsubrows(){
    cchangtongss();
}

function getRentDetail(mid){
    var detail="";
    js.ajax(geturlact("getRentRemind"), {mid:mid}, function (a){
        detail = a;
    },'get,json',"", "", false);
    return detail;
}