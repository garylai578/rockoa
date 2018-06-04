//流程模块【checkbill.对账单报表】下录入页面自定义js页面,初始函数
function initbodys(){
}

function getcheckbillDetail() {
    //根据mid获取对账单的相关信息
    var url = js.getajaxurl('getCheckbillDetail','customer','main');
    var detail="";
    js.ajax(url, {mid:mid}, function (a){
        detail = a;
    },'get,json',"", "", false);
    return detail;
}