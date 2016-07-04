<?php
class fileClassModel extends Model
{
	public function getfile($mtype, $mid)
	{
		$rows	= $this->getall("`mtype`='$mtype' and `mid`='$mid' order by `id`",'id,filename,filesizecn,filesize,fileext');
		return $rows;
	}
	
	public function addfile($fileid, $mtype, $mid)
	{
		if(!$this->isempt($fileid)){
			$this->update("`mtype`='$mtype',`mid`='$mid'", "`id` in($fileid)");
		}
	}
	
	public function getstr($mtype, $mid, $lx=0)
	{
		$filearr 	= $this->getfile($mtype, $mid);
		$fstr		= '';
		foreach($filearr as $k=>$rs){
			if($k>0)$fstr.='<br>';
			$str = $this->rock->jm->strrocktoken(array('a'=>'down','id'=>$rs['id']));
			$url = ''.URL.'?rocktoken='.$str.'';
			$str = 'href="'.$url.'" target="_blank"';
			if($lx==1)$str='href="javascript:" onclick="return js.downshow('.$rs['id'].')"';
			$fstr .='<img src="'.URL.'web/images/fileicons/'.$rs['fileext'].'.gif" align="absmiddle" height=16 width=16> <a '.$str.' style="color:blue"><u>'.$rs['filename'].'</u></a> ('.$rs['filesizecn'].')';
		}
		return $fstr;
	}
	
	public function getfiles($mtype, $mid)
	{
		$rows		= $this->getall("`mtype`='$mtype' and `mid`='$mid' order by `id`");
		foreach($rows as $k=>$rs){
			$rows[$k]['status'] = 4;
		}
		return $rows;
	}
	
	public function copyfile($mtype, $mid)
	{
		$rows	= $this->getall("`mtype`='$mtype' and `mid`='$mid' order by `id`");
		$arr 	= array();
		foreach($rows as $k=>$rs){
			unset($rs['id']);
			$inuar = $rs;
			$inuar['adddt'] 	= $this->rock->now;
			$inuar['optid'] 	= $this->adminid;
			$inuar['optname'] 	= $this->adminname;
			$inuar['downci'] = '0';
			$inuar['mtype'] = '';
			$inuar['mid'] = '0';
			$this->insert($inuar);
			$inuar['id'] = $this->db->insert_id();
			$inuar['status'] = 4;
			$arr[] = $inuar;
		}
		return $arr;
	}
	
	public function delfile($sid='', $where='')
	{
		if($sid!='')$where = "`id` in ($sid)";
		if($where=='')return;
		$rows 	= $this->getall($where, 'filepath,thumbpath');
		foreach($rows as $k=>$rs){
			$path = $rs['filepath'];
			if(!$this->isempt($path) && file_exists($path))unlink($path);
			$path = $rs['thumbpath'];
			if(!$this->isempt($path) && file_exists($path))unlink($path);
		}
		$this->delete($where);
	}
	
	public function show($id)
	{
		if($id==0)exit('Sorry!');
		$rs	= $this->getone($id);
		if(!$rs)exit('504 Not find files');
		$this->update("`downci`=`downci`+1", $id);
		
		$filepath	= $rs['filepath'];
		if(!file_exists($filepath))exit('404 Not find files');
		$filename	= $rs['filename'];
		$filesize 	= $rs['filesize'];
		if($rock->contain($filepath,'http')){
			header('location:'.$filepath.'');
		}else{
			if(substr($filepath,-4)=='temp'){
				header('Content-type:application/vnd.ms-excel');
				header('Content-type: text/plain');
				header('Accept-Ranges: bytes');
				header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
				header('Pragma: no-cache');
				header('Expires: 0');
				header('Content-disposition:attachment;filename='.iconv("utf-8","gb2312",str_replace(' ','',$filename)).'');
				$content	= file_get_contents($filepath);
				echo base64_decode($content);
			}else{
				header('location:'.$filepath.'');
			}
		}
	}
}