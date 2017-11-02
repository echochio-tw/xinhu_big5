<?php
//調薪申請
class mode_hrtrsalaryClassAction extends inputAction{

	protected function savebefore($table, $arr, $id, $addbo){
		$uid 	= $arr['uid'];
		$floats = (int)$arr['floats'];
		if($floats==0)return '調薪幅度不能為0';
		if(m($table)->rows("`uid`='$uid' and `id`<>'$id' and `status` not in(1,5)")>0)return '已有一單在申請中';
	}
	
	
	protected function saveafter($table, $arr, $id, $addbo){
		
	}
}	
			