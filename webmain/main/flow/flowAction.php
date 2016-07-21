<?php
class flowClassAction extends Action
{
	public function loaddataAjax()
	{
		$id		= (int)$this->get('id');
		$data	= m('flow_set')->getone($id);
		$arr 	= array(
			'data'		=> $data
		);
		echo json_encode($arr);
	}
	
	public function loaddatacourseAjax()
	{
		$id		= (int)$this->get('id');
		$data	= m('flow_course')->getone($id);
		$arr 	= array(
			'data'		=> $data
		);
		echo json_encode($arr);
	}
	
	public function elementafter($table, $rows)
	{
		$arr = m('flow_set')->getall('id>0','`id`,`num`,`name`,`table`','sort');
		$moders = m('flow_set')->getone($this->mid);
		
		$tass 	= $moders['table'];
		$farr	= $this->db->gettablefields('[Q]'.$tass.'');
		$farrs[]= array('id'=>'','name'=>'————↓以下表('.$tass.')的字段————');
		foreach($farr as $k=>$rs){
			$farrs[]= array('id'=>$rs['name'],'name'=>''.$rs['explain'].'('.$rs['name'].')');
		}
		
		return array(
			'flowarr'=>$arr,
			'moders'=>$moders,
			'fieldsarr' => $farrs,
			'fieldstypearr'=> $this->option->getdata('flowinputtype')
		);
	}
	
	public function elementbefore($table)
	{
		$mid = (int)$this->post('mid');
		$this->mid = $mid;
		return 'and `mid`='.$mid.'';
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public function inputAction()
	{
		$setid	= $this->get('setid');
		$atype	= $this->get('atype');
		$rs 	= m('flow_set')->getone("`id`='$setid'");
		if(!$rs)exit('sorry!');
		$this->smartydata['rs'] = $rs;
		$this->title  = $rs['name'].'_录入页面设置';
		$fleftarr 	= m('flow_element')->getrows("`mid`='$setid'",'*','`iszb`,`sort`');
		$modenum	= $rs['num'];
		$fleft[]= array('base_name', '申请人',0);
		$fleft[]= array('base_deptname', '申请部门',0);
		$fleft[]= array('base_sericnum', '单号',0);
		$fleft[] = array('file_content', '相关文件',0);
		$iszb 	= 0;
		foreach($fleftarr as $k=>$brs){
			$bt='';
			if($brs['isbt']==1)$bt='*';
			$iszbs = $brs['iszb'];
			if($iszbs>0&&$iszb==0){
				$fleft[]= array('', '<font color=#ff6600>—第'.$iszbs.'个多列子表—</font>', $iszbs);
				$fleft[]= array('xuhao', '序号', $iszbs);
			}
			$iszb	= $iszbs;
			$fleft[]= array($brs['fields'], $bt.$brs['name'], $iszb);
		}

		
		$this->smartydata['fleft'] = $fleft;
		
		$path 		= ''.P.'/flow/page/input_'.$modenum.'.html';
		$content 	= '';
		if(file_exists($path)){
			$content = file_get_contents($path);
		}
		$this->smartydata['content'] = $content;
		
		$apaths		= ''.P.'/flow/input/mode_'.$modenum.'Action.php';
		$apath		= ''.ROOT_PATH.'/'.$apaths.'';
		if(!file_exists($apath)){
			$stra = '<?php
/**
*	此文件是流程模块【'.$modenum.'.'.$rs['name'].'】对应接口文件。
*	可在页面上创建更多方法如：public funciton testactAjax()，用js.getajaxurl(\'testact\',\'mode_'.$modenum.'|input\',\'flow\')调用到对应方法
*/ 
class mode_'.$modenum.'ClassAction extends inputAction{
	
	/**
	*	重写函数：保存前处理，主要用于判断是否可以保存
	*	$table String 对应表名
	*	$arr Array 表单参数
	*	$id Int 对应表上记录Id 0添加时，大于0修改时
	*	$addbo Boolean 是否添加时
	*	return array(\'msg\'=>\'错误提示内容\',\'rows\'=> array()) 可返回空字符串，或者数组 rows 是可同时保存到数据库上数组
	*/
	protected function savebefore($table, $arr, $id, $addbo){
		
	}
	
	/**
	*	重写函数：保存后处理，主要保存其他表数据
	*	$table String 对应表名
	*	$arr Array 表单参数
	*	$id Int 对应表上记录Id
	*	$addbo Boolean 是否添加时
	*/	
	protected function saveafter($table, $arr, $id, $addbo){
		
	}
}	
			';
			$this->rock->createtxt($apaths, $stra);
		}
	}
	
	public function pagesaveAjax()
	{
		$content = $this->post('content');
		$num 	 = $this->post('num');
		$path 	 = ''.P.'/flow/page/input_'.$num.'.html';
		$this->rock->createtxt($path, $content);
		echo 'success';
	}
	
	
	
	public function getsubtableAjax()
	{
		$iszb 	= (int)$this->post('iszb');
		$hang 	= (int)$this->post('hang');
		$modeid = (int)$this->post('modeid');
		if($iszb<=0)$iszb=1;
		if($hang<=0)$hang=1;
		
		$rows 	= m('flow_element')->getall("`mid`='$modeid' and `iszb`=$iszb and `islu`=1",'`isbt`,`fields`,`name`','`sort`');
		if(!$rows)$this->backmsg('没有设置第'.$iszb.'个多行子表');
		$xu	 = $iszb-1;
		$str = '<table class="tablesub" id="tablesub'.$xu.'" style="width:100%;" border="0" cellspacing="0" cellpadding="0">';
		$str.='<tr>';
		$str.='<td width="10%">序号</td>';
		foreach($rows as $k=>$rs){
			$xh = '';
			if($rs['isbt']==1)$xh='*';
			$str.='<td>'.$xh.''.$rs['name'].'</td>';
		}
		$str.='<td width="5%">操作</td>';
		$str.='</tr>';
		for($j=0;$j<$hang;$j++){
			$str.='<tr>';
			$str.='<td >[xuhao'.$xu.','.$j.']</td>';
			foreach($rows as $k=>$rs){
				$str.='<td>['.$rs['fields'].''.$xu.','.$j.']</td>';
			}
			$str.='<td >{删,'.$xu.'}</td>';
			$str.='</tr>';
		}
		$str.='</table>';
		$str.='<div style="background-color:#F1F1F1;">{新增,'.$xu.'}</div>';
		$this->backmsg('','ok', $str);
	}
	
	
	
	
	
	
	
	public function getmodearrAjax()
	{
		$arr = m('flow_set')->getall('1=1','id,num,name','sort');
		$this->backmsg('','ok', $arr);
	}
	
	
	
	
	public function viewshowbefore($table)
	{
		$this->modeid = (int)$this->post('modeid');
		$this->moders = m('flow_set')->getone($this->modeid);
		$this->isflow = $this->moders['isflow'];
		$table = $this->moders['table'];
		$where = $this->moders['where'];
		if(!isempt($where)){
			$where = $this->rock->covexec($where);
			$where = "and $where";
		}
		return array(
			'table' => '[Q]'.$table,
			'where' => $where
		);
	}
	
	public function viewshowafter($table, $rows)
	{
		$arr = array();
		$ztarr  = explode(',','待处理,已审核,处理不通过');
		$ztarrc = explode(',','blue,green,red');
		foreach($rows as $k=>$rs){
			$zt 	= '';
			if(isset($rs['status']))$zt = $rs['status'];
			$narr['id'] 		= $rs['id'];
			$narr['optname'] 	= $rs['optname'];
			$narr['modenum'] 	= $this->moders['num'];
			$narr['modename'] 	= $this->moders['name'];
			$narr['optdt'] 		= $rs['optdt'];
			$narr['summary'] 	= $this->rock->reparr($this->moders['summary'], $rs);
			if($this->isflow == 1){
				$zt = '<font color="'.$ztarrc[$zt].'">'.$ztarr[$zt].'</font>';
			}
			$narr['status']		= $zt;
			$arr[] = $narr;
		}
		return array('rows'=>$arr);
	}
	
	public function delmodeshujuAjax()
	{
		$this->modeid 	= (int)$this->post('modeid');
		$mid 			= (int)$this->post('mid');
		$this->moders 	= m('flow_set')->getone($this->modeid);
		if(!$this->moders)exit('sorry!');
		
		$msg	= m('flow')->opt('deletebill', $this->moders['num'], $mid);
		echo $msg;
	}
	
	//保存字段判断
	public function elemensavefields($table, $cans)
	{
		$fields = $cans['fields'];
		$name 	= $cans['name'];
		$mid 	= $cans['mid'];
		$type 	= $cans['fieldstype'];
		$tables = m('flow_set')->getmou('`table`', $mid);
		if(!isempt($tables)){
			$allfields = $this->db->getallfields('[Q]'.$tables.'');
			if(!in_array($fields, $allfields)){
				$str = "ALTER TABLE [Q]".$tables." ADD $fields ";
				if($type=='date' || $type=='datetime' || $type=='time'){
					$str .= ' '.$type.'';
				}else if($type=='number'){
					$str .= ' smallint(6)';
				}else if($type=='checkbox'){
					$str .= ' tinyint(1)';	
				}else if($type=='textarea'){
					$str .= ' varchar(500)';
				}else{
					$str .= ' varchar(50)';
				}
				if(!isempt($cans['dev']))$str.= " DEFAULT '".$cans['dev']."'";
				$str.= " COMMENT '$name'";
				$this->db->query($str);
			}
		}
	}
}