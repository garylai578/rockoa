function initbodys(){
	$(form('type')).change(function(){changestype(1)});
	changestype(0);
	get('btnchange_recename').onclick=function(){
		changeuserss(0);
	}
	get('btnchange_ccname').onclick=function(){
		changeuserss(1);
	}
}
var txlbool=false,txldata=[];
function changestype(lx){
	var val = form('type').value;
	if(lx==1){
		js.changeclear('changeccname');
		js.changeclear('changerecename');
	}
}
function changeuserss(lx){
	var val = form('type').value;
	if(val==1){
		var ss1 = 'receid',ss2='recename',tit='选择收信人';
		if(lx==1){
			var ss1 = 'ccid',ss2='ccname';
			tit='抄送给';
		}
		c.selectdata('getvcard,'+ss1+'', true, ss2, tit);
		return;
	}
	if(lx==0){
		js.changeuser('changerecename','changedeptusercheck');
	}else{
		js.changeuser('changeccname','changeusercheck');
	}
}