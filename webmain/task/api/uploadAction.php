<?php 
set_time_limit(0);
header('Access-Control-Allow-Origin: *');
class uploadClassAction extends apiAction
{
	public function upfileAction()
	{
		if(!$_FILES)exit('sorry!');
		$upimg	= c('upfile');
		$maxsize= (int)$this->get('maxsize', 50);
		$uptypes= '|jpg|png|gif|jpeg|bmp|docx|doc|zip|rar|xls|xlsx|ppt|pptx|pdf|mp3|';
		$uptypes= '*';
		$upimg->initupfile($uptypes, 'upload|'.date('Y-m').'', $maxsize);
		$upses	= $upimg->up('file');
		$arr 	= $this->upback($upses);
		echo json_encode($arr);
	}
	
	public function upcontAction()
	{
		$cont = $this->post('content');
		if($this->isempt($cont))exit('sorry not cont');
		$cont = str_replace(' ','', $cont);
		$mkdir = 'upload/'.date('Y-m').'';
		if(!is_dir($mkdir))mkdir($mkdir);
		$allfilename	= ''.$mkdir.'/'.date('d_His').''.rand(10,99).'.png';
		$upses['oldfilename'] = '截图.png';
		$upses['fileext'] 	  = 'png';
		file_put_contents($allfilename, $this->rock->jm->base64decode($cont));
		$filesize 			  = filesize($allfilename);
		$filesizecn 		  = c('upfile')->formatsize($filesize);
		list($picw,$pich)	  = getimagesize($allfilename);
		if($picw==0||$pich==0){
			@unlink($allfilename);
			exit('error;');
		}
		$upses['filesize']	 	= $filesize;
		$upses['filesizecn']	= $filesizecn;
		$upses['allfilename']	= $allfilename;
		$upses['picw']	 		= $picw;
		$upses['pich']	 		= $pich;
		$arr = $this->upback($upses);
		echo json_encode($arr);
	}
	
	private function upback($upses)
	{
		$thumbnail 	= '150x150';
		$thumbtype	= (int)$this->get('thumbtype', 0);
		$msg 		= '';
		$data 		= array();
		if(is_array($upses)){
			$arrs	= array(
				'adddt'	=> $this->now,
				'valid'	=> 1,
				'filename'	=> $upses['oldfilename'],
				'web'		=> $this->rock->web,
				'ip'		=> $this->rock->ip,
				'fileext'	=> $upses['fileext'],
				'filesize'	=> $upses['filesize'],
				'filesizecn'=> $upses['filesizecn'],
				'filepath'	=> str_replace('../','',$upses['allfilename']),
				'optid'		=> $this->adminid,
				'optname'	=> $this->adminname
			);
			
			$thumbpath	= $arrs['filepath'];
			$sttua		= explode('x', $thumbnail);
			$lw 		= (int)$sttua[0];
			$lh 		= (int)$sttua[1];
			if($upses['picw']>$lw || $upses['pich']>$lh){
				$imgaa	= c('image', true);
				$imgaa->createimg($thumbpath);
				$thumbpath 	= $imgaa->thumbnail($lw, $lh, 1);
			}
			$arrs['thumbpath'] = $thumbpath;
			
			
			$this->db->record('[Q]file',$arrs);
			$id	= $this->db->insert_id();
			$arrs['id'] = $id;
			$arrs['picw'] = $upses['picw'];
			$arrs['pich'] = $upses['pich'];
			$data= $arrs;
		}else{
			$msg = $upses;
		}
		/*
		$this->rock->createtxt('upload/uptxt'.$this->adminid.'.txt',json_encode(array(
			'msg' => $msg,
			'data'=> $data
		)));*/
		return $data;
	}
	
	public function getfileAjax()
	{
		$cont = '';
		$path = 'upload/uptxt'.$this->adminid.'.txt';
		if(file_exists($path)){
			@$cont = file_get_contents($path);
		}
		$data = array();
		if($cont!=''){
			$arr = json_decode($cont, true);
			$msg 	= $arr['msg'];
			$data 	= $arr['data'];
			@unlink($path);
		}else{
			$msg = 'sorry,not infor!';
		}
		$this->showreturn($data, $msg);
	}
}