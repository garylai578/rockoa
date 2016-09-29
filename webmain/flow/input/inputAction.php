<?php
class inputAction extends ActionNot
{
	public $mid = 0;
	
	public function initAction()
	{
		$aid 	= (int)$this->get('adminid');
		$token 	= $this->get('token');
		m('login')->autologin($aid, $token);
		$this->getlogin(1);
	}
	
	private $fieldarr = array();
	private $ismobile = 0;
	
	protected $moders = array();
	
	
	//保存前处理，主要用于判断是否可以保存
	protected function savebefore($table,$arr, $id, $addbo){}
	
	//保存后处理，主要用于判断是否可以保存
	protected function saveafter($table,$arr, $id, $addbo){}


	public function saveAjax()
	{
		$id				= (int)$this->request('id');
		$modenum		= $this->request('modenum');
		$uid			= $this->adminid;
		$this->moders 	= m('flow_set')->getone("`num`='$modenum'",'`num`,`name`,`id`,`table`,`tables`,`isflow`');
		if(!$this->moders)$this->backmsg('流程模块不存在');
		$modeid			= $this->moders['id'];
		$isflow			= $this->moders['isflow'];
		$flownum		= $this->moders['num'];
		$table			= $this->moders['table'];
		if($this->isempt($table))$this->backmsg('模块未设置表名');
		$fieldsarr		= m('flow_element')->getrows("`mid`='$modeid' and `islu`=1 and `iszb`=0",'`name`,`fields`,`isbt`,`fieldstype`,`data`,`iszb`','`sort`');
		if(!$fieldsarr)$this->backmsg('没有录入元素');
		$db	   = m($table);$subna = '提交';$addbo = false;$where = "`id`='$id'"; $oldrs = false;
		$this->mdb = $db;
		if($id==0){
			$where = '';
			$addbo = true;
		}else{
			$oldrs = $db->getone($id);
			if(!$oldrs)$this->backmsg('记录不存在');
			if($isflow==1){
				$bos = false;
				if($oldrs['uid']==$uid||$oldrs['optid']==$uid)$bos=true;
				if($oldrs['status']==1)$bos=false;
				if(!$bos)$this->backmsg('不允许编辑,可能已审核通过/不是你的单据');
			}
			$subna = '编辑';
		}
		$uaarr = $farrs = array();
		foreach($fieldsarr as $k=>$rs){
			$fid = $rs['fields'];
			$val = $this->post($fid);
			if($rs['isbt']==1&&$this->isempt($val))$this->backmsg(''.$rs['name'].'不能为空');
			$uaarr[$fid] = $val;
			$farrs[$fid] = array('name' => $rs['name']);
		}
		foreach($fieldsarr as $k=>$rs){
			if(substr($rs['fieldstype'],0,6)=='change'){
				if(!$this->isempt($rs['data'])){
					$fid = $rs['data'];
					if(isset($uaarr[$fid]))continue;
					$val = $this->post($fid);
					if($rs['isbt']==1&&$this->isempt($val))$this->backmsg(''.$rs['name'].'id不能为空');
					$uaarr[$fid] = $val;
					$farrs[$fid] = array('name' => $rs['name'].'id');
				}
			}
		}
		
		
		$allfields = $this->db->getallfields('[Q]'.$table.'');
		if(in_array('optdt', $allfields))$uaarr['optdt'] = $this->now;
		if(in_array('optid', $allfields))$uaarr['optid'] = $this->adminid;
		if(in_array('optname', $allfields))$uaarr['optname'] = $this->adminname;
		if(in_array('uid', $allfields))$uaarr['uid'] = $this->post('uid', $this->adminid);
		if(in_array('applydt', $allfields) && $id==0)$uaarr['applydt'] = $this->post('applydt', $this->date);
		if($addbo){
			if(in_array('createdt', $allfields))$uaarr['createdt'] = $this->now;
			if(in_array('adddt', $allfields))$uaarr['adddt'] = $this->now;
			if(in_array('createid', $allfields))$uaarr['createid'] = $this->adminid;
			if(in_array('createname', $allfields))$uaarr['createname'] = $this->adminname;
		}
		if($isflow==1){
			$uaarr['status']= '0';
		}else{
			if(in_array('status', $allfields))$uaarr['status'] = (int)$this->post('status', '1');
			if(in_array('isturn', $allfields))$uaarr['isturn'] = 1;
		}
		$ss 	= '';
		$befa 	= $this->savebefore($table, $uaarr, $id, $addbo);
		if(isset($befa['msg']))$ss=$befa['msg'];
		if(isset($befa['rows'])){
			foreach($befa['rows'] as $bk=>$bv)$uaarr[$bk]=$bv;
		}
		if(is_string($befa))$ss = $befa;
		if(!$this->isempt($ss))$this->backmsg($ss);
		
		$bo = $db->record($uaarr, $where);;
		if(!$bo)$this->backmsg($this->db->error());
		
		if($id==0)$id = $this->db->insert_id();
		m('file')->addfile($this->post('fileid'), $table, $id);
		
		$this->savesubtable($id,'0', $addbo);//保存子表
		
		$this->saveafter($table,$uaarr, $id, $addbo);
		$msg 	= '';
		m('flow')->submit($modenum, $id, $subna);
		$this->backmsg('', $msg, $id);
	}
	
	public function getsubtabledata($xu)
	{
		$arr 	= array();
		$oi 	= (int)$this->post('sub_totals'.$xu.'');
		if($oi<=0)return $arr;
		$modeid		= $this->moders['id'];
		$iszb		= $xu+1;
		$farr		= m('flow_element')->getrows("`mid`='$modeid' and `islu`=1 and `iszb`=$iszb",'`name`,`fields`,`isbt`,`dev`','`sort`');
		$sort 		= 0;
		for($i=0; $i<$oi; $i++){
			$sid  = (int)$this->post('sid'.$xu.'_'.$i.'');
			$bos  = true;
			$uaarr['id'] = $sid;
			foreach($farr as $k=>$rs){
				$fid= $rs['fields'];
				$na = ''.$fid.''.$xu.'_'.$i.'';
				$val= $this->post($na);
				if($rs['isbt']==1&&$this->isempt($val))$bos=false;
				$uaarr[$fid] = $val;
			}
			if(!$bos)continue;
			$uaarr['sort'] 	= $sort;
			$sort++;
			$arr[] = $uaarr;
		}
		return $arr;
	}
	
	private function savesubtable($mid, $xu, $addbo)
	{
		$data 	= $this->getsubtabledata($xu);
		$len 	= count($data);
		if($len<=0)return;
		$table		= $this->moders['table'];
		$tables		= $this->moders['tables'];if(isempt($tables))$tables='items';
		$idss		= '0';
		$dbs 		= m($tables);
		
		$allfields 	= $this->db->getallfields('[Q]'.$tables.'');
		$oarray 	= array();
		if(in_array('optdt', $allfields))$oarray['optdt'] 		= $this->now;
		if(in_array('optid', $allfields))$oarray['optid'] 		= $this->adminid;
		if(in_array('optname', $allfields))$oarray['optname'] 	= $this->adminname;
		if(in_array('uid', $allfields))$oarray['uid'] 			= $this->post('uid', $this->adminid);
		if(in_array('applydt', $allfields) && $addbo)$oarray['applydt']	= $this->post('applydt', $this->date);
		if(in_array('status', $allfields))$oarray['status']		= 0;
		
		foreach($data as $k=>$uaarr){
			$sid 			= $uaarr['id'];
			$where			= "`id`='$sid'";
			$uaarr['mid'] 	= $mid;
			if($sid==0)$where = '';
			foreach($oarray as $k1=>$v1)$uaarr[$k1]=$v1;
			
			$dbs->record($uaarr, $where);
			if($sid==0)$sid = $this->db->insert_id();
			$idss.=','.$sid.'';
		}
		$delwhere = "`mid`='$mid' and `id` not in($idss)";
		$dbs->delete($delwhere);
	}
	
	//获取数据
	public function getdataAjax()
	{
		$flownum = $this->request('flownum');
		$id		 = (int)$this->request('mid');
		$arr 	 = m('flow')->getdataedit($flownum, $id);
		$tables	 = $arr['tables'];
		$modeid	 = $arr['modeid'];
		$subdata0	 = array();
		if(!isempt($tables)){
			$subdata0 = m($tables)->getall('mid='.$id.'','*','`sort`');
		}
		$arr['subdata'] = array(
			'subdata0'	=> $subdata0
		);
		$this->backmsg('', '', $arr);
	}
	
	
	public function lumAction()
	{
		$this->ismobile = 1;
		$isheader = 0;
		if($this->web != 'wxbro' && $this->get('show')=='we')$isheader=1;
		$this->assign('isheader', $isheader);
		$this->luactions();
	}
	
	public function luAction()
	{
		$this->ismobile = 0;
		$this->luactions();
	}

	public function lusAction()
	{
		$this->ismobile = 1;
		$menuid	= (int)$this->get('menuid');
		$fields 	= m('flow_menu')->getmou('fields', $menuid);
		if(isempt($fields))exit('sorry;');
		$fields	= str_replace(',',"','", $fields);
		$stwhe	= "and `fields` in('$fields')";
		$this->luactions(1, $stwhe);
	}	
	
	private function luactions($slx=0, $stwhe='')
	{
		$this->tpltype = 'html';
		$uid		= $this->adminid;
		$num		= $this->jm->gettoken('num');
		$mid		= (int)$this->jm->gettoken('mid');
		$this->mid  = $mid;
		$moders 	= m('flow_set')->getone("`num`='$num'",'`id`,`num`,`name`,`names`,`table`,`isflow`');
		if(!$moders)exit('流程不存在!');
		$this->smartydata['moders']	= $moders;
		$modeid 	= $moders['id'];
		if($mid==0){
			$isadd = m('view')->isadd($modeid, $uid);
			if(!$isadd)exit('无权添加['.$moders['name'].']的数据;');
		}
		
		$content 	= '';
		$this->urs  = m('admin')->getone($this->adminid, '`name`,`deptname`,`ranking`,`deptid`');
		
		$fieldarr 	= m('flow_element')->getrows("`mid`='$modeid' and `iszb`=0 $stwhe",'fields,fieldstype,name,dev,data,isbt,islu,attr,iszb','`sort`');
		
		$modelu		= '';
		$oldrs 		= m($moders['table'])->getone($mid);
		foreach($fieldarr as $k=>$rs){
			if($slx==1 && $oldrs){
				$rs['value'] = $oldrs[$rs['fields']];
			}
			$this->fieldarr[$rs['fields']] = $rs;
			if($rs['islu'])$modelu.='{'.$rs['fields'].'}';
		}
		$this->smartydata['fieldsjson']	= json_encode($fieldarr);
		$this->moders	= $moders;
		
		if($this->ismobile==0){
			$path 			= ''.P.'/flow/page/input_'.$num.'.html';
			if(file_exists($path)){
				$content 	= file_get_contents($path);
			}
		}else{
			$content = $modelu;
			$zbstr 	 = m('input')->getsubtable($modeid,1,1,1);
			if($zbstr!='')$content.='<tr><td  style="padding:5px;" colspan="2"><div><b>'.$moders['names'].'</b></div><div>'.$zbstr.'</div></td></tr>';
		}
		
		if($content=='')exit('未设置录入页面');
		
		
		$this->actclss	= $this;
		$pathss 		= ''.P.'/flow/input/mode_'.$num.'Action.php';
		if(file_exists($pathss)){
			include_once($pathss);
			$clsnam 	= 'mode_'.$num.'ClassAction';
			$this->actclss 	= new $clsnam();
		}
		
		
		
		preg_match_all('/\{(.*?)\}/', $content, $list);
		foreach($list[1] as $k=>$nrs){
			$str		= $this->getfieldcont($nrs, $this->actclss);
			$content	= str_replace('{'.$nrs.'}', $str, $content);
		}
		
		$content 	 	= $this->pisubduolie($content, $modeid, 1);//多列子表匹配的是[]
		$content		= str_replace('*','<font color=red>*</font>', $content);
		
		$course			= array();
		if($moders['isflow']==1){
			$course[]= array('name'=>'提交','id'=>0);
			$courses = m('flow_course')->getall('setid='.$modeid.'','name,checktype,id,checktypename,`explain`');
			foreach($courses as $k=>$rs1){
				$na = $rs1['name'];
				if(!$this->isempt($rs1['explain']))$na.= '<br><span style="font-size:12px">('.$rs1['explain'].')</span>';
				$rs1['name'] = $na;
				$course[]=$rs1;
			}
			$course[]= array('name'=>'结束','id'=>-1);
		}
		$this->title  	= $moders['name'];
		$this->smartydata['content']	= $content;
		$this->smartydata['mid']		= $mid;
		$this->smartydata['course']		= $course;
	}
	
	private function pisubduolie($content, $modeid, $xu)
	{
		$oi 		= $xu-1;
		$fieldarr 	= m('flow_element')->getrows("`mid`='$modeid' and `iszb`='$xu'",'fields,fieldstype,name,dev,data,isbt,islu,attr','`sort`');
		if(!$fieldarr)return $content;
		$this->fieldarr = array();
		$this->fieldarr['xuhao'.$oi.''] = array(
			'fields' 	=> 'xuhao'.$oi.'',
			'fieldstype'=> 'xuhao',
			'data' 		=> '',
			'attr' 		=> 'style="text-align:center" readonly temp="xuhao"',
			'dev'	 	=> '1',
			'isbt'		=> '0',
			'fieldss'	=> 'sid'.$oi.''
		);
		foreach($fieldarr as $k=>$rs){
			$this->fieldarr[$rs['fields'].''.$oi.''] = $rs;
		}
		preg_match_all('/\[(.*?)\]/', $content, $list);
		foreach($list[1] as $k=>$nrs){
			if(!$this->isempt($nrs)){
				$fida= explode(',', $nrs);$xu0='0';
				if(isset($fida[1]))$xu0=$fida[1];
				
				$str		= $this->getfieldcont($fida[0], $this->actclss,'_'.$xu0.'', $xu);
				$content	= str_replace('['.$nrs.']', $str, $content);
			}
		}
		return $content;
	}
	
	private function getfieldcont($fid, $objs, $leox='', $iszb=0)
	{
		$fida= explode(',', $fid);$xu0='0';
		$ism = $this->ismobile;
		$fid = $fida[0];
		$str = $val ='';
		if(isset($fida[1]))$xu0=$fida[1];
		if($fid=='base_name'){
			$str = '<input class="inputs" style="border:none" name="base_name" value="'.$this->adminname.'" readonly>';
		}
		if($fid=='base_deptname'){
			$str = '<input class="inputs" style="border:none" name="base_deptname" value="'.$this->urs['deptname'].'" readonly>';
		}
		if($fid=='file_content'){
			$str = '<input name="fileid" type="hidden" id="fileidview-inputEl"><div id="view_fileidview" style="width:97%;height:80px;border:1px #cccccc solid; background:white;overflow:auto"></div><div id="fileupaddbtn"><a href="javascript:;" class="blue" onclick="c.upload()"><u>＋添加文件</u></a></div>';
		}
		if($fid=='删'){
			$str='<a href="javascript:;" onclick="c.delrow(this,'.$xu0.')">删</a>';
		}
		if($fid=='新增'){
			$str='<a href="javascript:;" onclick="c.addrow(this,'.$xu0.')">＋新增</a>';
		}
		if($str!='')return $str;
		if(!isset($this->fieldarr[$fid]))return '';
		
		$isasm 	= 1;
		$a 		= $this->fieldarr[$fid];
		$fname 	= $fid.$leox;
		$type 	= $a['fieldstype'];
		$data 	= $a['data'];
		$val 	= $a['dev'];
		if(isset($a['value']))$val=$a['value'];
		$attr 	= $a['attr'];
		$fnams 	= @$a['name'];
		if($a['isbt']==1)$fnams='*'.$fnams.'';
		if($this->isempt($val))$val='';
		if($this->isempt($attr))$attr='';
		if($val!='')$val = str_replace(array('{now}','{date}','{admin}','{adminid}','{deptname}','{ranking}'),array($this->now,$this->date,$this->adminname,$this->adminid, $this->urs['deptname'], $this->urs['ranking']),$val);
		
		$str 	= '<input class="inputs" value="'.$val.'" '.$attr.' name="'.$fname.'">';
		
		
		if($type=='fixed'||$type=='hidden'){
			$str  = '<input value="'.$val.'" '.$attr.' type="hidden" name="'.$fname.'">';
			$isasm=0;
		}
		if($type=='textarea'){
			$str = '<textarea class="textarea" style="height:100px" '.$attr.' name="'.$fname.'">'.$val.'</textarea>';
		}
		if($type=='rockcombo' || $type=='select' || $type=='checkboxall'){
			$str ='<select style="width:99%" '.$attr.' name="'.$fname.'" class="inputs">';
			$str.='<option value="">-请选择-</option>';
			$str1= '';
			$datanum = $data;
			if(!$this->isempt($datanum)){
				$fopt	= array();
				if(method_exists($objs, $datanum)){
					$fopt	= $objs->$datanum($fid,$this->mid);
					foreach($fopt as $k=>$rs){
						$sel = ($rs['value']==$val)?'selected':'';
						$str.='<option value="'.$rs['value'].'" '.$sel.'>'.$rs['name'].'</option>';
						$str1.='<label><input name="'.$fname.'[]" value="'.$rs['value'].'" type="checkbox">'.$rs['name'].'</label>&nbsp;&nbsp;';
					}
					$fopt = true;
				}
				if(($type=='rockcombo' ||$type=='checkboxall') && !$fopt){
					$_ars= explode(',', $datanum);
					$fopt= $this->option->getmnum($_ars[0]);
					$fvad= 'name';
					if(isset($_ars[1])&&($_ars[1]=='value'||$_ars[1]=='id'||$_ars[1]=='num'))$fvad=$_ars[1];
					foreach($fopt as $k=>$rs){
						$cb  = $rs[$fvad];
						$sel = ($cb==$val)?'selected':'';
						$str.='<option value="'.$cb.'" '.$sel.'>'.$rs['name'].'</option>';
						$str1.='<label><input name="'.$fname.'[]" value="'.$cb.'" type="checkbox">'.$rs['name'].'</label>&nbsp;&nbsp;';
					}
				}
				if(($type=='select' ||$type=='checkboxall') && !$fopt){
					$fopt= c('array')->strtoarray($datanum);
					foreach($fopt as $k=>$rs){
						$sel = ($rs[0]==$val)?'selected':'';
						$str.='<option value="'.$rs[0].'" '.$sel.'>'.$rs[1].'</option>';
						$str1.='<label><input name="'.$fname.'[]" value="'.$rs[0].'" type="checkbox">'.$rs[1].'</label>&nbsp;&nbsp;';
					}
				}
			}
			$str.='</select>';
			if($type=='checkboxall')$str = $str1;
		}
		
		if($type=='datetime'||$type=='date'||$type=='time'){
			$str = '<input onclick="js.datechange(this,\''.$type.'\')" value="'.$val.'" '.$attr.' class="inputs datesss" inputtype="'.$type.'" readonly name="'.$fname.'">';
		}
		if($type=='number'||$type=='xuhao'){
			$str = '<input class="inputs" '.$attr.' value="'.$val.'" type="number" onfocus="js.focusval=this.value" onblur="js.number(this)" name="'.$fname.'">';
			if($type=='xuhao')$str.='<input value="0" type="hidden" name="'.$a['fieldss'].$leox.'">';
		}
		if($type=='changeusercheck'||$type=='changeuser'||$type=='changedept'||$type=='changedeptusercheck'){
			$str = '<table width="98%" cellpadding="0" border="0"><tr><td width="100%"><input '.$attr.' class="inputs" style="width:98%" id="change'.$fname.'" readonly type="text" name="'.$fname.'"><input name="'.$data.'" id="change'.$fname.'_id" type="hidden"></td>';
			$str .= '<td nowrap><a href="javascript:;" style="border-right:1px #0AA888 solid" onclick="c.changeclear(\'change'.$fname.'\')" class="webbtn">×</a><a href="javascript:;" onclick="c.changeuser(\'change'.$fname.'\',\''.$type.'\')" class="webbtn">选择</a></td></tr></table>';
		}
		if($type=='htmlediter'){
			$str = '<textarea class="textarea" style="height:130px" '.$attr.' name="'.$fname.'">'.$val.'</textarea>';
		}
		if($type=='checkbox'){
			$chk = '';
			if($val=='1'||$val=='true')$chk='checked';
			$str = '<input name="'.$fname.'" '.$chk.' '.$attr.' type="checkbox" value="1"> ';
		}
		if($type=='auto'){
			$datanum = $data;
			if(!$this->isempt($datanum)){
				if(method_exists($objs, $datanum)){
					$str = $objs->$datanum($fid, $this->mid);
				}
			}
		}
		if($iszb>0)return $str;
		if($isasm==1){
			$lx  = 'span';if($ism==1)$lx='div';
			$str = '<'.$lx.' id="div_'.$fname.'" class="divinput">'.$str.'</'.$lx.'>';
			if($ism==1 && $iszb==0){
				$str = '<tr><td class="lurim" nowrap>'.$fnams.':</td><td width="90%">'.$str.'</td></tr>';
			}
		}
		return $str;
	}
}

class inputClassAction extends inputAction{}