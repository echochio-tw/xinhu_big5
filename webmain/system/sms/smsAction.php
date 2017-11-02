<?php
class smsClassAction extends Action
{
	public function initAction()
	{
		$this->smsobj = c('xinhuapi');
	}
	
	public function gettotalAjax()
	{
		$barr = $this->smsobj->getdata('sms','smstotal');
		$barr['sms_iscb'] = $this->option->getval('sms_iscb','0');
		$barr['sms_cbnum'] = $this->option->getval('sms_cbnum','defnum');
		return $barr;
	}
	
	//保存設置
	public function cogsaveAjax()
	{
		$this->option->setval('sms_iscb', $this->get('sms_iscb','0'));
		$this->option->setval('sms_cbnum', $this->get('sms_cbnum'));
	}
	
	//測試
	public function testsendAjax()
	{
		$mobile = $this->get('mobile');
		$barr 	= $this->smsobj->send($mobile,'','defurls', array(
			'modename' 	=> '測試短信',
			'sericnum' 	=> 'AB-20170117-0001',
		),''.URL.'?d=we', false);
		return $barr;
	}
	
	//獲取簽名
	public function getqianAjax()
	{
		$barr = $this->smsobj->getdata('sms','getqian');
		$rows = array();
		if($barr['success']){
			$rows = $barr['data'];
		}
		return array(
			'rows' => $rows
		);
	}
	
	//獲取發送記錄
	public function getrecordAjax()
	{
		$barr = $this->smsobj->getdata('sms','getrecord');
		$rows = array();
		if($barr['success']){
			$rows = $barr['data'];
		}
		return array(
			'rows' => $rows
		);
	}
	//保存簽名
	public function saveqianAjax()
	{
		if(getconfig('systype')=='demo')return returnerror('demo演示上禁止操作');
		$cont = $this->post('cont');
		$num  = $this->post('num');
		$isgk = (int)$this->post('isgk',1);
		$barr = $this->smsobj->postdata('sms','saveqian', array(
			'cont' 	=> $cont,
			'num' 	=> $num,
			'isgk' 	=> $isgk,
		));
		return $barr;
	}
	
	//獲取模版
	public function gettplAjax()
	{
		$barr = $this->smsobj->getdata('sms','gettpl');
		$rows = array();
		if($barr['success']){
			$rows = $barr['data'];
		}
		return array(
			'rows' => $rows
		);
	}
	//保存模版
	public function savetplAjax()
	{
		if(getconfig('systype')=='demo')return returnerror('demo演示上禁止操作');
		$cont = $this->post('cont');
		$num  = $this->post('num');
		$isgk = 1;
		$barr = $this->smsobj->postdata('sms','savetpl', array(
			'cont' 	=> $cont,
			'num' 	=> $num,
			'isgk' 	=> 1,
		));
		return $barr;
	}
	
	//刪除模版
	public function deltplAjax()
	{
		if(getconfig('systype')=='demo')return returnerror('demo演示上禁止操作');
		$num  = $this->post('num');
		$barr = $this->smsobj->getdata('sms','deltpl', array(
			'num' 	=> $num,
		));
		return $barr;
	}
	
	//刷新模版狀態
	public function relaodtplAjax()
	{
		$num  = $this->post('num');
		$barr = $this->smsobj->getdata('sms','reloadtpl', array(
			'num' 	=> $num,
		));
		return $barr;
	}
	
	//刷新狀態
	public function reloadsignAjax()
	{
		$barr = $this->smsobj->getdata('sms','reloadsign');
		return $barr;
	}
}