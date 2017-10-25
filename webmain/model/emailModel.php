<?php
class emailClassModel extends Model
{
	
	private $errorinfo = '';
	
	public function initModel()
	{
		$this->settable('email_cog');
	}
	/**
	*	系統郵件發送郵件
	*	$to_uid 發送給。。。
	*	$rows	內容
	*/
	public function sendmail($title, $body, $to_uid, $rows=array(), $zjsend=0)
	{
		$setrs		= m('option')->getpidarr(-1);
		if(!$setrs)return '未設置發送郵件';
		
		$serversmtp 	= $this->rock->arrvalue($setrs, 'email_sendhost');
		$emailuser  	= $this->rock->arrvalue($setrs, 'email_sysuser');
		$emailname  	= $this->rock->arrvalue($setrs, 'email_sysname');
		$emailpass  	= $this->rock->arrvalue($setrs, 'email_syspass');
		$serverport  	= $this->rock->arrvalue($setrs, 'email_sendport');
		$emailsecure  	= $this->rock->arrvalue($setrs, 'email_sendsecure');
		
		if(isempt($serversmtp) || isempt($serverport) || isempt($emailuser)|| isempt($emailpass))return '未設置發送帳號';

		$to_em	= $to_mn = $to_id 	= '';
		
		$urs	= $this->db->getall("select `email`,`name`,`id` from `[Q]admin` where `id` in($to_uid) and `email` is not null and `status`=1 order by `sort`");
		foreach($urs as $k=>$rs){
			$to_em.=','.$rs['email'];
			$to_mn.=','.$rs['name'];
			$to_id.=','.$rs['id'];
		}	
		
		if(isempt($to_em))return '沒有接收人';
		
		$to_em	= substr($to_em, 1);
		$to_mn	= substr($to_mn, 1);
		$to_id	= substr($to_id, 1);
		
		$body	= $this->rock->reparr($body, $rows);
		$title	= $this->rock->reparr($title, $rows);
			
		$body	= str_replace("\n", '<br>', $body);
		
		$msg 	= 'ok';
		
		if(!getconfig('asynsend') || $zjsend==1){
			$bo 	= $this->sendddddd(array(
				'emailpass' 	=> $emailpass,
				'serversmtp' 	=> $serversmtp,
				'serverport' 	=> $serverport,
				'emailsecure' 	=> $emailsecure,
				'emailuser' 	=> $emailuser,
				'emailname' 	=> $emailname,
				'receemail' 	=> $to_em,
				'recename' 		=> $to_mn,
				'title' 		=> $title,
				'body' 			=> $body,
			), true);
			if(!$bo)$msg = $this->errorinfo;
		}else{
			//異步發送郵件
			$uarr['title'] 		= $title;
			$uarr['body'] 		= $body;
			$uarr['receid'] 	= $to_id;
			$uarr['recename'] 	= $to_mn;
			$uarr['receemail'] 	= $to_em;
			$uarr['optdt'] 		= $this->rock->now();
			$uarr['optid'] 		= $this->adminid;
			$uarr['optname'] 	= $this->adminname;
			$uarr['status'] 	= 0;
			$sid 	= m('email_cont')->insert($uarr);
			m('reim')->asynurl('asynrun','sendemail', array(
				'id' 	=> $sid,
				'stype' => 0
			));
		}
		return $msg;
	}
	
	/**
	*	
	*/
	public function sendtoemail($params=array())
	{
		$setrs		= m('option')->getpidarr(-1);
		if(!$setrs)return '未設置發送郵件';
		
		$serversmtp 	= $this->rock->arrvalue($setrs, 'email_sendhost');
		$emailuser  	= $this->rock->arrvalue($setrs, 'email_sysuser');
		$emailname  	= $this->rock->arrvalue($setrs, 'email_sysname');
		$emailpass  	= $this->rock->arrvalue($setrs, 'email_syspass');
		$serverport  	= $this->rock->arrvalue($setrs, 'email_sendport');
		$emailsecure  	= $this->rock->arrvalue($setrs, 'email_sendsecure');
		
		$barr 			= array(
			'emailpass' 	=> $emailpass,
			'serversmtp' 	=> $serversmtp,
			'serverport' 	=> $serverport,
			'emailsecure' 	=> $emailsecure,
			'emailuser' 	=> $emailuser,
			'emailname' 	=> $emailname,
			'receemail' 	=> '',
			'recename' 		=> '',
			'title' 		=> '',
			'body' 			=> '',
		);
		foreach($params as $k=>$v)$barr[$k]=$v;
		return $this->sendddddd($barr, true);
	}
	
	//$jbs 密碼是否加密 保存日志$log
	private function sendddddd($arr, $jbs, $log=false)
	{
		extract($arr);
		$pass	= $emailpass;
		if($jbs)$pass	= $this->rock->jm->uncrypt($pass);
		$mail	= c('mailer');
		$mail->setHost($serversmtp, $serverport, $this->rock->repempt($emailsecure));
		$mail->setUser($emailuser, $pass);
		$mail->setFrom($emailuser, $emailname);
		$mail->addAddress($receemail, $recename);
		if(isset($ccemail) && !isempt($ccemail)){
			$mail->addCC($ccemail, $ccname);
		}
		if(isset($attachpath) && !isempt($attachpath)){
			$mail->addAttachment($attachpath, $attachname);
		}
		$mail->sendMail($title, $body);
		$bo		= $mail->isSuccess();
		if(!$bo){
			$this->errorinfo = 'error:'.$mail->getErrror().';to:'.$receemail.'';
		}
		return $bo;
	}
	
	/**
	*	測試發送郵件
	*/
	public function sendmail_test()
	{
		return $this->sendmail('測試郵件帳號','這只是一個測試郵件帳號，不要緊張！<br>來自：'.TITLE.'<br>發送人：'.$this->adminname.'<br>網址：'.URL.'<br>發送時間：'.$this->rock->now().'', $this->adminid, array(),1);
	}
	
	/**
	*	異步發送郵件
	*/
	public function sendemailcont($id)
	{
		$rs 	= m('email_cont')->getone($id);
		if(!$rs)return '記錄不存在';
		$stype	= (int)$this->rock->get('stype');
		if($stype == 0){
			$msg 	= $this->sendmail($rs['title'],$rs['body'], $rs['receid'], array(), 1);
		}else{
			$msg 	= $this->sendemailout($rs['optid'],array(
				'title' 	=> $rs['title'],
				'body' 		=> $rs['body'],
				'receemail' => $rs['receemail'],
				'recename' 	=> $rs['recename'],
				'ccname' 	=> $rs['ccname'],
				'ccemail' 	=> $rs['ccemail'],
				'attachpath'=> $rs['attachpath'],
				'attachname'=> $rs['attachname'],
			), 1);
		}
		$status = '2';
		if($msg=='ok')$status = '1';
		$uarr['status'] = $status;
		$uarr['senddt'] = $this->rock->now();
		m('email_cont')->update($uarr, $id);
		return $msg;
	}
	
	
	/**
	*	用戶自己外發發送
	*/
	public function sendemailout($sendid, $canarr = array(), $zjsend=0)
	{
		$sendarr 		= array(
			'title'			=> '',
			'body'			=> '',
			'receemail'		=> '',
			'recename'		=> '',
			'ccname'		=> '',
			'ccemail'		=> '',
			'attachpath'	=> '',
			'attachname'	=> '',
		);
		foreach($canarr as $k=>$v)$sendarr[$k] = $v;
		extract($sendarr);
		$setrs			= m('option')->getpidarr(-1);
		if(!$setrs)return '未設置發送郵件';
		$serversmtp 	= $this->rock->arrvalue($setrs, 'email_sendhost');
		$serverport  	= $this->rock->arrvalue($setrs, 'email_sendport');
		$emailsecure  	= $this->rock->arrvalue($setrs, 'email_sendsecure');
		$myuser 		= m('admin')->getone($sendid,'name,email,emailpass');
		if(!$myuser)return '發送人不存在';

		$emailuser  	= $this->rock->arrvalue($myuser, 'email');
		$emailname  	= $this->rock->arrvalue($myuser, 'name');
		$emailpass  	= $this->rock->arrvalue($myuser, 'emailpass');
		
		if(isempt($serversmtp) || isempt($serverport) || isempt($emailuser)|| isempt($emailpass))return '用戶未設置郵件帳號密碼';
		
		$msg 	= 'ok';
		if(!getconfig('asynsend') || $zjsend==1){
			$bo 	= $this->sendddddd(array(
				'emailpass' 	=> $emailpass,
				'serversmtp' 	=> $serversmtp,
				'serverport' 	=> $serverport,
				'emailsecure' 	=> $emailsecure,
				'emailuser' 	=> $emailuser,
				'emailname' 	=> $emailname,
				'receemail' 	=> $receemail,
				'recename' 		=> $recename,
				'ccname' 		=> $ccname,
				'ccemail' 		=> $ccemail,
				'attachpath' 	=> $attachpath,
				'attachname' 	=> $attachname,
				'title' 		=> $title,
				'body' 			=> $body,
			), false);
			if(!$bo)$msg = $this->errorinfo;
		}else{
			//異步發送郵件
			$uarr['title'] 		= $title;
			$uarr['body'] 		= $body;
			$uarr['receid'] 	= '';
			$uarr['recename'] 	= $recename;
			$uarr['receemail'] 	= $receemail;
			$uarr['ccname'] 	= $ccname;
			$uarr['ccemail'] 	= $ccemail;
			$uarr['attachpath'] = $attachpath;
			$uarr['attachname'] = $attachname;
			$uarr['optdt'] 		= $this->rock->now();
			$uarr['optid'] 		= $this->adminid;
			$uarr['optname'] 	= $this->adminname;
			$uarr['status'] 	= 0;
			$sid 	= m('email_cont')->insert($uarr);
			
			m('reim')->asynurl('asynrun','sendemail', array(
				'id' 	=> $sid,
				'stype' => 1
			));
		}
		return $msg;
	}
}