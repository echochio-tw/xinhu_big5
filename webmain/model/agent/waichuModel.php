<?php
//外出應用
class agent_waichuClassModel extends agentModel
{
	//狀態替換
	protected function agentrows($rows, $rowd, $uid){
		return $this->agentrows_status($rows, $rowd);
	}
}