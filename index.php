<?php 
/**
	入口
	主页：http://www.rockoa.com
	作者：雨中磐石(rainrock)
*/
include_once('config/config.php');
$m			= $rock->jm->gettoken('m', 'index');
$d			= $rock->jm->gettoken('d');
$a			= $rock->jm->gettoken('a', 'default');
$ajaxbool	= $rock->jm->gettoken('ajaxbool', 'false');
$mode		= $rock->get('m', $m);
if(!$config['install'] && $mode != 'install')$rock->location('?m=install');//可删除判断是否有安装的
include_once('include/View.php');