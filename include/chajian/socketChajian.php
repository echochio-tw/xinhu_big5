<?php
class socketChajian extends Chajian
{
	//UDP服務器主機，不需要修改
	private $serverhost = '127.0.0.1';
	
	//UDP服務端口，數字類型
	private $serverport = 780;			
	
	/**
	*	UDP發送文本
	*/
	public function udpsend($str)
	{
		if(!function_exists('socket_create'))return '沒有開啟Socket組件';
		$sock 	= socket_create(AF_INET, SOCK_DGRAM, SOL_UDP);
		$len 	= strlen($str);
		$bo 	= socket_sendto($sock, $str, $len, 0, $this->serverhost, $this->serverport);
		socket_close($sock);
		return $bo;
	}
	
	/**
	*	轉pdf發送命令
	*/
	public function topdf($path, $fid, $type)
	{
		$flx	= 'doc';
		if($type=='xls' || $type=='xlsx')$flx='xls';
		if($type=='ppt' || $type=='pptx')$flx='ppt';
		$topah 	= ''.ROOT_PATH.'/mode/pdfjs/topdf/'.$flx.'.js';
		if(!file_exists($topah))return '沒有安裝轉化插件';
		$url  	= m('base')->getasynurl('asynrun', 'topdfok', array('id'=>$fid));;
		$path 	= ''.ROOT_PATH.'/mode/pdfjs/topdf/start.bat "'.$topah.'" "'.ROOT_PATH.'/'.$path.'" "'.$url.'"';
		$bo 	= $this->udpsend($path);
		return $bo;
	}
	
	/**
	*	用udp推送
	*/
	public function udppush($str, $host='', $port=0)
	{
		$msg 	= '';
		if(!function_exists('stream_socket_client'))$msg= '沒有開啟Socket組件';
		if($msg==''){
			$handle = stream_socket_client("udp://{$host}:{$port}", $errno, $errstr);
			if(!$handle){  
				$msg = "ERROR: {$errno} - {$errstr}"; 
			}
			if($msg==''){
				fwrite($handle, $str);  
				$bstr = fread($handle, 1024); 
				fclose($handle);
				if(isempt($bstr))$msg = 'error';
			}
		}
		$barr['code'] = 0;
		$barr['msg']  = 'ok';
		if($msg!=''){
			$barr['code'] = 2;
			$barr['msg']  = $msg;
		}	
		return $barr;
	}
}