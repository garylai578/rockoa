//初始函数
function initbodys(){
	
	c.onselectdata['sheng'] = function(d){
		if(!d.shengname)return;
		if(form('sheng'))form('sheng').value = d.shengname;
		if(form('shi'))form('shi').value = d.cityname;
	}
}


function changesubmit(){
	var jg = parseFloat(form('discount').value);
	if(jg<0 || jg > 1) return  '折扣率区间是[0,1]';
}