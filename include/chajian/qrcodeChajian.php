<?php 
/**
*	創建二維碼
*/
include_once(ROOT_PATH.'/include/phpqrcode/phpqrcode.php');
class qrcodeChajian extends Chajian
{
	public function show($url='')
	{
		if($url=='')$url 		= URL; 
		$errorCorrectionLevel 	= 'L';  // 糾錯級別：L、M、Q、H 
		$matrixPointSize 		= 6;  // 點的大小：1到10 
		$margin 				= 1;  //表示二維碼週圍邊框空白區域間距值；
		$bo = QRcode::png($url, false, $errorCorrectionLevel, $matrixPointSize, $margin, false);
		return $bo;
	}
}                                                                                                                                                            