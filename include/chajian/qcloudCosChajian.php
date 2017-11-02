<?php 
/**
*	騰訊雲上文件存儲上傳管理
*/
include_once(ROOT_PATH.'/\include/cos-php-sdk-v4-master/include.php');
use qcloudcos\Cosapi;
class qcloudCosChajian extends Chajian{
	
	
	
	protected function initChajian()
	{
		Cosapi::initConf(); //初始設置
	}
	
	/**
	*	上傳文件
	*	filepath 要上傳的文件全路徑
	*	updir 上傳到哪個目錄
	*	upname 上傳後保存文件名
	*/
	public function upload($filepath, $updir='', $upname='')
	{
		if(!file_exists($filepath))return false;
		$filea 	= explode('/', $filepath);
		if($upname=='')$upname = $filea[count($filea)-1];
		if($updir=='')$updir = 'rockxinhuweb';
		$ret = Cosapi::upload('xinhu', $filepath, ''.$updir.'/'.$upname.'');
		return $ret;
	}
	
	/**
	*	創建文件夾
	*/
	public function createFolder($folder)
	{
		$ret = Cosapi::createFolder($bucket, $folder);
		return $ret;
	}
}