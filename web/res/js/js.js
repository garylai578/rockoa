var PROJECT='',HOST='',token='',adminid=0,nwjsgui=false,adminface='images/noface.png',QOM='xinhu_',device='',DEBUG=false;
var windows	= null;
apiurl		= 'http://127.0.0.1/app/xinhu/';
function initbody(){}
function bodyunload(){}
$(document).ready(function(){
	try{if(typeof(nw)=='object'){nwjsgui = nw;}else{nwjsgui = require('nw.gui');}}catch(e){nwjsgui=false;}
	document.oncontextmenu=new Function("return false");
	adminid		= js.getoption('adminid');
	device		= js.getoption('device');
	if(device==''){
		device  = js.now('time')+'';
		js.setoption('device', device);
	}
	token		= js.getoption('admintoken');
	var lurl 	= location.href;
	HOST	 	= lurl.substr(lurl,lurl.lastIndexOf('/')+1);
	if(lurl.substr(0,4)=='http'){
		var sass = lurl.split('web/');
		apiurl=sass[0];
	}else if(nwjsgui){
		apiurl='http://demo.xh829.com/';
	}	
	apiurl 		= js.getoption('apiurl', apiurl);
	js.splittime= parseFloat(js.getoption('splittime','0'));
	$(window).unload(function(){
		bodyunload();
		js.onunload();
	});
	try{
		var winobj = js.request('winobj');
		if(nwjsgui)window.focus=function(){nwjsgui.Window.get().focus()}
		if(winobj!='')opener.js.openarr[winobj]=window;
	}catch(e){}
	if(lurl.indexOf('127.0.0')>0)DEBUG=true;
	initbody();
});
var js={path:'index',url:'',bool:false,login:{},initdata:{},scroll:function(){}};
var isIE=true;
if(!document.all)isIE=false;
var get=function(id){return document.getElementById(id)};
var isempt=function(an){var ob	= false;if(an==''||an==null||typeof(an)=='undefined'){ob=true;}return ob;}
var strreplace=function(str){if(isempt(str))return '';return str.replace(/[ ]/gi,'').replace(/\s/gi,'')}
var strhtml=function(str){if(isempt(str))return '';return str.replace(/\</gi,'&lt;').replace(/\>/gi,'&gt;')}
var form=function(an,fna){if(!fna)fna='myform';return document[fna][an]}
var xy10=function(s){var s1=''+s+'';if(s1.length<2)s1='0'+s+'';return s1;};
js.getarr=function(caa,bo){
	var s='';
	for(var a in caa)s+=' @@ '+a+'=>'+caa[a]+'';
	if(!bo)alert(s);
	return s;
}
js.getarropen=function(caa){
	jsopenararass = caa;
	js.open('js/array.shtml');
}
js.str=function(o){
	o.value	= strreplace(o.value);
}
function winHb(){
	var winH=(!isIE)?window.innerHeight:document.documentElement.offsetHeight;
	return winH;
}
function winWb(){
	var winH=(!isIE)?window.innerWidth:document.documentElement.offsetWidth;
	return winH;
}
js.scrolla	= function(){
	var top	= $(document).scrollTop();
	js.scroll(top);
}
js.request=function(name,dev,url){
	if(!dev)dev='';
	if(!name)return dev;
	if(!url)url=location.href;
	if(url.indexOf('\?')<0)return dev;
	neurl=url.split('\?')[1];
	neurl=neurl.split('&');
	var value=dev;
	for(i=0;i<neurl.length;i++){
		val=neurl[i].split('=');
		if(val[0].toLowerCase()==name.toLowerCase()){
			value=val[1];
			break;
		}
	}
	if(!value)value='';
	return value;
}
js.now=function(type,sj){
	if(!type)type='Y-m-d';
	if(type=='now')type='Y-m-d H:i:s';
	var dt,ymd,his,weekArr,Y,m,d,w,H=0,i=0,s=0,W;
	if(typeof(sj)=='string')sj=sj.replace(/\//gi,'-');
	if(/^[0-9]{4}-[0-9]{1,2}-[0-9]{1,2}/.test(sj)){
		sj=sj.split(' ');
		ymd=sj[0];
		his=sj[1];if(!his)his='00:00:00';
		ymd=ymd.split('-');
		his=his.split(':');
		H = his[0];if(his.length>1)i = his[1];if(his.length>2)s = his[2];
		dt=new Date(ymd[0],ymd[1]-1,ymd[2],H,i,s);
	}else{
		dt=(typeof(sj)=='number')?new Date(sj):new Date();
	}
	weekArr=new Array('日','一','二','三','四','五','六');
	Y=dt.getFullYear();
	m=xy10(dt.getMonth()+1);
	d=xy10(dt.getDate());
	w=dt.getDay();
	H=xy10(dt.getHours());
	i=xy10(dt.getMinutes());
	s=xy10(dt.getSeconds());
	W=weekArr[w];
	if(type=='time'){
		return dt.getTime();
	}else{
		return type.replace('Y',Y).replace('m',m).replace('d',d).replace('H',H).replace('i',i).replace('s',s).replace('w',w).replace('W',W);
	}
}
js.float=function(num,w){
	if(isNaN(num)||num==''||!num||num==null)num='0';
	num=parseFloat(num);
	if(!w&&w!=0)w=2;
	var m=num.toFixed(w);
	return m;	
}
js.splittime=0;
js.getsplit=function(){
	if(!js.servernow)return false;
	var dt=js.now('Y-m-d H:i:s');
	var d1=js.now('time',dt);	
	var d2=js.now('time',js.servernow);
	js.splittime=d1-d2;
}
js.serverdt=function(atype){
	if(!atype)atype='Y-m-d H:i:s';
	var d1=js.now('time')-js.splittime;
	var dt=js.now(atype,d1);
	return dt;
}
js.openarr={};
js.open=function(url,w,h,wina,can,wjcan){
	if(wina){try{var owina	= this.openarr[wina];owina.document.body;owina.focus();return owina;}catch(e){}}
	var ja=(url.indexOf('?')>=0)?'&':'?';
	if(!w)w=600;if(!h)h=500;
	var l=(screen.width-w)*0.5,t=(screen.height-h)*0.5-30;
	var rnd = parseInt(Math.random()*50);
	if(rnd%2==0){l=l+rnd;t=t-rnd;}else{l=l-rnd;t=t+rnd;}
	if(!can)can={};
	var s='resizable=yes,scrollbars=yes,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no';
	var a1={'left':''+l+'px','top':''+t+'px','width':''+w+'px','height':''+h+'px'};
	a1 = js.apply(a1,can);
	for(var o1 in a1)s+=','+o1+'='+a1[o1]+'';
	if(nwjsgui){
		var ocsn=js.apply({'frame':true,width:w,height:h,x:l,y:t,icon:'images/logo.png'},wjcan);
		if(typeof(nw)=='undefined')ocsn.toolbar=false;
		var opar=nw.Window.open(url, ocsn);
	}else{
		var opar=window.open(url,'',s);
	}
	if(wina)this.openarr[wina]=opar;
	return false;
}
js.onunload=function(){
	var a=js.openarr;
	for(var b in a){
		try{a[b].close()}catch(e){}
	}
	try{
		var winobj = js.request('winobj');
		if(winobj!='')opener.js.openarr[winobj]=false;
	}catch(e){}
}
js.decode=function(str){
	var arr	= {length:-1};
	try{
		arr	= new Function('return '+str+'')();
	}catch(e){}
	return arr;
}
js.move=function(id,event){
	var _left=0,_top=0;
	var obj	= id;
	if(typeof(id)=='string')obj=get(id);
	var _Down=function(evt){
		try{
			var s='<div id="divmovetemp" style="filter:Alpha(Opacity=0);opacity:0;z-index:99999;width:100%;height:100%;position:absolute;background-color:#000000;left:0px;top:0px;cursor:move"></div>';
			$('body').prepend(s);
			evt=window.event||evt;
			_left=evt.clientX-parseInt(obj.style.left);
			_top=evt.clientY-parseInt(obj.style.top);
			document.onselectstart=function(){return false}
		}catch(e){}		
	}
	var _Move=function(evt){
		try{
			var c=get('divmovetemp').innerHTML;
			evt=window.event||evt;
			obj.style.left=evt.clientX-_left+'px';
			obj.style.top=evt.clientY-_top+'px';
		}catch(e){_Down(evt)}
	}
	var _Up=function(){
		document.onmousemove="";
		document.onselectstart=""
		$('#divmovetemp').remove();	
	}
	document.onmousemove=_Move
	document.onmouseup=_Up;
}
js.setdev=function(val,dev){
	var cv	= val;
	if(isempt(cv))cv=dev;
	return cv;
}
js.downshow=function(id){
	js.open(''+apiurl+'?a=down&id='+id+'',600,350);
	return false;
}
js.formatsize=function(size){
	var arr = new Array('Byte', 'KB', 'MB', 'GB', 'TB', 'PB');
	var e	= Math.floor(Math.log(size)/Math.log(1024));
	var fs	= size/Math.pow(1024,Math.floor(e));
	return js.float(fs)+' '+arr[e];
}
js.cookie=function(name){
	var str=document.cookie,cda,val='',arr,i;
	if(str.length<=0)return '';
	arr=str.split('; ');
	for(i=0;i<arr.length;i++){
		cda=arr[i].split('=');
		if(name.toLowerCase()==cda[0].toLowerCase()){
			val=cda[1];
			break;
		}
	}
	if(!val)val='';
	return val;
}
js.savecookie=function(name,value,d){
	var expires = new Date();
	if(!d)d=365;
	if(!value)d=-10;
	expires.setTime(expires.getTime()+d*24*60*60*1000);
	var str=''+name+'='+value+';expires='+expires.toGMTString()+';path=/';
	document.cookie = str;
}
js.backtop=function(ci){
	if(!ci)ci=0;
	$('body,html').animate({scrollTop:ci});
	return false;
}
js.backto = function(oid){
	if(!get(oid))return;
	var of	= $('#'+oid+'').offset();
	this.backtop(of.top);
	return false;
}
js.applyIf=function(a,b){
	if(!a)a={};
	if(!b)b={};
	for(var c in b)if(typeof(a[c])=='undefined')a[c]=b[c];
	return a;
}
js.apply=function(a,b){
	if(!a)a={};
	if(!b)b={};
	for(var c in b)a[c]=b[c];
	return a;
}
js.tanbodyindex = 90;
js.tanbody=function(act,title,w,h,can1){
	this.tanbodyindex++;
	var can	= js.applyIf(can1,{html:'',showfun:function(){},bodystyle:'',guanact:'',titlecls:'',btn:[]});
	var l=(winWb()-w-50)*0.5,t=(winHb()-h-50)*0.5;
	var s	= '';
	var mid	= ''+act+'_main';
	$('#'+mid+'').remove();
	var posta= 'fixed';
	if(js.path == 'admin')posta='absolute';
	s+='<div id="'+mid+'" style="position:'+posta+';background-color:#ffffff;left:'+l+'px;width:'+w+'px;top:'+t+'px;z-index:'+this.tanbodyindex+';box-shadow:0px 0px 10px rgba(0,0,0,0.3);">';
	s+='	<div class="title '+can.titlecls+'" style="-moz-user-select:none;-webkit-user-select:none;user-select:none;">';
	s+='		<table border="0"  width="100%" cellspacing="0" cellpadding="0"><tr>';
	s+='			<td height="34" style="font-size:14px; font-weight:bold;color:white; padding-left:8px" width="100%" onmousedown="js.move(\''+mid+'\')" id="'+act+'_title">'+title+'</td>';
	s+='			<td><div onmouseover="this.style.backgroundColor=\'#C64343\'" onmouseout="this.style.backgroundColor=\'\'" style="padding:0px 8px;height:40px;overflow:hidden;cursor:pointer;" onclick="js.tanclose(\''+act+'\',\''+can.guanact+'\')"><div id="'+act+'_spancancel" style="height:16px;overflow:hidden;width:16px;background:url(images/wclose.png);margin-top:12px"></div></div></td>';
	s+='		</tr></table>';
	s+='	</div>';
	s+='	<div id="'+act+'_body" style="'+can.bodystyle+'">';
	s+=can.html;
	s+='	</div>';
	s+='	<div id="'+act+'_bbar" style="padding:5px 10px;background:#eeeeee;line-height:30px" align="right"><span id="msgview_'+act+'"></span>&nbsp;';
	for(var i=0; i<can.btn.length; i++){
		var a	= can.btn[i];
		s+='<a class="webbtn" id="'+act+'_btn'+i+'" onclick="return false" >';
		s+=''+a.text+'</a>&nbsp; ';
	}
	s+='		<a class="webbtn" id="'+act+'_cancel" onclick="return js.tanclose(\''+act+'\',\''+can.guanact+'\')" >取消</a>';
	s+='	</div>';
	s+='</div>';
	js.xpbody(act,can.mode);
	$('body').prepend(s);
	if(can.closed=='none'){
		$('#'+act+'_cancel').remove();
		$('#'+act+'_spancancel').parent().remove();
	}
	if(can.bbar=='none')$('#'+act+'_bbar').remove();
	var lw = get(mid).offsetWidth;
	l=(winWb()-lw)*0.5;
	$('#'+mid+'').css('left',''+l+'px');
	can.showfun(act);
}
js.tanclose=function(act, guan){
	if(!isempt(guan)){
		var s= guan.split(',');
		for(var i=0;i<s.length;i++)$('#'+s[i]+'_main').remove();
	}
	var mid	= ''+act+'_main';
	var t	= parseInt(get(mid).style.top);
	$('#'+mid+'').animate({top:t+100,opacity:0},200,function(){$(this).remove();js.xpbody(act,'none');});
	return false;
}
js.xpbody=function(act,type){
	if(type=='none'){
		$("div[xpbody='"+act+"']").remove();
		return;
	}
	if(get('xpbg_bodydds'))return false;
	var bs='<div id="xpbg_bodydds" xpbody="'+act+'" oncontextmenu="return false" style="position:absolute;display:none;width:100%;height:100%;filter:Alpha(opacity=30);opacity:0.3;left:0px;top:0px;background-color:#000000;z-index:80"></div>';
	$('body').prepend(bs);	
	$('#xpbg_bodydds').fadeIn(300);
	return $('#xpbg_bodydds');
}
js.focusval	= '0';
js.number=function(obj){
	val=strreplace(obj.value);
	if(!val){
		obj.value=js.focusval;
		return false;
	}
	if(isNaN(val)){
		js.msg('msg','输入的不是数字');
		obj.value=js.focusval;
		obj.focus();
	}else{
		obj.value=val;
	}
}
js.setmsg=function(txt,col,ids){
	if(!ids)ids='msgview';
	$('#'+ids+'').html(js.getmsg(txt,col));
}
js.getmsg  = function(txt,col){
	if(!col)col='red';
	var s	= '';
	if(!txt)txt='';
	if(txt.indexOf('...')>0){
		s='<img src="images/loading.gif" height="16" width="16" align="absmiddle"> ';
		col = '#ff6600';
	}	
	s+='<span style="color:'+col+'">'+txt+'</span>';
	if(!txt)s='';
	return s;
}
js.msgtotal	= 0;
js.msgshow=function(lx,txt,sj){
	clearTimeout(this.msgshowtime);
	var lt	= document.documentElement.scrollTop;
	if(!sj)sj=5;
	var noi	= this.msgtotal;
	this.msgtotal++;
	var sid	= 'tishimsgeid_'+noi+'';
	$("div[id^='tishimsgeid_']").remove();
	var s='<div id="'+sid+'" onclick="$(this).remove()" class="alert alert_'+lx+'" style="left:'+(winWb()-100)*0.5+'px;line-height:24px;position:absolute;top:'+(lt-100)+'px;z-index:'+(noi+9999999)+'">'+txt+'</div>';
	$('body').append(s);
	if(sj>0)this.msgshowtime	= setTimeout("if(get('"+sid+"'))($('#"+sid+"').animate({'top':'"+(lt-100)+"px',opacity:0},function(){$(this).remove()}))",sj*1000);
	var no	= $('#'+sid+'');
	no.css('left',''+((winWb()-no.width()-5)*0.5)+'px');
	no.animate({top:''+(lt+3)+'px',opacity:1});
}
js.msg=function(lx,txt,sj){
	if(lx == 'none' || !lx){
		$("div[id^='tishimsgeid_']").remove();
		return;
	}
	if(lx == 'wait'){
		txt	= '<img src="images/loading.gif" height="16" width="16" align="absmiddle"> '+txt;
		sj	= 60;
	}
	js.msgshow(lx,txt,sj);
}
js.repempt=function(stt,v){
	var s = stt;
	if(isempt(s))s=v;
	return s;
}
js.getrand=function(){
	var r;
	r = ''+new Date().getTime()+'';
	r+='_'+parseInt(Math.random()*9999)+'';
	return r;
}
js._bodyclick = {};
js.downbody=function(o1, e){
	this.allparent = '';
	this.getparenta($(e.target),0);
	var a,s = this.allparent,a1;
	for(a in js._bodyclick){
		a1 = js._bodyclick[a];
		if(s.indexOf(a)<0){
			if(a1.type=='hide'){
				$('#'+a1.objid+'').hide();
			}else{
				$('#'+a1.objid+'').remove();
			}
		}
	}
	return true;
}
js.addbody = function(num, type,objid){
	js._bodyclick[num] = {type:type,objid:objid};
}
js.getparenta=function(o, oi){
	try{
	if(o[0].nodeName.toUpperCase()=='BODY')return;}catch(e){return;}
	var id = o.attr('id');
	if(!isempt(id)){
		this.allparent+=','+id;
	}
	this.getparenta(o.parent(), oi+1);
}
js.setoption=function(k,v){
	k=QOM+k;
	try{
		if(isempt(v)){
			localStorage.removeItem(k);
		}else{
			localStorage.setItem(k, v);
		}
	}catch(e){
		js.savecookie(k,v);
	}
	return true;
}
js.getoption=function(k,dev){
	var s = '';
	k=QOM+k;
	try{s = localStorage.getItem(k);}catch(e){s=js.cookie(k);}
	if(isempt(dev))dev='';
	if(isempt(s))s=dev;
	return s;
}
js.location = function(url){
	location.href = url;
}


js.apiurl = function(m,a,cans){
	var url=''+apiurl+'api.php/'+m+'/'+a+'?adminid='+adminid+'';
	var cfrom='reim';
	url+='&device='+device+'';
	url+='&cfrom='+cfrom+'';
	url+='&token='+token+'';
	if(!cans)cans={};
	for(var i in cans)url+='&'+i+'='+cans[i]+'';
	return url;
}
js.ajaxwurbo = false;
js.ajaxbool	 = false;
js.ajax 	 = function(m,a,d,funs, mod,checs, erfs){
	if(js.ajaxbool && !js.ajaxwurbo)return;
	clearTimeout(js.ajax_time);
	var url = js.apiurl(m,a);
	js.ajaxbool = true;
	if(!mod)mod='wait';
	if(typeof(erfs)!='function')erfs=function(){};
	if(typeof(funs)!='function')funs=function(){};
	if(!checs)checs=function(){};
	var bs = checs(d);
	if(typeof(bs)=='string'&&bs!=''){
		js.msg('msg', bs);
		return;
	}
	if(typeof(bs)=='object')d=js.apply(d,bs);
	if(d)for(var i in d)url+='&'+i+'='+d[i]+'';
	url+='&callback=?';
	var tsnr = '努力处理中...';
	if(mod=='wait')js.msg(mod, tsnr);
	$.getJSON(url,function(ret){
		try{modeltabs('none');}catch(e){}
		js.ajaxbool = false;
		clearTimeout(js.ajax_time);
		if(ret.code!=200){
			js.setmsg(ret.msg);	
			js.msg('msg', 'err1:'+ret.msg);
			erfs(ret.msg);
		}else{
			js.setmsg('');
			js.msg('none');
			funs(ret.data);
		}
	});
	js.ajax_time = setTimeout(function(){
		try{modeltabs('none');}catch(e){}
		if(js.ajaxbool){
			var str = 'Error:请求超时?';
			$('#listmenutishi').remove();
			js.setmsg(str);
			js.msg('msg',str);
			js.ajaxbool = false;
			erfs(str);
		}
	}, 1000*30);
}

js.initbtn = function(obj){
	var o = $("[click]"),i,o1,cl;
	for(i=0; i<o.length; i++){
		o1	= $(o[i]);
		cl	= o1.attr('clickadd');
		if(cl!='true'){
			o1.click(function(evt){
				var cls = $(this).attr('click');
				if(typeof(cls)=='string'){
					cls=cls.split(',');
					obj[cls[0]](this, cls[1], evt);
				}
				return false;
			});
		}
	}
	o.attr('clickadd','true');
}
js.isimg = function(lx){
	var ftype 	= '|png|jpg|bmp|gif|jpeg|';
	var bo		= false;
	if(ftype.indexOf('|'+lx+'|')>-1)bo=true;
	return bo;
}

js.setselectdata = function(o, data, vfs, devs){
	var i,ty = data,sv;
	if(!data)return;	
	if(!vfs)vfs='name';	
	if(typeof(devs)=='undefined')devs=-1;
	for(i=0;i<ty.length;i++){
		o.options.add(new Option(ty[i].name,ty[i][vfs]));
		if(i==devs)sv=ty[i][vfs];
	}
	if(sv)o.value=sv;
}
js.changeuser=function(lx, ots, ots1){
	var h = winHb()-70;
	if(!ots)ots='';
	if(!ots1)ots1='';
	if(h>400)h=400;
	js.tanbody('changeaction','请选择...',280,h,{
		html:'<div style="height:'+h+'px"><iframe src="" name="winiframe" width="100%" height="100%" frameborder="0"></iframe></div>',
		bbar:'none'
	});
	var url = 'dept.html?adminid&adminid='+adminid+'&token='+token+'&changetype='+lx+'&btype='+ots+'&params='+ots1+'';
	winiframe.location.href=url;
	return false;
}
js.changecancel=function(){
	js.tanclose('changeaction');
}
js.changeok=function(sna,sid, blx,plx){
	
}

js.debug	= function(s){
	if(!DEBUG)return;
	if(typeof(console)!='object')return;
	console.log(s);
}

js.confirm	= function(txt,fun, tcls){
	var h = '<div style="padding:20px;line-height:30px" align="center"><img src="images/helpbg.png" align="absmiddle">&nbsp; '+txt+'</div>';
	h+='<div style="padding:10px" align="center"><a id="confirm_btn1" style="padding:5px 10px"  class="webbtn" sattr="yes" href="javascript:;"><i class="icon-ok"></i>&nbsp;确定</a> &nbsp;  &nbsp; <a sattr="no" style="padding:5px 10px; background-color:#888888" class="webbtn" id="confirm_btn" href="javascript:;"><i class="icon-remove"></i>&nbsp;取消</a></div>';
	h+='<div class="blank10"></div>';
	if(!tcls)tcls='danger';
	js.tanbody('confirm', '<i class="icon-question-sign"></i>&nbsp;系统提示', 300, 200,{closed:'none',bbar:'none',html:h,titlecls:tcls});
	function backl(e){
		var jg	= $(this).attr('sattr');
		js.tanclose('confirm');
		if(typeof(fun)=='function')fun(jg,this);
		return false;
	}
	$('#confirm_btn1').click(backl);
	$('#confirm_btn').click(backl);
	get('confirm_btn').focus();
}
js.fileall=',aac,ace,ai,ain,amr,app,arj,asf,asp,aspx,av,avi,bin,bmp,cab,cad,cat,cdr,chm,com,css,cur,dat,db,dll,dmv,doc,docx,dot,dps,dpt,dwg,dxf,emf,eps,et,ett,exe,fla,ftp,gif,hlp,htm,html,icl,ico,img,inf,ini,iso,jpeg,jpg,js,m3u,max,mdb,mde,mht,mid,midi,mov,mp3,mp4,mpeg,mpg,msi,nrg,ocx,ogg,ogm,pdf,php,png,pot,ppt,pptx,psd,pub,qt,ra,ram,rar,rm,rmvb,rtf,swf,tar,tif,tiff,txt,url,vbs,vsd,vss,vst,wav,wave,wm,wma,wmd,wmf,wmv,wps,wpt,wz,xls,xlsx,xlt,xml,zip,';