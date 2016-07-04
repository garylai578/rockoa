<?php 
include_once('../../config/config.php');
if($rock->adminid==0)exit('sorry not sign');
$title		= $rock->get('title');
$title		= $rock->jm->base64decode($title);

$callback	= $rock->get('callback');
$aid		= $rock->get('aid');
$imgsizearr = explode('x',$rock->get('imgsize'));
$imgsizearr = explode('x',$rock->get('imgsize'));
$w			= $imgsizearr[0];
$h			= $imgsizearr[1];
$imgurl		= $rock->get('imgurl');
$thumimg	= $rock->get('thumimg');
$imgurlabc	= '';
$imgurlcz	= '';

if(!$imgurl){
	
}else{
	$imgurlcz='../../'.$imgurl.'';
	$imgurl='../../'.$imgurl.'';
	if(!file_exists($imgurl)){
		$imgurl='';
		$imgurlcz='';
	}
	$imgurlabc=$imgurl;
}
if(!$thumimg){
	$thumimg=$imgurl;
}else{
	$thumimg='../../'.$thumimg;
}
$thumimgshow	= $thumimg;
if(!$thumimgshow)$thumimgshow='../../images/white.gif';
?>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../css/css.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="../../js/jquery.js"></script>
<script language="javascript" src="../../js/js.js"></script>
<title><? echo $title?></title>
<style type="text/css">
*{ font-size:12px}
</style>
<script language="javascript">
<?php 
$w1=$w;$h1=$h;
$bili1=1;
if($w1>=480){
	$bili1=480/$w1;
	$w1=480;
}
$h1=$bili1*$h;
?>
var cropwidth=<?php echo $w1?>;
var cropheight=<?php echo $h1?>;
var cropresize=false;
var imgurl='<?php echo $imgurlabc?>';
var thumimg='<?php echo $thumimg?>';
var aaaaid = '<?php echo $aid?>';

function showface(img){
	thumimg=img;
	get('shouimg').src=thumimg;
}

function initifrabc(){
	get("upfilew").value=iframecrop.scr.oldwidth;
	get("upfileh").value=iframecrop.scr.oldheight;
	get("upfilesize").value=iframecrop.scr.oldsize;	
}

function okque(yuan){
	var yuanval = iframecrop.scr.path;
	var oldwidth= get("upfilew").value;
	var oldheight= get("upfileh").value;
	var oldsize= get("upfilesize").value;
	var souval = thumimg;
	if(yuan)souval=yuanval;
	var val=souval+'|'+yuanval+'|'+oldsize+'x'+oldwidth+'x'+oldheight+'';
	val=val.replace(/\.\.\//gi,'');
	window.returnValue = val;
	<?php 
	if($callback!='')echo 'opener.'.$callback.'(val, aaaaid);';
	?>
	window.close();		
}
function del(){
	var val='||';
	window.returnValue = val;
	
	<?php 
	if($callback!='')echo 'opener.'.$callback.'(val, aaaaid);';
	?>
	window.close();		
}
</script>
<?php 
$bili=1;
if($w>170){
	$bili=170/$w;
	$w=170;
}
$h=$bili*$h;
?>
</head>
<body style="overflow:hidden; padding:5px">
<center>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="500">
  <iframe width="500" height="350" frameborder="0" id="ifrautoface" name="iframecrop" scrolling="no" marginheight="0" marginwidth="0" src="crop.php?imgurl=<?php echo $imgurlcz?>&rotate=0" onload="initifrabc()"></iframe>  
    </td>
    <td align="center" valign="top">
    <div style="height:10px"></div>
    <img src="<?php echo $thumimgshow?>" id="shouimg" width="<?php echo $w?>" height="<?php echo $h?>" style="border:1px #cccccc solid; padding:2px; background-color:#ffffff"><br>
    <div>截取的规格：<?php echo $rock->get('imgsize')?></div>
    <div style="height:20px; overflow:hidden"></div>
    <div>
    <fieldset style="margin:5px;width:180px">
    <legend>原图属性</legend>
    <div align="left" style="padding:8px">
   <div>宽×高 <input class="inputys1" id="upfilew" style="width:40px" readonly maxlength="5">×<input class="inputys1"  id="upfileh" style="width:40px" maxlength="5" readonly></div>
    <div>大小：<input class="inputys1" id="upfilesize"  style="width:50px" readonly>KB</div>
   </div>
    </fieldset>  
    </div>
    <div style="height:20px; overflow:hidden"></div>
<table width="150" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="50%" align="center"><button type="button" style="width:50px" onClick="okque()" id="AltT">确定</button></td>
    <td width="50%" align="center"><button type="button" style="width:70px" onClick="okque(true)" id="AltY">用原图</button></td>
  </tr>
  <tr><td colspan="2" height="10"></td></tr>
  <tr>
    <td width="50%" align="center"><button type="button" style="width:50px" onClick="del(true)" id="AltY">删除</button></td>
    <td width="50%" align="center"><button id="AltQ" type="button" style="width:50px" onClick="window.close()">取消</button></td>
  </tr>  
</table>
    </td>
  </tr>
</table>


</center>
</body>
</html>