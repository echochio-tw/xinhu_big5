<?php
/**
*	此文件是流程模塊【leavehr.考勤信息】對應接口文件。
*/ 
class mode_leavehrClassAction extends inputAction{
	
	public function totalAjax()
	{
		$uid	= (int)$this->post('uid','0');
		$start	= $this->post('stime');
		$end	= $this->post('etime');
		$kq 	= m('kaoqin');
		$sj 	= 0;
		$sbtime = $kq->getworktime($uid, $start); //一天上班小時
		return array($sj, '', $sbtime);
	}
}	
			