<?php
//考勤信息下的應用
class agent_kqdkjlClassModel extends agentModel
{
	
	protected function agentrows($rows, $rowd, $uid){
		return $this->agentrows_status($rows, $rowd);
	}
}