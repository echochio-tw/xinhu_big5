<?php
/**
*	群英考勤機
* 	請求地址如：http://127.0.0.1/api.php?m=opendkq&openkey=key
*/
class openkqjClassAction extends openapiAction
{
	private $snid = 0; //設備號ID
	
	public function initAction()
	{
		$this->display= false;
		$this->getpostdata();
	}
	
	public function indexAction()
	{
		echo 'ok';
	}
	
	//考勤機的使用
	public function apiAction()
	{
	 	//print_r($_SERVER);
		$path 	= arrvalue($GLOBALS,'_paths', $_SERVER['REQUEST_URI']);
		if(isempt($path))return '';
		$patha 	= explode('/', $path);
		
		$acta	= explode('?', $patha[count($patha)-1]);
		$act 	= $acta[0];
		$data 	= array();
		$num	= $this->get('sn'); //設備號
		if(!$num)return 'notdata';
		$dbs 	= m('kqjsn');
		$snid	= (int)$dbs->getmou('id',"`num`='$num'");
		if($snid==0)$snid = $dbs->insert(array(
			'num' => $num,
			'optdt' => $this->rock->now,
			'status' => 1
		));
		
		$this->snid = $snid;

		//考勤機請求
		if($act=='get'){
			$data= m('kqjcmd')->getcmd($this->snid); //向考勤機發送命令
		}
		
		//推送來的
		if($act=='post' && $this->postdata!=''){
			$data= m('kqjcmd')->postdata($this->snid, $this->postdata);
		}
		
		//設備上獲取服務器時間
		if($act=='unixtime'){
			$this->rock->debugs(json_encode($_GET),'unixtime');
			$data['timezone'] = 'UTC';
			$data['unixtime'] = time()-8*3600; //由于北京時間多8小時所有要減
			$data['datetime'] = date('Y-m-d H:i:s', $data['unixtime']);
		}
		
		$barr['status'] = 1;
		$barr['info']   = 'ok';
		$barr['data']	= $data;
		return $barr;
	}
	
	//推送過來的數據
	//[{"id":"5056928","data":"return","return":[{"id":"0","result":"0"}]},{"id":"8993137","data":"return","return":[{"id":"0","result":"0"}]},{"id":"1275640","data":"return","return":[{"id":"0","result":"0"}]},{"id":"8085763","data":"return","return":[{"id":"0","result":"0"}]},{"id":"3896216","data":"return","return":[{"id":"0","result":"0"}]},{"id":"5036770","data":"return","return":[{"id":"0","result":"0"}]},{"id":"3554609","data":"return","return":[{"id":"0","result":"0"}]},{"id":"2144747","data":"return","return":[{"id":"0","result":"0"}]},{"id":"235805","data":"return","return":[{"id":"0","result":"0"}]},{"id":"186003","data":"return","return":[{"id":"0","result":"0"}]}]
}	