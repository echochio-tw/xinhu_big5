<?php
class cogClassAction extends Action
{
	public function sysinfoAjax()
	{
		$fields = array(
			'title'	=> '系統名稱',
			'url'	=> '系統URL地址',
			'localurl'	=> '系統本地地址',
			'taskurl'	=> '任務地址',
			'db_drive'	=> '操作數據庫驅動',
			'version'	=> '版本',
			'phpos'		=> '服務器',
			'phpver'	=> 'PHP版本',
			'mysqlver'	=> 'mysql版本',
			'SERVER_SOFTWARE'	=> 'web服務器',
			'upload_max_filesize'	=> '最大上傳大小',
			'post_max_size'	=> 'POST最大',
			'memory_limit'	=> '使用最大內存',
			'curl'			=> '是否支持CURL',
			'max_execution_time'			=> 'PHP執行超時時間',
			
		);
		
		$data = array(
			'title'	=> getconfig('title'),
			'url'	=> getconfig('url'),
			'localurl'	=> getconfig('localurl'),
			'taskurl'	=> getconfig('taskurl'),
			'xinhukey'	=> getconfig('xinhukey'),
			'db_drive'	=> getconfig('db_drive'),
			'version'	=> '信呼V'.VERSION.'',
			'phpos'	=> PHP_OS,
			'phpver'	=> PHP_VERSION,
			'mysqlver'	=> $this->db->getsyscount('version'),
			'SERVER_SOFTWARE'	=> $_SERVER['SERVER_SOFTWARE'],
			'upload_max_filesize'	=> ini_get('upload_max_filesize'),
			'post_max_size'			=> ini_get('post_max_size'),
			'memory_limit'			=> ini_get('memory_limit'),
			'max_execution_time'			=> ini_get('max_execution_time').'秒',
			
		);
		if(!function_exists('curl_init')){
			$data['curl'] = '<font color=red>不支持</font>';
		}else{
			$data['curl'] = '<font color=green>支持</font>';
		}
		
		$this->returnjson(array(
			'fields' => $fields,
			'data' 	=> $data,
		));
	}
	
	public function getinfoAjax()
	{
		$arr['title'] 		= getconfig('title');
		$arr['url'] 		= getconfig('url');
		$arr['localurl'] 	= getconfig('localurl');
		$arr['apptitle'] 	= getconfig('apptitle');
		$arr['reimtitle'] 	= getconfig('reimtitle');
		$arr['asynkey'] 	= getconfig('asynkey');
		$arr['openkey'] 	= getconfig('openkey');
		$arr['db_drive'] 	= getconfig('db_drive');
		$arr['xinhukey'] 	= getconfig('xinhukey');
		$arr['bcolorxiang'] = getconfig('bcolorxiang');
		$arr['asynsend'] 	= getconfig('asynsend');
		$arr['sqllog'] 		= getconfig('sqllog') ? '1' : '0';
		$arr['debug'] 		= getconfig('debug') ? '1' : '0';
		$arr['reim_show'] 	= getconfig('reim_show') ? '1' : '0';
		$arr['mobile_show'] = getconfig('mobile_show') ? '1' : '0';
		if(getconfig('systype')=='demo')$arr['xinhukey']='';
		$this->returnjson($arr);
	}
	
	public function savecongAjax()
	{
		if(getconfig('systype')=='demo')exit('演示上禁止設置');
		if($this->getsession('isadmin')!='1')exit('非管理員不能操作');
		
		$puurl 			= $this->option->getval('reimpushurlsystem',1);
		
		$_confpath		= $this->rock->strformat('?0/?1/?1Config.php', ROOT_PATH, PROJECT);
		$arr 			= require($_confpath);
		
		$title 			= $this->post('title');
		if(!isempt($title))$arr['title'] = $title;
		
		$arr['url'] 		= $this->post('url');
		$arr['reimtitle'] 	= $this->post('reimtitle');
		
		$apptitle 			= $this->post('apptitle');
		if(!isempt($apptitle))$arr['apptitle'] = $apptitle;
		
		$asynkey 			= $this->post('asynkey');
		if(!isempt($asynkey))$arr['asynkey'] = $asynkey;
		
		$db_drive 			= $this->post('db_drive');
		if(!isempt($db_drive)){
			if($db_drive=='mysql' && !function_exists('mysql_connect'))exit('未開啟mysql擴展模塊');
			if($db_drive=='mysqli' && !class_exists('mysqli'))exit('未開啟mysqli擴展模塊');
			if($db_drive=='pdo' && !class_exists('PDO'))exit('未開啟pdo擴展模塊');
			$arr['db_drive'] = $db_drive;
		}
		
		$arr['localurl'] 	= $this->post('localurl');
		$arr['openkey']  	= $this->post('openkey');
		$arr['xinhukey'] 	= $this->post('xinhukey');
		$arr['bcolorxiang'] = $this->post('bcolorxiang');
		
		$asynsend 		 	= $this->post('asynsend');
		$arr['asynsend'] 	= $asynsend;
		
		//if($arr['asynsend'] && !m('reim')->asynurlbo())exit('沒有開啟服務端不能使用異步');
		
		$arr['sqllog'] 	 = $this->post('sqllog')=='1';
		$arr['debug'] 	 = $this->post('debug')=='1';
		$arr['reim_show'] 	 = $this->post('reim_show')=='1';
		$arr['mobile_show']  = $this->post('mobile_show')=='1';
		
		if($asynsend == '1' && isempt($puurl))exit('未安裝或開啟服務端不能使用異步發送消息');
		
		$smarr['url']			= '系統URL';
		$smarr['localurl']		= '本地系統URL，用于服務器上瀏覽地址';
		$smarr['title']			= '系統默認標題';
		$smarr['apptitle']		= 'APP上或PC客戶端上的標題';
		$smarr['reimtitle']		= 'REIM即時通信上標題';
		$smarr['weblogo']		= 'PC客戶端上的logo圖片';
		$smarr['db_host']		= '數據庫地址';
		$smarr['db_user']		= '數據庫用戶名';
		$smarr['db_pass']		= '數據庫密碼';
		$smarr['db_base']		= '數據庫名稱';
		$smarr['perfix']		= '數據庫表名前綴';
		$smarr['qom']			= 'session、cookie前綴';
		$smarr['highpass']		= '超級管理員密碼，可用于登錄任何帳號';
		$smarr['db_drive']		= '操作數據庫驅動有mysql,mysqli,pdo三種';
		$smarr['randkey']		= '系統隨機字符串密鑰';
		$smarr['asynkey']		= '這是異步任務key';
		$smarr['openkey']		= '對外接口openkey';
		$smarr['sqllog']		= '是否記錄sql日志保存'.UPDIR.'/sqllog下';
		$smarr['asynsend']		= '是否異步發送提醒消息，0同步，1自己服務端異步，2官網VIP用戶異步';
		$smarr['install']		= '已安裝，不要去掉啊';
		$smarr['xinhukey']		= '信呼官網key，用于在線升級使用';
		$smarr['bcolorxiang']	= '單據詳情頁面上默認展示線條的顏色';
		$smarr['debug']			= '為true調試開發模式,false上線模式';
		$smarr['reim_show']		= '首頁是否顯示REIM';
		$smarr['mobile_show']	= '首頁是否顯示手機版';
		
		$str1 = '';
		foreach($arr as $k=>$v){
			$bz = '';
			if(isset($smarr[$k]))$bz='	//'.$smarr[$k].'';
			if(is_bool($v)){
				$v = $v ? 'true' : 'false';
			}else{
				$v = "'$v'";
			}
			$str1.= "	'$k'	=> $v,$bz\n";
		}
		
		$str = '<?php
if(!defined(\'HOST\'))die(\'not access\');
//['.$this->adminname.']在'.$this->now.'通過[系統→系統工具→系統設置]，保存修改了配置文件
return array(
'.$str1.'
);';
		@$bo = file_put_contents($_confpath, $str);
		if($bo){
			echo 'ok';
		}else{
			echo '保存失敗無法寫入：'.$_confpath.'';
		}
	}
	
	public function logbefore($table)
	{
		$key = $this->post('key');
		$s   = '';
		if($key != ''){
			$s = "and (`type`='$key' or `optname` like '$key%' or `remark` like '$key%' or `web`='$key' or `ip`='$key')";
		}
		return $s;
	}
	
	public function dellogAjax()
	{
		$id = $this->post('id');
		m('log')->delete('id in('.$id.')');
		backmsg();
	}
}