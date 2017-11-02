<?php
/**
*	桌面項目
*/
class homeitemsClassModel extends Model
{
	public function getmyshow()
	{
		$str 	= m('admin')->getjoinstr('receid', $this->adminid, 1);
		$rows 	= $this->getall('`status`=1 and ('.$str.')','`num`,`row`,`name`,`sort`','`row`,`sort`');
		return $rows;
	}
	
	/**
	*	桌面項目數據讀取
	*/
	public function getitemsdata($nums='')
	{
		if(isempt($nums))$nums = 'apply,gong,meet';
		$numarr	= explode(',', $nums);
		$barr 	= array();
		foreach($numarr as $num){
			$act = 'get_'.$num.'_arr';
			if(method_exists($this, $act)){
				$barr[''.$num.'arr'] = $this->$act();
			}
		}
		if(in_array('kjrk', $numarr))$barr['total'] = $this->gettotals($this->adminid); //有快捷方式才顯示
		return $barr;
	}
	
	//快捷入口紅數字的統計的(根據菜單編號來的)
	public function gettotals($uid)
	{
		$optdt 	= $this->rock->now;
		$arr 	= array();
		$bidb	= m('flowbill');
		
		$todo			= m('todo')->rows("uid='$uid' and `status`=0 and `tododt`<='$optdt'");
		$arr['todo']	= $todo;
		$arr['daiban']	= $bidb->daibanshu($uid);
		$arr['applywtg']= $bidb->applymywgt($uid);
		$arr['danerror']= $bidb->errortotal();
		$arr['workwwc']	= m('work')->getwwctotals($uid);
		$arr['email']	= m('emailm')->wdtotal($uid);
		$arr['flowtodo']= m('flowtodo')->getwdtotals($uid);
		return $arr;
	}
	
	//我的申請
	public function get_apply_arr()
	{
		return m('flowbill')->homelistshow();
	}
	
	//通知公告讀取
	public function get_gong_arr()
	{
		return m('flow')->initflow('gong')->getflowrows($this->adminid,'my');
	}
	
	//會議
	public function get_meet_arr()
	{
		return m('meet')->getmeethome($this->rock->date, $this->adminid);
	}
	
	//系統日志
	public function get_syslog_arr()
	{
		return m('log')->getrows('1=1','type,remark,optdt,level','id desc limit 5');
	}
	
	//考勤打卡的
	public function get_kqdk_arr()
	{
		$kq 	= m('kaoqin');
		$dt 	= $this->rock->date;
		if($this->rock->get('atype')=='daka')$kq->kqanay($this->adminid, $dt);
		$sbarr 	= $kq->getsbanay($this->adminid, $dt);
		$dkarr 	= $kq->getdkjl($this->adminid, $dt);
		
		return array(
			'sbarr' => $sbarr,
			'dkarr' => $dkarr,
		);
	}
}