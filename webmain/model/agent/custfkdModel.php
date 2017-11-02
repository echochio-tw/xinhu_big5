<?php
//客戶.付款單的應用
class agent_custfkdClassModel extends agentModel
{
	
	
	//狀態顯示替換
	protected function agentrows($rows, $rowd, $uid)
	{
		$statea = $this->flow->statearrf;
		foreach($rowd as $k=>$rs){
			$state 	 = $rs['paystatus'];
			$ztarr	 = $statea[$state];
			$rows[$k]['statustext']		= $ztarr[0];
			$rows[$k]['statuscolor']	= $ztarr[1];
			$rows[$k]['modenum']	    = 'custfina';
		}
		return $rows;
	}
	
}