<?php 
/**
*	字符檢查插件
*/

class checkChajian extends Chajian{
	
	/**
	*	是否為郵箱
	*/
	public function isemail($str)
	{
		if(isempt($str))return false;
		return filter_var($str, FILTER_VALIDATE_EMAIL);
	}
	
	/**
	*	是否為手機號
	*/
	public function ismobile($str)
	{
		if(isempt($str))return false;
		if(!is_numeric($str) || strlen($str)<5)return false;
		return true;
	}
	
	/**
	*	判斷是否為國內手機號
	*/
	public function iscnmobile($str)
	{
		if(isempt($str))return false;
		if(!is_numeric($str) || strlen($str)!=11)return false;
		if(!preg_match("/1[34587]{1}\d{9}$/", $str))return false;
		return true;
	}
	
	/**
	*	是否有中文
	*/
	public function isincn($str)
	{
		return preg_match("/[\x7f-\xff]/", $str);
	}
	
	//是否整個的英文a-z,0-9
	public function iszgen($str)
	{
		if(isempt($str))return false;
		if($this->isincn($str)){
			return false;
		}
		return true;
	}
	
	//返回字符串編碼
	public function getencode($str)
	{
		$encode = mb_detect_encoding($str, array('ASCII','UTF-8','GB2312','GBK','BIG5'));
		$encode = strtolower($encode);
		return $encode;
	}
	
	/**
	*	是否為數字
	*/
	public function isnumber($str)
	{
		if(isempt($str))return false;
		return is_numeric($str);
	}
	
	/**
	*	字符是否包含數字
	*/
	public function isinnumber($str)
	{
		return preg_match("/[0-9]/", $str);
	}
	
	/**
	*	是否為日期
	*/
	public function isdate($str)
	{
		return preg_match("/^([0-9]{4})-([0-9]{2})-([0-9]{2})$/", $str);
	}
	
	/**
	*	是否為月份
	*/
	public function ismonth($str)
	{
		return preg_match("/^([0-9]{4})-([0-9]{2})$/", $str);
	}
}