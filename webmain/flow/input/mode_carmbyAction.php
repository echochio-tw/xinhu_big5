<?php
/**
*	此文件是流程模塊【carmby.車輛保養】對應接口文件。
*/ 
class mode_carmbyClassAction extends inputAction{
	
	
	public function getcardata()
	{
		$rows = m('carm')->getall("1=1",'carnum as name,id as value');
		return $rows;
	}
	
	protected function savebefore($table, $arr, $id, $addbo){
		$carid 	= $arr['carid'];
		$to 	= m($table)->rows('id<>'.$id.' and `carid`='.$carid.' and `type`=1 and `status`=0');
		if($to>0)return '當前車輛已申請了保養在處理中了';
	}
}	
			