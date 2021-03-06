<?php
/**
*	考試培訓
*/
class flow_knowtraimClassModel extends flowModel
{
	public function initModel()
	{
		$this->statearr = explode(',','<font color=#ff6600>還未開始</font>,<font color=green>進行中</font>,<font color=#888888>已結束</font>');
	}
	
	public function getstatestr($zt)
	{
		return arrvalue($this->statearr, $zt);
	}
	
	protected function flowsubmit($na, $sm)
	{
		if($this->rs['status']==1)$this->sendtodo();
	}
	
	//審核完成後發通知
	protected function flowcheckfinsh($zt)
	{
		if($zt==1)$this->sendtodo();
	}
	
	//發通知給對應人員
	public function sendtodo()
	{
		$rows = m('knowtrais')->getall('mid='.$this->id.' and `isks`=0','uid');
		$ids  = '';
		foreach($rows as $k=>$rs)$ids.=','.$rs['uid'].'';
		if($ids=='')return;
		$ids	= substr($ids, 1);
		
		$cont	= ''.$this->adminname.'發布培訓考試,主題：{title}，時間{startdt}至{enddt}。';
		$this->push($ids,'', $cont);
	}
	
	public function flowisreadqx()
	{
		$to = m('knowtrais')->rows('`mid`='.$this->id.' and `uid`='.$this->adminid.'');
		return $to>0;
	}
	
	public function flowrsreplace($rs,$lx=0)
	{
		$zt 		 = $rs['state'];
		$rs['state'] = $this->getstatestr($zt);
		if($lx==1 && $zt==1){
			//我當前狀態
			$ors	= m('knowtrais')->getone('`mid`='.$rs['id'].' and `uid`='.$this->adminid.'');
			if($ors){
				if($ors['isks']=='0'){
					$rs['state'] .= '&nbsp;<a class="zhu"  href="index.php?m=hr&a=kaoshi&d=main&id='.$this->id.'">去考試</a>';
				}else{
					$rs['state'] .= '&nbsp;&nbsp;已考試分數：'.$ors['fenshu'].'';
				}
			}
		}
		return $rs;
	}
	
	//更新題庫狀態
	public function reloadstate($id='')
	{
		$where  = '1=1';
		if($id!='')$where='id in('.$id.')';
		$rows 	= $this->getall($where);
		$now 	= $this->rock->now;
		foreach($rows as $k=>$rs){
			$zt = 0;
			if($rs['enddt']<$now){
				$zt = 2;
			}else if($rs['startdt']<$now){
				$zt = 1;
			}
			if($zt!=$rs['state'])$this->update('`state`='.$zt.'', $rs['id']);
		}
		$rows 	= $this->db->getall('SELECT mid,count(1)stotal FROM `[q]knowtrais` where isks=1 GROUP BY mid');
		foreach($rows as $k=>$rs)$this->update('`ydshu`='.$rs['stotal'].'', $rs['mid']);
	}
	
	protected function flowbillwhere($uid, $lx)
	{
		$this->reloadstate();
	}
	
	//每天通知未考試培訓人員
	public function todaytodo()
	{
		
	}
	
	//得條件
	public function gettikuwhere($tiid)
	{
		if(isempt($tiid))return '';
		$sid 	= '';
		$tarr	= explode(',', $tiid);
		$dbs 	= m('option');
		foreach($tarr as $sid1){
			$ssid = $dbs->getalldownid($sid1);
			$sid.=','.$ssid.'';
		}
		if($sid!=''){
			$sid = substr($sid, 1);
			return ' and `typeid` in('.$sid.')';
		}else{
			return '';
		}
	}
}