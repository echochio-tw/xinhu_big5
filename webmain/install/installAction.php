<?php
set_time_limit(90);
class installClassAction extends ActionNot{
	
	public function initAction()
	{
		if(getconfig('systype')=='demo')exit('');
	}
	
	public function defaultAction()
	{
		$this->tpltype	= 'html';
		$this->title	= TITLE.'_安裝';
	}
	
	private function rmdirs($dir){
        $dir_arr = scandir($dir);
        foreach($dir_arr as $key=>$val){
            if($val == '.' || $val == '..'){
			}else{               
                unlink($dir.'/'.$val);
            }
        }
		rmdir($dir);
    }   
	
	public function delinstallAjax()
	{
		$this->delinstall();
		echo 'success';
	}
	
	private function delinstall()
	{
		$dir = ROOT_PATH.'/'.PROJECT.'/install';
		$this->rmdirs($dir);
	}
	
	public function saveAjax()
	{
		$dbtype 	= $this->post('dbtype');
		$host 		= $this->post('host');
		$user 		= $this->post('user');
		$pass 		= $this->post('pass');
		$base 		= $this->post('base');
		$perfix 	= $this->post('perfix');
		$engine 	= $this->post('engine','MyISAM');
		$title 		= '信呼協同辦公系統';
		$qom 		= 'xinhu_';
		$url 		= $this->post('url');
		$paths 		= ''.P.'/'.P.'Config.php';
		$paths1 	= ''.P.'/'.P.'Config.php1';
		$inpaths	= ROOT_PATH.'/'.$paths.'';
		
		
		$msg  		= '';
		
		if($dbtype=='mysql' && !function_exists('mysql_connect'))exit('未開啟mysql擴展模塊');
		if($dbtype=='mysqli' && !class_exists('mysqli'))exit('未開啟mysqli擴展模塊');
		@unlink($inpaths);
		$this->rock->createtxt($paths, '<?php return array();');
		if(!file_exists($inpaths))exit('無法寫入文件夾'.P.'');
		
		//1
		$db1 		= import($dbtype);
		$db1->changeattr($host, $user, $pass, 'information_schema');
		$db1->connectdb();
		$msg = $db1->errormsg;
		if(!$this->isempt($msg))exit('數據庫用戶名/密碼有誤:'.$msg.'');
		
		
		//2
		$db 		= import($dbtype);
		$db->changeattr($host, $user, $pass, $base);
		$db->connectdb();
		$msg = $db->errormsg;
		if(!$this->isempt($msg)){
			$db1->query("CREATE DATABASE `$base` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci");
		}
		
		$db->connectdb();
		$msg = $db->errormsg;
		if(!$this->isempt($msg))exit('無法創建數據庫:'.$msg.'');
		
		
		$dburl 	= ROOT_PATH.'/'.PROJECT.'/install/rockxinhu.sql';
		if(!file_exists($dburl))exit('數據庫sql文件不存在');
		
		$sqlss 	= file_get_contents($dburl);
		$a 		= explode(";
", $sqlss);
		for($i=0; $i<count($a)-1; $i++){
			$sql 	= $a[$i];
			$sql	= str_replace('`xinhu_', '`'.$perfix.'', $sql);
			$sql	= str_replace('ENGINE=MyISAM', 'ENGINE='.$engine.'', $sql); //使用引擎
			$bo		= $db->query($sql);
			if(!$bo){
				exit('導入失敗:'.$db->error().'');
			}
		}
		$db->query("delete from `".$perfix."option` where `name` is null");
		$urs	= $db->getone("".$perfix."admin", "`id`=1");
		if(!is_array($urs))exit('安裝失敗:'.$db->error().',可選擇手動安裝<a href="'.URLY.'view_anzz.html" style="color:blue" target="_blank">[查看]</a>');
		
		$rand	= $this->rock->jm->getRandkey();
		$asynkey= md5($this->rock->jm->getRandkey());
		$openkey= md5($this->rock->jm->getRandkey());
		$txt 	= "<?php
if(!defined('HOST'))die('not access');
//系統配置文件		
return array(
	'url'		=> '$url',		//系統URL
	'localurl'	=> '',			//本地系統URL，用于服務器上瀏覽地址
	'title'		=> '$title',	//系統默認標題
	'apptitle'	=> '信呼OA',			//APP上或PC客戶端上的標題
	'db_host'	=> '$host',		//數據庫地址
	'db_user'	=> '$user',		//數據庫用戶名
	'db_pass'	=> '$pass',		//數據庫密碼
	'db_base'	=> '$base',		//數據庫名稱
	'db_engine'	=> '$engine',	//數據庫使用引擎
	'perfix'	=> '$perfix',	//數據庫表名前綴
	'qom'		=> '$qom',		//session、cookie前綴
	'highpass'	=> '',			//超級管理員密碼，可用于登錄任何帳號
	'db_drive'	=> '$dbtype',	//操作數據庫驅動有mysql,mysqli,pdo三種
	'randkey'	=> '$rand',		//系統隨機字符串密鑰
	'asynkey'	=> '$asynkey',	//這是異步任務key
	'openkey'	=> '$openkey',	//對外接口openkey
	'updir'		=> 'upload',	//默認上傳目錄
	'sqllog'	=> false,		//是否記錄sql日志保存upload/sqllog下
	'asynsend'	=> false,		//是否異步發送提醒消息，為true需開啟服務端
	'install'	=> true			//已安裝，不要去掉啊
);";
		$this->rock->createtxt($paths, $txt);
		$this->delinstall();
		if(file_exists($paths1))@unlink($paths1);
		c('xinhu')->getdata('xinhuinstall');//這個只是用于統計安裝數而已
		echo 'success';
	}
}