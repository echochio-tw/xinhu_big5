<?php 
/**
*	連接官網API，短信發送
*/

class xinhuapiChajian extends Chajian{
	
	private $updatekey 	= '';
	private $updatekeys = '';
	private $systemnum  = '';
	
	
	protected function initChajian()
	{
		if(getconfig('systype')=='dev'){
			$this->updatekeys  = 'aHR0cDovLzEyNy4wLjAuMS9hcHAvcm9ja2FwaS8:';
		}else{
			$this->updatekeys  = 'aHR0cDovL2FwaS5yb2Nrb2EuY29tLw::';
		}
		$this->updatekey	=$this->rock->jm->base64decode($this->updatekeys);
	}
	
	private function getsysnum()
	{
		$dbs 	= m('option');
		$this->systemnum  = $dbs->getval('systemnum');
		if(isempt($this->systemnum)){
			$rnd  	= md5(str_shuffle('abcedfghijk').rand(1000,9999));
			$dbs->setval('systemnum', $rnd);
			$this->systemnum = $rnd;
		}
		return $this->systemnum;
	}
	
	
	public function geturlstr($mod, $act, $can=array())
	{
		$url 	= $this->updatekey;
		$sysnum = $this->getsysnum();
		$url.= '?m='.$mod.'&a='.$act.'';
		$url.= '&host='.$this->rock->jm->base64encode(HOST).'&version='.VERSION.'&randtime='.time().'&ip='.$this->rock->ip.'&xinhukey='.getconfig('xinhukey').'&sysnum='.$sysnum.'';
		foreach($can as $k=>$v)$url.='&'.$k.'='.$v.'';
		return $url;
	}
	
	/**
	*	get獲取數據
	*/
	public function getdata($mod, $act, $can=array())
	{
		$url 	= $this->geturlstr($mod, $act, $can);
		$cont 	= c('curl')->getcurl($url);
		if(!isempt($cont) && contain($cont, 'success')){
			$data  	= json_decode($cont, true);
		}else{
			$data 	= returnerror('無法訪問到信呼官網的'.$this->updatekey.','.$cont.'');
		}
		return $data;
	}
	
	/**
	*	post發送數據
	*/
	public function postdata($mod, $act, $can=array())
	{
		$url 	= $this->geturlstr($mod, $act);
		$cont 	= c('curl')->postcurl($url, $can);
		if(!isempt($cont) && contain($cont, 'success')){
			$data  	= json_decode($cont, true);
		}else{
			$data 	= returnerror('無法訪問到信呼官網的'.$this->updatekey.','.$cont.'');
		}
		return $data;
	}
	
	/**
	*	發送短信
	*	$tomobile 手機號
	*	$qiannum 短信簽名編號
	*	$tplnum 短信模版編號
	*	$params 模版上的參數
	*	$url 詳情URL
	*	$addlog 是否添加日志
	*/
	public function send($tomobile,$qiannum, $tplnum, $params=array(), $url='', $addlog=true)
	{
		$para['sys_tomobile'] = $tomobile;
		$para['sys_tplnum']   = $tplnum;
		$para['sys_qiannum']  = $qiannum;
		
		$para['sys_url']   	  = $this->rock->jm->base64encode($url); //詳情的URL
		foreach($params as $k=>$v)$para['can_'.$k.''] = $v;
		
		$barr 	= $this->postdata('sms','send', $para);
		if(!$barr['success'] && $addlog)m('log')->addlogs('短信', $barr['msg'],2);
		return $barr;
	}
	
	
	/**
	*	根據用戶ID獲取手機號，發送短信
	*/
	public function sendsms($receid, $qiannum, $tplnum, $params=array(), $url='', $addlog=true, $isyb=true)
	{
		if(isempt($receid))return returnerror('沒有接收人');
		$tomobile = m('admin')->getjoinfields($receid, 'mobile');
		
		if(isempt($tomobile))return returnerror('接收人['.$receid.']可能沒設置手機號');
		
		//異步發送
		if(getconfig('asynsend') && $isyb){
			$ybbo = m('reim')->asynurl('asynrun','sendsms', array(
				'tomobile' 		=> $tomobile,
				'qiannum' 		=> $qiannum,
				'tplnum' 		=> $tplnum,
				'url' 			=> $this->rock->jm->base64encode($url),
				'params' 		=> $this->rock->jm->base64encode(json_encode($params)),
			));
			if($ybbo)return returnsuccess('異步發送');
		}
		
		return $this->send($tomobile, $qiannum, $tplnum, $params, $url, $addlog);
	}
	
	/**
	*	添加異步
	*/
	public function sendanay($m, $a,$can=array(), $runtime=0)
	{
		$runurl = m('base')->getasynurl($m, $a,$can, 1);
		$barr 	= $this->sendanayurl($runurl, $runtime);
		return $barr;
	}
	
	public function sendanayurl($runurl, $runtime=0)
	{
		if(isempt($runurl))return returnerror('異步調用地址不能為空');
		$para	= array(
			'runurl' => $this->rock->jm->base64encode($runurl),
			'runtime' => $runtime,
		);
		$barr 	= $this->postdata('anay','send', $para);
		
		if(!$barr['success'])m('log')->addlogs('調用官網異步', $barr['msg'],2);
		
		return $barr;
	}
	
	/**
	*	獲取驗證碼(1分鐘內只能獲取一次)，有效期5分鐘
	*	$tomobile 接收手機號
	*	$qiannum 簽名編號
	*	$tplnum 模版編號
	*/
	public function getvercode($tomobile, $tplnum='', $qiannum='')
	{
		if($tplnum=='')$tplnum = 'defyzm';
		$otme 	= floatval($this->rock->cookie('sms_vertime',0));
		if(isempt($tomobile))return returnerror('接收手機號不能為空');
		
		$jgtims = 60;//每次獲取間隔秒數
		$jgtime	= time()-$otme;
		if($otme>0 && $jgtime<$jgtims)return returnerror('獲取太頻繁,請'.($jgtims-$jgtime).'秒後在試');

		$code 	= rand(100000,999999);
		$params['code'] = $code;
		$barr 	= $this->send($tomobile, $qiannum, $tplnum, $params);
		//$barr['success'] = $code;
		if($barr['success']){
			$this->rock->savecookie('sms_vercode,sms_vertime,sms_yztime', array(md5($tomobile.$code), time(),1), 1/24/12);
		}
		return $barr;
	}
	
	/**
	*	驗證驗證碼是否正確,最多只能驗證5次
	*/
	public function checkcode($tomobile, $code)
	{
		if(isempt($tomobile))return returnerror('手機號不能為空');
		if(isempt($code))return returnerror('驗證碼不能為空');
		$codes 	= md5($tomobile.$code);
		$vercode= $this->rock->cookie('sms_vercode');
		$yztime = (int)$this->rock->cookie('sms_yztime','1'); //驗證次數
		$otme 	= floatval($this->rock->cookie('sms_vertime',0));
		if($otme<=0)return returnerror('未獲取驗證碼');
		$youxiaq= 5*60;//
		if(time() - $otme > $youxiaq)return returnerror('驗證碼已過期');
		$keys 	= 'sms_vercode,sms_vertime,sms_yztime';
		if($vercode != $codes){
			$yztime++;
			$this->rock->savecookie('sms_yztime', $yztime, 1/24/12);
			if($yztime>5)$this->rock->clearcookie($keys);
			return returnerror('驗證碼錯誤');
		}
		$this->rock->clearcookie($keys); //正確就清除
		return returnsuccess('ok');
	}
	
	/**
	*	發送用官網計劃任務
	*/
	public function starttask()
	{
		$turl	= getconfig('anayurl', URL);
		$url 	= ''.$turl.'task.php?m=runt&a=task';
		
		$barr 	= $this->postdata('anay','starttask', array(
			'runurl' => $this->rock->jm->base64encode($url)
		));
		return $barr;
	}
	/**
	*	停止計劃任務
	*/
	public function stoptask()
	{
		$barr 	= $this->getdata('anay','stoptask');
		return $barr;
	}
}