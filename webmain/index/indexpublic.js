js.getuser = function(cans){
	var rand = js.getrand(),s='';
	var can = js.apply({windowid:'getuser_'+rand+'',title:'读取人员',idobj:false,nameobj:false,value:'',type:'deptusercheck',callback:function(){}}, cans);
	js.tanbody(can.windowid, can.title, 300, 400,{bbar:'none'});
	s+='<div style="height:350px;overflow:auto" id="view_'+rand+'"></div>';
	s+='<div style="padding:8px 10px;background:#eeeeee;line-height:30px" align="right">';
	s+='	<button type="button" class="btn btn-primary" id="ok_'+rand+'"><i class="icon-ok"></i>&nbsp;确定</button>';
	s+='&nbsp; <button type="button" onclick="js.tanclose(\''+can.windowid+'\');" class="btn btn-default" ><i class="icon-remove"></i>&nbsp;取消</button>';
	s+='</div>';
	$('#'+can.windowid+'_body').html(s);
	var ctype=can.type;
	var a = $('#view_'+rand+'').bootstree({
		storefields:'id,name',url:js.getajaxurl('deptuserdata','dept','system',{changetype:ctype}),
		params:{value:can.value},
		columns:[{
			text:'名称',dataIndex:'name',align:'left',xtype:'treecolumn',width:'99%'
		}]
	});
	$('#ok_'+rand+'').click(function(){
		var d = a.getchecked(),s1='',s2='',i,a1;
		for(i=0; i<d.length; i++){
			a1 = d[i];
			if(ctype=='dept'){
				if(a1.type=='d'){
					s1 = ','+a1.did;
					s2 = ','+a1.name;
				}
			}
			if(ctype=='deptcheck' || ctype=='checkdept'){
				if(a1.type=='d'){
					s1 += ','+a1.did;
					s2 += ','+a1.name;
				}
			}
			if(ctype=='user' || ctype=='deptuser'){
				if(a1.type=='u'){
					s1 = ','+a1.uid;
					s2 = ','+a1.name;
				}
			}
			if(ctype=='usercheck' || ctype=='checkuser'){
				if(a1.type=='u'){
					s1 += ','+a1.uid;
					s2 += ','+a1.name;
				}
			}
			if(ctype.indexOf('user')>-1 && ctype.indexOf('dept')>-1 && ctype.indexOf('check')>-1){
				s1 += ','+a1.id;
				s2 += ','+a1.name;
			}
		}
		if(s1!=''){
			s1 = s1.substr(1);
			s2 = s2.substr(1);
		}
		if(can.idobj)can.idobj.value = s1;
		if(can.nameobj){
			can.nameobj.value = s2;
			can.nameobj.focus();
		}	
		can.callback(d);
		js.tanclose(can.windowid);
	}).focus();
}

//读取客户
js.getcustomer = function(cans){
	var rand = js.getrand(),s='';
	var can = js.apply({windowid:'getcustomer_'+rand+'',gtype:'unit',keys:'',title:'读取客户',idobj:false,nameobj:false,value:'',callback:function(){}}, cans);
	js.tanbody(can.windowid, can.title, 700, 430,{btn:[{text:'确定',icons:'ok'}]});
	s+='<div style="padding:10px"><div class="input-group" style="width:300px"><input id="keys_'+rand+'" value="'+can.keys+'" class="form-control" placeholder="编号/名称"><span class="input-group-btn"><button class="btn btn-default" id="search_'+rand+'" type="button"><i class="icon-search"></i></button></span></div></div>';
	s+='<div style="padding-bottom:5px" id="view_'+rand+'"></div>';
	$('#'+can.windowid+'_body').html(s);
	var where = '';
	if(!isempt(can.keys)){
		where= "and `name` like '%"+can.keys+"%'";
	}
	var a = $('#view_'+rand+'').bootstable({
		tablename:'customer',fanye:true,where:where,height:250,
		url:js.getajaxurl('publicstore','guan','customer'),storebeforeaction:'readcustbefore',params:{gtype:can.gtype},
		columns:[{
			text:'名称',dataIndex:'name',sortable:true
		},{
			text:'编号',dataIndex:'num'	,sortable:true
		},{
			text:'等级',dataIndex:'grade',sortable:true
		},{
			text:'操作',dataIndex:'opt',renderer:function(v, d, oi){
				return '<a oi="'+oi+'" tempa="read_'+rand+'" href="javascript:">读取</a>';
			}
		}],
		load:function(){
			$("a[tempa='read_"+rand+"']").click(function(){
				var coi = parseInt($(this).attr('oi'));
				backfun(a.getData()[coi]);
			});
		}
	});
	
	var backfun = function(d){
		var s1='',s2 = '';
		if(d.id)s1=d.id;
		if(d.name)s2=d.name;
		if(can.idobj)can.idobj.value = s1;
		if(can.nameobj){
			can.nameobj.value = s2;
			can.nameobj.focus();
		}
		can.callback(d);
		js.tanclose(can.windowid);
	}
	
	$('#'+can.windowid+'_btn0').click(function(){
		backfun(a.changedata);
	}).focus();
	
	$('#search_'+rand+'').click(function(){
		var v = get('keys_'+rand+'').value;
		var s= '';
		if(v!='')s="and `name` like '%"+v+"%'";
		a.search(s);
	});
}
var statearr = '待执行,已完成,执行中'.split(',');
var statecolor = 'blue,green,#ff6600'.split(',');