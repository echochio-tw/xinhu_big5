<?php
/**
*	此文件是流程模塊【carms.車輛信息登記】對應接口文件。
*	可在頁面上創建更多方法如：public funciton testactAjax()，用js.getajaxurl('testact','mode_carms|input','flow')調用到對應方法
*/ 
class mode_carmsClassAction extends inputAction{
	
	
	//可預定的車輛
	public function getcardata()
	{
		$rows = m('carm')->getall("1=1",'carnum as name,id as value');
		return $rows;
	}
}	
			