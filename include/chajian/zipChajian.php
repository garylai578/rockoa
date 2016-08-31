<?php 
class zipChajian extends Chajian{

	/**
	*	解压zip文件
	*/
	public function unzip($filename, $path){
		if(!function_exists('zip_open'))return 'php未开启zip模块';
		if(!file_exists($filename))return '文件不存在';
		@$resource = zip_open($filename);
		if(!$resource)return '无法打开文件';
		while ($dir_resource = zip_read($resource)){
			if(zip_entry_open($resource,$dir_resource)){
				$file_name = $path.zip_entry_name($dir_resource);
				$file_path = substr($file_name,0,strrpos($file_name, "/"));
				if(!is_dir($file_path))mkdir($file_path,0777,true);
				if(!is_dir($file_name)){
					$file_size 		= zip_entry_filesize($dir_resource);
					$file_content 	= zip_entry_read($dir_resource,$file_size);
					file_put_contents($file_name,$file_content);
				}
				
				zip_entry_close($dir_resource);
			}
		}
		
		zip_close($resource); 
		return 'ok';
	}
}