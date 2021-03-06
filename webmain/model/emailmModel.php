<?php
class emailmClassModel extends Model
{
	public function initModel()
	{
		$this->adminobj 	= m('admin');
		$this->optionobj 	= m('option');
		$this->upfileobj 	= c('upfile');
		$this->recehost 	= $this->optionobj->getval('email_recehost');
		$this->receyumi 	= $this->optionobj->getval('email_receyumi');
	}
	
	/**
	*	用戶收郵件
	*	$uid 用戶id
	*	return 返回是數組就說明成功，字符串就失敗
	*/
	public function receemail($uid)
	{
		$ukey 	= 'email_recexin_'.$uid.'';
		$myurs 	= $this->adminobj->getone($uid, 'email,emailpass');
		$time	= $this->optionobj->getval($ukey,'',3);
		if(!isempt($time))$time = strtotime($time);
		if(isempt($this->receyumi))return '未設置收信郵箱域名';
		if(isempt($myurs['email']))return '未設置郵箱，可到[系統→郵件管理→用戶郵箱設置]下設置';
		if(!contain($myurs['email'], $this->receyumi))return '郵箱域名必須是['.$this->receyumi.']，當前用戶郵箱:'.$myurs['email'].'';
		$rows 	= c('imap')->receemail($this->recehost, $myurs['email'], $myurs['emailpass'], $time);
		if(!is_array($rows))return $rows;
		$jf 	= 0;
		$bool 	= true;
		foreach($rows as $k=>$rs){
			$message_id	= $rs['message_id'];
			if(isempt($message_id))$message_id = md5($rs['date']);
			
			$where 	= "message_id='$message_id'";
			$id 	= (int)$this->getmou('id',$where);
			if($id ==0)$where = '';
			if($id>0)continue;
			
			$uarr['message_id'] = $message_id;
			$uarr['title'] 		= $this->db->tocovexec($rs['subject'], 1);
			$uarr['content'] 	= $this->db->tocovexec($rs['body'], 1);
			$uarr['senddt'] 	= $rs['date'];
			$uarr['optdt'] 		= $this->rock->now;
			$uarr['size'] 		= $rs['size'];
			$uarr['fromemail'] 	= $rs['fromemail'];
			$uarr['toemail'] 	= $rs['toemail'];
			$uarr['reply_toemail'] 	= $rs['reply_toemail'];
			$uarr['ccemail'] 		= $rs['ccemail'];
			$uarr['isturn'] 		= 1;
			$uarr['isfile'] 		= count($rs['attach']) > 0 ? 1 : 0;
			$uarr['type'] 			= 1;
			$uarr['numoi'] 			= $rs['num'];
			$form	= $rs['from'][0];
			$urs 	= $this->adminobj->emailtours($form->email);
			$uarr['uid']			= 0;
			$uarr['sendid']			= 0;
			$uarr['sendname']		= '';
			if(is_array($urs) && $urs){
				$uarr['sendid']		= $urs['id'];
				$uarr['uid']		= $urs['id'];
				$uarr['sendname']	= $urs['name'];
			}
			$uarr['sendname']	= $uarr['fromemail'];
			$uarr['recename']	= $uarr['toemail'];
			
			$bool  = $this->record($uarr, $where);
			if($bool){
				if($id ==0)$id = $this->db->insert_id();
				$this->saveattach($rs['num'], $rs['attach'], $id);
				$toarr = $this->saveemails($id, 0, $rs['to']);
				$this->saveemails($id, 1, $rs['cc']);
				$this->saveemails($id, 2, $rs['from']);
				$uuarr['receid']	= $toarr[0];
				//$uuarr['recename']	= $toarr[1];
				$this->update($uuarr, $id);
				$jf++;
			}
		}
		if($bool)$this->optionobj->setval($ukey.'@-2', '共'.$jf.'封');//記錄最後收信時間
		return array(
			'count' => $jf
		);
	}
	
	//保存到子表
	public function saveemails($mid, $type, $arr)
	{
		$sid = $sna = '';
		foreach($arr as $k=>$rs){
			$where 				= "`mid`='$mid' and `type`=$type and `email`='$rs->email'";
			$id 				= (int)$this->db->getmou('[Q]emails','id',$where);
			if($id ==0)$where 	= '';
			$uarr				= array();
			$uarr['mid']		= $mid;
			$uarr['email']		= $rs->email;
			$uarr['personal']	= $rs->personal;
			$uarr['type']		= $type;
			if($id==0){
				$uarr['optdt']	= $this->rock->now;
			}
			$urs 	= $this->adminobj->emailtours($rs->email);
			$uarr['uid']		= 0;
			if(is_array($urs) && $urs){
				$uarr['uid']	= $urs['id'];
				$sid			.=',u'.$urs['id'].'';
				$sna			.=','.$urs['name'].'';
			}
			$this->db->record('[Q]emails', $uarr, $where);
		}
		if($sid != ''){
			$sid = substr($sid, 1);
			$sna = substr($sna, 1);
		}
		return array($sid, $sna);
	}
	
	//保存郵件的附件
	private function saveattach($oi, $arr, $id)
	{
		$dbs 	= m('file');
		$doobj 	= c('down');
		foreach($arr as $k=>$rs){
			
			$fsad	= explode('.', $rs['filename']);
			$sarr['filename'] 	= $rs['filename'];
			$sarr['filesize'] 	= $rs['filesize'];
			$sarr['fileext']  	= strtolower($fsad[count($fsad)-1]);
			$sarr['keyoi'] 	  	= $oi.','.$rs['encoding'].','.$rs['filekey'];
			$sarr['mtype']	  	= 'emailm';
			$sarr['optid']	  	= $this->adminid;
			$sarr['optname']  	= $this->adminname;
			$sarr['adddt']  	= $this->rock->now;
			$sarr['mid']	  	= $id;
			$sarr['filesizecn']	= $this->upfileobj->formatsize($rs['filesize']);
			$where 				= "`mtype`='emailm' and `mid`='$id' and `filename`='".$sarr['filename']."' and `filesize`='".$sarr['filesize']."'";
			
			if($dbs->rows($where)==0){
				$sarr['filepath'] = $doobj->savefilecont($sarr['fileext'], $rs['attachcont']);//下載附件
				$fid = $dbs->insert($sarr);
			}
		}
	}
	
	
	/**
	*	統計我未讀郵件
	*/
	public function wdtotal($uid)
	{
		$to= $this->gettotsllss($uid, 1);
		return (int)$to;
	}
	
	//
	private function gettotsllss($uid, $lx=0, $glx='')
	{
		$whe= 'b.uid='.$uid.' and a.`isturn`=1 and b.`isdel`=0 and b.`type` in(0,1)';
		if($lx==1)$whe='b.uid='.$uid.' and a.`isturn`=1 and b.`isdel`=0 and b.`type` in(0,1) and b.`zt`=0';
		if($lx==2)$whe='a.`sendid`='.$uid.' and a.`isturn`=0';
		if($lx==3)$whe='b.uid='.$uid.' and b.`type` = 2 and b.`isdel`=0';
		if($lx==4)$whe='b.uid='.$uid.' and a.`isturn`=1 and b.`type` in(0,1) and b.`isdel`=1';
		if($glx=='whe')return $whe;
		$to 	= $this->db->rows('`[Q]emailm` a left join `[Q]emails` b on a.`id`=b.`mid`', $whe);
		return (int)$to;
	}
	
	public function gettowhere($uid, $lx)
	{
		return $this->gettotsllss($uid, $lx,'whe');
	}

	
	public function zongtotal($uid)
	{
		$zz = $this->gettotsllss($uid, 0); //所有郵件
		$wd = $this->gettotsllss($uid, 1); //未讀郵件
		$cgx= $this->gettotsllss($uid, 2); //草稿箱
		
		$yfs= $this->gettotsllss($uid, 3); //已發送
		$ysc= $this->gettotsllss($uid, 4); //已刪除
		
		return array(
			'wd' 	=> $wd,
			'zz' 	=> $zz,
			'cgx' 	=> $cgx,
			'yfs' 	=> $yfs,
			'ysc' 	=> $ysc
		);
	}
	
	/**
	*	標識已讀了
	*/
	public function biaoyd($uid,$sid)
	{
		m('emails')->update('`zt`=1','`uid`='.$uid.' and `mid` in('.$sid.')');
	}
}