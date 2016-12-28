<?php 
class indexClassAction extends Action{
	
	public function defaultAction()
	{
		$afrom 			= $this->get('afrom');
		$this->tpltype	= 'html';
		$my			= $this->db->getone('[Q]admin', "`id`='$this->adminid'",'`face`,`id`,`name`,`ranking`,`deptname`,`type`,`style`');
		$allmenuid	= m('sjoin')->getuserext($this->adminid, $my['type']);
		
		$mewhere	= '';
		$isadmin	= 1;
		$myext		= $allmenuid;
		if($myext != '-1'){
			$isadmin	= 0;	
			$mewhere	= ' and `id` in('.str_replace(array('[',']'), array('',''), $myext).')';
		}
		$this->rock->savesession(array(
			'adminallmenuid'	=> $allmenuid,
			'isadmin'			=> $isadmin
		));
		$this->smartydata['topmenu'] 	= m('menu')->getall("`pid`=0 and `status`=1 $mewhere order by `sort`");
		
		
		
		$this->smartydata['showkey']	= $this->jm->base64encode($this->jm->getkeyshow());
		$this->smartydata['my']			= $my;
		$this->smartydata['afrom']		= $afrom;
		$this->smartydata['face']		= $this->rock->repempt($my['face'], 'images/noface.png');
		$this->smartydata['style']		= $this->rock->repempt($my['style'], '0');
	}
	
	private function menuwheres()
	{
		$this->menuwhere = '';
		$myext	= $this->getsession('adminallmenuid');
		if($myext != '-1'){	
			$this->menuwhere	= ' and `id` in('.str_replace(array('[',']'), array('',''), $myext).')';
		}
	}
	
	/**
	*	搜索菜单
	*/
	public function getmenusouAjax()
	{
		$key = $this->post('key');
		$this->menuwheres();
		$this->addmenu = m('menu')->getall("`status`=1 $this->menuwhere and `name` like '%$key%' and ifnull(`url`,'')<>'' order by `pid`,`sort` limit 10",'`id`,`num`,`url`,`icons`,`name`,`pid`');
		$arr	= $this->getmenu(0, 1);
		$this->returnjson($arr);
	}
	
	/**
	*	获取菜单
	*/
	public function getmenuAjax()
	{
		$pid 	= $this->get('pid');
		$this->menuwheres();
		$this->addmenu = m('menu')->getall("`status`=1 $this->menuwhere order by `sort`,`id`",'`id`,`num`,`url`,`icons`,`name`,`pid`');
		$arr	= $this->getmenu($pid,0);
		$this->returnjson($arr);
	}
	
	private function getmenu($pid, $lx=0)
	{
		$menu	= $this->addmenu;
		$rows	= array();
		foreach($menu as $k=>$rs){
			if($lx == 0 && $pid != $rs['pid'])continue;
			$num			= $rs['num'];
			$sid			= $rs['id'];
			$icons			= $rs['icons'];
			if(isempt($num))$num 		= 'num_'.$sid;
			if(isempt($icons))$icons 	= 'bookmark-empty';
			$rs['icons']	= $icons;
			$rs['num']		= $num;
			if($lx == 0){
				$children		= $this->getmenu($sid);
				$rs['children']	= $children;
				$rs['stotal']	= count($children);
			}else{
				$rs['stotal']	= 0;
			}
			$rows[] = $rs;
		}
		return $rows;
	}
	
	public function downAction()
	{
		$this->display = false;
		$id  = (int)$this->jm->gettoken('id');
		m('file')->show($id);
	}
	
	/**
	*	单页显示
	*/
	public function showAction()
	{
		$url 	= $this->get('url');
		if($url=='')exit('无效请求');
		$this->defaultAction();
	}
	
	/**
	*	获取模版文件
	*/
	public function getshtmlAction()
	{
		$surl = $this->jm->base64decode($this->get('surl'));
		if(isempt($surl))exit('not found');
		$file = ''.P.'/'.$surl.'.php';
		if(!file_exists($file))$file = ''.P.'/'.$surl.'.shtml';
		if(!file_exists($file))exit('404 not found '.$surl.'');
		$this->displayfile = $file;
	}
}