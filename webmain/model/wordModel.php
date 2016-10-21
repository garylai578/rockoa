<?php
class wordClassModel extends Model
{
	public function getfolderid($uid)
	{
		$num = "folder".$uid."";
		$id  = m('option')->setval($num,'','文件夹目录');
		return $id;
	}
	
	public function getfoldrows($uid)
	{
		$pid 	= $this->getfolderid($uid);
		$rows 	= $this->getfoldrowsss($pid);
		return $rows;
	}
	
	private function getfoldrowsss($pid)
	{
		$rows 	= $this->db->getall("select `id`,`pid`,`name`,`optdt`,`sort` from [Q]option where `pid`='$pid' and `valid`=1 order by `sort`,`id`");
		foreach($rows as $k=>$rs){
			$rows[$k]['expanded']	= true;
			$rows[$k]['children'] 	= $this->getfoldrowsss($rs['id']);
		}
		return $rows;
	}
}