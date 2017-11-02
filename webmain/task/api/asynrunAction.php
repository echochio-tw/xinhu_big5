<?php
class asynrunClassAction extends apiAction
{
	public function initAction()
	{
		$this->display	= false;
		$uid   			= (int)$this->get('adminid');
		$key   			= $this->get('asynkey');
		$mykey			= getconfig('asynkey');
		if($mykey != ''){
			$wodkey 	= md5(md5($mykey));
			if($wodkey != $key)exit('sorry,asyn');
		}
		$urs 			= m('admin')->getone($uid,'`id`,`name`,`user`');
		if($urs)$this->setNowUser($urs['id'], $urs['name'], $urs['user']);
	}
	
	//測試
	public function indexAction()
	{
		$runtime = $this->get('runtime');
		$this->rock->debugs('hehe:'.time().','.$runtime.'','yibu');
		echo 'lala'.time().'';
	}
	
	//消息同步到微信企業會話
	public function wxchattbAction()
	{
		$id   = (int)$this->get('id');
		return m('weixin:chat')->chattongbu($id);
	}
	
	//消息同步到企業客服消息匯總
	public function wxkefutbAction()
	{
		$id   = (int)$this->get('id');
		return m('weixin:kefu')->chattongbu($id);
	}
	
	//薪資發放通知給人員
	public function salaryffAction()
	{
		$id    = (int)$this->get('id');
		return m('flow')->initflow('hrsalary', $id)->todouser();
	}
	
	//下載微信發送的圖片到服務器
	public function downwxpicAction()
	{
		$picurl = $this->rock->jm->uncrypt($this->get('picurl'));
		$msgid  = $this->get('msgid');
		return m('reim')->downwximg($picurl, $msgid);
	}
	
	//下載微信上媒體文件
	public function downwxmediaAction()
	{
		$mediaid 	= $this->get('mediaid');
		$msgid  	= $this->get('msgid');
		$fileext  	= $this->get('fileext');
		$barr = m('weixin:media')->downmedia($mediaid, $fileext, $msgid);
		return $barr;
	}
	
	//異步發送郵件
	public function sendemailAction()
	{
		$id   	= (int)$this->get('id');
		$msg 	= m('email')->sendemailcont($id);
		if($msg!='ok')m('log')->addlogs('郵件', $msg , 2);
		return $msg;
	}
	
	//異步微信企業號發送提醒
	public function wxsendmsgAction()
	{
		$body = $this->get('body');
		if($body=='')return;
		$body	= $this->jm->base64decode($body);
		$barr 	= m('weixin:index')->sendbody($body);
		m('log')->todolog('微信提醒', $barr);
		
		return $barr;
	}
	
	//異步企業微信發送提醒
	public function wxqysendmsgAction()
	{
		$body 		= $this->get('body');
		$agentid 	= $this->get('agentid');
		if($body=='')return;
		$body	= $this->jm->base64decode($body);
		$barr 	= m('weixinqy:index')->sendbody($body, $agentid);
		m('log')->todolog('企業微信提醒', $barr);
		return $barr;
	}
	
	//企業微信異步獲取頭像
	public function wxqyfaceAction()
	{
		$userid = $this->get('userid');
		if($userid=='')return;
		$barr 	= m('weixinqy:user')->anayface($userid);
		m('log')->todolog('企業微信提醒', $barr);
		return $barr;
	}
	
	//釘釘異步提醒
	public function ddsendmsgAction()
	{
		$body = $this->get('body');
		if($body=='')return;
		$body	= $this->jm->base64decode($body);
		$barr 	= m('dingding:index')->sendbody($body);
		m('log')->todolog('釘釘提醒', $barr);
		return $barr;
	}
	
	//轉pdf完成了設置
	public function topdfokAction()
	{
		$id    	= (int)$this->get('id');
		$type 	= $this->get('type','html');
		$frs 	= m('file')->getone($id);
		$pdfpath= str_replace('.'.$frs['fileext'].'','.'.$type.'', $frs['filepath']);
		if(!file_exists($pdfpath))return;
		if($type=='html'){
			$cont = file_get_contents($pdfpath);
			$str1 = '<meta http-equiv=Content-Type content="text/html; charset=gb2312">';
			$cont = str_replace('</head>', ''.$str1.'</head>', $cont);
			$this->rock->createtxt($pdfpath, $cont);
		}
		m('file')->update("`pdfpath`='$pdfpath'", $id);
	}
	
	//發送短信
	public function sendsmsAction()
	{
		$tomobile 	= $this->get('tomobile');
		$qiannum 	= $this->get('qiannum');
		$tplnum 	= $this->get('tplnum');
		$url 		= $this->jm->base64decode($this->get('url'));
		$params 	= json_decode($this->jm->base64decode($this->get('params')), true);
		return c('xinhuapi')->send($tomobile, $qiannum, $tplnum, $params, $url);
	}
	
	//訂閱的
	public function subscribeAction()
	{
		$id 		= $this->get('id');
		$uid 		= $this->get('uid');
		$receid 	= $this->get('receid');
		$recename 	= $this->jm->base64decode($this->get('recename'));
		$flow = m('flow')->initflow('subscribeinfo');
		return $flow->subscribe($id, $uid, $receid, $recename);
	}
}