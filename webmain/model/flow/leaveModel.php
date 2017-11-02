<?php
//請假條的
class flow_leaveClassModel extends flowModel
{
	
	public function flowrsreplace($rs)
	{
		$rs['modenum']  = $this->modenum;
		$totday			= floatval(arrvalue($rs,'totday','0'));
		if($totday>0)$rs['totals'].='('.$totday.'天)';
		return $rs;
	}

	protected function flowbillwhere($uid, $lx)
	{
		$month	= $this->rock->post('month');
		$where 	= '';
		if($month!=''){
			$where.=" and `stime` like '$month%'";
		}

		return array(
			'where' => $where
		);
	}
	
	/**
	*	年假添加設置(自動添加)，可計劃任務沒有運行一次，兌換為小時的，默認一天8小時
	*/
	public function autoaddleave($ndate='')
	{
		$type = 0; //根據哪個類型計算年：0根據入職日期，1根據轉正日期
		$hour = (int)m('option')->getval('kqsbtime', 8); //默認一天8小時(請自己設定)
		if($ndate=='')$ndate = $this->rock->date;
		if($ndate > $this->rock->date)return array();
		$Y  	= substr($ndate,0,4);
		$niana	= array(
			//	 開始   截止    年假天數
			array(0, 	0, 		0), //0-0年，0天 
			array(1, 	10, 	5), //1年(含)-10年(含)，5天 
			array(11, 	20, 	10), //11年(含)-20年(含)，10天 
			array(21, 	9999, 	15), //21年(含)以上，15天 
		);
		//配置可根據自己情況修改
		$adlx = array('workdate','positivedt');
		$adln = array('入職','轉正');
		$dtobj= c('date');
		
		$usea = $this->db->getall("select `uid` from `[Q]kqinfo` where `kind`='增加年假' and `status`=1 and `optname`='系統' and `stime` like '".$Y."-%'"); //系統已經自動添加過
		$uids = '0';
		foreach($usea as $k=>$rs)$uids.=','.$rs['uid'].'';
		
		$rows = $this->db->getall("select a.`id`,a.`name`,a.`workdate`,b.`positivedt` from `[Q]admin` a left join `[Q]userinfo` b on a.id=b.id where a.`status`=1 and a.id not in($uids) and b.`state`<>5");
		$barr 	= array();
		foreach($rows as $k=>$rs){
			$dt = $rs[$adlx[$type]];
			if(isempt($dt))continue;
			$dttime = strtotime($dt);
			$rs['dt'] = $dt;
			$jg = $dtobj->datediff('d', $dt, $ndate);
			$yea= (int)($jg/365); //年限 
			if($yea==0)continue;//未滿1年
			$nianday	= 0;	//年假條數
			foreach($niana as $k1=>$ns){
				if($yea>=$ns[0] && $yea<=$ns[1]){
					$nianday = $ns[2];
					break;
				}
			}
			$dt 	= date(''.$Y.'-m-d', $dttime);
			if(strtotime($dt) > strtotime($ndate) )continue;//還沒到對應日期
			
			$rs['nianday']  = $nianday;
			$rs['nyear'] 	= $yea; //入職年限
			$rs['stime']  	= $dt.' 00:00:00';
			$rs['etime']  	= $dt.' 23:59:59';
			$rs['nianhour'] = $nianday * $hour; //小時
			$barr[] = $rs;
		}
		
		//添加到kqinfo表上
		$dbs = m('kqinfo');
		foreach($barr as $k=>$rs){
			$uarr['uid'] = $rs['id'];
			$uarr['uname'] = $rs['name'];
			$uarr['stime'] = $rs['stime'];
			$uarr['etime'] = $rs['etime'];
			$uarr['kind'] = '增加年假';
			$uarr['status'] = '1';
			$uarr['totals'] = $rs['nianhour'];
			$uarr['optdt'] = $this->rock->now;
			$uarr['isturn'] = '1';
			$uarr['optname'] = '系統';
			$uarr['optid'] = '0';
			$uarr['applydt'] = $this->rock->date;
			$uarr['totday'] = $rs['nianday'];
			$uarr['explain'] = ''.$rs['dt'].''.$adln[$type].'年限滿'.$rs['nyear'].'年添加年假'.$rs['nianday'].'天';
			$dbs->insert($uarr);
		}
		
		return $barr;
	}
}