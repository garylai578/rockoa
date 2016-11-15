<?php
class emailClassModel extends Model
{
	public function initModel()
	{
		$this->settable('email_cog');
	}
	/**
	*	发送邮件
	*	$num 默认帐号
	*	$to_uid 发送给。。。
	*	$rows	内容
	*/
	public function sendmail($title, $body, $to_uid, $rows=array(), $num='', $zjsend=0)
	{
		if($num=='')$num = 'default';
		
		$setrs	= $this->getone("`num`='$num' or `id`='$num'");
		if(!$setrs)return ''.$num.'邮箱不存在';
		
		if(isempt($setrs['serversmtp']) || isempt($setrs['emailname']))return '未设置发送帐号';

		$to_em	= $to_mn = $to_id 	= '';
		
		$urs	= $this->db->getall("select `email`,`name`,`id` from `[Q]admin` where `id` in($to_uid) and `email` is not null and `status`=1 order by `sort`");
		foreach($urs as $k=>$rs){
			$to_em.=','.$rs['email'];
			$to_mn.=','.$rs['name'];
			$to_id.=','.$rs['id'];
		}	
		
		if(isempt($to_em))return '没有接收人';
		
		$to_em	= substr($to_em, 1);
		$to_mn	= substr($to_mn, 1);
		$to_id	= substr($to_id, 1);
		
		$body	= $this->rock->reparr($body, $rows);
		$title	= $this->rock->reparr($title, $rows);
			
		$body	= str_replace("\n", '<br>', $body);
		
		$msg 	= 'ok';
		
		if(!getconfig('asynsend') || $zjsend==1){
			$pass	= $this->rock->jm->uncrypt($setrs['emailpass']);
			$mail	= c('mailer');
			$mail->setHost($setrs['serversmtp'], $setrs['serverport'], $this->rock->repempt($setrs['secure']));
			$mail->setUser($setrs['emailname'], $pass);
			$mail->setFrom($setrs['emailname'], $setrs['name']);
			$mail->addAddress($to_em, $to_mn);
			$mail->sendMail($title, $body);
			$bo		= $mail->isSuccess();
			if(!$bo)$msg = '发送失败';
		}else{
			//异步发送邮件
			$uarr['emailid'] 	= $setrs['id'];
			$uarr['title'] 		= $title;
			$uarr['body'] 		= $body;
			$uarr['receid'] 	= $to_id;
			$uarr['recename'] 	= $to_mn;
			$uarr['optdt'] 		= $this->rock->now();
			$uarr['optid'] 		= $this->adminid;
			$uarr['optname'] 	= $this->adminname;
			$uarr['status'] 	= 0;
			$sid 	= m('email_cont')->insert($uarr);
			m('reim')->asynurl('asynrun','sendemail', array(
				'id' => $sid
			));
		}
		return $msg;
	}
	
	/**
	*	测试发送邮件
	*/
	public function sendmail_test($id)
	{
		$rs 	= $this->getone($id);
		$num 	= $rs['num'];
		return $this->sendmail('测试邮件帐号','这只是一个测试邮件帐号，不要紧张！<br>来自：'.TITLE.'<br>发送人：'.$this->adminname.'<br>发送时间：'.$this->rock->now().'', $this->adminid, array(), $num, 1);
	}
	
	/**
	*	异步发送邮件
	*/
	public function sendemailcont($id)
	{
		$rs 	= m('email_cont')->getone($id);
		if(!$rs)return;
		$msg 	= $this->sendmail($rs['title'],$rs['body'], $rs['receid'], array(), $rs['emailid'], 1);
		$status = '2';
		if($msg=='ok')$status = '1';
		$uarr['status'] = $status;
		$uarr['senddt'] = $this->rock->now();
		m('email_cont')->update($uarr, $id);
	}
	
}