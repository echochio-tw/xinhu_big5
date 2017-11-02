<?php
//考勤機管理命令
class kqjcmdClassModel extends Model
{
	private $snrs;
	
	public function initModel()
	{
		$this->snobj = m('kqjsn');
		$this->kquobj = m('kqjuser');
	}
	
	/**
	*	命令類型
	*/
	public function cmdtype($type)
	{
		$atrr = array(
			'config' => '設置配置',
			'reboot' => '重啟',
			'dept' 	 => '上傳部門',
			'user' 	 => '上傳人員',
			'deluser' 	=> '刪除人員',
			'delsuser' 	=> '刪除不存在人員',
			'getfingerprint' => '獲取指紋',
			'getheadpic' => '獲取頭像',
			'headpic' 	 => '上傳頭像',
			'advert1' 	 => '設置廣告圖1',
			'advert2' 	 => '設置廣告圖2',
			'advert3' 	 => '設置廣告圖3',
			'deladvert' 	 => '刪除廣告圖',
			'getuser' 	 => '獲取人員',
			'getinfo' 	 => '獲取設備信息',
			'getclockin' 	 => '獲取打卡記錄',
			'delclockin' 	 => '刪除打卡記錄',
			'getpic'  => '獲取現場照片',
			'delpic'  => '刪除現場照片',
			'fingerprint'  => '上傳指紋',
		);
		
		return arrvalue($atrr, $type, $type);
	}
	
	/**
	*	發送命令
	*/
	public function send($snid, $type, $ohter='')
	{
		$snrs = $this->getsninfo($snid);
		if(!$snrs)return returnerror('設備不存在,請添加');
		if(isempt($snrs['name']))return returnerror('請設置設備名稱');
		if(isempt($snrs['company']))return returnerror('請設置設備顯示公司名稱');
		$id = 0;
		
		//判斷是不是有重復
		$arrpda = array('reboot','config','getuser','getinfo','advert');
		if(in_array($type, $arrpda)){
			$tod = $this->rows("`snid`='$snid' and `atype`='$type' and `status`=0");
			if($tod>0)return returnerror('還有['.$this->cmdtype($type).']命令待運行，不能重復發送');
		}
		
		//重啟
		if($type=='reboot'){
			$id = $this->savedata($snid, $type, array(
				'do' => 'cmd',
				'cmd' => 'reboot',
			));
		}
		
		//獲取設備信息
		if($type=='getinfo'){
			$id = $this->savedata($snid, $type, array(
				'do' 	=> 'upload',
				'data' 	=> 'info',
			));
		}
		
		//發送配置信息
		if($type=='config'){
			$id = $this->savedata($snid, $type, $this->getconfigs($snrs));
		}
		
		//部門推送更新
		if($type=='dept'){
			$id = $this->savedata($snid, $type, $this->depttosn($ohter));
		}
		
		//人員推送
		if($type=='user'){
			$id = $this->savedata($snid, $type, $this->usertosn($ohter));
		}
		
		//獲取指紋和頭像
		if($type=='getfingerprint' || $type=='getheadpic'){
			$id = $this->savedata($snid, $type, $this->sntofingerhead($ohter, $type));
		}
		
		//獲取所有人員
		if($type=='getuser'){
			$id = $this->savedata($snid, $type, array(
				'do' 	=> 'upload',
				'data' 	=> array('user'),
			));
		}
		
		//設置廣告圖
		if(substr($type,0,6)=='advert'){
			$index = substr($type,6);
			$path  = 'images/kqbanner'.$index.'.jpg';
			if(!file_exists($path)){
				$id = '廣告圖片'.$index.'不存在，請在系統目錄下添加圖片：'.$path.'';
			}else{
				$id = $this->savedata($snid, $type, array(
					'do' 	=> 'update',
					'data' 	=> 'advert',
					'index' => $index,
					'advert'=> base64_encode(file_get_contents($path))
				));
			}
		}
		
		//上傳頭像
		if($type=='headpic'){
			$id = $this->uoloadface($snid,$ohter);
		}
		
		//刪除選中人員
		if($type=='deluser'){
			$id = $this->savedata($snid, $type, $this->userdeltosn($snid, $ohter));
		}
		//刪除不存在人員
		if($type=='delsuser'){
			$id = $this->savedata($snid, 'deluser', $this->userdeltosns($snid));
		}
		
		//獲取打卡記錄
		if($type=='getclockin' || $type=='getpic' || $type=='delclockin' || $type=='delpic'){
			$id = $this->savedata($snid, $type, $this->getsntosyspic($snid, $type,$ohter));
		}
		
		//上次指紋,採集就不上傳了
		if($type=='fingerprint'){
			$id = $this->fingerprinttosn($snid, $ohter);
		}
		
		
		if($id==0 || is_string($id))return returnerror('發送失敗:'.$id.'');
		
		return returnsuccess(array(
			'id' => $id
		));
	}
	
	//保存命令到數據庫
	private function savedata($snid, $type, $data)
	{
		if(is_string($data))return $data;
		if(!$data)return 0;
		if(!isset($data[0]))$data = array($data);
		$id 	= $this->getrandid();
		$others = '';
		foreach($data as $k=>$rs){
			$data[$k]['id'] = $id+$k;
			if($k==0)$others = arrvalue($rs,'others');
			unset($data[$k]['others']);
		}
		$cmd	= json_encode($data,256);
		$this->insert(array(
			'id'	=> $id,
			'snid' 	=> $snid,
			'others' 	=> $others, //其他主鍵ID
			'status'=> '0',
			'atype' => $type,
			'cmd' 	=> $cmd,
			'optdt' => $this->rock->now,
		));
		return $id;
	}
	
	private function getrandid()
	{
		$id = rand(10000,99999999);
		if($this->rows($id)>0)$id = $this->getrandid();
		return $id;
	}
	
	
	/**
	*	獲取命令,一次可獲取條數
	*/
	public function getcmd($snid)
	{
		//10分鐘內的
		$optdt= date('Y-m-d H:i:s', time()-10*60);
		$rows = $this->getall("`snid`='$snid' and `status`=0 and `optdt`>'$optdt'",'*','optdt asc');
		$snrs = $this->getsninfo($snid);
		if($rows){
			$data = $rows[0];
			$this->update(array(
				'status' => 2,
				'qjtime' => $this->rock->now,
			), $data['id']);
			$cmd  = $data['cmd'];
			$cmd  = str_replace("\n",'', $cmd);
			$barr = json_decode($cmd, true);
		}else{
			//$barr[] 	= $this->getconfigs($snrs);
			$barr = '';
		}
		$this->snobj->update(array(
			'lastdt' => $this->rock->now
		), $snid);
		return $barr;
	}
	
	//配置信息
	private function getconfigs($snrs)
	{
		$name 		= arrvalue($snrs,'name','信呼雲考勤');
		$company 	= arrvalue($snrs,'company','信呼雲考勤');
		$snid 		= arrvalue($snrs,'id','0');
		
		return array(
			'id' 		=> 0,
			'do' 		=> 'update',
			'data' 		=> 'config',
			'name' 		=> $name,
			'company' 	=> $company,
			'companyid' => $snid, 	//公司ID/設備ID
			'max' 		=> 3000,	//目前設計最大值
			'function' 	=> 65535, 	//全部功能
			'delay' 	=> 20,
			'errdelay' 	=> 50,
			'interval' 	=> 5,
			'timezone' 	=> 'GMT+08:00',
			'encrypt' 	=> 0,
			'expired' 	=> 0
		);
	}
	
	
	/**
	*	推送過來的數據
	*/
	public function postdata($snid, $dstr)
	{
		$this->rock->debugs($dstr,'postkqj_'.$snid.'_');
		$barr = json_decode($dstr, true);
		$carr = array();
		$uids = $dids = '';
		$snrs = $this->getsninfo($snid);
		if($barr)foreach($barr as $k=>$rs){
			$dtype = arrvalue($rs, 'data'); //數據類型
			
			$carr[]= $rs['id']; //設備上來的ID
			
			//發送的命令返回
			if($dtype == 'return'){
				$mids 	= '';
				foreach($rs['return'] as $k1=>$rs1){
					$mid 	= arrvalue($rs1,'id'); //我發送時ID
					if(isempt($mid))continue;
					$result = $rs1['result']; //處理結果
					$status = ($result=='0') ? 1 : 3;//
					$this->update(array(
						'status' => $status,
						'cjtime' => $this->rock->now,
					),'`id`='.$mid.'');
					$mids.=','.$mid.'';
				}
				if($mids!=''){
					$mids = substr($mids, 1);
					$this->returnchuli($mids, $snid); //返回處理
				}
			}
			
			//推送過來的人員信息
			if($dtype=='user' && isset($rs['deptid'])){
				$uids .= ','.$rs['ccid'].'';
				$dids .= ','.$rs['deptid'].'';
			}
			
			//推送來的指紋
			if($dtype=='fingerprint'){
				$this->savefingerprint($snid, $rs['ccid'], $rs['fingerprint']);
			}
			
			//推送來的頭像
			if($dtype=='headpic'){
				$this->saveheadpic($snid, $rs['ccid'], $rs['headpic']);
			}
			
			//解除綁定（解除綁定會清空設備上所有數據，包括設備上待發送的命令）
			if($dtype=='unbound'){
				$this->cleardatasn($snid);
			}
			
			//打卡記錄
			if($dtype=='clockin'){
				$this->adddkjl($snid, $rs);
			}
			
			//推送來的設備信息
			if($dtype=='info'){
				$this->setsnconfig($snid, $rs);
			}
		}
		
		//保存用戶
		if($uids!='')$this->saveuseriddids(substr($uids, 1), substr($dids, 1), $snid);

		return $carr;
	}
	
	//上傳完成回調處理
	private function returnchuli($mids, $snid)
	{
		$clarr = $this->getall("`id` in($mids) and `status`=1");//處理成功的
		$detpids= $userids= $useridsdel = '';
		foreach($clarr as $k=>$rs){
			$others = $rs['others'];
			if(isempt($others))continue;//不需要處理
			$atype  = $rs['atype'];
			
			//部門說明設備已
			if($atype=='dept'){
				$detpids.=','.$others.'';
			}
			
			//人員
			if($atype=='user'){
				$userids.=','.$others.'';
			}
			
			//上傳頭像成功
			if($atype=='headpic'){
				$uid = (int)$others;
				$face= $this->db->getmou('[Q]admin','face','`id`='.$uid.'');
				$this->saveheadpic($snid, $uid, '', $face); //設置設備頭像
			}
			
			//刪除人員成功
			if($atype=='deluser'){
				$useridsdel.=','.$others.'';
			}
			
			//指紋上傳成功
			if($atype=='fingerprint'){
				$cmdarr = json_decode($rs['cmd'], true);
				$cnsrs	= $cmdarr[0];
				$this->savefingerprint($snid, $cnsrs['ccid'], $cnsrs['fingerprint']); //保存指紋
			}
		}
		
		//部門
		if(!isempt($detpids)){
			$this->addupstr($snid, substr($detpids, 1), 'deptids');
		}
		
		//人員的，說明設備上有哪些人員
		if(!isempt($userids)){
			$this->addupstr($snid, substr($userids, 1), 'userids');
		}
		
		//刪除人員
		if(!isempt($useridsdel)){
			$this->delupstr($snid, substr($useridsdel, 1), 'userids');
		}
	}
	
	//清除設備上所有信息
	private function cleardatasn($snid)
	{
		m('kqjuser')->delete('`snid`='.$snid.'');//刪除數據
		m('kqjcmd')->delete('`snid`='.$snid.''); //刪除命令
		$this->snobj->update(array(
			'userids' => '',
			'deptids' => '',
		), $snid);
	}
	
	//添加打卡記錄
	private function adddkjl($snid, $rs)
	{
		$dkdt 	= $rs['time'];
		$uid 	= $rs['ccid']; //用戶ID
		$pic	= arrvalue($rs,'pic');	 //現成照片
		$sntype = $rs['verify'];//打卡方式
		$where 	= "`uid`='$uid' and `dkdt`='$dkdt' and `type`=1";
		$ddbs	= m('kqdkjl');
		$to 	= $ddbs->rows($where);
		$datype = array('密碼','指紋','刷卡');
		
		$uarr['sntype'] = $sntype;
		$uarr['snid'] 	= $snid;
		$uarr['optdt']  = $this->rock->now;
		$uarr['explain']  = '在['.$this->snrs['name'].']使用('.arrvalue($datype, $sntype).')打卡';
		if($to==0){
			$uarr['type'] 	= 1;
			$uarr['uid'] 	= $uid;
			$uarr['dkdt'] 	= $dkdt;
			$where = '';
		}
		
		if(!isempt($pic)){
			$imgpath = ''.UPDIR.'/'.date('Y-m').'/'.$uid.'_'.strtotime($dkdt).'.jpg';
			$this->rock->createtxt($imgpath, base64_decode($pic));
			$uarr['imgpath'] 	= $imgpath;
		}
		$ddbs->record($uarr, $where);
	}
	
	//保存設備用戶
	private function saveuseriddids($userids, $dids, $snid)
	{
		$darrs 	 = $this->depttosn($dids);
		$deptids = $darrs['others'];
		$this->snobj->update(array(
			'userids' => $userids,
			'deptids' => $deptids,
		), $snid);
	}
	
	//保存指紋
	private function savefingerprint($snid, $uid, $finge)
	{
		$where = "`snid`='$snid' and `uid`='$uid'";
		$arr['fingerprint1'] = str_replace("\n",'', arrvalue($finge, 0));
		$arr['fingerprint2'] = str_replace("\n",'', arrvalue($finge, 1));
		//if(isempt($arr['fingerprint1']) && isempt($arr['fingerprint2']))return;
		if($this->kquobj->rows($where)==0){
			$where = '';
			$arr['snid'] = $snid;
			$arr['uid'] = $uid;
		}
		$this->kquobj->record($arr, $where);
	}
	
	//保存設備頭像
	private function saveheadpic($snid, $uid, $headpic, $face='')
	{
		$where = "`snid`='$snid' and `uid`='$uid'";
		if(isempt($face)){
			if(isempt($headpic))return;
			$face  = ''.UPDIR.'/face/kqj'.$snid.'_u'.$uid.'.jpg'; //頭像保存為圖片
			$this->rock->createtxt($face, base64_decode($headpic));
		}
		$arr['headpic'] = $face;
		if($this->kquobj->rows($where)==0){
			$where = '';
			$arr['snid'] = $snid;
			$arr['uid']  = $uid;
		}
		$this->kquobj->record($arr, $where);
	}
	
	//獲取設備信息
	public function getsninfo($id)
	{
		$snrs			= $this->db->getone('`[Q]kqjsn`','`id`='.$id.'');
		$this->snrs 	= $snrs;//當前設備信息
		return $snrs;
	}
	
	//設置設備信息
	private function setsnconfig($snid, $rs)
	{
		$uarr['model'] = arrvalue($rs,'model');
		$uarr['appver'] = $rs['app'];
		$uarr['romver'] = $rs['rom'];
		$uarr['space'] = $rs['space'];
		$uarr['memory'] = $rs['memory'];
		$uarr['usershu'] = $rs['user'];
		$uarr['fingerprintshu'] = $rs['fingerprint'];
		$uarr['headpicshu'] = $rs['headpic'];
		$uarr['clockinshu'] = $rs['clockin'];
		$uarr['picshu'] = $rs['pic'];
		$this->snobj->update($uarr, $snid);
	}
	
	
	private function delupstr($snid, $dstr, $fields)
	{
		$this->kquobj->delete('`snid`='.$snid.' and `uid` in('.$dstr.')');
		$snrs = $this->getsninfo($snid);
		$odeptid = $snrs[$fields];
		if(isempt($odeptid))return;
		$dstr = ','.$dstr.','; //要刪除的
		
		$depta 	 = explode(',', $odeptid);
		$dids 	 = array(); //最後Id
		foreach($depta as $dis1){
			if(!contain($dstr,','.$dis1.','))$dids[] = $dis1;
		}
		
		$ids 	= join(',', $dids);
		$this->snobj->update("`$fields`='$ids'", $snid);
	}
	
	//更新添加記錄
	private function addupstr($snid, $strss, $fields)
	{
		$snrs = $this->getsninfo($snid);
		$odeptid = $snrs[$fields];
		if(isempt($odeptid))$odeptid = '';
		if(!isempt($odeptid))$odeptid.=',';
		$odeptid.=''.$strss.''; //最新的
		
		$depta 	 = explode(',', $odeptid);
		$dids 	 = array(); //最後Id
		foreach($depta as $dis1){
			if(!in_array($dis1, $dids))$dids[] = $dis1;
		}
		$ids 	= join(',', $dids);
		
		$this->snobj->update("`$fields`='$ids'", $snid);
	}
	
	/**
	*	部門推送更新
	*/
	private function depttosn($deptids)
	{
		if(isempt($deptids))return 0;
		$dids 		= '';
		$deptida	= explode(',', $deptids);
		foreach($deptida as $did){
			$didsss 	= $this->db->getpval('[Q]dept', 'pid', 'id', $did,','); //獲取路徑
			if(!isempt($didsss))$dids.=','.$didsss.'';
			
		}
		if($dids=='')return 0;
		$dids = substr($dids, 1);
		$drows= $this->db->getall('select * from `[Q]dept` where `id` in('.$dids.')');
		$deptarr = array();
		$ids  = '';
		foreach($drows as $k=>$rs){
			$deptarr[] = array(
				'id' 	=> $rs['id'],
				'name' 	=> $rs['name'],
				'pid' 	=> $rs['pid'],
			);
			$ids.=','.$rs['id'].'';
		}
		$data['do'] 	= 'update';
		$data['data'] 	= 'dept';
		$data['dept'] 	= $deptarr;
		$data['others'] = substr($ids, 1); //部門id

		return $data;
	}
	
	//人員上傳
	private function usertosn($uids)
	{
		$uarr = m('admin')->getall('id in('.$uids.') and `status`=1');
		if(!$uarr)return 0;
		$data 	= array();
		$ids  	= '';
		$dids 	= '';
		$deptids= ','.arrvalue($this->snrs,'deptids').',';
		
		foreach($uarr as $k=>$rs){
			$data[] = array(
				'do' 	=> 'update',
				'data' 	=> 'user',
				'ccid' 	=> $rs['id'],
				'name' 	=> $rs['name'],
				'passwd'=> $rs['pass'], // 密碼
				'card' 	=> $rs['user'],
				'deptid' => $rs['deptid'],
				'auth' 	=> 0, //刷卡卡號
				'faceexist' => 0, //是否有人臉，0 沒有，1 有（暫無用，預留字段）
			);
			$ids.=','.$rs['id'].'';
			
			if(!contain($deptids,','.$rs['deptid'].',')){
				$dids.=','.$rs['deptid'].'';
			}
		}
		$data[0]['others'] = substr($ids, 1); //人員ID
		
		
		//同時也要上傳部門ID
		if($dids!=''){
			$dids = substr($dids, 1);
			$this->savedata($this->snrs['id'], 'dept', $this->depttosn($dids));
		}
		
		
		return $data;
	}
	
	//設備上獲取指紋和頭像
	private function sntofingerhead($uids, $type)
	{
		$uarr 		= $this->userinsn($uids);
		if(is_string($uarr))return $uarr;
		
		$ccid = array();
		foreach($uarr as $k=>$rs){
			$ccid[] = $rs['id'];
		}
		$data = array(
			'do' => 'upload',
			'data' => array(substr($type,3)),
			'ccid' => $ccid,
			'others' => join(',', $ccid)
		);
		
		return $data;
	}
	
	//判斷人員是否在設備上
	private function userinsn($uids)
	{
		$userids 	= arrvalue($this->snrs,'userids');
		if(isempt($userids))return '設備上沒有人員';
		$uarr = m('admin')->getall('id in('.$uids.') and `id` in('.$userids.')');
		if(!$uarr)return '沒有選中人員沒在此設備上';
		
		return $uarr;
	}
	
	//上傳頭像
	private function uoloadface($snid, $uids)
	{
		$uarr 		= $this->userinsn($uids);
		if(is_string($uarr))return $uarr;
		foreach($uarr as $k=>$rs){
			$face = $rs['face'];
			if(!isempt($face) && file_exists($face)){
				
				$data['do'] 	= 'update';
				$data['data'] 	= 'headpic';
				$data['ccid'] 	= $rs['id'];
				$data['others'] = $rs['id'];
				$data['headpic']= base64_encode(file_get_contents($face));
				
				$this->savedata($snid, 'headpic', $data);
			}
		}
		return 1;
	}
	
	//刪除選中的人員
	private function userdeltosn($snid, $uids)
	{
		$uarr 		= $this->userinsn($uids);
		if(is_string($uarr))return $uarr;
		
		$ccid = array();
		foreach($uarr as $k=>$rs){
			$ccid[] = $rs['id'];
		}
		$data = array(
			'do' 	=> 'delete',
			'data' 	=> array("user","fingerprint","face","headpic","clockin","pic"), //刪除全部
			'ccid' 	=> $ccid,
			'others' => join(',', $ccid)
		);
		
		return $data;
	}
	//刪除不存在的
	private function userdeltosns($snid)
	{
		$ccid = $this->getnosys($snid);
		if(!$ccid)return '沒有可刪除的人員';
		$data = array(
			'do' 	=> 'delete',
			'data' 	=> array("user","fingerprint","face","headpic","clockin","pic"), //刪除全部
			'ccid' 	=> $ccid,
			'others' => join(',', $ccid)
		);
		
		return $data;
	}
	
	//對應設備顯示顯示離職人員等信息
	public function getnosys($snid)
	{
		$snrs = $this->getsninfo($snid);
		$userids = $snrs['userids'];
		if(isempt($userids))return array();
		$uarr = m('admin')->getall('`id` in('.$userids.') and `status`=1');
		$ccid = array();
		foreach($uarr as $k=>$rs){
			$ccid[] = $rs['id'];
		}
		$useridsa = explode(',', $userids);
		$nuco	= array();//不存在
		foreach($useridsa as $adis){
			if(!in_array($adis, $ccid))$nuco[] = $adis;
		}
		return $nuco;
	}
	
	//獲取打卡記錄
	private function getsntosyspic($snid, $type, $uids)
	{
		$startdt = $this->rock->post('startdt', $this->rock->date);
		$endddt  = $this->rock->post('endddt', $this->rock->date);
		if($endddt<$startdt)return '獲取開始日期不能大于截止日期';
		
		$userids 	= arrvalue($this->snrs,'userids');
		if(isempt($userids))return '設備上沒有人員';
		
		$ccid 		= array();
		if($uids!='0'){
			$uarr = m('admin')->getall('`id` in('.$userids.')');
			if(!$uarr)return '沒有選中人員沒在此設備上';
			
			$ccid = array();
			foreach($uarr as $k=>$rs){
				$ccid[] = $rs['id'];
			}
		}
		//刪除
		if($type=='delclockin' || $type=='delpic'){
			$data['do'] = 'delete';
			$data['data'] = array(substr($type, 3));
		}else{
			$data['do'] = 'upload';
			$data['data'] = array('clockin');
			if($type=='getpic')$data['data'][]= 'pic';//要照片
		}
		if($ccid){
			$data['ccid'] = $ccid;
			$data['others'] = join(',', $ccid);
		}
		$data['from'] = ''.$startdt.' 00:00:00';
		$data['to']   = ''.$endddt.' 23:59:59';
		
		return $data;
	}
	
	//上傳指紋
	public function fingerprinttosn($snid, $uids)
	{
		$uarr 		= $this->userinsn($uids);
		if(is_string($uarr))return $uarr;
		
		$ccid = array();
		$ubo  = 0;
		foreach($uarr as $k=>$rs){
			$uid  = $rs['id'];
			$zwra = $this->kquobj->getone('snid='.$snid.' and `uid`='.$uid.'');
			$fingerprint1 = arrvalue($zwra,'fingerprint1');
			$fingerprint2 = arrvalue($zwra,'fingerprint2');
			
			$uobo		 = false;
			
			//找找別的設備有沒有指紋
			if(isempt($fingerprint1)){
				$fingerprint1s = $this->kquobj->getmou('fingerprint1',"`uid`='$uid' and ifnull(`fingerprint1`,'')<>''");
				if(!isempt($fingerprint1s)){
					$fingerprint1 = $fingerprint1s;
					$uobo = true;
				}
			}
			
			if(isempt($fingerprint2)){
				$fingerprint2s = $this->kquobj->getmou('fingerprint2',"`uid`='$uid' and ifnull(`fingerprint2`,'')<>''");
				if(!isempt($fingerprint2s)){
					$fingerprint2 = $fingerprint2s;
					$uobo = true;
				}
			}
			
			if($uobo){
				$ubo++;
				$data['do'] 	= 'update';
				$data['data'] 	= 'fingerprint';
				$data['ccid'] 	= $uid;
				$data['others'] = $uid;
				$data['fingerprint'] = array($fingerprint1, $fingerprint2);
				
				$this->savedata($snid, 'fingerprint', $data);
			}
		}
		if($ubo==0)$ubo = '沒有可上傳的指紋';
		return $ubo;
	}
}