<?php
@session_start();
if(!ini_get('date.timezone') )date_default_timezone_set('Asia/Shanghai');
header('Content-Type:text/html;charset=utf-8');
define('ROOT_PATH',str_replace('\\','/',dirname(dirname(__FILE__))));
define('DEBUG', true);
include_once(''.ROOT_PATH.'/include/rockFun.php');
include_once(''.ROOT_PATH.'/include/Chajian.php');
include_once(''.ROOT_PATH.'/include/class/rockClass.php');
$rock 		= new rockClass();
$db			= null;		
$smarty		= false;
define('HOST', $rock->host);
define('REWRITE', 'true');
if(!defined('PROJECT'))define('PROJECT', $rock->get('p', 'webmain'));
if(!DEBUG)error_reporting(0);
$config		= array(
	'title'		=> '信呼',
	'url'		=> 'http://'.HOST.'/app/xinhu/',
	'urly'		=> 'http://xinhu.pw/',
	'db_host'	=> '',
	'db_user'	=> '',
	'db_pass'	=> '',
	'db_base'	=> '',
	'perfix'	=> '',
	'qom'		=> '',
	'highpass'	=> '',
	'install'	=> false,
	'version'	=> require('version.php'),
	'path'		=> 'index',
	'dbencrypt'	=> false,
	'db_drive'	=> 'mysqli'
);

$_confpath		= $rock->strformat('?0/?1/?1Config.php', ROOT_PATH, PROJECT);
if(file_exists($_confpath)){
	$_tempconf	= require($_confpath);
	foreach($_tempconf as $_tkey=>$_tvs)$config[$_tkey] = $_tvs;
}

define('TITLE', $config['title']);
define('URL', $config['url']);
define('URLY', $config['urly']);
define('PATH', $config['path']);

define('DB_DRIVE', $config['db_drive']);
define('DB_HOST', $config['db_host']);
define('DB_USER', $config['db_user']);
define('DB_PASS', $config['db_pass']);
define('DB_BASE', $config['db_base']);

define('PREFIX', $config['perfix']);
define('QOM', $config['qom']);
define('VERSION', $config['version']);
define('HIGHPASS', $config['highpass']);
define('SYSURL', ''.URL.PATH.'.php');
$rock->initRock();