function initbodys(){
	$(form('custid')).change(function(){
		var val = this.value,txt='';
		if(val!=''){
			txt = this.options[this.selectedIndex].text;
		}
		form('custname').value=txt;
		form('htid').value = '';
	});
	
	c.onselectdata['custname']=function(){
		form('htid').value = '';
	}
	
	$(form('htid')).change(function(){
		var val = this.value,txt='';
		salechange(val);
	});
}
function salechange(v){
	if(v==''){
		form('custid').value='';
		return;
	}
	js.ajax(geturlact('ractchange'),{ractid:v},function(a){
    form('custid').value=a.custid;
    form('custname').value=a.custname;
    form('money').value=a.money;
    form('type').value=a.type;
    form('htnum').value=a.num;
    form('dt').value=a.signdt;
},'get,json');  // 通过调试，发现geturlact('ractchage')返回的地址是：a=ractchange&m=mode_custfina|input&d=flow&ajaxbool=true&rnd=221203&ractid=8，a表示方法名，m表示模块，如果ajaxbool为true，那么调用的就是mode_custfinaAction中的ractchageAjax方法，ractid表示传递的参数，通过该方法对a进行了赋值。
}