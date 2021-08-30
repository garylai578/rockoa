<?php
if(!defined('HOST'))die('not access');
//[管理员]在2018-04-04 17:26:32通过[系统→系统工具→系统设置]，保存修改了配置文件
return array(
	'url'	=> 'http://oa1.xingheoa.com/',	//系统URL
	'localurl'	=> '',	//本地系统URL，用于服务器上浏览地址
	'title'	=> '星河协同办公系统',	//系统默认标题
	'apptitle'	=> '星河OA',	//APP上或PC客户端上的标题
	'db_host'	=> 'bdm260329247.my3w.com',	//数据库地址
	'db_user'	=> 'bdm260329247',	//数据库用户名
	'db_pass'	=> 'Garylai2018',	//数据库密码
	'db_base'	=> 'bdm260329247_db',	//数据库名称
	'db_engine'	=> 'MyISAM',
	'perfix'	=> 'xinhu_',	//数据库表名前缀
	'qom'	=> 'xinhu_',	//session、cookie前缀
	'highpass'	=> '',	//超级管理员密码，可用于登录任何帐号
	'db_drive'	=> 'mysqli',	//操作数据库驱动有mysql,mysqli,pdo三种
	'randkey'	=> 'vseijdacfphwozukrbnqgylmtx',	//系统随机字符串密钥
	'asynkey'	=> 'fc1bcd2afd8e9768a91485e53d0bc8d0',	//这是异步任务key
	'openkey'	=> 'a97c20d26302d49cb7d40b0e14c495bd',	//对外接口openkey
	'updir'	=> 'upload',
	'sqllog'	=> false,	//是否记录sql日志保存upload/sqllog下
	'asynsend'	=> '0',	//是否异步发送提醒消息，0同步，1自己服务端异步，2官网VIP用户异步
	'install'	=> true,	//已安装，不要去掉啊
	'reimtitle'	=> '',	//REIM即时通信上标题
	'xinhukey'	=> '',	//信呼官网key，用于在线升级使用
	'bcolorxiang'	=> '',	//单据详情页面上默认展示线条的颜色
	'debug'	=> true,	//为true调试开发模式,false上线模式
	'reim_show'	=> true,	//首页是否显示REIM
	'mobile_show'	=> true,	//首页是否显示手机版


);