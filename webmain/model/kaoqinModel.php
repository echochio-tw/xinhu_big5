<?php
/**
*	考勤的model
*/
class kaoqinClassModel extends Model
{
	private $userarr 	= array();
	private $_pipeiarr 	= array();
	
	public function initModel()
	{
		$this->settable('kqdist');
		$this->admindb 	= m('admin');
		$this->sjoindb 	= m('sjoin');
		$this->dtobj 	= c('date');
	}
	
	public function adddkjl($uid,$type=0, $dkdt='',$ip='',$mac='')
	{
		$now = $this->rock->now;
		if($dkdt=='')$dkdt = $now;
		if($ip=='')$ip=$this->rock->ip;
		$xh  	= c('xinhu');
		$kqa 	= $this->admindb->getusinfo($uid,'dkip,dkmac');
		$mac	= strtolower($mac);
		if(isempt($kqa['dkip']) && isempt($kqa['dkmac']))return '未設置打卡IP或MAC地址'.$xh->helpstr('kaoqin').'';
		if(!isempt($kqa['dkip']) && $kqa['dkip']!='*'){
			$ass 	= explode(',', $kqa['dkip']);
			if(!in_array($ip, $ass))return '打卡電腦IP必須是：'.$kqa['dkip'].'，當前IP是：'.$ip.''.$xh->helpstr('kaoqin').'';
		}
		if(!isempt($kqa['dkmac'])){
			if($mac=='')return '無法獲取MAC地址,請使用REIM客戶端，'.$xh->helpstr('client','下載').'';
			$dkmac 	= str_replace('-',':',strtolower($kqa['dkmac']));
			$ass 	= explode(',', $dkmac);
			if(!in_array($mac, $ass))return '打卡電腦MAC地址必須是：'.$kqa['dkmac'].'，當前MAC地址是：'.$mac.'';
		}
		$this->db->record('[Q]kqdkjl',array(
			'dkdt' 	=> $dkdt,
			'uid'	=> $uid,
			'optdt'	=> $now,
			'ip'	=> $ip,
			'mac'	=> $mac,
			'type'	=> $type
		));
		$dt = substr($dkdt, 0, 10);
		$this->kqanay($uid, $dt);
		return '';
	}
	
	/**
	*	讀取考勤時間
	*	$lx0 考勤時段,$lx1上班時間
	*/
	public function getkqsj($uid, $dt, $lx=0)
	{
		$key 	= $this->rock->getfunkey(func_get_args(),'kqdist');
		$rows 	= arrvalue($this->_pipeiarr, $key);
		if($rows)return $rows;
		$mid 	= $this->getdistid($uid, $dt, 0);
		$rows 	= $this->db->getrows('[Q]kqsjgz','pid='.$mid.'','id,name,stime,etime,qtype,iskq,iskt,isxx','`sort`');
		if($lx==1){
			$this->_pipeiarr[$key] = $rows;
			return $rows;
		}
		foreach($rows as $k=>$rs){
			$rows[$k]['children'] = $this->db->getrows('[Q]kqsjgz','pid='.$rs['id'].'','id,name,stime,etime,qtype,sort,iskt,iskq','`sort`');
		}
		$this->_pipeiarr[$key] = $rows;
		return $rows;
	}
	
	/**
	*	讀取某人一天考勤類型狀態
	*/
	public function getkqztarr($uid, $dt)
	{
		$kqzt 	= $this->getkqsj($uid, $dt);
		$kqsr 	= array(); $xu 	= 0;
		foreach($kqzt as $k=>$rs){
			foreach($rs['children'] as $rs1){
				if(!isset($kqsr[$rs1['name']])){
					$kqsr[$rs1['name']]='state'.$xu.'';
					$xu++;
				}
			}
		}
		return $kqsr;
	}
	
	/**
	*	獲取匹配Id
	*	$type 0考勤時間,1休息,2定位
	*/
	private $getdistrows = array();
	public function getdistid($uid, $dt, $type=0)
	{
		//根據排班來
		if($type==0){
			$pbarr	= $this->getpbarr($dt);
			if($pbarr){
				$key0 	= 'a'.$dt.'_'.$uid.'_2_0';//休息key
				if(isset($pbarr[$key0]))return $pbarr[$key0];
				//根據組來判斷考勤時間規則
				$gids 	= $this->sjoindb->getgroupid($uid); //組Id
				if($gids!='0'){
					$gidar = explode(',', $gids);
					for($i=1; $i<count($gidar); $i++){
						$gid 	= $gidar[$i];
						$key0 	= 'a'.$dt.'_'.$gid.'_1_0';
						if(isset($pbarr[$key0]))return $pbarr[$key0];
					}
				}
			}
		}
		
		$uarr[] 	= 'u'.$uid.'';
		$deptpath 	= arrvalue($this->getusarr($uid), 'deptpath');
		if(!isempt($deptpath)){
			$depa = explode(',', str_replace(array('[',']'), array('',''), $deptpath));
			foreach($depa as $depas){
				$uarr[] = 'd'.$depas.'';
			}
		}
		if(!isset($this->getdistrows[$type])){
			$barr = $this->getall("`status`=1 and `type`=".$type." ",'*', '`sort`');
			foreach($barr as $k=>$rs)if(isempt($rs['enddt']))$barr[$k]['enddt'] = $rs['startdt'];
			$this->getdistrows[$type] = $barr;
		}else{
			$barr = $this->getdistrows[$type];
		}
		$rows 		= array();
		if($barr)foreach($barr as $k=>$rs){
			$receid = $rs['receid'];
			if($dt<$rs['startdt'] || $dt>$rs['enddt'])continue;
			if(isempt($receid) || $receid=='all'){
				$rows[] = $rs;
				continue;
			}
			$receida = explode(',', $receid);
			$bo 	 = false;
			foreach($uarr as $uarrs){
				if(in_array($uarrs, $receida))$bo=true;
			}
			if($bo)$rows[] = $rs;
		}
		$mid 	= $this->getpipeimid($uid, $rows);
		if($type==0){
			
		}
		return $mid;
	}
	
	//從排班表kqdisv讀取記錄
	private $getpbarrs	= array();
	private function getpbarr($dt)
	{
		$month= substr($dt, 0, 7);
		if(!isset($this->getpbarrs[$month])){
			$gset = $this->db->getall("select * from `[Q]kqdisv` where `dt` like '".$month."%' order by `type`");
			$setar= array();
			foreach($gset as $k=>$rs){
				$key = 'a'.$rs['dt'].'_'.$rs['receid'].'_'.$rs['plx'].'_'.$rs['type'].'';
				$setar[$key] = $rs['mid'];
			}
			$this->getpbarrs[$month] = $setar;
			return $setar;
		}else{
			return $this->getpbarrs[$month];
		}
	}
	
	/**
	*	是不是工作日
	*/
	private $isworkdtarr = array();
	public function isworkdt($uid, $dt)
	{
		//先從排班那讀取
		$pbarr	= $this->getpbarr($dt);
		if($pbarr){
			$key1 	= 'a'.$dt.'_'.$uid.'_2_1';//休息key
			$key2 	= 'a'.$dt.'_'.$uid.'_2_2';//工作日key
			
			if(isset($pbarr[$key2]))return 1;
			if(isset($pbarr[$key1]))return 0;
			
			//根據組來判斷排班
			$gids 	= $this->sjoindb->getgroupid($uid); //組Id
			if($gids!='0'){
				$gidar = explode(',', $gids);
				for($i=1; $i<count($gidar); $i++){
					$gid 	= $gidar[$i];
					$key2 	= 'a'.$dt.'_'.$gid.'_1_2';
					if(isset($pbarr[$key2]))return 1;
				}
				for($i=1; $i<count($gidar); $i++){
					$gid 	= $gidar[$i];
					$key1 	= 'a'.$dt.'_'.$gid.'_1_1';
					if(isset($pbarr[$key1]))return 0;
				}
			}
		}
		
		
		$month 	= substr($dt, 0, 7);
		$key 	= 'a'.$month.'';
		$barr 	= array();
		if(!isset($this->isworkdtarr[$key])){
			$rows = $this->db->getrows('[Q]kqxxsj',"`dt` like '$month%'");
			foreach($rows as $k=>$rs){
				$barr['a'.$rs['pid'].''.$rs['dt'].'_'.$rs['uid'].''] = $rs['type'];
			}
			$this->isworkdtarr[$key] = $barr;
		}else{
			$barr = $this->isworkdtarr[$key];
		}
		$isw	= 1;
		$mid 	= $this->getdistid($uid, $dt, 1);
		$type 	= arrvalue($barr, 'a'.$mid.''.$dt.'_0');
		if($type=='0')$isw = 0;
		$types 	= arrvalue($barr, 'a'.$mid.''.$dt.'_'.$uid.'');
		if(!isempt($types))$isw = (int)$types;
		//$tos 	= $this->db->rows('[Q]kqxxsj',"`pid`=$mid and `dt`='$dt'");
		//$isw 	= ( $tos>0 ) ? 0 : 1;
		return $isw;
	}
	
	//返回人員
	public function getusarr($uid)
	{
		if(is_array($uid)){
			return $uid;
		}else{
			if(!isset($this->userarr[$uid])){
				$_urs = $this->db->getone('[Q]admin', "`id`='$uid'", '`id`,`deptid`,`deptpath`');
				$this->userarr[$uid] = $_urs;
				return $_urs;
			}else{
				return $this->userarr[$uid];
			}
		}
	}
	
	/**
	*	讀取人員定位定位打卡位置
	*/
	public function dwdkrs($uid, $dt)
	{
		$mid 	= $this->getdistid($uid, $dt, 2);
		return m('kqdw')->getone($mid);
	}
	
	/**
	*	數組匹配人員對應哪個記錄
	*/
	public function getpipeimid($uid=0, $garrs, $esfi='mid', $momid=1, $dt='')
	{
		$mid 	= $momid;
		if($uid==0)return $mid;
		$mid 	= 0;
		
		$uarr 		= $this->getusarr($uid);
		$deptpath 	= arrvalue($uarr, 'deptpath');
		$uid		= arrvalue($uarr, 'id','0');

		$utid  	= $dtid  =  array();$allars=false;$dttime = 0;
		if($dt!='')$dttime	= strtotime($dt);
		foreach($garrs as $k=>$rs){
			$artid = explode(',', $rs['receid']);
			if($dttime>0){
				if(!isset($rs['starttime'])){
					$rs['starttime'] 	= strtotime($rs['startdt']);
					$rs['endtime'] 		= strtotime($rs['enddt']);
				}
				if($rs['starttime'] > $dttime || $rs['endtime'] < $dttime)continue;
			}	
			foreach($artid as $ssid){
				if($ssid=='')continue;
				if($ssid=='all'){
					$allars = $rs;
					continue;
				}
				$fs  = substr($ssid, 0, 1);
				$sid = str_replace('u','', $ssid);
				$sid = str_replace('d','', $sid);
				if($fs=='d'){
					$dtid[$sid][]= $rs;
				}else{
					$utid[$sid][]= $rs;
				}					
			}
		}
		if(isset($utid[$uid]))$mid = (int)$utid[$uid][0][$esfi];
		if($mid == 0 && !$this->isempt($deptpath)){
			$depa = explode(',', str_replace(array('[',']'), array('',''), $deptpath));
			foreach($depa as $depas){
				if(isset($dtid[$depas]))$mid = (int)$dtid[$depas][0][$esfi];
			}
		}
		if($mid == 0 && is_array($allars))$mid = (int)$allars[$esfi];
		if($mid==0)$mid=$momid;
		return $mid;
	}
	
	public function kqanayall($month, $where='')
	{
		if(isempt($month))return;
		$month	= substr($month, 0, 7);
		$start	= ''.$month.'-01';
		$max 	= c('date')->getmaxdt($month);
		$enddt	= ''.$month.'-'.$max.'';
		$s 		= "and (`quitdt` is null or `quitdt`>='$start') and (`workdate` is null or `workdate`<='$enddt') $where";
		$urows 	= $this->admindb->getall('1=1 '.$s.'', '`id`,`workdate`,`quitdt`');
		foreach($urows as $k=>$urs){
			$this->kqanaymonth($urs['id'], $month, $urs, $max);
		}
	}
	
	public function kqanayalldt($dt)
	{
		$s 		= "and (`quitdt` is null or `quitdt`>='$dt') and (`workdate` is null or `workdate`<='$dt')";
		$urows 	= $this->admindb->getall('1=1 '.$s.'', '`id`,`workdate`,`quitdt`');
		foreach($urows as $k=>$urs){
			$this->kqanay($urs['id'], $dt);
		}
	}
	
	public function kqanaymonth($uid, $month, $urs=false, $max=0)
	{
		$month	= substr($month, 0, 7);
		if(!$urs)$urs 	= $this->admindb->getone($uid, '`workdate`,`quitdt`,`id`');
		if($max==0)$max = c('date')->getmaxdt($month);
		for($i=1; $i<=$max; $i++){
			$oi = $i;if($oi<10)$oi='0'.$i.'';
			$dt = ''.$month.'-'.$oi.'';
			if(!isempt($urs['workdate']) && $urs['workdate']>$dt)continue;
			if(!isempt($urs['quitdt']) && $urs['quitdt']<$dt)continue;
			$this->kqanay($uid, $dt);
		}
		$this->delquitwork($urs, $month, $max);
	}
	
	private function delquitwork($urs, $month, $max)
	{
		$ds = array();
		$dt1= ''.$month.'-01'; $dt2= ''.$month.'-'.$max.'';
		$uid= $urs['id'];
		if(!isempt($urs['workdate'])){
			if($urs['workdate']>$dt1)$ds[] = "dt<'".$urs['workdate']."'";
		}
		if(!isempt($urs['quitdt'])){
			if($urs['quitdt']<$dt2)$ds[] = "dt>'".$urs['quitdt']."'";
		}
		$str = join(' or ', $ds);
		if(!isempt($str))$this->db->delete('[Q]kqanay',"`uid`=$uid and ($str)");
	}
	
	private function geetdkarr($uid, $dt)
	{
		return $this->db->getrows('[Q]kqdkjl',"`uid`='$uid' and `dkdt` like '$dt%'",'`dkdt`','`dkdt` asc');
	}
	
	/**
	*	考勤分析
	*	@param $uid 用戶Id
	*	@param $dt 分析日期
	*/
	public function kqanay($uid, $dt)
	{
		if($dt > $this->rock->date)return;
		$dkarr 	= $this->geetdkarr($uid, $dt);
		
		$iswork	= $this->isworkdt($uid, $dt);
		$sjarr	= $this->getkqsj($uid, $dt);
		$db 	= m('kqanay');
		$ids 	= '0';
		
		//是否有跨天的
		$isjy_1	=  $isjy_2	= 0;
		foreach($sjarr as $k=>$rs){
			foreach($rs['children'] as $k1=>$rs1){
				if($rs1['iskt']==2)$isjy_2=1; //-1天
				if($rs1['iskt']==1)$isjy_1=1; //+1天
			}
		}
		if($isjy_2==1){
			$dt2 	= $this->dtobj->adddate($dt,'d', -1);
			$dtarr2 = $this->geetdkarr($uid, $dt2);
			if($dtarr2)$dkarr = array_merge($dtarr2, $dkarr);
		}
		if($isjy_1==1){
			$dt1 	= $this->dtobj->adddate($dt,'d', 1);
			$dtarr1 = $this->geetdkarr($uid, $dt1);
			if($dtarr1)$dkarr = array_merge($dkarr, $dtarr1);
		}
		
		$this->_dkarr = $dkarr;
		foreach($sjarr as $k=>$rs){
			$ztname = $rs['name'];
			$arrs 	= $this->kqanaysss($uid, $dt, $rs, $this->_dkarr);
			$state	= $arrs['state'];
			$states	= $arrs['states'];
			
			//判斷是否有請假和外出。。
			if($iswork==1 && $state !='正常'){
				$zcarr	= array();
				foreach($rs['children'] as $k2=>$cog2){
					if($cog2['name']=='正常')$zcarr = $cog2;
				}
				if($zcarr)$states = $this->getstates($zcarr, $dt, $uid);	
			}
			
			$emiao	= $arrs['emiao'];
			$time	= $arrs['time'];
			$arr	= array(
				'ztname' 	=> $ztname,
				'state' 	=> $state,
				'states' 	=> $states,
				'remark' 	=> $arrs['remark'],
				'time' 		=> $time,
				'uid' 		=> $uid,
				'dt' 		=> $dt,
				'sort' 		=> $k,
				'iswork' 	=> $iswork,
				'optdt' 	=> $this->rock->now,
				'emiao' 	=> $emiao
			);
			$where 	= "`uid`='$uid' and `dt`='$dt' and `ztname`='$ztname'";
			$id 	= (int)$db->getmou('id', $where);
			if($id==0)$where='';
			$db->record($arr, $where);
			if($id==0)$id = $this->db->insert_id();
			$ids.=','.$id.'';
		}
		$db->delete("id not in ($ids) and `uid`='$uid' and `dt`='$dt'");
	}
	private function kqanaysss($uid, $dt, $kqrs, $dkarr)
	{
		$kqarr	= $kqrs['children'];
		$state	= '未打卡';$states = $remark = ''; $emiao	= 0; $tpk=-1; $time	= ''; $pdtime	= 0;
		if($dkarr && $kqarr)foreach($kqarr as $k=>$rs){
			$stime 	= strtotime(''.$dt.' '.$rs['stime'].'');
			$etime 	= strtotime(''.$dt.' '.$rs['etime'].'');
			$qtype	= $rs['qtype'];
			$iskt	= $rs['iskt'];
			
			//-1跨天
			if($iskt==2){
				$dt2	= $this->dtobj->adddate($dt,'d', -1);
				$stime 	= strtotime(''.$dt2.' '.$rs['stime'].'');
				if($rs['stime']<$rs['etime']){
					$etime 	= strtotime(''.$dt2.' '.$rs['etime'].'');
				}
			}
			
			//+1跨天
			if($iskt==1){
				$dt1	= $this->dtobj->adddate($dt,'d', 1);
				$etime 	= strtotime(''.$dt1.' '.$rs['etime'].'');
				if($rs['stime']<$rs['etime']){
					$stime 	= strtotime(''.$dt1.' '.$rs['stime'].'');
				}
			}
			
			foreach($dkarr as $k1=>$rs1){
				$dkdt = strtotime($rs1['dkdt']);
				if($stime>$dkdt || $etime<$dkdt)continue;
				$time	= $dkdt;
				$state	= $rs['name'];
				$tpk	= $k1;
				if($qtype==0)break;
			}
			$pdtime	= $stime;
			if($qtype==1)$pdtime = $etime;
			if($time!='')break;
		}
		if($time!=''){
			if($state!='正常'){
				$emiao = $pdtime-$time;
			}
			unset($this->_dkarr[$tpk]);//一次打卡記錄只能使用一次
		}
		$barr['state'] 		= $state;
		$barr['emiao'] 		= abs($emiao);
		if($time!='')$time	= date('Y-m-d H:i:s', $time);
		$barr['time'] 		= $time;
		$barr['states'] 	= $states;
		$barr['remark'] 	= $remark;
		if($pdtime!=0)$barr['pdtime'] = date('Y-m-d H:i:s', $pdtime);
		return $barr;
	}
	
	

	
	/**
	*	上班: (當前qtype==0)請假開始時間小于等于 設置正常的截止時間（取最小值）
	*	下班: (當前qtype==1)請假截止時間大于等于 設置正常的開始時間（取最大值）
	*/
	private function getstates($ztarr, $dts, $uid)
	{
		$st1	= strtotime($dts.' '.$ztarr['stime']);
		$et1	= strtotime($dts.' '.$ztarr['etime']);
		$s 		= '';
		$rows 	= $this->db->getall("select `stime`,`etime`,`qjkind` from `[Q]kqinfo` where `uid`='$uid' and `status`=1 and `isturn`=1 and `kind`='請假' and `stime`<='$dts 23:59:59' and `etime`>='$dts 00:00:00'");
		foreach($rows as $k=>$rs){
			$qst = strtotime($rs['stime']);
			$qet = strtotime($rs['etime']);
			if($ztarr['qtype']==1){
				if($qet >= $st1){
					$s = $rs['qjkind'];
				}
			}else{
				if($qst <= $et1){
					$s = $rs['qjkind'];
				}
			}
		}
		if($s==''){
			$rows 	= $this->db->getall("select `outtime`,`intime`,`atype` from `[Q]kqout` where `uid`='$uid' and `status`=1 and `isturn`=1 and `outtime`<='$dts 23:59:59' and `intime`>='$dts 00:00:00'");
			foreach($rows as $k=>$rs){
				$qst = strtotime($rs['outtime']);
				$qet = strtotime($rs['intime']);
				if($ztarr['qtype']==1){
					if($qet >= $st1){
						$s = $rs['atype'];
					}
				}else{
					if($qst <= $et1){
						$s = $rs['atype'];
					}
				}
			}
		}
		return $s;
	}
	
	/**
	*	獲取默人對月份所有考勤狀態{'2017-01-17':[{name:'上班','state':'正常'}]}
	*/
	public function getanay($uid, $month, $dt='')
	{
		$month	= substr($month, 0, 7);
		$dtobj  = c('date');
		$max 	= $dtobj->getmaxdt($month);
		$startdt= ''.$month.'-01';
		$enddt  = ''.$month.'-'.$max.'';
		if($dt!=''){
			$startdt = $dt;
			$enddt   = $dt;
		}
		$rows  	= $this->db->getrows('[Q]kqanay',"`uid`='$uid' and `dt` between '$startdt' and '$enddt'",'*','dt,sort');
		$barr 	= array();
		foreach($rows as $k=>$rs){
			if(!isset($barr[$rs['dt']]))$barr[$rs['dt']]=array();
			
			$barr[$rs['dt']][] 	= $rs;
		}
		return $barr;
	}
	
	
	/**
	*	計算剩餘假期時間,如果審核未通過，申請人不刪除照樣也會扣除時間
	*/
	public function getqjsytime($uid, $type, $dt='', $id=0)
	{
		$types 	= '增加'.$type.'';
		$wehe	= '';
		if($type=='調休'){
			$types='加班';
			$wehe = 'and `jiatype`=0'; //只有可調休才能用
		}
		if($dt=='')$dt = $this->rock->now;
		$to1	= $this->db->getmou('[Q]kqinfo',"sum(totals)", "`kind`='請假' and `qjkind`='$type' and `uid`='$uid' and `status` not in(5) and `id`<>$id ");
		$zto	= $this->db->getmou('[Q]kqinfo',"sum(totals)", "`kind`='$types' $wehe and `uid`='$uid'  and `status`=1 and `stime`<='$dt'");
		if(is_null($to1))$to1=0;
		if(is_null($zto))$zto=0;
		return floatval($zto) - floatval($to1);
	}
	
	//總統計顯示
	public function getqjsytimestr($uid, $dt='', $id=0)
	{
		$rows = $this->db->getall("select `kind` from `[Q]kqinfo` where `uid`='$uid' and `status`=1 and `kind` like '增加%' group by `kind`");
		$tx   = $this->getqjsytime($uid, '調休', $dt, $id);
		$str  = '可調休('.$tx.'小時)';
		foreach($rows as $k=>$rs){
			$type = str_replace('增加', '', $rs['kind']);
			$sj   = $this->getqjsytime($uid, $type, $dt, $id);
			$str  .= '，'.$type.'('.$sj.'小時)';
		}
		return $str;
	}
	
	/**
	*	判斷這段時間是否可以申請請假
	*/
	public function leavepan($uid, $qjkind, $start, $end, $totals, $id=0)
	{
		$msg 	= '';
		$sdf 	= $this->db->rows('[Q]kqinfo',"`uid`='$uid' and `status`<>5 and ((`stime`<='$start' and `etime`>='$start') or (`stime`<='$end' and `etime`>='$end') or (`stime`>='$start' and `etime`<='$end')) and `kind`='請假' and `id`<>'$id' ");
		if($sdf > 0){
			$msg = '該時間段已申請過了';
		}
		$tsjia	= '事假,病假';
		$tsjia	= m('option')->getval('kqsqtype', $tsjia); //讀取選項
		if($msg == '' && !$this->contain(','.$tsjia.',', ','.$qjkind.',')){
			$sy1	= $this->getqjsytime($uid, $qjkind, $start, $id);
			if($sy1<0)$sy1=0;
			$totals	= floatval($totals);
			if($totals>$sy1)$msg = '剩餘['.$qjkind.']'.$sy1.'小時,不能申請,'.c('xinhu')->helpstr('kaoqin').'';
		}
		return $msg;
	}
	
	/**
	*	計算當月請假時間合計
	*/
	public function getqjtotal($uid, $month)
	{
		$to 	= $this->getkqtotalsss($uid, $month,'請假');
		return  $to;
	}
	
	/**
	*	計算當月加班時間合計
	*/
	public function getjbtotal($uid, $month)
	{
		$to 	= $this->getkqtotalsss($uid, $month,'加班');
		return  $to;
	}
	private function getkqtotalsss($uid, $month, $kind)
	{
		$ors  	= $this->db->getmou('[Q]kqinfo','sum(totals)as totals',"`status`=1 and `uid`=$uid and `stime` like '$month%' and `kind`='$kind'");
		$to 	= 0;
		if($ors)$to = $ors;
		return  $to;
	}
	
	/**
	*	統計當前我考勤異常的狀態
	*/
	public function getkqtotal($uid, $month)
	{
		$sql 	= "SELECT state,count(1)stotal FROM `[Q]kqanay` where `dt` like '$month%' and `uid`=$uid and `iswork`=1 and `states` is null GROUP BY `state`";
		$rows 	= $this->db->getall($sql);
		$chidao	= $zaotui = $weidk = 0;
		foreach($rows as $k=>$rs){
			if($rs['state']=='遲到')$chidao = $rs['stotal'];
			if($rs['state']=='早退')$zaotui = $rs['stotal'];
			if($rs['state']=='未打卡')$weidk= $rs['stotal'];
		}
		return array(
			'cidao' 	=> $chidao,
			'zaotui' 	=> $zaotui,
			'weidk' 	=> $weidk,
			'jiaban' 	=> $this->getjbtotal($uid, $month),
			'jiabans' 	=> $this->getjiafee($uid, $month),
			'leave' 	=> $this->getqjtotal($uid, $month),
		);
	}
	
	/**
	*	獲取默認某天應該上班時間段
	*	返回array(array('每天上班時間斷'))
	*/
	public function getsbarr($uid, $dt)
	{
		$arr 	= $this->getkqsj($uid, $dt, 1);
		$barr	= array();
		foreach($arr as $k=>$rs){
			if(!isempt($rs['stime']) && !isempt($rs['etime']))$barr[] = $rs;
		}
		return $barr;
	}
	
	/**
	*	獲取某個人某一天考勤狀態[{stat}]
	*/
	public function getsbanay($uid, $dt)
	{
		$ansy = $this->getanay($uid, $dt, $dt);
		$nates= array();
		if(isset($ansy[$dt])){
			$barr = $ansy[$dt];
			foreach($barr as $k=>$rs){
				$nates[$rs['ztname']] = $rs;
			}
		}
		$sbarr = $this->getsbarr($uid, $dt);
		foreach($sbarr as $k=>$rs){
			$state = '<font color=red>未打卡</font>';
			if(isset($nates[$rs['name']])){
				$ors 	= $nates[$rs['name']];
				$state 	= $this->getkqstate($ors);
			}
			$sbarr[$k]['state'] = $state;
		}
		
		return $sbarr;
	}
	
	/**
	*	獲取某一天的打卡記錄
	*/
	public function getdkjl($uid, $dt)
	{
		$rows = $this->db->getall("select `dkdt` from `[Q]kqdkjl` where uid='$uid' and `dkdt` like '".$dt."%' order by `dkdt`");
		foreach($rows as $k=>$rs){
			$rows[$k]['dktime'] = substr($rs['dkdt'], 11);
		}
		return $rows;
	}
	
	/**
	*	考勤狀態
	*/
	public function getkqstate($rs)
	{
		$s 	 	= $rs['state'];
		$state 	= $rs['state'];
		$iswork = $rs['iswork'];
		
		$miaocn	= '';
		if($rs['emiao']>0){
			$stssa = explode(':', $this->dtobj->sjdate($rs['emiao'],'H:i:s'));
			if($stssa[0]>0)$miaocn=''.$stssa[0].'時';
			$miaocn.=''.$stssa[1].'分'.$stssa[2].'秒';
		}
		$rs['miaocn'] = $miaocn;
		
		if($iswork==0 && $state == '未打卡')$s='休息日';
		if(!isempt($rs['miaocn'])){
			$s.='['.$rs['miaocn'].']';
		}
		if(!isempt($rs['time']))$s.='('.substr($rs['time'],11).')';
		
		if(!isempt($rs['states'])){
			$state = '正常';
			$s	= $rs['states'];
		}
		
		if($state != '正常' && $iswork==1)$s='<font color=red>'.$s.'</font>';
		if($s=='休息日')$s='<font color=#888888>'.$s.'</font>';
		
		return $s;
	}
	
	/**
	*	獲取默認某天應該上班時間段
	*	返回09:00-18:00
	*/
	public function getsbstr($uid, $dt)
	{
		$barr	= $this->getsbarr($uid, $dt);
		$stime 	= $etime = '';
		foreach($barr as $k=>$rs){
			if($rs['iskq']==1 && $rs['isxx']=='0'){
				if($stime=='')$stime = $rs['stime'];
				$etime = $rs['etime'];
			}
		}
		if($stime=='')$stime = '09:00:00';
		if($etime=='')$etime = '18:00:00';
		$stimes 	= $dt.' '.$stime;
		$etimes 	= $dt.' '.$etime;
		return array(
			'stime' 	=> $stimes,
			'stimes' 	=> strtotime($stimes),
			'etime' 	=> $etimes,
			'etimes' 	=> strtotime($etimes),
		);
	}
	
	/**
	*	每天上班時間斷，返回8小時
	*/
	public function getworktime($uid, $dt='')
	{
		if($dt=='')$dt = $this->rock->date;
		$dt 	= substr($dt, 0, 10);
		$to 	= $this->getsbtime($uid, $dt.' 00:00:00', $dt.' 23:59:59', 1);
		if($to<0)$to = (int)m('option')->getval('kqsbtime', 8); //默認1天上班時間8小時
		return $to;
	}
	
	/**
	*	根據時間間隔獲取上班時間小時
	*	$lx=0 計算請假時間 1算當前應上班時間
	*/
	public function getsbtime($uid,$sdt, $edt, $lx=0)
	{
		$tot	= 0;
		$sdt1	= strtotime($sdt);
		$edt1	= strtotime($edt);
		$dtsa	= explode(' ', $sdt);
		$dts	= $dtsa[0];
		$jg		= $this->dtobj->datediff('d', $sdt, $edt);
		for($i=0; $i<$jg+1; $i++){
			if($i>0)$dts = $this->dtobj->adddate($dts, 'd', 1);
			if($lx==0)if($this->isworkdt($uid, $dts)==0)continue;//休息日就不用算了
			$arr 	= $this->getsbarr($uid, $dts);
			foreach($arr as $k=>$rs){
				$iskt	= $rs['iskt'];
				if($rs['iskq']==1 && $rs['isxx']=='0'){
					$_sts = strtotime($dts.' '.$rs['stime']);
					$_ets = strtotime($dts.' '.$rs['etime']);
					
					//開始時間-1
					if($iskt=='2'){
						
					}
					
					//結束時間+1
					if($iskt=='1'){
					}
					
					if($_sts<$sdt1)$_sts=$sdt1;
					if($_ets>$edt1)$_ets=$edt1;
					$_tisg = $_ets - $_sts;
					if($_tisg>0)$tot+=$_tisg;
				}
			}
		}
		return $tot / 3600;
	}
	
	/**
	*	統計月份應上班天數
	*	return array(應上班天數, 有上班天數);
	*/
	public function getsbdt($uid, $month)
	{
		$month	= substr($month, 0, 7);
		$dtobj  = c('date');
		$max 	= $dtobj->getmaxdt($month);
		$startdt= ''.$month.'-01';
		$enddt  = ''.$month.'-'.$max.'';
		$tian	= 0;
		$ysb	= 0;
		$anayarr= $this->db->getrows('[Q]kqanay', "`uid`=$uid and `dt` like '$month%'");
		for($i=0; $i<$max; $i++){
			$oi = ($i<10) ? '0'.$i.'' : $i;
			$dt = ''.$month.'-'.$oi.'';
			if($this->isworkdt($uid, $dt)==1){
				$tian++;
				foreach($anayarr as $k=>$rs){
					if($rs['dt']==$dt && $rs['state']!='未打卡'){
						$ysb++;
						break;
					}
				}
			}
		}
		return array($tian, $ysb, $tian-$ysb);
	}
	
	/**
	*	計算人員加班工資，一天默認8小時
	*	$uid 人員，$hour 小時，$stime 加班開始時間
	*	加班費計算（正常工作日1.5），週末2.0，節假日3.0
	*	上月的(基本工資+職位津貼+技能津貼)/本月應上班天數 * 1.5，週末*2.0
	*/
	public function jiafee($uid, $hour, $stime)
	{
		$fee = 0;
		$hour= floatval($hour);
		if($hour<=0)return $fee;
		$nrs = $this->db->getone('[Q]hrsalary','`xuid`='.$uid.' and `status`<>5','`base`,`postjt`,`skilljt`','`month` desc');
		if($nrs){
			$dt 	= substr($stime, 0, 10);
			$hs  	= $this->getworktime($uid, $dt); //一天上班小時
			$sbarr	= $this->getsbdt($uid, $dt);
			$bsh	= 1.5;
			if($this->isworkdt($uid, $dt)==0)$bsh = 2; //休息日倍數2
			$base 	= floatval($nrs['base']) + floatval($nrs['postjt']) + floatval($nrs['skilljt']);
			
			$gongzi	= $base/$sbarr[0];//一天的工資
			$fee	= ($gongzi / $hs) * $bsh * $hour;
			$fee 	= $this->rock->number($fee);
		}
		return $fee;
	}
	
	//獲取對應月份加班費
	public function getjiafee($uid, $month)
	{
		$mond = $this->db->getmou('[Q]kqinfo','sum(jiafee)', "`uid`=$uid and `kind`='加班' and `status`=1  and `jiatype`=1 and `stime` like '$month%'");
		if(isempt($mond))$mond = 0;
		return $mond;
	}
	
	
	/**
	*	all統計
	*/
	public function alltotal($month, $uids)
	{
		$barr = $this->alltotalrows($month, $uids);
		$data = $barr['rows'][0];
		$farrs 				= $barr['columns'];
		$farrs['未打卡'] 	= 'weidk';
		$farrs['請假'] 		= 'qingjia';
		$farrs['加班'] 		= 'jiaban';
		$farrs['外出出差'] 	= 'outci';
		$farrs['打卡異常'] 	= 'errci';
		$farrs['應上班'] 	= 'sbday';
		$farrs['已上班'] 	= 'ysbday';
		return array('data'=>$data, 'fields'=>$farrs, 'unita'=> array(
			'qingjia' => '小時',
			'jiaban'  => '小時',
			'sbday'  	=> '天',
			'ysbday'  	=> '天',
		));
	}
	
	public function alltotalrows($month, $uids)
	{
		$rows	= array();
		if(is_array($uids)){
			$rows = $uids;
		}else{
			$uidsa = explode(',', $uids);
			foreach($uidsa as $_uids)$rows[] = array('id'=>$_uids);
		}
		$uids 	= '0';
		foreach($rows as $k=>$rs)$uids.=','.$rs['id'].'';
		$farrs	= $columns = array();
		//獲取考勤狀態數組{'正常':'state0'}
		if($rows){
			$fuid 	= $rows[0]['id'];
			$farrs 	= $this->getkqztarr($fuid, $month.'-01');
			$columns= $farrs;
		}
		
		$darr	= $this->db->getall("SELECT uid,state,states FROM `[Q]kqanay` where iswork=1 and dt like '$month%' and `uid` in($uids)");
		$sarr 	= array();
		foreach($darr as $k=>$rs){
			$state 	= $rs['state'];
			$uid 	= $rs['uid'];
			if(!isempt($rs['states']))$state='正常';
			if(!isset($sarr[$uid]))$sarr[$uid]=array();
			if(!isset($sarr[$uid][$state]))$sarr[$uid][$state]=0;
			$sarr[$uid][$state]++;
		}
		
		$farrs['未打卡'] 	= 'weidk';
		$farrs['請假'] 		= 'qingjia';
		$farrs['事假'] 		= 'shijia';
		$farrs['加班'] 		= 'jiaban';
		$lxarr 				= m('option')->getmnum('kqqjkind');
		foreach($lxarr as $k=>$rs){
			$tev 				= 'qingjia'.$rs['id'].'';
			$farrs[$rs['name']] = $tev;
			//$columns[$rs['name']]		= $tev;
		}
		
		$kqarr	= $this->db->getall("select sum(totals)as totals,kind,qjkind,uid from `[Q]kqinfo` where `status`=1 and `uid` in($uids) and `stime` like '$month%' and `kind` in('請假','加班') group by `uid`,`qjkind`");
		foreach($kqarr as $k=>$rs){
			$uid 	= $rs['uid'];
			$kind	= $rs['qjkind'];
			if(isempt($kind))$kind = '加班';
			if(!isset($sarr[$uid]))$sarr[$uid]=array();
			$sarr[$uid][$kind] = $rs['totals'];
			$kinds = $kind.'(時)';
			if($rs['kind']=='請假' && !isset($columns[$kinds])){
				$columns[$kinds] = $farrs[$kind];
			}
		}
		
		foreach($rows as $k=>$rs){
			$uid 	= $rs['id'];
			if(isset($sarr[$uid])){
				foreach($sarr[$uid] as $zt=>$v){
					if(isset($farrs[$zt])){
						$rows[$k][$farrs[$zt]] = $v;
					}
				}
			}
			$outci	= $this->db->rows('[Q]kqout',"`status`=1 and `uid`=$uid and `outtime` like '$month%'");
			if($outci==0)$outci='';
			$rows[$k]['outci'] = $outci;
			
			$errci	= $this->db->rows('[Q]kqerr',"`status`=1 and `uid`=$uid and `dt` like '$month%'");
			if($errci==0)$errci='';
			$rows[$k]['errci'] = $errci;
			
			$sbdt 			   	= $this->getsbdt($uid, $month);
			$rows[$k]['sbday'] 	= $sbdt[0];
			$rows[$k]['ysbday'] = $sbdt[1]>0 ?  $sbdt[1] : '';
		}
		
		return array('rows'=>$rows,'columns'=>$columns);
	}
	

}