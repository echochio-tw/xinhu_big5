<?php 
class indexClassAction extends apiAction
{
	public function indexAction()
	{
		$this->showreturn('','error', 203);
	}
	
	/**
	*	手機app讀取
	*/
	public function indexinitAction()
	{
		$dbs 			= m('reim');
		$ntime			= floatval($this->post('ntime'));
		$uid 			= $this->adminid;
		$arr['loaddt']  	= $this->now;
		$arr['splittime'] 	= (int)($ntime/1000-time());
		$arr['reimarr']		= $dbs->gethistory($uid);
		$this->showreturn($arr);
	}
	
	/**
	* app首頁接口截止
	*/
	public function indexappAction()
	{
		$dbs 			= m('reim');
		$ntime			= floatval($this->post('ntime'));
		$uid 			= $this->adminid;
		$agent 			= $dbs->getappagent($uid);
		$arr['loaddt']  	= $this->now;
		$arr['splittime'] 	= (int)($ntime/1000-time());
		$arr['reimarr']		= $dbs->gethistory($uid);
		$arr['agentarr']	= $agent['rows'];
		$arr['agentstotal']	= $agent['stotal'];
		$arr['maxupsize']	= c('upfile')->getmaxzhao();//最大上傳大小M
		$this->showreturn($arr);
	}
	
	public function lunxunAction()
	{
		$uid 			= $this->adminid;
		$loaddt			= $this->post('loaddt');
		//$reimarr 		= m('reim')->getwdarr($uid, $loaddt);
		$reimarr 		= m('reim')->gethistory($uid, $loaddt);
		$arr['reimarr'] = $reimarr;
		$arr['loaddt']  = $this->now;
		m('login')->uplastdt();
		$this->showreturn($arr);
	}
	
	
	//應用獲取數據
	public function getyydataAction()
	{
		$num 	= $this->post('num');
		$event 	= $this->post('event');
		$page 	= (int)$this->post('page');
		$rows 	= m('agent:'.$num.'')->getdata($this->adminid, $num, $event, $page);
		
		$this->showreturn($rows);
	}
	
	public function yyoptmenuAction()
	{
		$num 	= $this->post('modenum');
		$sm 	= $this->post('sm');
		$optid 	= (int)$this->post('optmenuid');
		$zt 	= (int)$this->post('statusvalue');
		$mid 	= (int)$this->post('mid');
		$msg 	= m('flow')->opt('optmenu', $num, $mid, $optid, $zt, $sm);
		if($msg != 'ok')$this->showreturn('', $msg, 201);
		$this->showreturn('');
	}
	
	public function pushtestAction()
	{
		m('reim')->pushagent('1','會議','關于端午節放假通知');
		//$a = c('apiCloud')->send(1,'通知','內容');
		//$a = c('JPush')->send('2','發來一條消息', '內容');
		//print_r($a);
		echo 'ok';
	}
	
	public function changetxAction()
	{
		$apptx = (int)$this->post('apptx');
		m('admin')->update("`apptx`='$apptx'", $this->adminid);
		$this->showreturn('');
	}
}