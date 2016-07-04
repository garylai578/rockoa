<?php 
include_once('../../config/config.php');
if($rock->adminid==0)exit('sorry not sign');
$title		= urldecode($rock->get('title'));
if($title=='')$title='文件上传';
$callback	= $rock->get('callback');
$savepath	= $rock->get('savepath');
$maxup		= (int)$rock->get('maxup','0');
$maxsize	= (int)$rock->get('maxsize','50');
$uptype		= $rock->get('uptype','*');
$upkey		= $rock->get('upkey');
$showid		= $rock->get('showid');
$thumbnail	= $rock->get('thumbnail');
$maxwidth	= $rock->get('maxwidth','0');
$thumbtype	= $rock->get('thumbtype','0');
?>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script language="javascript" src="../../js/jquery.js"></script>
<script language="javascript" src="../../js/js.js"></script>
<link rel="shortcut icon" href="../../favicon.ico" />
<title><?php echo $title?></title>
<script language="javascript">
var mkdir	= '<?=date('Y-m')?>',
	callback= '<?=$callback?>',
	savepath= '<?=$savepath?>',
	maxup	= <?=$maxup?>,
	uptype	= '<?=$uptype?>',
	thumbnail = '<?=$thumbnail?>',
	maxwidth  = '<?=$maxwidth?>',
	showid  	= '<?=$showid?>',
	upkey  	= '<?=$upkey?>',
	thumbtype  = '<?=$thumbtype?>';//缩略图类型0可能去掉看不到的默认， 1整图缩略可以看到白
var up={
	reader:false,
	filearr:[],
	bool:false,
	upsize:1024*200,
	upsizea:0,
	maxsize:<?=$maxsize?>,
	moi:0,
	wcarr:[],
	init:function()
	{
		this.upsizea = this.upsize;
		try{
			this.reader	= new FileReader();
		}catch(e){
			$('body').prepend('<div style="color:red;padding:2px;border:1px #dddddd solid;margin:5px">对不起，您的浏览器不支持上传功能，请使用IE10+，火狐，Opera，谷歌浏览器</div>');
		}
		var bol	= true;
		try{if(parent.js.uploadrand!=upkey){bol=false;}}catch(e){bol=false;}
		if(!bol){
			try{if(opener.js.uploadrand==upkey){bol=true;}}catch(e){}
		}
		if(!bol){
			$('body').prepend('<div style="color:red;padding:2px;border:1px #dddddd solid;margin:5px">不正当访问本页面，不能操作</div>');
			this.reader = false;
		}
		if(!this.reader){
			get('addbtn').disabled=true;
			get('clearbtn').disabled=true;
			get('startbtn').disabled=true;
		}
		this.obj=$('#upfile');
		if(maxup!=0){
			$('#footmsg').html('最多可添加'+maxup+'文件');
		}
	},
	add:function()
	{
		if(!this.reader||this.bool)return false;
		if(maxup!=0){
			if(this.gsize()>=maxup){
				alert('最多可添加'+maxup+'个文件');
				return false;
			}
		}
		document.myform.inputfile.click();
		return false;
	},
	rand:function()
	{
		var rand	= ''+js.now('d_His')+''+parseInt(Math.random()*9999)+'';
		return rand;
	},
	change:function(o){
		this.change1(0);
	},
	change1:function(oi)
	{
		var obja	= get('inputfileid').files;
		if(maxup!=0){
			if(this.gsize()>=maxup){
				this.rexushow();
				return false;
			}
		}
		if(oi>=obja.length){
			setTimeout('document.myform.reset()',500);
			this.rexushow();
			return false;
		}
		var file	= obja[oi];
		var olen	= this.filearr.length;
		var filesize	= file.size;
		var filesizecn	= this.formatsize(filesize);
		var filename	= file.name;
		var fileext		= filename.substr(filename.lastIndexOf('.')+1).toLowerCase();
		var filetype	= file.type;
		if(uptype!='*' && uptype!=''){
			var uobo = true;
			if(uptype=='image'){
				if(filetype.indexOf('image')<0)uobo=false;
			}else{
				var auptsype	= '|'+uptype+'|';
				if(auptsype.indexOf('|'+fileext+'|')<0)uobo=false;
			}
			if(!uobo){
				var tstype = uptype;
				if(tstype=='image')tstype='jpg,png,gif,bmp,jpeg';
				js.msg('msg','['+filename+']文件类型不符合，请选择类型为['+tstype+']的文件');
				up.change1(oi+1);
				return false;
			}
		}
		if(filesize>this.maxsize*1024*1024){
			js.msg('msg','['+filename+']文件超过'+this.maxsize+' MB，当前文件大小'+filesizecn+'');
			up.change1(oi+1);
			return false;
		}
		this.moi++;
		for(var i=0;i<olen;i++){
			if(this.filearr[i].filename==filename && this.filearr[i].filesize==filesize){
				js.msg('msg','['+filename+']已添加，请不要选择重复文件!');
				up.change1(oi+1);
				return false;
			}
		}
		var s='<div class="mdiv" upload="true">'+
		'<div class="div01"><span></span>'+fileext+'：'+filename+'</div>'+
		'<div class="div02">'+filesizecn+'</div>'+
		'<div class="div03" id="updeng'+this.moi+'">初始化文件...</div>'+
		'</div>';
		this.obj.append(s);
		try{
			var arr={filename:filename,filesize:filesize,filesizecn:filesizecn,filetype:filetype,fileext:fileext,newfile:this.rand(),xu:this.moi};
			this.reader.readAsDataURL(file);
			this.bool	= true;
			this.reader.onload=function(){
				var cont= this.result;
				cont	= cont.substr(cont.indexOf(',')+1);	
				arr.filecout=cont;
				up.filearr.push(arr);
				$('#updeng'+up.moi+'').html('等待上传...<a href="javascript:" temp="del" onclick="return up.del(this,'+olen+')">×</a>');
				up.bool	= false;
				up.change1(oi+1);
			}
		}catch(e){
			$('#updeng'+up.moi+'').html('失败..');
			up.change1(oi+1);
		}
	},
	del:function(o,oi)
	{
		$(o).parent().parent().remove();
		this.filearr[oi]=false;
		this.rexushow();
		return false;
	},
	formatsize:function(size)
	{
		var arr = new Array('Byte', 'KB', 'MB', 'GB', 'TB', 'PB');
		var e	= Math.floor(Math.log(size)/Math.log(1024));
		var fs	= size/Math.pow(1024,Math.floor(e));
		return js.float(fs)+' '+arr[e];
	},
	gsize:function()
	{
		var olen	= this.filearr.length;
		var ol	= 0;
		for(var i=0;i<olen;i++){
			if(this.filearr[i])ol++;
		}
		return ol;
	},
	upload:function()
	{
		if(this.bool)return false;
		var olen	= this.filearr.length;
		this.uparr	= [];
		var ol	= 0;
		for(var i=0;i<olen;i++){
			if(this.filearr[i]){
				this.uparr.push(this.filearr[i]);
				ol++;
			}
		}
		if(ol==0){
			js.msg('msg','请添加上传文件');
			return false;
		}
		this.filearr=[];
		get('addbtn').disabled=true;
		get('quebtn').disabled=true;
		get('clearbtn').disabled=true;
		get('startbtn').disabled=true;
		this.bool	= true;
		$("a[temp='del']").remove();
		$('#prou').show();
		$('#proushow').html('等待上传('+ol+'/<font id="nowupspan">0</font>)[<font id="allbili">0%</font>]...');
		$('#proudiv').css('width','0%');
		this.start(0);
		return false;
	},
	start:function(oi)
	{
		if(oi==this.uparr.length){
			$('#proushow').html('上传完成');
			get('addbtn').disabled=false;
			get('clearbtn').disabled=false;
			get('startbtn').disabled=false;
			get('quebtn').disabled=false;
			this.bool	= false;
			return false;
		}
		this.suarr	= this.uparr[oi];
		this.updengid= 'updeng'+this.suarr.xu+'';
		$('#'+this.updengid+'').html('<font color=#ff6600>正在上传(<span id="bilishow">0</span>%)...</font>');
		var len		= this.suarr.filecout.length;
		this.maxsend= Math.ceil(len/this.upsize);
		$('#nowupspan').html(oi+1);
		this.jdt(0);
		this.starts(0,oi);
	},
	rejisuantime:[],
	rejisuan:function(ms){
		this.rejisuantime[ms]=js.now('time');
		if(ms==1){
			var maa	= (this.rejisuantime[1]-this.rejisuantime[0])/1000;
			this.upsizea = this.upsize/maa;
		}
	},
	starts:function(oj,oi)
	{
		if(oj==this.maxsend){
			$('#'+this.updengid+'').html('<font color=green>上传成功</font>');
			this.start(oi+1);
			return false;
		}
		var bil		= js.float(((oj+1)/this.maxsend)*100);
		this.jdt(bil);
		$('#bilishow').html(bil);
		var arr		= this.suarr;
		var cont	= arr.filecout;
		var sendcont= cont.substr(oj*this.upsize,this.upsize);
		//arr.sendcont= sendcont;
		var data	= {sendcont:sendcont,filename:arr.filename,maxsend:this.maxsend,sendci:oj,filetype:arr.filetype,fileext:arr.fileext,filesize:arr.filesize,filesizecn:arr.filesizecn,mkdir:mkdir,newfile:arr.newfile,savepath:savepath,thumbnail:thumbnail,maxwidth:maxwidth,thumbtype:thumbtype};
		this.rejisuan(0);
		$.ajax({
			url:'uploadajax.php?action=send&rnd='+Math.random()+'&p=<?=$rock->get('p')?>',
			data:data,
			type:'post',
			success:function(da){
				var result	= js.decode(da);
				if(!result.success){
					alert(da);
					$('#'+up.updengid+'').html('<font color=red>上传失败</font>');
				}else{
					setTimeout('up.starts('+(oj+1)+','+oi+')',5);
					if(result.msg!='0'){
						up.wcarr.push({id:result.msg,filename:arr.filename,filetype:arr.filetype,fileext:arr.fileext,filesize:arr.filesize,filesizecn:arr.filesizecn,mkdir:mkdir,newfile:arr.newfile,filepath:result.filepath,thumbpath:result.thumbpath,width:result.width,height:result.height});
					}
				}
				up.rejisuan(1);
			},
			error:function(){
				$('#'+up.updengid+'').html('<font color=red>上传失败</font>');
			}
		});
	},
	jdt:function(bl)
	{
		$('#allbili').html(bl+'%('+this.formatsize(this.upsizea)+'/S)');
		$('#proudiv').css('width',''+bl+'%');
	},
	unload:function()
	{
		//window.returnValue='问';
		return false;
	},
	clear:function()
	{
		this.filearr=[];
		this.obj.html('');
	},
	rexushow:function(){
		var o	= $('#upfile').find('span');
		for(var i=0;i<o.length;i++){
			o[i].innerHTML=''+(i+1)+'. ';
		}
	},
	getsid:function(a){
		var sid = '',i;
		for(i=0;i<a.length;i++){
			sid+=','+a[i].id+'';
		}
		if(sid!='')sid = sid.substr(1);
		return sid;
	},
	okla:function(){
		var sid = this.getsid(this.wcarr);
		<?php if($callback!=''){?>try{parent.<?=$callback?>(this.wcarr,js.request('params1'), js.request('params2'), sid)}catch(e){}<?php }?>
		if(showid!=''){
			try{parent.js.downupshow(this.wcarr, showid, sid);}catch(e){}
			try{opener.js.downupshow(this.wcarr, showid, sid);}catch(e){}
		}
		this.closeaa();
	},
	closeaa:function(){
		window.close();
		try{parent.js.tanclose('uploadwin')}catch(e){}
	}
}
window.onbeforeunload=function(){
	if(up.bool)return '文件正在上传，确定要关闭页面吗？';
}
</script>
<style type="text/css">
button{cursor:pointer}
.alert{ padding:1px 5px; border:1px #996 solid; background-color:#ffffff; color:#933}
*{ font-size:12px;font-family:微软雅黑,Verdana, Geneva, sans-serif;}
.mdiv{ border-bottom:1px #cccccc solid; height:22px; overflow:hidden}
.mdiv div{ float:left; height:22px; line-height:22px; overflow:hidden; padding:0px 3px}
.div01{ width:55%;text-align:left;border-right:1px #cccccc solid;}
.div02{ width:15%; text-align:center;border-right:1px #cccccc solid;}
.div03{ width:25%;text-align:left}
#prou{overflow:hidden; background-color:#ffffff; margin:5px 0px; border:1px #666 solid;padding:0px; text-align:left;font-size:12px; position:relative; height:18px;}
#prou span{ left:5px; position:absolute; top:2px}
#proudiv{ position:absolute; left:0px; top:0px; height:18px; overflow:hidden; background-color:#09F;width:0%}
button{ cursor:pointer}
#footmsg{ text-align:left; padding:3px}
.quebntha{position:fixed;right:10px;bottom:10px;}
</style>
</head>
<body style="padding:1px" onLoad="up.init()">
<center>
<form name="myform" style="display:none"><input type="file" name="inputfile" id="inputfileid" multiple onChange="up.change(this)"></form>
<div align="left" style="padding:3px"></div>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    
    <td align="left"><button type="button" id="addbtn" onClick="up.add()">＋添加文件</button>&nbsp; <button type="button" id="clearbtn" onClick="up.clear()">－清除所有文件</button>&nbsp; <button type="button" onClick="up.closeaa()">关闭</button></td>
    <td align="right"><button type="button" id="startbtn" onClick="up.upload()">开始上传</button></td>
  </tr>
</table>
<div style="overflow:hidden; height:5px"></div>
<div id="prou" style="display:none"><div id="proudiv"></div><span id="proushow">等待上传...</span></div>
<div class="mdiv" style="background-color:#eeeeee">
<div class="div01">文件名</div>
<div class="div02">大小</div>
<div class="div03">状态</div>
</div>
<div id="upfile"></div>
<div id="footmsg"></div>

<div class="quebntha"><button type="button" disabled id="quebtn" onClick="up.okla()">确定</button></div>
</center>
</body>
</html>