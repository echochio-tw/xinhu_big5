<?php 
/**
*	計劃任務地址，指向目錄webmain/task下
*	主頁：http://www.rockoa.com/
*	軟件：信呼
*	作者：雨中磐石(rainrock)
*/
define('ENTRANCE', 'task');
include_once('config/config.php');
$m 			= 'mode';
if(isset($argv[1])){
	$_mar	= explode(',', $argv[1]);
	$m 		= $_mar[0].'|runt';
	if(isset($_mar[1]))$a = $_mar[1];
}
$d			= $rock->get('d','task');
$m			= $rock->get('m',$m);
include_once('include/View.php');