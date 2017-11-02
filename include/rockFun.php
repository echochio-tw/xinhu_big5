<?php 
/**
	*****************************************************************
	* 聯系QQ： 290802026											*
	* 版  本： V2.0													*
	* 開發者：雨中磐石工作室										*
	* 郵  箱： admin@rockoa.com										*
	* 網  址： http://www.rockoa.com/								*
	* 說  明: 定義常用的方法										*
	* 備  注: 未經允許不得商業出售，代碼歡迎參考糾正				*
	*****************************************************************
*/



/**
*	m 讀取數據模型，操作數據庫的
*	$name 表名/文件名
*/
$GLOBALS['rockModelImport']	= array();
function m($name)
{
	$cls			= NULL;
	$pats	= $nac	= '';
	if(isset($GLOBALS['rockModelImport'][$name])){
		$cls		= clone $GLOBALS['rockModelImport'][$name];
	}else{
		$nas		= $name;
		$asq		= explode(':', $nas);
		if(count($asq)>1){
			$nas	= $asq[1];
			$nac	= $asq[0];
			$pats	= $nac.'/';
			$_pats	= ''.ROOT_PATH.'/'.PROJECT.'/model/'.$nac.'/'.$nac.'.php';
			if(file_exists($_pats)){
				include_once($_pats);
				$class	= ''.$nac.'Model';
				$cls	= new $class($nas);
			}	
		}
		$class		= ''.$nas.'ClassModel';
		$path		= ''.ROOT_PATH.'/'.PROJECT.'/model/'.$pats.''.$nas.'Model.php';
		if(file_exists($path)){
			include_once($path);
			if($nac!='')$class= $nac.'_'.$class;
			$cls	= new $class($nas);
		}
		if($cls==NULL)$cls = new sModel($nas);
		$GLOBALS['rockModelImport'][$name]	= $cls;
	}
	return $cls;
}

/**
*	引入插件
*	$name 插件名稱
*	$inbo 是否初始化
*	$param1,2,參數 
*/
function c($name, $inbo=true, $param1='', $param2='')
{
	$class	= ''.$name.'Chajian';
	$path	= ''.ROOT_PATH.'/include/chajian/'.$class.'.php';
	$cls	= NULL;
	if(file_exists($path)){
		include_once($path);
		if($inbo)$cls	= new $class($param1, $param2);
	}
	return $cls;	
}

/**
*	引入class文件
*/
function import($name, $inbo=true)
{
	$class	= ''.$name.'Class';
	$path	= ''.ROOT_PATH.'/include/class/'.$class.'.php';
	$cls	= NULL;
	if(file_exists($path)){
		include_once($path);
		if($inbo){
			$cls	= new $class();
		}
	}
	return $cls;
}

/**
*	讀取配置
*/
function getconfig($key, $dev='')
{
	$a = array();
	if(isset($GLOBALS['config']))$a = $GLOBALS['config'];
	$s = '';
	if(isset($a[$key]))$s = $a[$key];
	if($s==='')$s = $dev;
	return $s;
}

/**
*	判斷變量是否為空
*	@return boolean
*/
function isempt($str)
{
	$bool=false;
	if( ($str==''||$str==NULL||empty($str)) && (!is_numeric($str)) )$bool=true;
	return $bool;
}

/**
*	判斷變量是否包含在另一變量裡面
*	@return boolean
*/
function contain($str,$a)
{
	$bool=false;
	if(!isempt($a) && !isempt($str)){
		$ad=strpos($str,$a);
		if($ad>0||!is_bool($ad))$bool=true;
	}
	return $bool;
}

/**
*	獲取請求的頭
*	@return string/array
*/
function getheader($key='')
{
	$arr = array();
	if(function_exists('getallheaders'))$arr = getallheaders();
	if($key=='')return $arr;
	return arrvalue($arr, $key);
}

/**
*	是否ajax請求
*	@return boolean
*/
function isajax()
{
	if(strtolower(getheader('X-Requested-With'))=='xmlhttprequest'){ 
		return true;
	}else{ 
		return false;
	};
}

function backmsg($msg='', $demsg='處理成功', $da=array())
{
	$code = 201;
	if($msg == ''){
		$msg = $demsg;
		$code= 200;
	}
	showreturn($da, $msg, $code);
}

/**
*	返回錯誤信息
*/
function returnerror($msg='', $code=201, $carr=array())
{
	$carr['msg']  		= $msg;
	$carr['code'] 		= $code;
	$carr['success'] 	= false;
	$carr['data'] 		= '';
	return $carr;
}

/**
*	返回正確信息
*/
function returnsuccess($data=array())
{
	$carr['msg']  		= '';
	$carr['code'] 		= 200;
	$carr['success'] 	= true;
	$carr['data'] 		= $data;
	return $carr;
}

function showreturn($arr='', $msg='', $code=200)
{
	$callback	= @$_GET['callback'];
	$success	= true;
	if($code != 200)$success = false;
	$result 	= json_encode(array(
		'code' 	=> $code,
		'msg'	=> $msg,
		'data'	=> $arr,
		'success'=> $success
	));
	if(!isempt($callback)){
		echo ''.$callback.'('.$result.')';
	}else{
		echo $result;
	}
	exit();
}

/**
*	錯誤處理
*/
function rockerror($errno, $errstr,$err_file = '', $err_line = 0){
	$str = "File:".$err_file." Line:[$err_line] Error: [$errno] $errstr";
	echo $str;exit();
}

/**
*	在數組裡讀取變量
*	@return value
*/
function arrvalue($arr, $k, $dev='')
{
	$val  = $dev;
	if(isset($arr[$k]))$val= $arr[$k];
	return $val;
}

/**
*	在對象裡讀取變量
*	@return value
*/
function objvalue($arr, $k, $dev='')
{
	$val  = $dev;
	if(isset($arr->$k))$val= $arr->$k;
	return $val;
}

/**
*	過濾字符串的空格
*/
function trimstr($str)
{
	return trim(str_replace(' ','',$str));
}