<?php
//客戶.收款單的應用
class agent_custfinaClassModel extends agentModel
{
	
	
	//狀態顯示替換
	protected function agentrows($rows, $rowd, $uid)
	{
		$statea = $this->flow->statearrs;
		foreach($rowd as $k=>$rs){
			$state 	 = $rs['paystatus'];
			$ztarr	 = $statea[$state];
			$rows[$k]['statustext']		= $ztarr[0];
			$rows[$k]['statuscolor']	= $ztarr[1];
		}
		return $rows;
	}
	
}