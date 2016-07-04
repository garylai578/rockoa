/**
	rockmenu 菜单选择插件
	caratename：chenxihu
	caratetime：214-04-06 21:40:00
	email:qqqq2900@126.com
	homepage:www.xh829.com
*/
var rockmenuobj	= null;
(function ($) {
	
	function rockmenu(element, options){
		var obj		= element;
		var can		= options;
		var json	= can.data;
		var rand	= js.getrand(); 
		var me		= this;
		var hidebo	= false;
		var timeas	= null;
		this.obj	= obj;
		//初始化
		this.init	= function(){
			obj[can.trigger](function(){
				me.setcontent();
			});
			obj.mouseout(function(){
				me.hidetime();
			});
			obj.mouseover(function(){
				me.clearhide();
			});
		};
		this.clearhide	= function(){
			hidebo	= false;
		};
		this.hidetime	= function(){
			clearTimeout(timeas);
			hidebo	= true;
			timeas	= setTimeout(function(){
				if(hidebo)me.hide();
			},100);
		};
		this.hide	= function(){
			$('#rockmenu_'+rand+'').hide();
			if(can.bgcolor!='')obj.css('background','');
			if(can.autoremove)$('#rockmenu_'+rand+'').remove();
		};
		this.setcontent	= function(){
			rockmenuobj	= this;
			can.beforeshow(this);
			if(json.length<=0)return false;
			if(can.bgcolor!='')obj.css('background',can.bgcolor);
			if(can.autoremove)$('#rockmenu_'+rand+'').remove();
			if(document.getElementById('rockmenu_'+rand+'')){
				this.setweizhi();
				return false;
			}
			var len	= json.length;
			var str	= '<div class="rockmenu" id="rockmenu_'+rand+'">';
			if(can.arrowup)str+='<div class="arrow-up"></div>';
			str+='<div style="background:'+can.background+'"  id="rockmenuli_'+rand+'" class="rockmenuli">'+
			'<ul>';
			var s	= '',ys='',col,va;
			for(var i=0; i<len; i++){
				ys= '',
				va= json[i][can.display];
				if(i==len-1)ys+='border:none;';
				col	= '';
				if(json[i].fontcolor)ys+='color:'+json[i].fontcolor+';';
				if(va==can.value)col='#e1e1e1';
				if(json[i].background)col=json[i].background;
				if(col)ys+='background:'+col+';';
				s = '<li temp="'+i+'" style="'+ys+'">';
				var s1	= can.resultbody(json[i], this, i);
				if(!s1){
					if(json[i].icons)s+='<img src="'+json[i].icons+'" width="'+can.iconswh+'" height="'+can.iconswh+'" class="iconsa">';
					s+=va;
				}else{
					s+=s1;
				}
				s+='</li>';
				str+=s;
			}
			str+='</ul>'+
			'</div>'+
			'</div>';
			
			$('body').prepend(str);
			var oac	= $('#rockmenu_'+rand+'');
			can.aftershow(this);
			
			if(can.width!=0){
				$('#rockmenuli_'+rand+'').css('width',''+can.width+'px');
			};
			
			this.setweizhi();
			
			oac.find('li').mouseover(function(){this.className=can.overcls;});
			oac.find('li').mouseout(function(){this.className='';});
			oac.find('li').click(function(){me.itemsclick(this);});
			oac.mouseover(function(){
				hidebo = false;
			});
			oac.mouseout(function(){
				me.hidetime();
			});
		};
		this.setValue	= function(v){
			can.value	= v;
		};
		this.remove		= function(oi){
			$('#rockmenu_'+rand+'').find("li[temp='"+oi+"']").remove();
		};
		this.setweizhi = function(){
			var oac		= $('#rockmenu_'+rand+'');
			if(can.donghua)oac.slideDown(100);
			oac.show();
			var off		= obj.offset(),
				l		= off.left+can.left,
				jg		= (l+oac.width()+10 - winWb()),jg1=0,
				t		= off.top+can.top;
			if(jg>0)l=l-jg;
			jg1	= t+get('rockmenu_'+rand+'').scrollHeight+10-winHb();
			if(jg1>0)t=t-jg1;
			if(t<5)t=5;
			oac.css({'left':''+l+'px','top':''+t+'px'});
		};
		//项目单击
		this.itemsclick = function(o){
			var oi	= parseInt($(o).attr('temp'));
			can.itemsclick(json[oi],oi,me);
			if(can.autohide)this.hide();
		};
		this.setData	= function(da){
			can.data= da;
			json	= da;
			can.autoremove = true;
		};
		
	};
	
	$.fn.rockmenu = function(options){
		var defaultVal = {
			data:[],
			display:'name',//显示的名称
			left:0,
			overcls:'li01',
			top:0,
			width:0,value:'',
			iconswh:16,
			itemsclick:function(){},
			beforeshow:function(){},
			aftershow:function(){},
			autoremove:false,//自动删除
			trigger:'click',
			autohide:true,
			arrowup:false,	//是否有箭头
			background:'#ffffff',//背景颜色
			bgcolor:'',
			resultbody:function(){
				return '';
			},
			donghua:true
		};
		
		return this.each(function(){
			var can = $.extend({}, defaultVal, options);
			var menu = new rockmenu($(this), can);
			menu.init();
			return menu;
		});
	};
})(jQuery); 