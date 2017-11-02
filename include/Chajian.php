<?php 
/**
	*****************************************************************
	* 聯系QQ： 290802026/1073744729									*
	* 版  本： V2.0													*
	* 開發者：雨中磐石工作室										*
	* 郵  箱： qqqq2900@126.com										*
	* 網  址： http://www.rockoa.com/								*
	* 說  明: 插件主類												*
	* 備  注: 未經允許不得商業出售，代碼歡迎參考糾正			*
	* 創建時間: 2014-08-30											*
	*****************************************************************
*/
abstract class Chajian{
	
	public	$rock;
	public 	$db;
	public 	$adminname;
	public 	$adminid;
	
	public function __construct()
	{
		$this->rock			= $GLOBALS['rock'];
		$this->db			= $GLOBALS['db'];
		$this->adminid		= $this->rock->adminid;
		$this->adminname	= $this->rock->adminname;
		$this->initChajian();
	}
	
	public function __destruct()
	{
		$this->destChajian();
	}
	
	public function isempt($str)
	{
		return $this->rock->isempt($str);
	}
	
	public function contain($str, $s1)
	{
		return $this->rock->contain($str, $s1);
	}
		
	protected function initChajian(){}
	protected function destChajian(){}
}