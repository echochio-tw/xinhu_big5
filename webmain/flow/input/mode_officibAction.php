<?php
/**
*	此文件是流程模塊【officib.收文單】對應接口文件。
*	可在頁面上創建更多方法如：public funciton testactAjax()，用js.getajaxurl('testact','mode_officib|input','flow')調用到對應方法
*/ 
class mode_officibClassAction extends inputAction{
	
	/**
	*	重寫函數：保存前處理，主要用于判斷是否可以保存
	*	$table String 對應表名
	*	$arr Array 表單參數
	*	$id Int 對應表上記錄Id 0添加時，大于0修改時
	*	$addbo Boolean 是否添加時
	*	return array('msg'=>'錯誤提示內容','rows'=> array()) 可返回空字符串，或者數組 rows 是可同時保存到數據庫上數組
	*/
	protected function savebefore($table, $arr, $id, $addbo){
		
	}
	
	/**
	*	重寫函數：保存後處理，主要保存其他表數據
	*	$table String 對應表名
	*	$arr Array 表單參數
	*	$id Int 對應表上記錄Id
	*	$addbo Boolean 是否添加時
	*/	
	protected function saveafter($table, $arr, $id, $addbo){
		
	}
}	
			