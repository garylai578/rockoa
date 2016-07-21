<?php 
/**
	网址管理后台控制处理
*/
require(ROOT_PATH.'/include/Action.php');

class Action extends mainAction
{
	public $adminid		= 0;
	public $adminuser	= '';
	public $adminname	= '';
	public $admintoken	= '';
	public $loadci		= 0;
	
	protected $ajaxbool 	= 'false';

	public function getlogin($lx=0)
	{
		$this->ajaxbool		= $this->rock->jm->gettoken('ajaxbool', 'false');
		$this->adminid		= (int)$this->getsession('adminid',0);
		$this->adminuser	= $this->getsession('adminuser');
		$this->adminname	= $this->getsession('adminname');
		$this->admintoken	= $this->getsession('admintoken');
		
		$this->rock->adminid			= $this->adminid;
		$this->rock->adminuser			= $this->adminuser;
		$this->rock->adminname			= $this->adminname;
		if($lx==0)$this->logincheck();
	}	
	
	protected function logincheck()
	{
		if($this->adminid==0){
			if($this->ajaxbool == 'true'){
				echo 'sorry! not sign';
			}else{
				$this->rock->location('?m=login');
			}
			exit();
		}
	}
	
	public function initProject()
	{
		$this->getlogin();
		if($this->rock->get('ajaxbool')=='true')return;
		$this->smartydata['adminid']	= $this->adminid;
		$this->smartydata['adminuser']	= $this->adminuser;
		$this->smartydata['adminname']	= $this->adminname;
	}
	
	private function iszclogin()
	{
		$token = $this->admintoken;
		if($this->isempt($token))exit('sorry1');
		$lastt = date('Y-m-d H:i:s',time()-24*3600);
		$rs = m('logintoken')->getone("`uid`='$this->adminid' and `token`='$token' and `cfrom` in('pc','reim') and `moddt`>='$lastt'",'`moddt`');
		if(!$rs)$this->backmsg('登录失效');
	}
	
	public function backmsg($msg='', $demsg='保存成功', $da=array())
	{
		backmsg($msg,$demsg,$da);
	}
	
	public function limitRows($table,$fields='*',$wherea='1=1',$order='',$arr=array())
	{
		$where		= $this->request('where');
		$keywhere	= $this->request('keywhere');
		$where 		= $this->jm->uncrypt($where);
		$keywhere 	= $this->jm->uncrypt($keywhere);
		$where  	= $this->rock->covexec($where);
		$keywhere  	= $this->rock->covexec($keywhere);
		
		$wherea	  .= " $where $keywhere";
		$wherea	   = $this->db->filterstr($wherea);
		$order	   = $this->getOrder($order);
		$group	   = '';
		if(isset($arr['group']))$group=" group by ".$arr['group']." ";
		
		$limitall	= false;
		if(isset($arr['all']))$limitall= $arr['all'];//判断是不是要全部数据
		
		if(isset($arr['sou'])){
			$wherea		= str_replace($arr['sou'],$arr['rep'],$wherea);
			$order		= str_replace($arr['sou'],$arr['rep'],$order);
		}
		$total		= $this->db->rows($table,$wherea);
		$fields		= str_replace(array('\'',' ','(',')','"'),array('','','','',''), $fields);
		$sql		= "select $fields from $table where $wherea $group $order ";
		
		if(!$limitall)$sql.=' '.$this->getLimit();
		
		$rows		= $this->db->getall($sql);
		if(!is_array($rows))$rows = array();
		return array(
			'total'	=> $total,
			'rows'	=> $rows
		);
	}
	
	public function getLimit()
	{
		$start  = (int)$this->rock->post('start',0);
		$limit  = (int)$this->rock->post('limit',15);
		$str	= '';
		if($limit > 0)$str =" limit $start,$limit";	
		return $str;
	}
	
	public function getOrder($order='')
	{
		$sort  		= $this->rock->post('sort');		//排序字段
		$dir  		= $this->rock->post('dir');			//ASC、DESC
		$highorder	= $this->rock->post('highorder');	//高级排序
		$asort		= '';
		if($sort != '' && $dir !=''){
			$sorta	= $sort;
			$asort=' '.$sorta.' '.$dir.'';
		}
		if($asort != '')$order = $asort;
		if($highorder != '')$order = $highorder;
		if($order != '')$order=" order by $order ";
		return $order;
	}

	public function publicdelAjax()
	{
		$this->iszclogin();
		$id		= $this->rock->post('id');
		$table	= $this->rock->post('table','',1);
		$msg	= '';
		if($msg == '' && $table!=''){
			if(!m($table)->delete("`id` in($id)"))$msg= $this->db->error();
		}
		if($msg=='')$msg='success';
		echo $msg;
	}	
	
	public function publicstoreAjax()
	{
		$this->iszclogin();
		$table			= $this->request('tablename_abc','',1);
		$fields			= $this->jm->uncrypt($this->request('storefields'));
		$order			= $this->request('defaultorder');
		$aftera			= $this->request('storeafteraction');
		if($fields=='')$fields='*';
		$execldown		= $this->request('execldown');
		$this->loadci	= (int)$this->request('loadci');
		$where			= '1=1 ';
		$beforea		= $this->request('storebeforeaction');
		$tables 		= $this->T($table);
		if($beforea != ''){
			if(method_exists($this, $beforea)){
				$nas	= $this->$beforea($table);
				if(is_array($nas)){
					if(isset($nas['where']))$where .= $nas['where'];
					if(isset($nas['order']))$order = $nas['order'];
					if(isset($nas['fields']))$fields = $nas['fields'];
					if(isset($nas['table']))$tables = $nas['table'];
				}else{
					$where .= $nas;
				}
			}
		}
		
		$arr	= $this->limitRows($tables, $fields, $where, $order);
		$total	= $arr['total'];
		$rows	= $arr['rows'];

		$bacarr	= array(
			'totalCount'=> $total,
			'rows'		=> $rows
		);
		if(method_exists($this, $aftera)){
			$narr	= $this->$aftera($table, $rows);
			if(is_array($narr)){
				foreach($narr as $kv=>$vv)$bacarr[$kv]=$vv;
			}
		}
		if($execldown == 'true'){
			$this->exceldown($bacarr);
			return;
		}
		echo json_encode($bacarr);
	}
	
	public function publictreestoreAjax()
	{
		$table	= $this->rock->post('tablename_abc');
		$order	= $this->rock->get('order');
		$fistid	= $this->rock->get('fistid','0');
		$rows	= $this->publictreestore($fistid, $table, $order);
		echo json_encode(Array(
			'root'=>'.','children'=>$rows
		));
	}
	public function publictreestore($pid, $table, $order){
		$db 		= m($table);
		$expandall	= $this->rock->get('expandall');
		$pidfields	= $this->rock->get('pidfields','pid');
		$idfields	= $this->rock->get('idfields','id');
		$wheres		= $this->rock->post('where');
		
		$where	= "`$pidfields`='$pid' $wheres";
		if($order!='')$where.=" order by `$order`";
		$rows = $db->getall($where);
		foreach($rows as $k=>$rs){
			$id	= $rs['id'];
			$rows[$k]['leaf'] 	= true;
			$rows[$k]['sid']	= $id;
			if($expandall=='true')$rows[$k]['expanded']	= true;
			$total	= $db->rows("`$pidfields`='".$rs[$idfields]."' $wheres");
			if($total >0){
				$rows[$k]['leaf'] = false;
				$rows[$k]['children'] = $this->publictreestore($rs[$idfields], $table, $order);
			}else{
				$rows[$k]['children'] = array();
			}
		}
		return $rows;
	}
	
	/**
		公共保存页面
	*/
	public function publicsaveAjax()
	{
		$this->iszclogin();
		$msg	= '';
		$success= false;
		$table	= $this->post('tablename_postabc');
		$id		= (int)$this->post('id');
		$oldrs  = false;
		if($table !='' ){
			$db		= m($table);
			$where	= "`id`='$id'";
			if($id==0)$where='';
			$msgerrortpl 		= $this->post('msgerrortpl');
			$aftersavea			= $this->post('aftersaveaction', 'publicaftersave');
			$beforesavea		= $this->post('beforesaveaction', 'publicbeforesave');
			$submditfi 			= $this->post('submitfields_postabc');
			$editrecord			= $this->post('editrecord_postabc');
			$fileid 			= $this->post('fileid', '0');
			$isturn 			= (int)$this->post('isturn_postabc', '1');
			$int_type 			= ','.$this->post('int_filestype').',';
			$md5_type 			= ','.$this->post('md5_filestype').',';
			if($submditfi !=''){
				$fields	= explode(',', $submditfi);
				$uaarr	= array();
				foreach($fields as $field){
					$val	= $this->post(''.$field.'');
					$type	= $this->post(''.$field.'_fieldstype');
					$boa	= true;
					if($this->contain($int_type, ','.$field.',')){
						$val = (int)$val;
					}
					if($this->contain($md5_type, ','.$field.',')){
						if($val=='')$boa=false;
						$val = md5($val);
					}
					if($boa)$uaarr[$field]=$val;
				}
				
				$otherfields		= $this->post('otherfields');
				$addotherfields		= $this->post('add_otherfields');
				$editotherfields	= $this->post('edit_otherfields');
				if($id == 0)$otherfields.=','.$addotherfields.'';
				if($id > 0)$otherfields.=','.$editotherfields.'';
				if($otherfields != ''){
					$otherfields = str_replace(array('{now}','{date}','{admin}','{adminid}'),array($this->now,date('Y-m-d'),$this->adminname,$this->adminid),$otherfields);
					$fiarsse = explode(',', $otherfields);
					foreach($fiarsse as $ffes){
						if($ffes!=''){
							$ssare = explode('=', $ffes);
							$lea	= substr($ssare[1],0,1);
							if($lea == '['){
								$uaarr[$ssare[0]]=$uaarr[substr($ssare[1],1,-1)];
							}else{
								$uaarr[$ssare[0]]=$ssare[1];
							}
						}
					}
				}
				
				$ss 	= '';
				if(!$this->isempt($beforesavea)){
					if(method_exists($this, $beforesavea)){
						$befa = $this->$beforesavea($table, $uaarr, $id);
						if(isset($befa['msg']))$ss=$befa['msg'];
						if(isset($befa['rows'])){
							foreach($befa['rows'] as $bk=>$bv)$uaarr[$bk]=$bv;
						}
					}	
				}
				$msg 	= $ss;	
				$idadd 	= false;
				if($msg == ''){
					if($id>0 && $editrecord=='true')$oldrs = $db->getone($id);
					if($db->record($uaarr, $where)){
						$msg	= '处理成功';
						$success= true;
						if($id == 0){
							$id = $this->db->insert_id();
							$idadd = true;
						}
						if($fileid !='0')m('file')->update("`mtype`='$table',`mid`='$id'", "`id` in($fileid)");//文件
						if(!$this->isempt($aftersavea)){
							if(method_exists($this, $aftersavea)){
								$this->$aftersavea($table, $uaarr, $id, $idadd);
							}
						}
						if($oldrs){
							$newrs = $db->getone($id);
							//c('edit')->record($table,$id, $oldrs, $newrs, 2);
						}
					}else{
						$msg = 'Error:'.mysql_error();
					}
				}
			}
		}else{
			$msg = '错误表名';
		}
		if($msg=='')$msg='处理失败';
		$arr = array('success'=>$success,'msg'=>$msg,'id'=>$id);
		echo json_encode($arr);
	}
	
	public function publicsavevalueAjax()
	{
		$this->iszclogin();
		$table	= $this->rock->post('tablename','',1);
		$id		= $this->rock->post('id', '0');
		$fields	= $this->rock->post('fieldname');
		$value	= $this->rock->post('value');
		$where	= "`id` in($id)";
		m($table)->record(array($fields=>$value), $where);
		echo 'success';
	}
	
	public function exceldown($arr)
	{
		$fields = explode(',', $this->post('excelfields','',1));
		$header = explode(',', $this->post('excelheader','',1));
		$title	= $this->post('exceltitle','',1);
		
		$headArr	= array();
		$rows		= $arr['rows'];
		for($i=0; $i<count($fields); $i++){
			$headArr[$fields[$i]] = $header[$i];
		}
		$excel	= c('PHPExcel', true);
		$excel->title = $title;
		$excel->headArr = $headArr;
		$excel->rows = $rows;
		$url = $excel->display('xls', 'back');
		
		echo json_encode(array(
			'url'	=> $url, 
			'totalCount'=> $arr['totalCount'],
			'downCount' => count($rows)
		));
	}
	
	public function getoptionAjax()
	{
		$num = $this->get('num');
		$arr = m('option')->getdata($num);
		echo json_encode($arr);
	}
}

class ActionNot extends Action
{
	public function publicsavevalueAjax(){}
	public function publicsaveAjax(){}
	public function publicdelAjax(){}
	public function publicstoreAjax(){}
	public function publictreestoreAjax(){}
	protected function logincheck(){}
}