<?php
/**
*	模块：rent.租机登记，
*	说明：自定义区域内可写您想要的代码，模块列表页面，生成分为2块
*	来源：流程模块→表单元素管理→[模块.租机登记]→生成列表页
*/
defined('HOST') or die ('not access');
?>
<script>
$(document).ready(function(){
	{params}
	var modenum = 'rent',modename='租机登记',isflow=0,modeid='79',atype = params.atype,pnum=params.pnum;
	if(!atype)atype='';if(!pnum)pnum='';
	var fieldsarr = [{"name":"\u7533\u8bf7\u4eba","fields":"base_name"},{"name":"\u7533\u8bf7\u4eba\u90e8\u95e8","fields":"base_deptname"},{"name":"\u5355\u53f7","fields":"sericnum"},{"fields":"custname","name":"\u5ba2\u6237\u540d\u79f0","fieldstype":"selectdatafalse","ispx":"0","isalign":"0","islb":"1"},{"fields":"custid","name":"\u5ba2\u6237id","fieldstype":"hidden","ispx":"0","isalign":"0","islb":"0"},{"fields":"dept","name":"\u90e8\u95e8","fieldstype":"selectdatafalse","ispx":"0","isalign":"0","islb":"1"},{"fields":"brand","name":"\u673a\u5668\u54c1\u724c","fieldstype":"text","ispx":"0","isalign":"0","islb":"1"},{"fields":"model","name":"\u673a\u5668\u578b\u53f7","fieldstype":"text","ispx":"0","isalign":"0","islb":"1"},{"fields":"series","name":"\u673a\u8eab\u7f16\u53f7","fieldstype":"text","ispx":"0","isalign":"0","islb":"0"},{"fields":"rentnum","name":"\u79df\u7ea6\u7f16\u53f7","fieldstype":"text","ispx":"0","isalign":"0","islb":"1"},{"fields":"basenumb","name":"\u5408\u7ea6\u57fa\u672c\u91cf\uff08\u9ed1\uff09","fieldstype":"number","ispx":"0","isalign":"0","islb":"0"},{"fields":"basenumc","name":"\u5408\u7ea6\u57fa\u672c\u91cf\uff08\u5f69\uff09","fieldstype":"number","ispx":"0","isalign":"0","islb":"0"},{"fields":"priceb","name":"\u8d85\u7b97\u5355\u4ef7\uff08\u9ed1\uff09","fieldstype":"number","ispx":"0","isalign":"0","islb":"0"},{"fields":"pricec","name":"\u8d85\u7b97\u5355\u4ef7\uff08\u5f69\uff09","fieldstype":"number","ispx":"0","isalign":"0","islb":"0"},{"fields":"rental","name":"\u6708\u57fa\u672c\u79df\u91d1","fieldstype":"number","ispx":"0","isalign":"0","islb":"1"},{"fields":"interval","name":"\u6284\u8868\u95f4\u9694\uff08\u6708\uff09","fieldstype":"rockcombo","ispx":"0","isalign":"0","islb":"1"},{"fields":"exceedingb","name":"\u8d77\u7b97\u5f20\u6570\uff08\u9ed1\uff09","fieldstype":"number","ispx":"0","isalign":"0","islb":"0"},{"fields":"exceedingc","name":"\u8d77\u7b97\u5f20\u6570\uff08\u5f69\uff09","fieldstype":"number","ispx":"0","isalign":"0","islb":"0"},{"fields":"startdt","name":"\u5f00\u59cb\u65e5\u671f","fieldstype":"date","ispx":"0","isalign":"0","islb":"0"},{"fields":"enddt","name":"\u7ed3\u675f\u65e5\u671f","fieldstype":"date","ispx":"0","isalign":"0","islb":"0"},{"fields":"belong","name":"\u8bbe\u5907\u6240\u5c5e","fieldstype":"rockcombo","ispx":"0","isalign":"0","islb":"0"},{"fields":"wastage","name":"\u8bbe\u5907\u8017\u635f","fieldstype":"number","ispx":"0","isalign":"0","islb":"0"},{"fields":"discount","name":"\u6298\u6263\u7387","fieldstype":"number","ispx":"0","isalign":"0","islb":"0"},{"fields":"state","name":"\u79df\u673a\u72b6\u6001","fieldstype":"rockcombo","ispx":"0","isalign":"0","islb":"1"},{"fields":"remark","name":"\u5907\u6ce8","fieldstype":"textarea","ispx":"0","isalign":"0","islb":"1"},{"fields":"totalmoney","name":"\u5408\u8ba1\u91d1\u989d","fieldstype":"number","ispx":"0","isalign":"0","islb":"1"},{"fields":"totalcost","name":"\u603b\u6210\u672c","fieldstype":"number","ispx":"0","isalign":"0","islb":"1"}],fieldsselarr= {"columns_rent_":"custname,dept,brand,model,rentnum,rental,interval,state,remark,totalmoney,caozuo"};
	
	var c = {
		reload:function(){
			a.reload();
		},
		clickwin:function(o1,lx){
			var id=0;
			if(lx==1)id=a.changeid;
			openinput(modename,modenum,id,'opegs{rand}');
		},
		view:function(){
			var d=a.changedata;
			openxiangs(modename,modenum,d.id,'opegs{rand}');
		},
		searchbtn:function(){
			this.search({});
		},
		search:function(cans){
			var s=get('key_{rand}').value,zt='';
			if(get('selstatus_{rand}'))zt=get('selstatus_{rand}').value;
			var canss = js.apply({key:s,keystatus:zt}, cans);
			a.setparams(canss,true);
		},
		//高级搜索
		searchhigh:function(){
			new highsearchclass({
				modenum:modenum,
				oncallback:function(d){
					c.searchhighb(d);
				}
			});
		},
		searchhighb:function(d){
			d.key='';
			get('key_{rand}').value='';
			a.setparams(d,true);
		},
		//导出
		daochu:function(o1,lx,lx1,e){
			if(!this.daochuobj)this.daochuobj=$.rockmenu({
				width:120,top:35,donghua:false,data:[],
				itemsclick:function(d, i){
					c.daonchuclick(d);
				}
			});
			var d = [{name:'导出全部',lx:0},{name:'导出当前页',lx:1},{name:'订阅此列表',lx:2}];
			this.daochuobj.setData(d);
			var lef = $(o1).offset();
			this.daochuobj.showAt(lef.left, lef.top+35);
		},
		daonchuclick:function(d){
			if(d.lx==0)a.exceldown();
			if(d.lx==1)a.exceldownnow();
			if(d.lx==2)this.subscribelist();
		},
		subscribelist:function(){
			js.subscribe({
				title:'租机登记('+nowtabs.name+')',
				cont:'租机登记('+nowtabs.name+')的列表的',
				explain:'订阅[租机登记]的列表',
				objtable:a
			});
		},
		getacturl:function(act){
			return js.getajaxurl(act,'mode_rent|input','flow',{'modeid':modeid});
		},
		changatype:function(o1,lx){
			$("button[id^='changatype{rand}']").removeClass('active');
			$('#changatype{rand}_'+lx+'').addClass('active');
			a.setparams({atype:lx},true);
			nowtabssettext($(o1).html());
		},
		init:function(){
			$('#key_{rand}').keyup(function(e){
				if(e.keyCode==13)c.searchbtn();
			});
			this.initpage();
		},
		initpage:function(){
			
		},
		loaddata:function(d){
			if(!d.atypearr)return;
			get('addbtn_{rand}').disabled=(d.isadd!=true);
			if(d.isdaoru)$('#daoruspan_{rand}').show();
			var d1 = d.atypearr,len=d1.length,i,str='';
			for(i=0;i<len;i++){
				str+='<button class="btn btn-default" click="changatype,'+d1[i].num+'" id="changatype{rand}_'+d1[i].num+'" type="button">'+d1[i].name+'</button>';
			}
			$('#changatype{rand}').html(str);
			$('#changatype{rand}_'+atype+'').addClass('active');
			js.initbtn(c);
		},
		setcolumns:function(fid, cnas){
			var d = false,i,ad=bootparams.columns,len=ad.length,oi=-1;
			for(i=0;i<len;i++){
				if(ad[i].dataIndex==fid){
					d = ad[i];
					oi= i;
					break;
				}
			}
			if(d){
				d = js.apply(d, cnas);
				bootparams.columns[oi]=d;
			}
		},
		daoru:function(){
			window.managelistrent = a;
			addtabs({num:'daorurent',url:'flow,input,daoru,modenum=rent',icons:'plus',name:'导入租机登记'});
		},
		initcolumns:function(bots){
			var num = 'columns_'+modenum+'_'+pnum+'',d=[],d1,d2={},i,len=fieldsarr.length,bok;
			var nstr= fieldsselarr[num];if(!nstr)nstr='';
			if(nstr)nstr=','+nstr+',';
			if(nstr=='' && isflow==1){
				d.push({text:'申请人',dataIndex:'base_name',sortable:true});
				d.push({text:'申请人部门',dataIndex:'base_deptname',sortable:true});
			}
			for(i=0;i<len;i++){
				d1 = fieldsarr[i];
				bok= false;
				if(nstr==''){
					if(d1['islb']=='1')bok=true;
				}else{
					if(nstr.indexOf(','+d1.fields+',')>=0)bok=true;
				}
				if(bok){
					d2={text:d1.name,dataIndex:d1.fields};
					if(d1.ispx=='1')d2.sortable=true;
					if(d1.isalign=='1')d2.align='left';
					if(d1.isalign=='2')d2.align='right';
					d.push(d2);
				}
			}
            //如果是抄表通知的页面
            if(pnum=='remind'){
                d.push({text:'上次抄表日', dataIndex:'lastdt'});
                d.push({text:'抄表间隔(月)', dataIndex:'interval'});
                d.push({text:'下次抄表日', dataIndex:'nextdt'});
            }
			if(isflow==1)d.push({text:'状态',dataIndex:'statustext'});
			if(nstr=='' || nstr.indexOf(',caozuo,')>=0)d.push({text:'',dataIndex:'caozuo',callback:'opegs{rand}'});
			if(!bots){
				bootparams.columns=d;
			}else{
				a.setColumns(d);
			}
		},
		setparams:function(cs){
			var ds = js.apply({},cs);
			a.setparams(ds);
		},
		storeurl:function(){
			var url = this.getacturl('publicstore')+'&pnum='+pnum+'';
			return url;
		},
		printlist:function(){
			js.msg('success','可使用导出，然后打开在打印');
		},
		getbtnstr:function(txt, click, ys, ots){
			if(!ys)ys='default';
			if(!ots)ots='';
			return '<button class="btn btn-'+ys+'" id="btn'+click+'_{rand}" click="'+click+'" '+ots+' type="button">'+txt+'</button>';
		},
		setfieldslist:function(){
			new highsearchclass({
				modenum:modenum,
				modeid:modeid,
				type:1,
				isflow:isflow,
				pnum:pnum,atype:atype,
				fieldsarr:fieldsarr,
				fieldsselarr:fieldsselarr,
				oncallback:function(str){
					fieldsselarr[this.columnsnum]=str;
					c.initcolumns(true);
					c.reload();
				}
			});
		}
	};	
	
	//表格参数设定
	var bootparams = {
		fanye:true,modenum:modenum,modename:modename,statuschange:false,tablename:jm.base64decode('cmVudA::'),
		url:c.storeurl(),storeafteraction:'storeaftershow',storebeforeaction:'storebeforeshow',
		params:{atype:atype},
		columns:[{text:"客户名称",dataIndex:"custname"},{text:"部门",dataIndex:"dept"},{text:"机器品牌",dataIndex:"brand"},{text:"机器型号",dataIndex:"model"},{text:"租约编号",dataIndex:"rentnum"},{text:"月基本租金",dataIndex:"rental"},{text:"抄表间隔（月）",dataIndex:"interval"},{text:"租机状态",dataIndex:"state"},{text:"备注",dataIndex:"remark"},{text:"合计金额",dataIndex:"totalmoney"},{text:"总成本",dataIndex:"totalcost"},{
			text:'',dataIndex:'caozuo',callback:'opegs{rand}'
		}],
		itemdblclick:function(){
			c.view();
		},
		load:function(d){
			c.loaddata(d);
            var tablebody = $('#viewrent_{rand}')[0];
            var tbodyid = tablebody.firstChild.id.replace("tablebody", "tbody");
            var tbodychildren = document.getElementById(tbodyid).children;
            var tmoneys = 0.0, cmoneys = 0.0;
            if(tbodychildren[0].children.length >= 12) {
                for (j = 0; j < tbodychildren.length; j++) {
                    tmoneys = parseFloat(tmoneys) + parseFloat(tbodychildren[j].children[10].innerHTML);
                    cmoneys = parseFloat(cmoneys) + parseFloat(tbodychildren[j].children[11].innerHTML);
                }
                var p = document.createElement("tr");
                p.innerHTML = "<td/><td/><td/><td/><td/><td/><td/><td/><td/><td align=\"center\">合计：</td><td align=\"center\">" + tmoneys.toFixed(2) + "</td><td align=\"center\">" + cmoneys.toFixed(2) + "</td><td/>";
                document.getElementById(tbodyid).appendChild(p);
            }
		}
	};
	c.initcolumns(false);
	opegs{rand}=function(){
		c.reload();
	}
	
//[自定义区域start]



//[自定义区域end]

	js.initbtn(c);
	var a = $('#viewrent_{rand}').bootstable(bootparams);
	c.init();
	var ddata = [{name:'高级搜索',lx:0}];
	if(admintype==1)ddata.push({name:'自定义列显示',lx:2});
	ddata.push({name:'打印',lx:1});
	$('#downbtn_{rand}').rockmenu({
		width:120,top:35,donghua:false,
		data:ddata,
		itemsclick:function(d, i){
			if(d.lx==0)c.searchhigh();
			if(d.lx==1)c.printlist();
			if(d.lx==2)c.setfieldslist();
		}
	});
	
	
});
</script>
<!--SCRIPTend-->
<!--HTMLstart-->
<div>
	<table width="100%">
	<tr>
		<td style="padding-right:10px;" id="tdleft_{rand}" nowrap><button id="addbtn_{rand}" class="btn btn-primary" click="clickwin,0" disabled type="button"><i class="icon-plus"></i> 新增</button></td>
		<td>
			<input class="form-control" style="width:160px" id="key_{rand}" placeholder="关键字">
		</td>
		
		<td style="padding-left:10px">
			<div style="width:85px" class="btn-group">
			<button class="btn btn-default" click="searchbtn" type="button">搜索</button><button class="btn btn-default" id="downbtn_{rand}" type="button" style="padding-left:8px;padding-right:8px"><i class="icon-angle-down"></i></button> 
			</div>
		</td>
		<td  width="90%" style="padding-left:10px"><div id="changatype{rand}" class="btn-group"></div></td>
	
		<td align="right" id="tdright_{rand}" nowrap>
			<button class="btn btn-default" click="daochu" type="button">导出 <i class="icon-angle-down"></i></button> 
		</td>
	</tr>
	</table>
</div>
<div class="blank10"></div>
<div id="viewrent_{rand}"></div>
<!--HTMLend-->