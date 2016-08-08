<?php
include_once('../../config/config.php');
if(!$_POST)exit('Sorry!,send');
if($rock->adminid==0)exit('sorry not sign');
$now		= $rock->now();
$action		= $rock->get('action');
if($action != 'send')exit('Sorry!');
$savepath	= '';
$maxwidth	= 0;
$thumbtype	= 0;//缩略图类型0可能去掉看不到的默认， 1整图缩略可以看到白边

$sendci		= (int)$rock->post('sendci')+1;
$maxsend	= (int)$rock->post('maxsend');
$maxwidth	= (int)$rock->post('maxwidth');
$thumbtype	= (int)$rock->post('thumbtype');
$sendcont	= $rock->post('sendcont');
$savetype	= $rock->post('savetype','temp');
$filename	= $rock->post('filename');
$filetype	= $rock->post('filetype');
$fileext	= trim($rock->post('fileext'));
$filesize	= $rock->post('filesize');
$filesizecn	= $rock->post('filesizecn');
$newfile	= $rock->post('newfile');
$mkdir		= date('Y-m');
$savepath	= $rock->post('savepath');
$thumbnail	= $rock->post('thumbnail');

$smkdir		= '../../upload/'.$mkdir.'';
if(!file_exists($smkdir))mkdir($smkdir);
$allfile	= ''.$smkdir.'/'.$newfile.'';
$tempfile	= $allfile.'.temp';
$filepath	= substr($tempfile,3);
$thumbpath	= '';//所累图地址
$width		= 0;
$height		= 0;

$fc	= fopen($tempfile, 'a');
fwrite($fc,$sendcont);
fclose($fc);
$id	= 0;
if($sendci==$maxsend){
	
	$optid	= $rock->adminid;
	$imgext	= '|jpg|gif|png|jpeg|bmp|';
	$boolc	= $rock->contain($imgext, '|'.$fileext.'|');
	$ztfile	= $imgext.'doc|docx|xls|xlsx|ppt|pptx|pdf|swf|rar|zip|txt|gz|wav|mp3|wma|chm|';
	$botxtl	= $rock->contain($ztfile,'|'.$fileext.'|');
	$savepath = '';
	$boolc1	= $rock->isempt($savepath);
	if(!$boolc1 && $optid==0)$boolc1 = true;

	$izztbo = false;
	if(!$boolc1 || $botxtl)$izztbo = true;

	if($izztbo){
		$content	= file_get_contents($tempfile);
		$temp1file	= ''.$allfile.'.'.$fileext.'';
		$a64basec	= base64_decode($content);
		
		if(!$boolc1){
			file_put_contents(ROOT_PATH.''.$savepath.''.iconv('utf-8','gb2312',$filename).'', $a64basec);
			unlink($tempfile);
		}else{
			file_put_contents($temp1file, $a64basec);
			unlink($tempfile);
			if($boolc){
				list($width, $height) = getimagesize($temp1file);
				if($rock->isempt($width)){
					$width = 0;
					$height = 0;
				}
			}
		}
		$filepath	= substr($temp1file,3);	
	}
	$filepath	= str_replace('../','',$filepath);
	$thumbpath	= $filepath;
	
	//图片，图片缩略图
	if($boolc && !$rock->isempt($thumbnail)){
		$imgaa	= c('image', true);
		$imgaa->createimg('../../'.$filepath.'');
		$sttua	= explode('x', $thumbnail);
		$thumbpath 	= $imgaa->thumbnail((int)$sttua[0], (int)$sttua[1], $thumbtype);
	}
	if($boolc && $maxwidth >0){
		if($width > $maxwidth){
			$imgac	= c('image', true);
			$imgac->createimg('../../'.$filepath.'');
			$souwid	= $maxwidth;
			$souhei	= (int)$maxwidth/$width * $height;
			$thumbpath 	= $imgac->thumbnail($souwid, $souhei, $thumbtype);
		}
	}
	$thumbpath	= str_replace('../','',$thumbpath);

	
	$arr	= array(
		'adddt'	=> $now,
		'valid'	=> 1,
		'filename'	=> $filename,
		'fileext'	=> $fileext,
		'filesize'	=> $filesize,
		'filesizecn'=> $filesizecn,
		'filepath'	=> $filepath,
		'thumbpath'	=> $thumbpath,
		'optid'		=> $optid,
		'optname'	=> $rock->adminname,
		'ip'		=> $rock->ip,
		'web'		=> $rock->web
	);
	$db	= import(DB_DRIVE);
	$db->record(''.PREFIX.'file',$arr);
	$id	= $db->insert_id();
}
echo '{success:true, msg:"'.$id.'",filepath:"'.$filepath.'", sendci:'.$sendci.', thumbpath:"'.$thumbpath.'",width:'.$width.',height:'.$height.'}';