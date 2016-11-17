<?php
class cogClassAction extends Action
{
	public function sysinfoAjax()
	{
		$fields = array(
			'title'	=> '系统名称',
			'url'	=> '系统URL地址',
			'localurl'	=> '系统本地地址',
			'taskurl'	=> '任务地址',
			'db_drive'	=> '操作数据库驱动',
			'version'	=> '版本',
			'phpos'		=> '服务器',
			'phpver'	=> 'PHP版本',
			'mysqlver'	=> 'mysql版本',
			'SERVER_SOFTWARE'	=> 'web服务器',
			'upload_max_filesize'	=> '最大上传大小',
			'post_max_size'	=> 'POST最大',
			'memory_limit'	=> '使用最大内存',
			'curl'			=> '是否支持CURL'
			
		);
		
		$data = array(
			'title'	=> getconfig('title'),
			'url'	=> getconfig('url'),
			'localurl'	=> getconfig('localurl'),
			'taskurl'	=> getconfig('taskurl'),
			'db_drive'	=> getconfig('db_drive'),
			'version'	=> '信呼V'.VERSION.'',
			'phpos'	=> PHP_OS,
			'phpver'	=> PHP_VERSION,
			'mysqlver'	=> $this->db->getsyscount('version'),
			'SERVER_SOFTWARE'	=> $_SERVER['SERVER_SOFTWARE'],
			'upload_max_filesize'	=> ini_get('upload_max_filesize'),
			'post_max_size'			=> ini_get('post_max_size'),
			'memory_limit'			=> ini_get('memory_limit'),
			
		);
		if(!function_exists('curl_init')){
			$data['curl'] = '<font color=red>不支持</font>';
		}else{
			$data['curl'] = '<font color=green>支持</font>';
		}
		
		$this->returnjson(array(
			'fields' => $fields,
			'data' 	=> $data,
		));
	}
	
	public function getinfoAjax()
	{
		$arr['title'] 		= getconfig('title');
		$arr['url'] 		= getconfig('url');
		$arr['localurl'] 	= getconfig('localurl');
		$arr['apptitle'] 	= getconfig('apptitle');
		$arr['asynkey'] 	= getconfig('asynkey');
		$arr['openkey'] 	= getconfig('openkey');
		$arr['db_drive'] 	= getconfig('db_drive');
		$arr['asynsend'] 	= getconfig('asynsend') ? '1' : '0';
		$arr['sqllog'] 		= getconfig('sqllog') ? '1' : '0';
		$this->returnjson($arr);
	}
	
	public function savecongAjax()
	{
		if(getconfig('systype')=='demo')exit('演示上禁止设置');
		if($this->getsession('isadmin')!='1')exit('非管理员不能操作');
		
		$puurl 			= $this->option->getval('reimpushurlsystem',1);
		
		$_confpath		= $this->rock->strformat('?0/?1/?1Config.php', ROOT_PATH, PROJECT);
		$arr 			= require($_confpath);
		
		$title 			= $this->post('title');
		if(!isempt($title))$arr['title'] = $title;
		
		$url 			= $this->post('url');
		if(!isempt($url))$arr['url'] = $url;
		
		$apptitle 			= $this->post('apptitle');
		if(!isempt($apptitle))$arr['apptitle'] = $apptitle;
		
		$asynkey 			= $this->post('asynkey');
		if(!isempt($asynkey))$arr['asynkey'] = $asynkey;
		
		$db_drive 			= $this->post('db_drive');
		if(!isempt($db_drive)){
			if($db_drive=='mysql' && !function_exists('mysql_connect'))exit('未开启mysql扩展模块');
			if($db_drive=='mysqli' && !class_exists('mysqli'))exit('未开启mysqli扩展模块');
			if($db_drive=='pdo' && !class_exists('PDO'))exit('未开启pdo扩展模块');
			$arr['db_drive'] = $db_drive;
		}
		
		$arr['localurl'] = $this->post('localurl');
		$arr['openkey']  = $this->post('openkey');
		
		$asynsend 		 = $this->post('asynsend');
		$arr['asynsend'] = $asynsend=='1';
		
		$arr['sqllog'] 	 = $this->post('sqllog')=='1';
		
		if($asynsend == '1' && isempt($puurl))exit('未安装或开启服务端不能使用异步发送消息');
		
		$str1 = '';
		foreach($arr as $k=>$v){
			if(is_bool($v)){
				$v = $v ? 'true' : 'false';
			}else{
				$v = "'$v'";
			}
			$str1.= "	'$k'	=> $v,\n";
		}
		
		$str = '<?php
//['.$this->adminname.']在'.$this->now.'通过[系统→系统工具→系统设置]，保存修改了配置文件
return array(
'.$str1.'
);';
		@$bo = file_put_contents($_confpath, $str);
		if($bo){
			echo 'ok';
		}else{
			echo '保存失败无法写入：'.$_confpath.'';
		}
	}
}