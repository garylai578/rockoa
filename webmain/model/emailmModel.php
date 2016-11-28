<?php
class emailmClassModel extends Model
{
	public function initModel()
	{
		$this->adminobj = m('admin');
	}
	
	//介绍邮件
	public function receemail($uid)
	{
		$rows 	= c('imap')->receemail();
		foreach($rows as $k=>$rs){
			$where 	= "message_id='".$rs['message_id']."'";
			$id 	= (int)$this->getmou('id',$where);
			if($id ==0)$where = '';
			
			$uarr['message_id'] = $rs['message_id'];
			$uarr['title'] 		= $rs['subject'];
			$uarr['content'] 	= $rs['body'];
			$uarr['senddt'] 	= $rs['date'];
			$uarr['size'] 		= $rs['size'];
			$uarr['fromemail'] 	= $rs['fromemail'];
			$uarr['toemail'] 	= $rs['toemail'];
			$uarr['reply_toemail'] 	= $rs['reply_toemail'];
			$uarr['ccemail'] 		= $rs['ccemail'];
			$uarr['isturn'] 		= 1;
			$uarr['status'] 		= 1;
			$form	= $rs['from'][0];
			$urs 	= $this->adminobj->emailtours($form->email);
			$uarr['sendid']			= 0;
			$uarr['sendname']		= '';
			if(is_array($urs) && $urs){
				$uarr['sendid']		= $urs['id'];
				$uarr['sendname']	= $urs['name'];
			}
			
			$this->record($uarr, $where);
			if($id ==0)$id = $this->db->insert_id();
			
			$toarr = $this->saveemails($id, 0, $rs['to']);
			$this->saveemails($id, 1, $rs['cc']);
			$uuarr['receid']	= $toarr[0];
			$uuarr['recename']	= $toarr[1];
			
			$this->update($uuarr, $id);
		}
		return $rows;
	}
	
	public function saveemails($mid, $type, $arr)
	{
		$sid = $sna = '';
		foreach($arr as $k=>$rs){
			$where 				= "`mid`='$mid' and `type`=$type and `email`='$rs->email'";
			$id 				= (int)$this->db->getmou('[Q]emails','id',$where);
			if($id ==0)$where 	= '';
			$uarr				= array();
			$uarr['mid']		= $mid;
			$uarr['email']		= $rs->email;
			$uarr['personal']	= $rs->personal;
			$uarr['type']		= $type;
			if($id==0){
				$uarr['optdt']	= $this->rock->now;
			}
			$urs 	= $this->adminobj->emailtours($rs->email);
			$uarr['uid']		= 0;
			if(is_array($urs) && $urs){
				$uarr['uid']	= $urs['id'];
				$sid			.=',u'.$urs['id'].'';
				$sna			.=','.$urs['name'].'';
			}
			$this->db->record('[Q]emails', $uarr, $where);
		}
		if($sid != ''){
			$sid = substr($sid, 1);
			$sna = substr($sna, 1);
		}
		return array($sid, $sna);
	}
	
}