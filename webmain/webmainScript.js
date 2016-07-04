js.initbtn = function(obj){
	var o = $("[click]"),i,o1,cl;
	for(i=0; i<o.length; i++){
		o1	= $(o[i]);
		cl	= o1.attr('clickadd');
		if(cl!='true'){
			o1.click(function(){
				var cls = $(this).attr('click');
				if(typeof(cls)=='string'){
					cls=cls.split(',');
					obj[cls[0]](this, cls[1], cls[2]);
				}
				return false;
			});
		}
	}
	o.attr('clickadd','true');
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
js.initedit = function(id,can){
	var cans = js.apply({
		resizeType : 0,
		allowPreviewEmoticons : false,
		allowImageUpload : true,
		formatUploadUrl:false,
		uploadJson:'mode/kindeditor/kindeditor_upload.php',
		allowFileManager:true,
		items : ['fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
			'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
			'insertunorderedlist', '|','image', 'link','unlink','|','source','clearhtml','fullscreen'],
		blur:function(){
			
		}
	},can);
	
	var editorobj = KindEditor.create('#'+id+'', cans);	
	return editorobj;
}