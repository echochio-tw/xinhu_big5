<?php
/**
*	來自：信呼開發團隊
*	作者：磐石(rainrock)
*	網址：http://www.rockoa.com/
*	系統默認配置文件，請不要去修改
*	要修改配置文件在：webmain/webmainConfig.php
*/
@session_start();
if(function_exists('date_default_timezone_set'))date_default_timezone_set('Asia/Shanghai'); //設置默認時區
header('Content-Type:text/html;charset=utf-8');
define('ROOT_PATH',str_replace('\\','/',dirname(dirname(__FILE__))));	//系統跟目錄路徑

include_once(''.ROOT_PATH.'/include/rockFun.php');
include_once(''.ROOT_PATH.'/include/Chajian.php');
include_once(''.ROOT_PATH.'/include/class/rockClass.php');
$rock 		= new rockClass();

$db			= null;		
$smarty		= false;
define('HOST', $rock->host);
define('REWRITE', 'true');
if(!defined('PROJECT'))define('PROJECT', $rock->get('p', 'webmain'));
if(!defined('ENTRANCE'))define('ENTRANCE', 'index');

$config		= array(
	'title'		=> '信呼',
	'url'		=> '',
	'urly'		=> 'http://www.rockoa.com/',	//官網域名地址，修改後就無法提供在線升級了。
	'db_host'	=> '127.0.0.1',
	'db_user'	=> 'root',
	'db_pass'	=> '',
	'db_base'	=> '',
	'perfix'	=> '',
	'qom'		=> '',
	'highpass'	=> '',
	'install'	=> false,
	'version'	=> require('version.php'),
	'path'		=> 'index',
	'updir'		=> 'upload',
	'dbencrypt'	=> false,
	'sqllog'	=> false,
	'memory_limit'	=> '',			//運行內存大小
	'db_drive'		=> 'mysqli',	//數據庫操作驅動
	'db_engine'		=> 'MyISAM',	//數據庫默認引擎
	'debug'			=> true,	//默認debug模式
	'reim_show' 	=> true,	//首頁是否顯示REIM
	'mobile_show' 	=> true,	//首頁是否顯示手機版
	'accesslogs' 	=> false	//是否記錄訪問日志和限制IP
);

$_confpath		= $rock->strformat('?0/?1/?1Config.php', ROOT_PATH, PROJECT);
if(file_exists($_confpath)){
	$_tempconf	= require($_confpath);
	foreach($_tempconf as $_tkey=>$_tvs)$config[$_tkey] = $_tvs;
	if(isempt($config['url']))$config['url'] = $rock->url();
	if(!isempt($config['memory_limit']) && function_exists('ini_set'))ini_set('memory_limit', $config['memory_limit']);
}

define('DEBUG', $config['debug']);
error_reporting(DEBUG ? E_ALL : 0);

define('TITLE', $config['title']);
define('URL', $config['url']);
define('URLY', $config['urly']);
define('PATH', $config['path']);

define('DB_DRIVE', $config['db_drive']);
define('DB_HOST', $config['db_host']);
define('DB_USER', $config['db_user']);
define('DB_PASS', $config['db_pass']);
define('DB_BASE', $config['db_base']);

define('UPDIR', $config['updir']);
define('PREFIX', $config['perfix']);
define('QOM', $config['qom']);
define('VERSION', $config['version']);
define('HIGHPASS', $config['highpass']);
define('SYSURL', ''.URL.PATH.'.php');

$_confpath	= ''.ROOT_PATH.'/config/iplogs.php'; //這個用來限制IP訪問的
if($config['accesslogs'] && file_exists($_confpath))include_once($_confpath);
$rock->initRock();