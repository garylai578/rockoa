<?php 
ini_set("memory_limit", "60M"); //设置内存否则无法生成大图
header("Content-type:image/*");
$path=@$_GET['path'];
if(empty($path))$path='img/white.gif';

$rotate=@$_GET['rotate']; //旋转角度
if(empty($rotate))$rotate=0;
$ext=strtolower(substr($path,strrpos($path,'.')+1));//文件扩展名
switch ($ext){
	case 'gif':
		$img=imagecreatefromgif($path);
	break;
	case 'png':
		$img=imagecreatefrompng($path);
	break;
	default:
		$img=imagecreatefromjpeg($path);
	break;	
}
$white=imagecolorallocate($img,255,255,255);
if($rotate!=0&&$rotate<360&&$rotate>-360){
	$img=imagerotate($img,$rotate,$white);//旋转
}

imagejpeg($img);
imagedestroy($img);
