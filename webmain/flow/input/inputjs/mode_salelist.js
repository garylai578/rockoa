//流程模块【salelist.销售单】下录入页面自定义js页面,初始函数
function initbodys(){
    $.getScript('js/rmb.js');
    form('applydt').readOnly=true;
    form('moneys').readOnly=true;
    form('moneyscn').readOnly=true;
    $(form('moneys')).click(function(){
        cchangtongss();
    });
    $(form('moneyscn')).click(function(){
        cchangtongss();
    });
    addchengesss();

    // 获取上次一次填写的资料，初始化录入界面
/*    if(mid=='0'){
        js.ajax(geturlact('getlast'),{},function(d){
            if(d){
                form('company').value=d.company;
                form('cusname').value=d.cusname;
                form('dept').value=d.dept;
            }
        },'get,json');
    }*/
}

function addchengesss(){
    if(isedit==0)return;
    $("[name^='sdt0_']").unbind('change').change(function(){
        cchangtongss();
    });
    $("[name^='product0_']").unbind('change').change(function(){
        cchangtongss();
    });
    $("[name^='money0_']").unbind('change').change(function(){
        cchangtongss();
    });
    $("[name^='costmoney0_']").unbind('change').change(function(){
        cchangtongss();
    });
}

function changesubmit(){
    var jg = parseFloat(form('moneys').value);
    if(jg<=0)return '销售金额不能小于0';
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

/*
 计算合计金额，并进行动态更新。
 */
function cchangtongss(){
    var d=c.getsubdata(0);
    var to=0,i,len=d.length;
    for(i=0;i<len;i++){
        if(d[i].product!=''){
            d[i].money = d[i].price * d[i].num;
            form('money0_'+i).value=d[i].money+'';
            to=to+parseFloat(d[i].money);
        }
        if(d[i].costprice!=""){
            d[i].costmoney = d[i].costprice * d[i].costnum;
            form("costmoney0_"+i).value=d[i].costmoney+'';
        }
    }
    form('moneys').value=js.float(to)+'';
    form('moneyscn').value=AmountInWords(to)
}