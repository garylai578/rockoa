<?php 
/**
*	imap 收邮件扩展
*/
set_time_limit(1800);
class imapChajian extends Chajian
{
	private $supportbool = true;
	
	protected function initChajian()
	{
		$this->supportbool 	= $this->isimap();
		$this->marubox		= false;
	}
	
	public function isimap()
	{
		return function_exists('imap_open');
	}
	
	public function receemail()
	{
		if(!$this->supportbool)exit('系统不支持imap收邮件扩展');
		
		$mailServer	= "imap.exmail.qq.com"; //IMAP主机
		$mailLink	= "{{$mailServer}:143}INBOX" ; //imagp连接地址：不同主机地址不同
		$mailUser 	= ''; //邮箱用户名
		$mailPass 	= ''; //邮箱密码

		$this->marubox 		= imap_open($mailLink,$mailUser,$mailPass); //开启信箱imap_open
		if(!$this->marubox)exit('不能连接收件服务器');
		//$wdboxarr 			= imap_search($this->marubox, 'UNSEEN');//未读
		//$wdboxarr 			= imap_search($this->marubox, "SINCE ");//指定日期之后
		
		//print_r($wdboxarr);exit;
		
		$totalrows 	= imap_num_msg($this->marubox); //取得信件数
		$rows 		= array();
		for ($i=1;$i<=$totalrows;$i++){
			$headers 	= $this->getheader($i); //获取某信件的标头信息
			$body 		= $this->getBody($i); 	//获取信件正文
			$headers['body']	= $body;
			$headers['num']		= $i;
			$rows[] = $headers;
		}
		imap_close($this->marubox, CL_EXPUNGE);
		
		return $rows;
	}
	
	/**
	*	获取某信件的标头信息
	*/
	private function getheader($i)
	{
		$headers 	= imap_header($this->marubox, $i);

		$arr['subject'] 	= $this->_imap_utf8($headers->subject);//标题
		$arr['message_id'] 	= $headers->message_id;	//邮件ID
		$arr['size'] 		= $headers->Size;	//邮件大小
		$arr['date'] 		= date('Y-m-d H:i:s', strtotime($headers->date));
		//发给
		$arr['to']			= $headers->to;
		foreach($arr['to'] as $k=>$rs){
			$arr['to'][$k]->personal = $this->_imap_utf8($rs->personal);
			$arr['to'][$k]->email 	 = ''.$rs->mailbox.'@'.$rs->host.'';
		}
		$arr['toemail']		= $this->stremail($arr['to']);
		
		//发件人
		$arr['from']			= $headers->from;
		foreach($arr['from'] as $k=>$rs){
			$arr['from'][$k]->personal 	= $this->_imap_utf8($rs->personal);
			$arr['from'][$k]->email 	= ''.$rs->mailbox.'@'.$rs->host.'';
		}
		$arr['fromemail']		= $this->stremail($arr['from']);
		
		//回复的邮件
		$arr['reply_to']			= $headers->reply_to;
		foreach($arr['reply_to'] as $k=>$rs){
			$arr['reply_to'][$k]->personal 	= $this->_imap_utf8($rs->personal);
			$arr['reply_to'][$k]->email 	= ''.$rs->mailbox.'@'.$rs->host.'';
		}
		$arr['reply_toemail']		= $this->stremail($arr['reply_to']);
		
		//抄送
		$arr['cc']					= array();
		if(isset($headers->cc)){
			$arr['cc']			= $headers->cc;
			foreach($arr['cc'] as $k=>$rs){
				$arr['cc'][$k]->personal = $this->_imap_utf8($rs->personal);
				$arr['cc'][$k]->email 	 = ''.$rs->mailbox.'@'.$rs->host.'';
			}
		}
		$arr['ccemail']		= $this->stremail($arr['cc']);
		
		$arr['headers'] 		= $headers;
		return $arr;
	}
	
	private function stremail($arr)
	{
		$str = '';
		if(is_array($arr))foreach($arr as $k=>$rs){
			$str.=','.$rs->personal.'('.$rs->mailbox.'@'.$rs->host.')';
		}
		if($str!='')$str = substr($str, 1);
		return $str;
	}
	
	
	private function _imap_utf8($text) {  
		$text	=  iconv_mime_decode($text,0, 'UTF-8'); 
        return $text;  
    }  
  
    private function _iconv_utf8($text) {
		$encode = mb_detect_encoding($text, array('ASCII','UTF-8','GB2312','GBK','BIG5'));
		if($encode != 'UTF-8'){
			return iconv($encode, 'utf-8', $text);
		}else{
			return $text;
		}
        @$s1 = iconv('gbk', 'utf-8', $text);  
        $s0  = iconv('utf-8', 'gbk', $s1);  
        if ($s0 == $text) {  
            return $s1;  
        } else {  
            return $text;  
        }  
    }

	function get_mime_type(&$structure) { //Get Mime type Internal Private Use  
        $primary_mime_type = array("TEXT", "MULTIPART", "MESSAGE", "APPLICATION", "AUDIO", "IMAGE", "VIDEO", "OTHER");  
  
        if ($structure->subtype) {  
            return $primary_mime_type[(int) $structure->type] . '/' . $structure->subtype;  
        }  
        return "TEXT/PLAIN";  
    } 
	
	private function get_part($stream, $msg_number, $mime_type, $structure = false, $part_number = false) { //Get Part Of Message Internal Private Use  
        if (!$structure) {  
            $structure = imap_fetchstructure($stream, $msg_number);  
        }  
        if ($structure) {  
            if ($mime_type == $this->get_mime_type($structure)) {  
                if (!$part_number) {  
                    $part_number = "1";  
                }  
                $text = imap_fetchbody($stream, $msg_number, $part_number);  
                if ($structure->encoding == 3) {  
                    return imap_base64($text);  
                } else if ($structure->encoding == 4) {  
                    return imap_qprint($text);  
                } else {  
                    return $text;  
                }  
            }  
            if ($structure->type == 1) /* multipart */ {  
                while (list($index, $sub_structure) = each($structure->parts)) {  
                    $prefix = '';  
                    if ($part_number) {  
                        $prefix = $part_number . '.';  
                    }  
                    $data = $this->get_part($stream, $msg_number, $mime_type, $sub_structure, $prefix . ($index + 1));  
                    if ($data) {  
                        return $data;  
                    }  
                }  
            }  
        }  
        return false;  
    } 
	
	/**
	*	获取邮件内容
	*/
	private function getBody($mid) { 
        $body = $this->get_part($this->marubox, $mid, "TEXT/HTML");  
        if ($body == "") {  
            $body = $this->get_part($this->marubox, $mid, "TEXT/PLAIN");  
        }  
        if ($body == "") {  
            return "";  
        }  
        return $this->_iconv_utf8($body);  
    }
}