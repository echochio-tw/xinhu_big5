<?php
class taskClassAction extends Action
{
	
	public function getrunlistAjax()
	{
		$barr = m('task')->getlistrun($this->date);
		$this->returnjson($barr);
	}
	public function starttaskAjax()
	{
		$lx		= (int)$this->get('lx','0');
		m('task')->cleartask();
		if($lx==0){
			$url 	= getconfig('localurl');
			if($url=='')return returnerror('請先設置系統本地地址');
			$barr 	= m('task')->starttask();
			if($barr['code']==0){
				return returnsuccess('啟動成功');
			}else{
				return returnsuccess('無法啟動可能未開啟服務端:'.$barr['msg'].'');
			}
		}else{
			if($lx==1){
				$barr = c('xinhuapi')->starttask();
				if($barr['success'])$barr['data'] = '已通過官網服務開啟計劃任務';
			}
			if($lx==2){
				$barr = c('xinhuapi')->stoptask();
				if($barr['success'])$barr['data'] = '已停止使用官網計劃任務';
			}
			return $barr;
		}
	}
	
	public function clearztAjax()
	{
		m('task')->update('state=0,lastdt=null,lastcont=null','1=1');
	}
	
	
	public function downbatAjax()
	{
		$ljth = str_replace('/','\\',ROOT_PATH);
		echo '<title>計劃任務開啟方法</title>';
		
		echo '<font color="red">如您有安裝信呼服務端，就不用根據下面來開啟計劃任務了</font><br><a target="_blank" style="color:blue" href="'.URLY.'view_taskrun.html">查看官網上幫助</a><br>';
		echo '計劃任務的運行時間需要設置為5的倍數才可以運行到。<br>';
		
		
		
		echo '一、<b>Windows服務器</b>，可根據以下設置定時任務<br>';
		$str1 = '@echo off
cd '.$ljth.'	
'.getconfig('phppath','php').' '.$ljth.'\task.php runt,task';
		$this->rock->createtxt(''.UPDIR.'/xinhutaskrun.bat', $str1);
		echo '1、打開系統配置文件webmainConfig.php加上一個配置phppath設置php環境的目錄地址如：F:\php\php-5.6.22\php.exe，設置好了，刷新本頁面。<br>';
		echo '<div style="background:#caeccb;padding:5px;border:1px #888888 solid;border-radius:5px;">';
		echo "return array(<br>'title'	=>'信呼OA',<br>'phppath' => 'F:\php\php-5.6.22\php.exe' <font color=#aaaaaa>//加上這個</font><br>)";
		echo '</div>';
		echo '2、在您的win服務器上，開始菜單→運行 輸入 cmd 回車(管理員身份運行)，輸入以下命令(每5分鐘運行一次)：<br>';
		echo '<div style="background:#caeccb;padding:5px;border:1px #888888 solid;border-radius:5px;">';
		echo 'schtasks /create /sc DAILY /mo 1 /du "24:00" /ri 5 /sd "2017/04/01" /st "00:00:05"  /tn "信呼計劃任務" /ru System /tr '.$ljth.'\\'.UPDIR.'\xinhutaskrun.bat';
		echo '</div>';
		

		$str1 = 'cd '.ROOT_PATH.'
php task.php runt,task';
		$spath= ''.UPDIR.'/xinhutaskrun.sh';
		$this->rock->createtxt($spath, $str1);	
		echo '<br>二、<b>Linux服務器</b>，可用根據以下設置定時任務<br>';
		echo '根據以下命令設置運行：<br>';
		echo '<div style="background:#caeccb;padding:5px;border:1px #888888 solid;border-radius:5px;"><font color=blue>chmod</font> 777 '.ROOT_PATH.'/'.$spath.'<br>';
		echo '<font color=blue>crontab</font> -e<br>';
		echo '#信呼計劃任務每5分鐘運行一次<br>';
		echo '*/5 * * * * '.ROOT_PATH.'/'.$spath.'</div>';
		
		echo '<br><br>三、<b>瀏覽器窗口運行</b>，用于你的是虛擬主機沒辦法管理服務器時<br>';
		echo '打開<a href="?m=task&a=queue&d=system" style="color:blue">[計劃任務隊列]</a> 來啟用計劃任務。<br>';
	}
	
	public function queueAction()
	{
		$this->title = '計劃任務隊列';
		$tasklist 	 = m('task')->getrunlist('',1);
		$this->smartydata['tasklist'] = $tasklist;
	}
}