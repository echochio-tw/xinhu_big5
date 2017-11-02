<?php
/**
*	此文件是流程模塊【officia.發文單】對應接口文件。
*	可在頁面上創建更多方法如：public funciton testactAjax()，用js.getajaxurl('testact','mode_officia|input','flow')調用到對應方法
*/ 
class mode_officiaClassAction extends inputAction{
	
	
	protected function savebefore($table, $arr, $id, $addbo){
		
	}
	
		
	protected function saveafter($table, $arr, $id, $addbo){
		
	}
	
	public function getfilenumAjax()
	{
		$type 	= $this->post('type');
		$num 	= ''.$type.'【Year】';
		return $this->db->sericnum($num,'[Q]official','num', 3);
	}
}	
			