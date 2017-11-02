<?php
class flowbillClassModel extends Model
{
	public $statustext;
	public $statuscolor;
	
	public function initModel()
	{
		$this->settable('flow_bill');
		$this->statustext	= explode(',','待處理,已審核,處理不通過,,,已作廢');
		$this->statuscolor	= explode(',','blue,green,red,,,gray');
	}
	
	/**
	*	獲取狀態
	*/
	public function getstatus($zt, $lx=0)
	{
		$a1	= $this->statustext;
		$a2	= $this->statuscolor;
		$str 		= '<font color='.$a2[$zt].'>'.$a1[$zt].'</font>';
		if($lx==0){
			return $str;
		}else{
			return array($a1[$zt], $a2[$zt]);
		}
	}
	
	/**
	*	讀取單據數據
	*	$glx 0是應用上讀取，1後台讀取
	*/
	public function getrecord($uid, $lx, $page, $limit, $glx=0)
	{
		$srows	= array();
		$where	= 'uid='.$uid.'';
		$isdb	= 0;
		//未通過
		if($lx=='flow_wtg'){
			$where .= ' and `status`=2';
		}
		
		if($lx=='flow_dcl'){
			$where .= ' and `status`=0';
		}
		
		//已完成
		if($lx=='flow_ywc'){
			$where .= ' and `status`=1';
		}
		
		//異常
		if($lx=='flow_error'){
			$where .= ' and '.$this->errorwhere().'';
		}
		
		//待辦
		if($lx=='daiban_daib' || $lx=='daiban_def'){
			$where	= '`status` not in(1,2) and '.$this->rock->dbinstr('nowcheckid', $uid);
			$isdb	= 1;
		}
		
		//經我處理
		if($lx=='daiban_jwcl'){
			$where	= $this->rock->dbinstr('allcheckid', $uid);
		}
		
		//我全部下級申請
		if($lx=='daiban_myxia'){
			$where 	= m('admin')->getdownwheres('uid', $uid, 0);
		}
		
		//我直屬下級申請
		if($lx=='daiban_mydown'){
			$where 	= m('admin')->getdownwheres('uid', $uid, 1);
		}
		
		$key 	= $this->rock->post('key');
		if(!isempt($key))$where.=" and (`optname` like '%$key%' or `modename` like '%$key%' or `sericnum` like '$key%')";
		
		$arr 	= $this->getlimit('`isdel`=0 and '.$where, $page,'*','`optdt` desc', $limit);
		$rows 	= $arr['rows'];
		$flow 	= m('flow:user');
		$modeids= '0';
		foreach($rows as $k=>$rs)$modeids.=','.$rs['modeid'].'';
		$modearr= array();
		if($modeids!='0'){
			$moders = m('flow_set')->getall("`id` in($modeids)",'id,num,name,summary,statusstr');
			foreach($moders as $k=>$rs)$modearr[$rs['id']] = $rs;
		}
		foreach($rows as $k=>$rs){
			$modename	= $rs['modename'];
			$summary	= '';
			$modenum 	= '';
			$statustext	= '記錄不存在';
			$statuscolor= '#888888';
			$ishui		= 0;
			if(isset($modearr[$rs['modeid']])){
				$mors 	= $modearr[$rs['modeid']];
				$modename 	= $mors['name'];
				$summary 	= $mors['summary'];
				$modenum 	= $mors['num'];
				$rers 		= $this->db->getone('[Q]'.$rs['table'].'', $rs['mid']);
				$summary	= $this->rock->reparr($summary, $rers);
				if($rers){
					$wdst		 = $rers['status'];
					if($rers['isturn']==0)$wdst=-1;
					$nowsets	 = '<font color="blue">'.$rs['nowcheckname'].'</font>';
					if($glx==0)$nowsets = $rs['nowcheckname'];
					//if($wdst!=0)$nowsets = '';
					
					$ztarr 		 = $flow->getstatus($rers, $mors['statusstr'], $nowsets);
					$statustext  = $ztarr[0];
					$statuscolor = $ztarr[1];
					
					if($rers['status']==5)$ishui = 1;
				}else{
					$this->update('isdel=1', $rs['id']);
				}
			}
			
			$title 		= '['.$rs['optname'].']'.$modename.'';
			$cont 		= '申請人：'.$rs['optname'].'<br>單號：'.$rs['sericnum'].'';
			$cont.='<br>申請日期：'.$rs['applydt'].'';
			if(!isempt($summary))$cont.='<br>摘要：'.$summary.'';
			if(!isempt($rs['nstatustext']))$cont.='<br>狀態：'.$rs['nstatustext'].'';
			if(!isempt($rs['checksm']))$cont.='<br>處理說明：'.$rs['checksm'].'';
			
			$srows[]= array(
				'title' => $title,
				'cont' 	=> $cont,
				'ishui' => $ishui,
				'id' 	=> $rs['mid'],
				'uid' 	=> $rs['uid'],
				'optdt' 	=> $rs['optdt'],
				'sericnum' 	=> $rs['sericnum'],
				'applydt' 	=> $rs['applydt'],
				'statustext' 	=> $statustext,
				'statuscolor' 	=> $statuscolor,
				'modenum'		=> $modenum,
				'modename'		=> $modename
			);
		}
		$arr['rows'] 	= $srows;
		
		return $arr;
	}
	
	//獲取待辦處理數字
	public function daibanshu($uid)
	{
		$where	= '`status` not in(1,2) and isdel=0 and '.$this->rock->dbinstr('nowcheckid', $uid);
		$to 	= $this->rows($where);
		return $to;
	}
	
	//未通過的
	public function applymywgt($uid)
	{
		$where	= '`status`=2 and isdel=0 and `uid`='.$uid.'';
		$to 	= $this->rows($where);
		return $to;
	}
	
	//異常單據條件，審核人中有停用的帳號
	public function errorwhere($qz='')
	{
		$where	= ''.$qz.'`status` not in(1,5) and '.$qz.'`isdel`=0 and '.$qz.'`isturn`=1 and (('.$qz.'`nowcheckid` is null) or ('.$qz.'`nowcheckid` not in(select `id` from `[Q]admin` where `status`=1)))';
		return $where;
	}
	
	//異常數
	public function errortotal()
	{
		$where	= $this->errorwhere();
		$to 	= $this->rows($where);
		return $to;
	}
	
	//單據數據
	public function getbilldata($rows)
	{
		$srows	= array();
		$modeids= '0';
		foreach($rows as $k=>$rs)$modeids.=','.$rs['modeid'].'';
		$modearr= array();
		if($modeids!='0'){
			$moders = m('flow_set')->getall("`id` in($modeids)",'id,num,name,summary,statusstr');
			foreach($moders as $k=>$rs)$modearr[$rs['id']] = $rs;
		}
		$flow = m('flow:user');
		foreach($rows as $k=>$rs){
			$modename	= $rs['modename'];
			$summary	= '';
			$modenum 	= '';
			$statustext	= '記錄不存在';
			$statuscolor= '#888888';
			$wdst 		= 0;
			$ishui 		= 0;
			if(isset($modearr[$rs['modeid']])){
				$mors 		= $modearr[$rs['modeid']];
				$modename 	= $mors['name'];
				$summary 	= $mors['summary'];
				$modenum 	= $mors['num'];	
				$rers 		= $this->db->getone('[Q]'.$rs['table'].'', $rs['mid']);
				$summary	= $this->rock->reparr($summary, $rers);
				if($rers){
					$wdst		 = $rers['status'];
					if($rers['isturn']==0)$wdst=-1;
					$nowsets	 = '<font color="blue">'.$rs['nowcheckname'].'</font>';
					//if($wdst!=0)$nowsets = '';
					$ztarr 		 = $flow->getstatus($rers, $mors['statusstr'], $nowsets);
					$statustext  = $ztarr[0];
					$statuscolor = $ztarr[1];
					if($rers['status']==5)$ishui = 1;
				}else{
					$this->update('isdel=1', $rs['id']); //記錄已經不存在了
				}
			}
			
			$status = '<font color="'.$statuscolor.'">'.$statustext.'</font>';
			if($wdst==0)$status= $statustext;
			
			$srows[]= array(
				'id' 		=> $rs['mid'],
				'optdt' 	=> $rs['optdt'],
				'applydt' 	=> $rs['applydt'],
				'name' 		=> $rs['name'],
				'deptname' 	=> $rs['deptname'],
				'sericnum' 	=> $rs['sericnum'],
				'nowcheckid'=> $rs['nowcheckid'],
				'nowcourseid'=> $rs['nowcourseid'], //當前步驟
				'ishui' 	=> $ishui,
				'modename' 	=> $modename,
				'modenum' 	=> $modenum,
				'summary' 	=> $summary,
				'status'	=> $status
			);
		}
		return $srows;
	}
	
	/**
	* 首頁上顯示我的申請
	*/
	public function homelistshow()
	{
		$arr 	= $this->getrecord($this->adminid, 'flow_dcl', 1, 5,1);
		$rows  	= $arr['rows'];
		$arows 	= array();
		foreach($rows as $k=>$rs){
			$cont = '【'.$rs['modename'].'】單號:'.$rs['sericnum'].',日期:'.$rs['applydt'].'，';
			if(!contain($rs['statustext'],'<font')){
				$cont.= '<font color="'.$rs['statuscolor'].'">'.$rs['statustext'].'</font>';
			}else{
				$cont.= $rs['statustext'];
			}
			$arows[] = array(
				'cont' 		=> $cont,
				'modename' 	=> $rs['modename'],
				'modenum' 	=> $rs['modenum'],
				'id' 		=> $rs['id'],
				'count'		=> $arr['count']
			);
		}
		return $arows;
	}
	
	/*
	*	更新記錄
	*/
	public function updatebill()
	{
		$rows = $this->db->getall('SELECT a.`id`,a.`uname`,a.`udeptname`,a.`status`,b.`name`,b.`deptname` FROM `[Q]flow_bill` a left join `[Q]admin` b on a.`uid`=b.id');
		$ztara= array(1,5);
		foreach($rows as $k=>$rs){
			if(isempt($rs['name']))continue;
			$zt = $rs['status'];
			if(isempt($rs['uname']) || isempt($rs['udeptname']) || !in_array($zt, $ztara)){
				$this->update(array(
					'uname' 	=> $rs['name'],
					'udeptname' => $rs['deptname'],
				), $rs['id']);
			}
		}
	}
}