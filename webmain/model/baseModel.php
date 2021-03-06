<?php
//基礎使用
class baseClassModel extends Model
{
	private $usrr = array();
	
	/**
	*	獲取異步地址
	*/
	public function getasynurl($m, $a,$can=array(), $lx=0)
	{
		if($lx==0)$runurl		= getconfig('localurl', URL);
		if($lx==1)$runurl		= getconfig('anayurl', URL); //使用異步通信地址
		$key 	 	= getconfig('asynkey');
		if($key!='')$key = md5(md5($key));
		$runurl 	.= 'api.php?m='.$m.'&a='.$a.'&adminid='.$this->adminid.'&asynkey='.$key.'';
		if(is_array($can))foreach($can as $k=>$v)$runurl.='&'.$k.'='.$v.'';
		return $runurl;
	}
	
	/**
	*	系統上變量替換
	*	$lx = 0 加''，$lx=1不加
	*/
	public function strreplace($str, $uid=0, $lx=0)
	{
		if(isempt($str))return '';
		$date 	= $this->rock->date;
		$month 	= date('Y-m');
		$str 		= str_replace('[date]', $date, $str);
		$str 		= str_replace('[month]', $month, $str);
		if(!contain($str,'{') || !contain($str,'}'))return $str; //沒有{}變量
		
		if($uid==0)$uid = $this->adminid;
		$ckey 	= 'u'.$uid.'';
		if(isset($this->usrr[$ckey])){
			$urs	= $this->usrr[$ckey];
		}else{
			$urs 	= $this->db->getone('[Q]admin','`id`='.$uid.'', '`name`,`deptname`,`ranking`,`deptid`,`num`,`companyid`,`deptallname`,`tel`,`mobile`,`email`,`id`,`superman`,`workdate`,`user`,`pingyin`');
			$this->usrr[$ckey] = $urs;
		}
		if(!$urs)$urs= array();
		$urs['uid']  		= $uid;
		$urs['date'] 		= $date;
		$urs['month']		= $month;
		$urs['now']  		= $this->rock->now;
		$urs['admin']		= arrvalue($urs,'name', $this->adminname);
		$urs['adminname']	= $urs['admin'];
		$urs['adminid']	 	= $uid;
		$urs['deptname']	= arrvalue($urs,'deptname');
		$urs['ranking']		= arrvalue($urs,'ranking');
		$barr = $this->rock->matcharr($str);
		foreach($barr as $match){
			$key 	= $match;
			if(substr($key,0,4)=='urs.')$key  = substr($key,4);
			if(isset($urs[$key])){
				$val = $urs[$key];
				if($lx==0)$val = "'$val'";
				$str = str_replace('{'.$match.'}', $val, $str);
			}
			//是否日期加減{date+1},{second-20}
			if(contain($match,'+') || contain($match,'-')){
				$add = 1;
				if(contain($match,'-'))$add=-1;
				$strss1	= explode('-', str_replace('+','-', $match));
				$dats  	= $strss1[0];
				$jg    	= (int)$strss1[1] * $add;;
				$cval  	= 'Y-m-d H:i:s';
				$lxs 	= 'd';
				if($dats=='date')$cval = 'Y-m-d';
				if($dats=='month'){
					$cval = 'Y-m';
					$lxs  = 'm';
				}
				if($dats=='hour')$lxs   = 'H';
				if($dats=='minute')$lxs = 'i';
				if($dats=='second')$lxs = 's';
				$val    = c('date')->adddate($urs['now'], $lxs, $jg, $cval);
				if($lx==0)$val = "'$val'";
				$str 	= str_replace('{'.$match.'}', $val, $str);
			}
		}
		return $str;
	}
}