//流程模块【quote.报价单】下录入页面自定义js页面,初始函数
var Companyid ;
var Custid ;
var From = new Array(3);
var To = new Array(3);

function initbodys(){
    $.getScript('js/rmb.js');
    form('moneys').readOnly=true;
    form('moneyscn').readOnly=true;
    $(form('moneys')).click(function(){
        cchangtongss();
    });
    $(form('moneyscn')).click(function(){
        cchangtongss();
    });

    // $(form('company')).unbind('change').change(selectContacts());
    // $(form('company'))[0].addEventListener("change", selectContacts); //不知道为什么，这个语句不起作用，所以把这个动作绑定在listid上（权宜之计）
    $(form('listid'))[0].addEventListener("change", selectCC);

    $(form('from'))[0].addEventListener("change", function () {
        var index = form('from').selectedIndex;
        var tel = From[index-1];
        form('fromtel').value = tel;
    });

    $(form('receiver'))[0].addEventListener("change", function () {
        var index = form('receiver').selectedIndex;
        var tel = To[index-1];
        form('receviertel').value = tel;
    });

    addchengesss();

    //如果是编辑已有信息，则需要初始化收件人和发件人
    Companyid = form('companyid').value;
    Custid = form('custid').value;
    if(Custid || Companyid){
        receiverName = form('receiver').value;
        fromName = form('from').value;
        js.ajax(geturlact('selectC'), {companyid:Companyid, customerid:Custid}, function(a){
            if(a){
                setFromOptions(a);
                setToOPtions(a);
            }
        },'get,json',"", "", false);  //false表示要等ajax执行完成后再执行下面的代码，否则逻辑有问题。

        setSelected("from", fromName);
        setSelected("receiver", receiverName)
    }
}

/**
 * 根据selName设置选项为默认选中
 * @param tagName  select标签的名称
 * @param selName  选中的选项名称
 */
function setSelected(tagName, selName) {
    var ops = form(tagName).options;
    for(var i = 1; i < ops.length; i++) {
        var tmp = ops[i].value;
        if (tmp == selName) {
            ops[i].selected = true;
            break;
        }
    }
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
}

function changesubmit(){
    var jg = parseFloat(form('moneys').value);
    if(jg<=0)return '报价金额不能小于0';
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
        if(d[i].product!='' && (typeof(form('money0_'+i))!="undefined")){
            d[i].money = d[i].price * d[i].num;
            form('money0_'+i).value=d[i].money+'';
            to=to+parseFloat(d[i].money);
        }
    }
    form('moneys').value=js.float(to)+'';
    form('moneyscn').value=AmountInWords(to)
}

//根据选择的客户和公司动态更新联系人
function selectCC(){
    var company = form('companyid').value;
    var customer = form('custid').value;
    if((company != '' && company != Companyid) || (customer != '' && customer != Custid)){
        js.ajax(geturlact('selectC'), {companyid:company, customerid:customer}, function(a){
            if(a){
                if(company != '' && company != Companyid){
                    setFromOptions(a);
                    Companyid = company;
                }
                if(customer != '' && customer != Custid){
                    setToOPtions(a);
                    Custid = customer;
                }
            }
        },'get,json', "", "", false);
    }
}

/**
 * 设置发件人的select选项
 * @param a ajax返回的json数据
 */
function setFromOptions(a){
    form('from').options.length=1;
    newopt = document.createElement("option");
    newopt.value = newopt.text = a.contacts1;
    From[0] = a.tel1;
    form('from').options.add(newopt, 1);

    newopt2 = document.createElement("option");
    newopt2.value = newopt2.text = a.contacts2;
    From[1] = a.tel2;
    form('from').options.add(newopt2, 2);

    newopt3 = document.createElement("option");
    newopt3.value =newopt3.text = a.contacts3;
    From[2] = a.tel3;
    form('from').options.add(newopt3, 3);
}

/**
 * 设置收件人的select选项
 * @param a ajax返回的json数据
 */
function setToOPtions(a) {
    form('receiver').options.length=1;
    len = a.custnums;
    for(j=0; j<len; ++j) {
        newopt = document.createElement("option");
        newopt.value = newopt.text = a[j].contact;
        To[j] = a[j].tel;
        form('receiver').options.add(newopt, 1);
    }
}

function selectContacts(){
    var cid = form('companyid').value;
    if(cid != "" && cid != Companyid){
        js.ajax(geturlact('selectfrom'),{companyid:cid},function(a){
            if(a){
                form('from').options.length=1;
                newopt = document.createElement("option");
                newopt.text = a.contacts1;
                newopt.value = a.tel;
                form('from').options.add(newopt, 1);

                newopt2 = document.createElement("option");
                newopt2.text = a.contacts2;
                newopt2.value = a.tel2;
                form('from').options.add(newopt2, 2);

                newopt3 = document.createElement("option");
                newopt3.text = a.contacts3;
                newopt3.value = a.tel3;
                form('from').options.add(newopt3, 3);
            }
        },'get,json');
        Companyid = cid;
    }
}

function selectCustomers(){
    var cid = form('custid').value;
    if(cid != "" && cid != Custid){
        js.ajax(geturlact('selectto'),{custid:cid},function(a){
            if(a){
                form('receiver').options.length=1;
                newopt = document.createElement("option");
                newopt.text = a.linkname;
                newopt.value = a.tel;
                form('receiver').options.add(newopt, 1);

                newopt2 = document.createElement("option");
                newopt2.text = a.linkname2;
                newopt2.value = a.tel2;
                form('receiver').options.add(newopt2, 2);

                newopt3 = document.createElement("option");
                newopt3.text = a.linkname3;
                newopt3.value = a.tel3;
                form('receiver').options.add(newopt3, 3);
            }
        },'get,json');
        Custid = cid;
    }
}