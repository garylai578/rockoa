<?php 
/**
*	imap 收邮件扩展
*/
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
		
		//以腾讯企业邮箱做了测试
		$mailServer="imap.exmail.qq.com"; //IMAP主机

		$mailLink="{{$mailServer}:143}INBOX" ; //imagp连接地址：不同主机地址不同

		$mailUser = 'admin@rockoa.com'; //邮箱用户名

		$mailPass = 'a111111A'; //邮箱密码

		$this->marubox 		= imap_open($mailLink,$mailUser,$mailPass); //开启信箱imap_open
		if(!$this->marubox)exit('不能连接收件服务器');

		$totalrows = imap_num_msg($this->marubox); //取得信件数
		
		for ($i=1;$i<=$totalrows;$i++){
			echo "--------------------------------------------<br>\n\n\n";
			$imap_uid	=  imap_uid($this->marubox, $i);//取得信件 UID
			//echo $imap_uid;
		

			$headers = $this->getheader($i); //获取某信件的标头信息
			print_r($headers);

		
			
			//$mailBody = imap_fetchbody($this->marubox, $i, 1); //获取信件正文
			//$mailBody = imap_body($this->marubox, $i); //获取信件正文
			$mailBody = $this->getBody($i); //获取信件正文
			
			echo $mailBody;
		}
		
		imap_close($this->marubox, CL_EXPUNGE);  
	}
	
	/**
	*	获取某信件的标头信息
	*/
	private function getheader($i)
	{
		$headers 	= imap_header($this->marubox, $i);

		$arr['subject'] 	= $this->_imap_utf8($headers->subject);//标题
		$arr['message_id'] 	= $headers->message_id;	//邮件ID
		$arr['date'] 		= date('Y-m-d H:i:s', strtotime($headers->date));
		//发给
		$arr['to']			= $headers->to;
		foreach($arr['to'] as $k=>$rs){
			$arr['to'][$k]->personal = $this->_imap_utf8($rs->personal);
		}
		
		//发件人
		$arr['from']			= $headers->from;
		foreach($arr['from'] as $k=>$rs){
			$arr['from'][$k]->personal = $this->_imap_utf8($rs->personal);
		}
		//回复的邮件
		$arr['reply_to']			= $headers->reply_to;
		foreach($arr['reply_to'] as $k=>$rs){
			$arr['reply_to'][$k]->personal = $this->_imap_utf8($rs->personal);
		}
		//抄送
		$arr['cc']					= array();
		if(isset($headers->cc)){
			$arr['cc']			= $headers->cc;
			foreach($arr['cc'] as $k=>$rs){
				$arr['cc'][$k]->personal = $this->_imap_utf8($rs->personal);
			}
		}
		return $arr;
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