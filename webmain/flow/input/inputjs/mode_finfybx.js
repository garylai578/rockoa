function initbodys(){
	$.getScript('js/rmb.js');
	form('applydt').readOnly=true;
	form('money').readOnly=true;
	form('moneycn').readOnly=true;
	$(form('money')).click(function(){
		cchangtongss();
	});
	$(form('moneycn')).click(function(){
		cchangtongss();
	});
	addchengesss();

	// 获取上次一次填写的资料，初始化录入界面
	if(mid=='0'){
		js.ajax(geturlact('getlast'),{},function(d){
			if(d){
				form('paytype').value=d.paytype;
				form('cardid').value=d.cardid;
				form('openbank').value=d.openbank;
				form('fullname').value=d.fullname;
			}
		},'get,json');
	}
}
function addchengesss(){
	if(isedit==0)return;
	$("[name^='sdt0_']").unbind('change').change(function(){
		cchangtongss();
	});
	$("[name^='name0_']").unbind('change').change(function(){
		cchangtongss();
	});
	$("[name^='money0_']").unbind('change').change(function(){
		cchangtongss();
	});
}
function changesubmit(){
	var jg = parseFloat(form('money').value);
	if(jg<=0)return '报销金额不能小于0';
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
		if(d[i].name!=''){
			d[i].money = d[i].price * d[i].num;
			form('money0_'+i).value=d[i].money+'';
			to=to+parseFloat(d[i].money);
		}
	}
	form('money').value=js.float(to)+'';
	form('moneycn').value=AmountInWords(to);

	//当付款方式选择“银行转账”时，需要填写相关信息
	if(form('paytype').value == "银行转账"){
		if(form("cardid").value == "")
			alert("收款账户不能为空");
	    else if(form("openbank").value =="")
            alert("开户行不能为空");
		else if(form("fullname").value == "")
			alert("收款人全称不能为空");
	}
}