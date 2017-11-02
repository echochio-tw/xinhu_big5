<?php
//客戶合同的應用
class agent_custractClassModel extends agentModel
{
	
	
	//狀態顯示替換
	protected function agentrows($rows, $rowd, $uid)
	{
		$statea = $this->flow->statearr;
		foreach($rowd as $k=>$rs){
			$state 	 = $rs['htstatus'];
			if($state==2){
				$rows[$k]['ishui']		=1;
			}
			$ztarr	 = $statea[$state];
			$rows[$k]['statustext']		= $ztarr[0];
			$rows[$k]['statuscolor']	= $ztarr[1];
		}
		return $rows;
	}
	
}