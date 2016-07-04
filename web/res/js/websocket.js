function websocketClass(opts){
	var me 		= this;
	this.wsobj	= false;
	this.wshost	= '';
	this.onopen		= function(){};
	this.onmessage	= function(){};
	this.onclose	= function(){};
	this.onerror	= function(){};
	this.reimfrom	= 'rockdemo';
	this.adminid	= '1';
	this.sendname	= '1';
	this._init=function(){
		if(opts)for(var o1 in opts)this[o1]=opts[o1];
		if(typeof(WebSocket)=='undefined'){
			WEB_SOCKET_SWF_LOCATION = "res/swf/WebSocketMain.swf";
			WEB_SOCKET_DEBUG = true;
			$.getScript('res/js/swfobject.js', function(){
				me._contect();
			});
		}else{
			this._contect();
		}
	};
	this._contect = function(){
		this.wsobj=new WebSocket(this.wshost);
		this.wsobj.onopen=function(evt){me._onopen(evt);}
		this.wsobj.onmessage=function(evt){me._onmessage(evt);}
		this.wsobj.onclose=function(evt){me._onclose(evt);}
		this.wsobj.onerror=function(evt){me._onerror(evt);}
	};
	this.connect  = function(){
		this._contect();
	};
	this._onopen = function(evt){
		this.onopen(this,evt);
		this.send({atype:'connect'});
	};
	this._onmessage = function(evt){
		var msg = evt.data;
		this.onmessage(msg,this);
	};
	this._onclose = function(evt){
		this.onclose(this,evt);
	};
	this._onerror = function(evt){
		this.onerror(this,evt);
	};
	this.send = function(arr){
		var str = this.objecttostr(arr);
		return this.wsobj.send(str);
	}
	this.objecttostr = function(a){
		var a1,s='',v;
		var arra=js.apply({'from':this.reimfrom,'adminid':this.adminid,'atype':'send','sendname':this.sendname},a);
		for(a1 in arra){
			v = arra[a1];
			s+=',"'+a1+'":"'+v+'"';
		}
		if(s!='')s = s.substr(1);
		return "{"+s+"}";
	};
	this._init();
}