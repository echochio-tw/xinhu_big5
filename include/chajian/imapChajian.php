<?php 
/**
*	imap 收郵件擴展

	imap_search 使用返回Id
	http://php.net/manual/en/function.imap-search.php
	ALL	返回所有合乎標準的信件
	ANSWERED	信件有配置 \\ANSWERED 標志者
	BCC "字符串"	Bcc 欄中有指定 "字符串" 的信件
	BEFORE "日期"	指定 "日期" 以前的信件
	BODY "字符串"	內文字段中有指定 "字符串" 的信件
	CC "字符串"	Cc 欄中有指定 "字符串" 的信件
	DELETED	合乎已刪除的信件
	FLAGGED	信件有配置 \\FLAGGED 標志者
	FROM "字符串"	From 欄中有指定 "字符串" 的信件
	KEYWORD "字符串"	關鍵字為指定 "字符串" 者
	NEW	新的信件
	OLD	舊的信件
	ON "日期"	指定 "日期" 的信件
	RECENT	信件有配置 \\RECENT 標志者
	SEEN	信件有配置 \\SEEN 標志者
	SINCE "日期"	指定 "日期" 之後的信件
	SUBJECT "字符串"	Subject 欄中有指定 "字符串" 的信件
	TEXT "字符串"	Text 欄中有指定 "字符串" 的信件
	TO "字符串"	To 欄中有指定 "字符串" 的信件
	UNANSWERED	未回應的信件
	UNDELETED	未刪除的信件
	UNFLAGGED	未配置標志的信件
	UNKEYWORD "字符串"	未配置關鍵 "字符串" 的信件
	UNSEEN	未讀取的信件
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
	
	
	/**
	*	讀取某日期後的郵件
	*	@params $link 服務器
	*	@params $user 郵箱
	*	@params $pass 郵箱密碼
	*	@params $time 時間戳，默認7天前的
	*/
	public function receemail($link, $user, $pass, $time=0)
	{
		if(isempt($link))return '未設置收郵件imap服務器';
		if(isempt($user))return '用戶未設置郵箱';
		if(isempt($pass))return '郵箱['.$user.']未設置密碼';
		
		if(!$this->supportbool)return '系統未開啟imap收郵件擴展';
		$this->marubox 			= @imap_open($link,$user,$pass);
		$this->struck_tearr		= array();
		if(!$this->marubox)return '不能連接到['.$link.']可能帳號密碼有錯';
		if($time == 0)$time		= time() - 7*24*3600;
		$ondt 					= date('j M Y', $time);
		$searcharr 				= imap_search($this->marubox, 'SINCE "'.$ondt.'"');//指定日期之後
		$rows 					= array();
		//return $searcharr;
		if($searcharr)foreach($searcharr as $k=>$i){
			$headers 	= $this->getheader($i);
			$body 		= $this->getBody($i);
			$headers['body']	= $body;
			$headers['num']		= $i;
			$headers['attach']	= $this->getattach($i);
			$rows[] = $headers;
		}
		imap_close($this->marubox, CL_EXPUNGE);
		return $rows;
		$totalrows 	= imap_num_msg($this->marubox); //取得信件數
		$rows 		= array();
		for ($i=1;$i<=$totalrows;$i++){
			$headers 	= $this->getheader($i); //獲取某信件的標頭信息
			$body 		= $this->getBody($i); 	//獲取信件正文
			$headers['body']	= $body;
			$headers['num']		= $i;
			$headers['attach']	= $this->getattach($i);
			$rows[] = $headers;
		}
		imap_close($this->marubox, CL_EXPUNGE);
		return $rows;
	}
	
	/**
	*	下載附件
	*/
	public function downattach($link, $user, $pass, $num, $key)
	{
		
	}
	
	private function getfetchstructure($i)
	{
		if(!isset($this->struck_tearr[$i])){
			$struck = imap_fetchstructure($this->marubox,$i);
		}else{
			$struck = $this->struck_tearr[$i];
		}
		return $struck;
	}
	
	/**
	*	獲取附件
	*/
	private function getattach($i)
	{
		$arr 	= array();
		$struck = $this->getfetchstructure($i);
		if($struck && isset($struck->parts))foreach($struck->parts as $key=>$val){
			if($val->subtype=='OCTET-STREAM'){
				if(isset($val->dparameters[0]))$arr[] = array(
					'filename' => $this->_imap_utf8($val->dparameters[0]->value),
					'filesize' => $val->bytes,
					'encoding' => $val->encoding,
					'filekey'  => $key,
					'attachcont' => $this->getattachcont($i, $key, $val->encoding) //獲取附件內容
				);
			}
		}
		return $arr;
	}
	
	/**
	*	附件內容讀取，需要額外讀取
	*/
	public function getattachcont($i, $key, $encoding)
	{
		$message = imap_fetchbody($this->marubox, $i, $key + 1);
		switch ($encoding) {
			case 0:
				$message = imap_8bit($message);
				break;
			case 1:
				$message = imap_8bit($message);
				break;
			case 2:
				$message = imap_binary($message);
				break;
			case 3:
				$message = imap_base64($message);
				break;
			case 4:
				$message = quoted_printable_decode($message);
				break;
			case 5:
				$message = $message;
				break;
		}
		return $message;
	}
	
	private function getkevel($st, $kdy, $dev='')
	{
		return objvalue($st, $kdy, $dev);
	}
	
	/**
	*	獲取某信件的標頭信息
	*/
	private function getheader($i)
	{
		$headers 	= imap_header($this->marubox, $i);

		$arr['subject'] 	= $this->_imap_utf8($this->getkevel($headers,'subject'));//標題
		$arr['message_id'] 	= $this->getkevel($headers,'message_id');//郵件ID
		$arr['size'] 		= $this->getkevel($headers,'Size','0');	//郵件大小
		$arr['date'] 		= date('Y-m-d H:i:s', strtotime($this->getkevel($headers,'date')));
		$arr['to']			= array();
		$arr['from']		= array();
		
		//發給
		if(isset($headers->to)){
			$arr['to']			= $headers->to;
			foreach($arr['to'] as $k=>$rs){
				$arr['to'][$k]->personal = $this->_imap_utf8($this->getkevel($rs, 'personal'));
				$arr['to'][$k]->email 	 = ''.$rs->mailbox.'@'.$rs->host.'';
			}
		}
		$arr['toemail']		= $this->stremail($arr['to']);
		
		//發件人
		if(isset($headers->from)){
			$arr['from']			= $headers->from;
			foreach($arr['from'] as $k=>$rs){
				$arr['from'][$k]->personal 	= $this->_imap_utf8($this->getkevel($rs, 'personal'));
				$arr['from'][$k]->email 	= ''.$rs->mailbox.'@'.$rs->host.'';
			}
		}
		$arr['fromemail']		= $this->stremail($arr['from']);
		
		//回復的郵件
		if(isset($headers->reply_to)){
			$arr['reply_to']			= $headers->reply_to;
			foreach($arr['reply_to'] as $k=>$rs){
				$arr['reply_to'][$k]->personal 	= $this->_imap_utf8($this->getkevel($rs, 'personal'));
				$arr['reply_to'][$k]->email 	= ''.$rs->mailbox.'@'.$rs->host.'';
			}
			$arr['reply_toemail']		= $this->stremail($arr['reply_to']);
		}else{
			$arr['reply_toemail']		= $arr['fromemail'];
		}
		
		//抄送
		$arr['cc']				= array();
		if(isset($headers->cc)){
			$arr['cc']			= $headers->cc;
			foreach($arr['cc'] as $k=>$rs){
				$arr['cc'][$k]->personal = $this->_imap_utf8($this->getkevel($rs, 'personal'));
				$arr['cc'][$k]->email 	 = ''.$rs->mailbox.'@'.$rs->host.'';
			}
		}
		$arr['ccemail']			= $this->stremail($arr['cc']);
		
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
            $structure = $this->getfetchstructure($msg_number);; 
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
	*	獲取郵件內容
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