function initbodys(){
	$(form('custid')).change(function(){
		var val = this.value,txt='';
		if(val!=''){
			txt = this.options[this.selectedIndex].text;
		}
		form('custname').value=txt;
		form('saleid').value = '';
	});
	
	$(form('saleid')).change(function(){
		salechange(this.value);
	});

    $(form('money')).click(function(){
        countMoney();
    });
    $("[name^='money0_']").click(function(){
    	countMoney();
	})
}

/*
 计算合计金额，并进行动态更新。
 */
function countMoney(){
    var d=c.getsubdata(0);
    var to=0,i,len=d.length;
    for(i=0;i<len;i++){
        if(d[i].name!=''){
            d[i].money = d[i].price * d[i].num;
            form('money0_'+i).value=d[i].money+'';
            to=to+parseFloat(d[i].money);
        }
    }
}

function salechange(v){
	if(v==''){
		form('custid').value='';
		return;
	}
	js.ajax(geturlact('salechange'),{saleid:v},function(a){
		form('custid').value=a.custid;
		form('custname').value=a.custname;
		form('money').value=a.money;
	},'get,json');
}