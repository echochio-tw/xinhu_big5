<?php 
class reimClassAction extends apiAction
{
	/**
	*	獲取聊天記錄
	*/
	public function getrecordAction()
	{
		$uid 		= $this->adminid;
		$type 		= $this->post('type');
		$gid 		= (int)$this->post('gid');
		$minid 		= (int)$this->post('minid');
		$lastdt 	= (int)$this->post('lastdt');
		$lastdts	= '';
		if($lastdt>0)$lastdts = date('Y-m-d H:i:s', $lastdt);
		$arr 		= m('reim')->getrecord($type, $uid, $gid, $minid, $lastdts);
		$this->showreturn($arr);
	}
	
	/**
	*	獲取會話的信息
	*/
	public function getreceinforAction()
	{
		$uid 		= $this->adminid;
		$type 		= $this->post('type');
		$gid 		= (int)$this->post('gid');
		$reimdb		= m('reim');
		$arr['receinfor'] 		= $reimdb->getreceinfor($type, $gid);
		$reimdb->setallyd($type, $uid, $gid);
		$this->showreturn($arr);
	}
	
	/**
	*	發消息
	*/
	public function sendinforAction()
	{
		$uid 		= $this->adminid;
		$type 		= $this->post('type');
		$gid 		= (int)$this->post('gid');
		$lx 		= 0;
		if($this->cfrom=='reim')$lx=1;
		if($type=='group'){
			$tos = m('im_groupuser')->rows("`gid`='$gid' and `uid`='$uid'");
			if($tos==0)$this->showreturn('','您不在此會話中，不允許發送', 201);
		}
		$arr 		= m('reim')->sendinfor($type, $uid, $gid, array(
			'optdt' => $this->now,
			'cont'  => $this->post('cont'),
			'fileid'=> (int)$this->post('fileid')
		), $lx);
		$this->showreturn($arr);
	}
	
	/**
	*	標識已讀
	*/
	public function yiduAction()
	{
		$id = $this->post('id');
		m('reim')->setyd($id, $this->adminid);
		$this->showreturn($id);
	}
	
	//將會話標識已讀
	public function yiduallAction()
	{
		$type 		= $this->post('type');
		$gid 		= (int)$this->post('gid');
		m('reim')->setallyd($type, $this->adminid, $gid);
		$this->showreturn('');
	}
	
	/**
	*	創建討論組
	*/
	public function createtaolunAction()
	{
		$name 	= $this->post('title');
		$explain= $this->post('content');
		$receid = $this->post('receid');
		if($name==''||$receid=='')$this->showreturn('','not data',201);
		$arr = m('reim')->creategroup($name, $receid.','.$this->adminid, 1, $explain);
		$this->showreturn($arr);
	}
	
	/**
	*	獲取會話上人員
	*/
	public function getgroupuserAction()
	{
		$gid 	= (int)$this->post('gid');
		$type 	= $this->post('type');
		$arr 	= m('reim')->getgroupuser($gid, $type);
		$this->showreturn($arr);
	}
	
	/**
	*	下載聊天記錄
	*/
	public function downrecordAction()
	{
		$minid = floatval($this->post('minid','999999999'));
		$maxid = floatval($this->post('maxid','0'));
		$arr 	= m('reim')->downrecord($this->adminid, $maxid, $minid);
		$this->showreturn($arr);
	}
	
	/**
	*	刪除歷史會話
	*/
	public function delhistoryAction()
	{
		$gid 	= (int)$this->post('gid');
		$type 	= $this->post('type');
		$arr 	= m('reim')->delhistory($type,$gid,$this->adminid);
		$this->showreturn('');
	}
	
	//邀請人員
	public function yaoqinguidAction()
	{
		$gid	= (int)$this->post('gid');
		$val	= $this->post('val');
		$ids 	= m('reim')->adduserchat($gid, $val, true);
		$msg	= 'success'.$ids.'';
		$this->showreturn($msg);
	}
	
	//退出討論組
	public function exitgroupAction()
	{
		$aid	= $this->adminid;
		$gid	= (int)$this->post('gid');
		m('reim')->exitchat($gid, $aid);
		$this->showreturn('success');
	}
	
	public function createlunAction()
	{
		$val	= $this->getvals('val');
		m('reim')->createchat($val, $this->adminid,$this->adminid, $this->adminname,'', true);
		$this->showreturn('success');
	}
	
	//清除歷史記錄
	public function clearrecordAction()
	{
		$gid 	= (int)$this->post('gid');
		$type 	= $this->post('type');
		$ids 	= $this->post('ids');
		$day 	= (int)$this->post('day');
		$arr 	= m('reim')->clearrecord($type,$gid,$this->adminid, $ids, $day);
		$this->showreturn('');
	}
	
	//上傳頭像
	public function changefaceAction()
	{
		$fid 	= (int)$this->post('id');
		$uid 	= $this->adminid;
		$face 	= m('admin')->changeface($uid, $fid); 	
		if(!$face)$this->showreturn('','fail changeface',201);
		$this->showreturn($face);
	}
	
	//下載文件
	public function downfileAction()
	{
		$id 	= (int)$this->post('id');
		m('file')->download($id);
	}
	
	/**
	*	文件轉發發送給對應人員
	*/
	public function forwardAction()
	{
		$fid = (int)$this->post('fileid');
		$tuid= $this->post('tuid');
		$msg = m('reim')->forward($tuid, 'user', $this->post('cont'), $fid);
		if($msg!='ok')$this->showreturn('', $msg, 201);
		$this->showreturn('');
	}
	
	/**
	*	信息轉發
	*/
	
}