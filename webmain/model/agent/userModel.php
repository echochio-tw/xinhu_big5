<?php
/**
	通訊錄顯示用戶模塊的
*/
class agent_userClassModel extends agentModel
{
	
	protected function agentrows($rows, $rowd, $uid){
		foreach($rowd as $k=>$rs){
			unset($rows[$k]['id']);
		}
		return $rows;
	}
	
}