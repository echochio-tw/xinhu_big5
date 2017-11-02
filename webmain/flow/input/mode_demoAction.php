<?php
/**
*	此文件是流程模塊【demo.演示測試】對應控制器接口文件。
*/ 
class mode_demoClassAction extends inputAction{
	
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
	
	
	//彈出下拉選擇單選
	public function tanxuan()
	{
		$rows[] = array(
			'name' => '第一個數據'
		);
		$rows[] = array(
			'name' => '第二個數據'
		);
		return $rows;
	}
	
	//彈出下拉選擇多選
	public function tanxuancheck()
	{
		$rows[] = array(
			'name' => '數據1'
		);
		$rows[] = array(
			'name' => '數據2'
		);
		for($i=3;$i<=500;$i++)$rows[] = array(
			'name' => '數據'.$i.''
		);
		return $rows;
	}
	
	//聯動獲取城市數據數據庫表city,根據pid讀取
	public function getcityAjax()
	{
		$sheng 	= $this->post('sheng');//省名稱
		if(isempt($sheng))return array();//為空
		$dbs 	= m('city');
		//獲取省ＩＤ
		$pid 	= $dbs->getmou('id',"`type`=1 and `name`='$sheng'");//type=1
		
		$rows 	 = $dbs->getall("`pid`='$pid'",'name','`sort`'); //查找數據
		
		return $rows;//返回數據
	}
	
	//聯動獲取城市數據數據庫表city,根據pid讀取
	public function getxianAjax()
	{
		$city 	= $this->post('city');//省名稱
		if(isempt($city))return array();//為空
		$dbs 	= m('city');
		//獲取城市ＩＤ
		$pid 	= $dbs->getmou('id',"`type`=2 and `name`='$city'");//type=2
		
		$rows 	 = $dbs->getall("`pid`='$pid'",'name','`sort`'); //查找數據
		
		return $rows;//返回數據
	}
	
	
	//下拉框市的數據源
	public function citydata()
	{
		return $this->getshegnxiandat(arrvalue($this->rs,'sheng'), 1);
	}
	
	//下拉框縣的數據源
	public function xiandata()
	{
		return $this->getshegnxiandat(arrvalue($this->rs,'shi'), 2);
	}
	
	//獲取下級
	private function getshegnxiandat($name, $type)
	{
		if(isempt($name))return array();
		$dbs 	= m('city');
		
		//獲取城市ＩＤ
		$pid 	= $dbs->getmou('id',"`type`='$type' and `name`='$name'");
		
		$rows 	 = $dbs->getall("`pid`='$pid'",'name','`sort`'); //查找數據
		
		return $rows;//返回數據
	}
}	
			