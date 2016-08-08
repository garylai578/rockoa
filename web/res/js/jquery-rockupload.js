/**
*	无刷新上传
*	createname：雨中磐石
*	homeurl：http://xh829.com/
*	Copyright (c) 2016 rainrock (xh829.com)
*	Date:2016-01-01
*/

(function ($) {

	function rockupload(opts){
		var me = this;
		var opts=js.apply({inputfile:'',uptype:'*',maxsize:50,onchange:function(){},onprogress:function(){},onsuccess:function(){},onerror:function(){},onabort:function(){}},opts);
		this._init=function(){
			for(var a in opts)this[a]=opts[a];
			this.uploadarr = [];
			if(!document.getElementById(this.inputfile)){
				var s='<form style="display:none;height:0px;width:0px" name="form_'+this.inputfile+'"><input type="file" id="'+this.inputfile+'"></form>';
				$('body').append(s);
			}
			$('#'+this.inputfile+'').change(function(){
				me._change(this);
			});
		};
		this.reset=function(){
			document['form_'+this.inputfile+''].reset();
		};
		this.click=function(lx){
			if(this.upbool)return;
			if(lx)this.uptype=lx;
			document.getElementById(this.inputfile).click();
		};
		this._change=function(o1){
			if(!o1.files){
				js.msg('msg','当前浏览器不支持1');
				return;
			}
			var f = o1.files[0];
			var a = {filename:f.name,filesize:f.size,filesizecn:js.formatsize(f.size)};
			if(f.size>this.maxsize*1024*1024){
				this.reset();
				js.msg('msg','文件不能超过'+this.maxsize+'MB,当前文件'+a.filesizecn+'');
				return;
			}
			var filename = f.name;
			var fileext	 = filename.substr(filename.lastIndexOf('.')+1).toLowerCase();
			if(this.uptype=='image')this.uptype='jpg,gif,png,bmp,jpeg';
			if(this.uptype!='*'){
				var upss=','+this.uptype+',';
				if(upss.indexOf(','+fileext+',')<0){
					js.msg('msg','禁止文件类型,请选择'+this.uptype+'');
					return;
				}
			}
			a.fileext	 = fileext;
			a.isimg		 = js.isimg(fileext);
			this.filearr=a;
			this.onchange(a);
			this.reset();
			this._startup(f);
		};
		this.sendbase64=function(nr){
			this.filearr={filename:'截图.png',filesize:0,filesizecn:'',isimg:true,fileext:'png'};
			this._startup(false, nr);
		};
		this._startup=function(fs, nr){
			this.upbool = true;
			try{var xhr = new XMLHttpRequest();}catch(e){js.msg('msg','当前浏览器不支持2');return;}
			var url = js.apiurl('upload','upfile');
			if(nr)url = js.apiurl('upload','upcont');
			xhr.open('POST', url, true); 
			xhr.onreadystatechange = function(){me._statechange(this);};
			xhr.upload.addEventListener("progress", function(evt){me._onprogress(evt, this);}, false);  
			xhr.addEventListener("load", function(){me._onsuccess(this);}, false);  
			xhr.addEventListener("error", function(){me._error(this);}, false); 
			if(fs){
				var fd = new FormData();  
				fd.append('file', fs); 
				xhr.send(fd);
			}
			if(nr){
				xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");  
				nr = nr.substr(nr.indexOf(',')+1);
				nr = nr.replace(/\+/g, '!');	
				nr = nr.replace(/\//g, '.');	
				nr = nr.replace(/\=/g, ':');
				xhr.send('content='+nr+'');
			}
			this.xhr = xhr;
		};
		this._onsuccess=function(o){
			this.upbool = false;
			this.onsuccess(this.filearr,o.response,o);
		};
		this._error=function(o){
			this.upbool = false;
			js.getarr(o);
			this.onerror(this);
		};
		this._statechange=function(o){
			
		};
		this._onprogress=function(evt){
			var loaded 	= evt.loaded;  
			var tot 	= evt.total;  
			var per 	= Math.floor(100*loaded/tot);
			this.onprogress(this.filearr,per, evt);
		};
		this.abort=function(){
			this.xhr.abort();
			this.onabort();
		};
		this._init();
	}
	
	
	$.rockupload	  = function(options){
		var cls = new rockupload(options,false);
		cls.init();
		return cls;
	}
	
})(jQuery); 