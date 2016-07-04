var get=function(id){return document.getElementById(id);}
var scr={
	left:0,//左相对位置
	top:0,//上相对位置
	oleft:0,
	otop:0,
	isIE:true,//是否为IE浏览
	isMove:true,//是否移动
	width:120,//默认截取宽
	height:120,//默认截取高
	oldwidth:0,//图片宽度
	oldheight:0,//图片高度
	isResize:true,//是否可以改变大小
	bili:1,//图片缩放比例
	sou:0.1,//缩小放大比例
	shu:0,
	bool:true,
	cropw:this.width,
	croph:this.height,
	across:true,//是否锁定纵横比
	nimgw:0,//当前图片大小
	nimgh:0,
	rotate:0,//旋转角度
	rotatejg:45,//旋转范围
	vieww:500,
	viewh:350,
	init:function(w,h,isre){//初始化
		if(!document.all)this.isIE=false;
		this.width=w;
		this.height=h;
		this.cropw=w;
		this.croph=h;
		if(this.oldwidth==0||this.oldwidth==''){
			this.bool=false;
			this.btnimg();
			this.viewprop();
			return;
		}
		this.nimgw=this.oldwidth;
		this.nimgh=this.oldheight;
		if(isre==false)this.isResize=false;
		this.zong=get('zongdiv');
		this.drag=get('dragDiv');
		var ctop=(this.zong.clientHeight-this.height)/2;
		var cleft=(this.zong.clientWidth-this.width)/2;
		var canshu={left:''+cleft+'px',top:''+ctop+'px',width:''+this.width+'px',height:''+this.height+'px'};
		$('#dragDiv').css(canshu);
		$('#optimg').css({left:'0px',top:'0px',width:''+(this.oldwidth*this.oldbili)+'px',height:''+(this.oldheight*this.oldbili)+'px'})
		if(!this.isResize){
			$('#down').hide();
			$('#right').hide();
			$('#rightdown').hide();
		}
		this.hua(this.oldbili);
		this.overbor();
		this.viewprop();
		this.showli();
	},
	showli:function(){
		var w=this.oldwidth*this.bili;
		var h=this.oldheight*this.bili;
		this.crop();
		var shu=(this.isIE)?0:1;
		$('#liangdivimg').css({width:''+w+'px',height:''+h+'px',left:''+(-this.oleft-shu)+'px',top:''+(-this.otop-shu)+'px'});
	}
	,
	rehui:function(){
		
	},
	move:function(id,event){//移动
		if(!this.bool)return;
		if(!this.isMove)return;
		var _left=parseFloat(get(id).style.left);
		var _top=parseFloat(get(id).style.top);
		var _X=event.clientX;
		var _Y=event.clientY;
		var ml=this.zong.clientWidth-this.drag.clientWidth-this.shu;
		var mt=this.zong.clientHeight-this.drag.clientHeight-this.shu;
		_move=function(evt){
			evt=window.event||evt;
			var lx=_left+evt.clientX-_X;
			var ty=_top+evt.clientY-_Y;
				if(id!='optimg'){
				if(lx<0)lx=0;
				if(lx>ml)lx=ml;
				if(ty<0)ty=0;
				if(ty>mt)ty=mt;
			}
			$('#'+id+'').css({'left':''+lx+'px','top':''+ty+'px'});
			if(!viewbool)scr.showli();
		}
		document.onmousemove=_move;
		document.onmouseup=function(){
			scr.overbor();
			document.onmousemove='';
		}
	},
	resize:function(type,event){//改变大小
		if(!this.bool)return;
		if(!this.isResize)return;
		this.isMove=false;
		var _X=event.clientX;
		var _Y=event.clientY;
		var _W=parseFloat(this.drag.style.width);
		var _H=parseFloat(this.drag.style.height);
		var zhb=1;
		_resize=function(evt){
			evt=window.event||evt;
			var wn=_W+(evt.clientX-_X);
			var hn=_H+(evt.clientY-_Y);
			//锁定纵横比
			if(scr.across){
				switch(type){
					case 'r':
					case 'rd':
						zhb=wn/_W;
						hn=zhb*_H;
					break;
					case 'd':
						zhb=hn/_H;
						wn=zhb*_W;
					break;
				}
			}
			
			if(wn<45)wn=45;
			if(hn<45)hn=45;
			
			if(!scr.across){
				switch(type){
					case 'r':
						scr.drag.style.width=wn+'px';
					break;
					case 'd':
						scr.drag.style.height=hn+'px';
					break;		
					case 'rd':
						scr.drag.style.width=wn+'px';
						scr.drag.style.height=hn+'px';
					break;							
				}
			}else{
				scr.drag.style.width=wn+'px';
				scr.drag.style.height=hn+'px';
			}
			if(scr.isIE){
				$('#drright').css('left',''+(wn-1)+'px');
				$('#drbottom').css('top',''+(hn-1)+'px');
			}
			scr.cropw=wn;
			scr.croph=hn;
			scr.showli();
		}
		document.onmousemove=_resize
		document.onmouseup=function(){
			scr.overbor();
			scr.isMove=true;document.onmousemove='';
		}
	},
	offset:function(id){//获取相对位置
		var off=$('#'+id+'').offset();
		this.left=off.left-this.shu;
		this.top=off.top-this.shu;
	},
	//判断选择区域是不是超界了
	overbor:function(){
		//if(this.nimgw<this.cropw&&this.nimgh<this.croph){
			
		//}
	},
	caibool:false,
	caijian:function(){
		if(this.caibool)return;
		if(!this.bool)return;
		this.crop();
		var w=this.drag.clientWidth;//裁剪宽
		var h=this.drag.clientHeight;//高
		var url='crop.php?action=crop&imgurl='+this.path+'&rotate='+this.rotate+'&bili='+this.bili+'&x1='+this.oleft+'&y1='+this.otop+'&w='+w+'&h='+h+'&rnd='+Math.random()+'';
		//alert(url)
		this.tishi('正在裁剪图片...');
		this.caibool=true;
		get('chuifrfrom').src=url;
	},
	//裁剪成功
	caij:function(img){
		try{parent.showface(img)}catch(e){};
		this.tishi('成功裁剪图片','close');
		this.caibool=false;
	},
	crop:function(){
		this.offset('optimg');
		var l1=this.left;
		var t1=this.top;
		this.offset('dragDiv');
		var x1=this.left-l1;
		var y1=this.top-t1;
		this.oleft=	x1;
		this.otop=y1;	
	},
	change:function(lx){//缩小放大
		if(!this.bool)return false;
		var bili;
		switch(lx){
			case 0:
				bili=1;//原图
			break;
			case 1:
				bili=this.bili+this.sou;//放大
			break;
			case 2:
				bili=this.bili-this.sou;//缩小
			break;
			case 3://恢复
				bili=this.oldbili;
				this.init(this.width,this.height);
			break;
			case 4://
				bili=this.bili;
			break;
			default:
				return;
			break;
		}
		if(bili<0.05)bili=0.05;
		if(bili>3)bili=3;
		var w=this.oldwidth*bili;
		var h=this.oldheight*bili;
		$('#optimg').stop();
		if(viewbool){
			var abtaa=this.imgcsoult(w,h);
			$('#optimg').animate({width:''+w+'px',height:''+h+'px',left:''+abtaa[0]+'px',top:''+abtaa[1]+'px'},200);
		}else{
			$('#optimg').css({width:''+w+'px',height:''+h+'px'});
		}
		this.bili=bili;
		this.hua(bili);
		this.nimgw=w;
		this.nimgh=h;
		this.overbor()
		this.showli();
		return false;
	}
	,moveimg:function(event){
		if(!this.bool)return;	
		var img=get('optimg');
		var left=parseFloat(img.style.left);
		var top=parseFloat(img.style.top);
		var ax=event.clientX;
		var ay=event.clientY;
		cadmove=function(evt){
			evt=window.event||evt;
			var yx=evt.clientX-ax;
			var yy=evt.clientY-ay;
			$('#optimg').css({'left':''+(left+yx)+'px','top':''+(top+yy)+'px'});
			if(!viewbool)scr.showli();
		}
		document.onmousemove=cadmove;
		document.onmouseup=function(){
			scr.overbor();
			document.onmousemove='';
		}
	}
	,hua:function(bil){
		var abl=bil;
		if(abl>1)abl=1;
		get('huakuai').style.width=(160*abl)+'px';
		get('huakuai').innerHTML=''+(bil*100).toFixed(0)+'%';
	},
	huak:function(event){
		if(!this.bool)return;
		var x=event.clientX;
		this.offset('divjin');
		var jg=x-this.left;
		this.bili=jg/160;
		this.change(4);
	}
	,changeimg:function(){
		get('fileface').click();
	}
	,btnimg:function(){
		if(viewbool)return;
		$('#divbtnchange').show();
		$('#divupimg').show();
	},
	upfa:false,
	changeface:function(obj){
		if(this.upfa)return;
		var val=obj.value;
		var ext=val.substr(val.lastIndexOf('.')+1).toLowerCase();
		if('[jpg],[png],[gif],[jpeg]'.indexOf('['+ext+']')<0){
			this.tishi('选择的图片格式不对，请选择jpg,jpeg,gif,png的图片类型！','red');
			this.reup();
			return false;
		}
		this.tishi('图片正在上传...');
		this.upfa=true;
		$('#divupimg').hide();
		document.upfrom.submit();
	},
	reup:function(){
		get('spanupfile').innerHTML='<input name="upfileface" id="fileface" style="cursor:pointer; position:absolute; right:0px"  onchange="return scr.changeface(this)" type="file" >';
	},
	tishitime:null,
	tishi:function(txt,color){
		clearTimeout(this.tishitime);
		$('#divmsg').stop();
		var cllx=color;
		if(!color||color=='close')color='#005eb5';
		$('#divmsg').animate({'top':'0px'});
		get('divmsg').innerHTML='<font color="'+color+'">'+txt+'</font>';
		if(cllx=='close')this.tishitime=setTimeout("$('#divmsg').animate({top:'-30px'},1000);",3000);//关闭
		if(cllx=='red'){
			this.upfa=false;
			$('#divupimg').show();
		}
	}
	,
	upcg:function(fname){
		this.tishi('上传成功，正在加载图片...');
		var url='crop.php?rotate=0&imgurl='+fname+'&vieww='+this.vieww+'&viewh='+this.viewh+'&rnd='+Math.random()+'';
		window.location.href=url;
		return false;
	},
	//重选
	rechange:function(){
		var url='crop.php?rotate=0&vieww='+this.vieww+'&viewh='+this.viewh+'&rnd='+Math.random()+'';
		window.location.href=url;
		return false;
	}
	,
	rotatefun:function(lx){
		if(!this.bool)return false;
		var rotate=eval(''+this.rotate+''+lx+''+this.rotatejg+'');
		if(rotate>360||rotate<-360)rotate=0;
		this.rotate=rotate;
		var url='crop.php?imgurl='+this.path+'&rotate='+this.rotate+'&vieww='+this.vieww+'&viewh='+this.viewh+'&rnd='+Math.random()+'';
		this.tishi('正在旋转图片...');
		window.location.href=url;
		return false;
	},
	
	//只是查看图片
	viewprop:function(){
		var cala=this.imgclefttop();
		$('#optimg').css({left:''+cala[0]+'px',top:''+cala[1]+'px'});
		if(!viewbool)return false;
		$('#dragDiv').hide();
		$('#tdbtn9').hide();
		$('#tdbtn3').hide();
		$('#movediv').css({'filter':'alpha(opacity=0)',opacity:0});
		get('zongdiv').className='imgbgzonga';
	},
	
	//让图片居中lw
	imgclefttop:function(){
		var zwa=get('zongdiv').clientWidth;
		var zwi=get('optimg').clientWidth;
		var zha=get('zongdiv').clientHeight;
		var zhi=get('optimg').clientHeight;
		var olef=0,otop=0;
		if(zwa>zwi||zha>zhi){
			olef=(zwa-zwi)*0.5;
			otop=(zha-zhi)*0.5;
		}
		return [olef,otop];
	},
	
	//放大缩小图片时让其居中
	imgcsoult:function(nw,nh){
		var onw=get('optimg').clientWidth;
		var onh=get('optimg').clientHeight;
		return [parseFloat(get('optimg').style.left)+(onw-nw)*0.5,parseFloat(get('optimg').style.top)+(onh-nh)*0.5];
	}
};