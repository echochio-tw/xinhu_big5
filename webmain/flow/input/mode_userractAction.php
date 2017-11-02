<?php
/**
*	此文件是流程模塊【userract.員工合同】對應接口文件。
*	可在頁面上創建更多方法如：public funciton testactAjax()，用js.getajaxurl('testact','mode_userract|input','flow')調用到對應方法
*/ 
class mode_userractClassAction extends inputAction{
	
	
	protected function savebefore($table, $arr, $id, $addbo){
		$tqenddt = $arr['tqenddt'];
		$startdt = $arr['startdt'];
		$enddt 	 = $arr['enddt'];
		$barr	 = array();
		if(isempt($tqenddt)){
			
		}
		$barr['company'] = m('company')->getmou('name', (int)$arr['companyid']);
		return array(
			'rows' => $barr
		);
	}
	
	
	protected function saveafter($table, $arr, $id, $addbo){
		
	}
	
	//簽署公司數據源
	public function companydata()
	{
		return m('company')->getselectdata(1);
	}
}	
			