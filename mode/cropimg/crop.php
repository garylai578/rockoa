<?php
ini_set("memory_limit", "60M"); //设置内存否则无法生成大图
include_once('../../config/config.php');
if($rock->adminid==0)exit('sorry not sign');
$scr = c('image',true);	//引入image插件



$imgurl=$rock->get('imgurl');   	//图片地址
$rotate=$rock->get('rotate','0'); 	//旋转角度
$action=$rock->get('action');




//截图
if($action=='crop'){
	
	$scr->createimg($imgurl,$rotate);
	$bili=$_GET['bili'];
	$w=$_GET['w'];$h=$_GET['h'];$x1=$_GET['x1'];$y1=$_GET['y1'];
	$img=$scr->img;
	$width  = $scr->w;
    $height = $scr->h;
	$new_width  = $bili*$width;
	$new_height = $bili*$height;

	
	//生成缩略图-Start
	$tmp_img = imagecreatetruecolor($new_width, $new_height);
	imagecopyresampled($tmp_img, $img, 0, 0, 0,0,$new_width, $new_height, $width, $height);//生成缩略图
	imagedestroy($img);
	$img = $tmp_img;
	
	//imagerotate();旋转
	
	$tmp_img = imagecreatetruecolor($w, $h);//创建图片
	
	imagecopyresampled($tmp_img, $img, 0, 0, $x1,$y1,$new_width, $new_height, $new_width, $new_height);//截图
	
	//$face='../../upload/'.date('Y-m').'/'.time().'_crop'.rand(10,99).'.'.$scr->ext.'';
	$face=str_replace('.'.$scr->ext.'','_crop'.rand(1000,9999).'.'.$scr->ext.'',$imgurl);//截图的文件名
	imagejpeg($tmp_img,$face,90);//保存
	
	imagedestroy($img);
	imagedestroy($tmp_img);
	echo '<script>parent.scr.caij("'.$face.'")</script>';
	exit();
}



//上传头像
if($action=='upimg'){
	$rnd=rand(1000,9000);
	$upimg	= c('upfile',true);
	$upimg->initupfile('jpg|png|gif|jpeg','../../upload|'.date('Y-m').'',1);
	$upses=$upimg->up('upfileface');
	if(is_array($upses)){
		echo '<script>parent.scr.upcg("'.$upses['allfilename'].'")</script>';
	}else{
		echo '<script>parent.scr.tishi("'.$upses.'","red")</script>';
	}	
	exit();
}

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>图片处理</title>
<script language="javascript" src="../../js/jquery.js"></script>
<script language="javascript" src="cropjs.js?rad=<?php echo time() ?>"></script>
<style type="text/css">
*{ font-size:12px; font-family:微软雅黑,Verdana, Geneva, sans-serif; padding:0px; margin:0px; }
img,a{border:0px}
#dragDiv{position:absolute;z-index:5;background-color:#000000;-moz-user-select:none; overflow:hidden}

#dragDiv div{ overflow:hidden;position:absolute; }
#rightdown{cursor:nw-resize; right:1px; bottom:1px;width:6px; height:6px;background-color:#aaaaaa;z-index:6}
#right{cursor:e-resize; right:1px; top:49%;width:6px; height:6px;background-color:#aaaaaa;z-index:6}
#down{cursor:n-resize; bottom:1px; left:49%;width:6px; height:6px;background-color:#aaaaaa;z-index:6}
#dragDivzao{ width:100%; height:100%;cursor:move; left:0px; top:0px; background-color:#ff0000; z-index:5;filter:Alpha(Opacity=0);opacity:0;-moz-user-select:none;}
.drborder{ overflow:hidden; position:absolute; z-index:4;}
.drtop{ height:1px; left:0px; top:0px; width:100%;background:url(img/marqueeHoriz.gif)}
.drleft{ height:100%; left:0px; top:0px; width:1px; background:url(img/marqueeVert.gif)}
.drright{ height:100%; right:0px; top:0px; width:1px;background:url(img/marqueeVert.gif)}
.drbottom{ height:1px; left:0px; bottom:0px; width:100%;background:url(img/marqueeHoriz.gif)}

button{ cursor:pointer}
.divbtn{ position:absolute; left:0px; top:0px; padding:2px 3px; text-align:left; z-index:10;}
.divbtn1{ left:0px; top:0px;background-color:#ffffff;filter:Alpha(Opacity=50);opacity:0.5; position:absolute; z-index:9; height:22px; width:300px}
#movediv{ width:100%; height:100%; overflow:hidden; background-color:#000000; position:absolute; left:0px; top:0px; z-index:1;filter:Alpha(Opacity=50);opacity:0.5;-moz-user-select:none;}
#optimg{ position:absolute;z-index:0}

#liangdivimg{position:absolute; left:0px; top:-0px;-moz-user-select:none; z-index:2}

a:link,a:visited {TEXT-DECORATION:none;color:#005eb5}
a:hover{TEXT-DECORATION:underline;color:#ff0000;}
.toolbar{ text-align:left;height:25px; overflow:hidden; background-color:#dddddd}
#divjin{ width:160px; height:10px; background-color:#ffffff; border:1px #888888 solid; overflow:hidden; position:absolute; left:0px; top:6px; text-align:left}
#huakuai{ background-color:#bbbbbb; height:10px; width:50px; border-right:1px #aaaaaa solid; color:#ffffff; line-height:9px; font-size:9px; text-align:center; cursor:default}
#divbtnchange{ width:84px; height:22px; overflow:hidden; line-height:23px; background:url(img/changeimg.gif); color:#666; text-align:right; display:none; z-index:20;position:absolute; left:40%;top:40%}
#divupimg{height:22px; width:84px; position:absolute; overflow:hidden; background-color:#999;left:40%;top:40%;text-align:left;filter:Alpha(Opacity=0);opacity:0;z-index:21; display:none}

#divmsg{width:100%; position:absolute; left:0px; top:-30px; z-index:22; background-color:#FFC; padding:5px 5px;filter:Alpha(Opacity=80);opacity:0.8; text-align:left;} 
.imgbgzong{background:url(img/cropbg.gif)}
.imgbgzonga{ background-color:#000000}
</style>
</head>
<body style="background-color:#ffffff;" scroll="no" onselectstart="return false">
<center>
<?php
$vieww	= (int)$rock->get('vieww',500);
$viewh	= (int)$rock->get('viewh',350);

$w		= $vieww;
$h		= $viewh;

$scr->createimg($imgurl,$rotate);
$arr=$scr->imgwh($w,$h-25);
//;
?>


<div id="mainzongdiv" style="width:<?php echo $w?>px; height:<?php echo $h?>px; overflow:hidden">

    <div id="zongdiv" style="width:<?php echo $w?>px; height:<?php echo $h-25?>px; overflow:hidden; position:relative;" class="imgbgzong">
    	<div id="divmsg">&nbsp;</div>
        <img src="cropload.php?path=<? echo $imgurl?>&rotate=<?php echo $rotate?>&rnd=<?php echo time()?>" id="optimg" style="left:0px; top:0px;" width="<?php echo $arr[0]?>" height="<?php echo $arr[1]?>">
        <div id="movediv" onmouseDown="scr.moveimg(event)"></div>
        
        <div id="dragDiv">
        	<img src="cropload.php?path=<? echo $imgurl?>&rotate=<?php echo $rotate?>&rnd=<?php echo time()?>" id="liangdivimg" style="left:0px; top:0px;" width="<?php echo $arr[0]?>" height="<?php echo $arr[1]?>">
            
        	<div id="dragDivzao"  onmouseDown="scr.move('dragDiv',event)"></div>
            <div id="down" onMouseDown="scr.resize('d',event)"></div>
            <div id="right" onMouseDown="scr.resize('r',event)"></div>
            <div id="rightdown" onMouseDown="scr.resize('rd',event)"></div>
            
            <div class="drborder drtop"></div>
            <div class="drborder drleft"></div>
            <div class="drborder drright" id="drright"></div>
            <div class="drborder drbottom" id="drbottom"></div>
        </div>
        
       
        <div id="divbtnchange"><a href="javascript:" onclick="scr.changeimg();return false">选择图片</a>&nbsp;&nbsp;</div>
        <div id="divupimg">
        <form action="crop.php?action=upimg" method="post" name="upfrom" target="ifrfrom" enctype="multipart/form-data">
        <span id="spanupfile"><input name="upfileface" id="fileface" style="cursor:pointer; position:absolute; right:0px"  onchange="return scr.changeface(this)" type="file" ></span>
        </form>
        </div>
        
    </div>
<div class="toolbar">
<table  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="25" width="45" align="center" id="tdbtn1"><a href="javascript:" onClick="scr.change(0);return false" title="查看原来图片大小"><img src="img/pi.gif" align="absmiddle">原图</a></td>
    <td width="45" align="center" id="tdbtn2"><a href="javascript:" onClick="scr.change(3);return false" title="恢复初始状态"><img src="img/pigo.gif" align="absmiddle">恢复</a></td>
    <td width="45" align="center" id="tdbtn3"><a href="javascript:" onClick="scr.rechange();return false" title="重新旋转图片"><img src="img/cx.gif" align="absmiddle">重选</a></td>
    <td width="45" align="center" id="tdbtn4"><a href="javascript:" onClick="return scr.rotatefun('+')" title="左转"><img src="img/xz1.gif" align="absmiddle">左转</a></td>
    <td width="45" align="center" id="tdbtn5"><a href="javascript:" onClick="return scr.rotatefun('-')" title="右转"><img src="img/xz2.gif" align="absmiddle">右转</a></td>
    <td width="22" align="center" id="tdbtn6"><a href="javascript:" onClick="scr.change(2);return false" title="缩小图片"><img src="img/fx.gif" align="absmiddle"></a></td>
    <td width="162" valign="top" id="tdbtn7">
    <div style="position:relative">
    <div id="divjin" onclick="scr.huak(event)"><div id="huakuai" style="width:0px">0%</div></div>
    </div>
    </td>
    <td width="22" align="center" id="tdbtn8"><a href="javascript:" onClick="scr.change(1);return false" title="放大图片"><img src="img/fd.gif" align="absmiddle"></a></td>  
    <td width="65" align="center" id="tdbtn9"><a href="javascript:" onClick="scr.caijian();return false" title="确定裁剪"><img src="img/cut.gif" align="absmiddle">确定裁剪</a></td>
  </tr>
</table>
</div>

</div>
<div style="position:absolute; height:0px; overflow:hidden"><iframe name="ifrfrom" id="chuifrfrom"></iframe></div>



<script language="javascript">
//初始化加载
scr.bili=<?php echo $arr[2];?>;
scr.oldwidth='<?php echo $scr->w;?>';
scr.oldheight='<?php echo $scr->h;?>';
scr.oldsize='<?php echo $scr->size;?>';
scr.oldbili=scr.bili;
scr.path='<?php echo $imgurl?>';
scr.rotate='<?php echo $rotate?>';
scr.vieww=<?php echo $vieww;?>;
scr.viewh=<?php echo $viewh;?>;
var wsize=120;
var hsize=120;
var whresize=false;
var viewbool=true;
try{
	if(parent.cropwidth)wsize=parent.cropwidth;
	if(parent.cropheight)hsize=parent.cropheight;
	if(parent.cropresize)whresize=parent.cropresize;
	viewbool=parent.cropviewbool;
}catch(e){}
scr.init(wsize,hsize,whresize);
</script>
</center>
</body>
</html>